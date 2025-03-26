import datetime
from typing import Dict, List, Set, Tuple, Any, Optional, Union
import json, random
import re
from neo4j import GraphDatabase

class VMwareChangeImpactAnalyzer:
    """
    Analyzes the impact of changes to VMware infrastructure components
    by examining relationships between nodes in Neo4j.
    
    This class identifies dependencies and calculates the potential impact
    of changes on connected service nodes.
    """
    
    def __init__(self, uri: str, username: str, password: str):
        """
        Initialize the impact analyzer with Neo4j connection details.
        
        Args:
            uri: Neo4j server URI (e.g., "neo4j://localhost:7687")
            username: Neo4j username
            password: Neo4j password
        """
        self.driver = GraphDatabase.driver(uri, auth=(username, password))
        
        # Mapping of node types to their impact propagation characteristics
        self.propagation_config = {
            "VCenterServer": {
                "impact_level": 9,  # 1-10 scale, higher means more critical
                "propagation_factor": 0.9,  # How much impact propagates to connected nodes (0-1)
                "managed_types": ["ESXiHost", "VSphereCluster", "VirtualMachine", "Datastore"]
            },
            "ESXiHost": {
                "impact_level": 8,
                "propagation_factor": 0.8,
                "managed_types": ["VirtualMachine"]
            },
            "VSphereCluster": {
                "impact_level": 7,
                "propagation_factor": 0.7,
                "managed_types": ["ESXiHost"]
            },
            "VirtualMachine": {
                "impact_level": 6,
                "propagation_factor": 0.5,
                "managed_types": []
            },
            "VSANCluster": {
                "impact_level": 8,
                "propagation_factor": 0.8,
                "managed_types": ["Datastore"]
            },
            "Datastore": {
                "impact_level": 7,
                "propagation_factor": 0.7,
                "managed_types": ["VirtualMachine"]
            },
            "NSXManager": {
                "impact_level": 9,
                "propagation_factor": 0.9,
                "managed_types": ["NSXEdge", "NSXSwitch", "VirtualNetwork"]
            },
            "NSXEdge": {
                "impact_level": 8,
                "propagation_factor": 0.8,
                "managed_types": ["NSXSwitch", "VirtualNetwork"]
            },
            "NSXSwitch": {
                "impact_level": 7,
                "propagation_factor": 0.7,
                "managed_types": ["VirtualNetwork"]
            },
            "VirtualNetwork": {
                "impact_level": 6,
                "propagation_factor": 0.6,
                "managed_types": ["VirtualMachine"]
            }
        }
        
        # Critical relationship types that propagate impact
        self.critical_relationships = [
            "MANAGES", "CONTAINS", "HOSTS", "PROVIDES", "ACCESSES", 
            "CONNECTED_TO", "USES_STORAGE", "INTEGRATES_WITH", "IMPLEMENTS",
            "DEPLOYED_ON", "DEPENDS_ON", "PROVIDES_NETWORK", "PARTICIPATES_IN"
        ]
        
        # Default change types and their impact weights
        self.change_types = {
            "upgrade": 0.9,            # Software/firmware upgrades
            "configuration": 0.7,      # Configuration changes
            "hardware": 0.8,           # Hardware changes
            "maintenance": 0.5,        # Scheduled maintenance
            "expansion": 0.6,          # Adding capacity
            "network": 0.8,            # Network changes
            "security": 0.7,           # Security changes
            "recovery": 0.4,           # Recovery operations
            "decommission": 1.0        # Removing a component
        }
    
    def close(self):
        """Close the Neo4j connection."""
        self.driver.close()
    
    def _run_query(self, query: str, params: Optional[Dict] = None) -> List[Dict]:
        """
        Run a Cypher query and return the results.
        
        Args:
            query: Cypher query string
            params: Optional parameters for the query
            
        Returns:
            List of dictionaries containing query results
        """
        with self.driver.session() as session:
            result = session.run(query, params or {})
            return [record.data() for record in result]
    
    def get_node_details(self, node_id: str) -> Dict:
        """
        Get details for a specific node by ID.
        
        Args:
            node_id: ID of the node to fetch
            
        Returns:
            Dictionary containing node details or empty dict if not found
        """
        query = """
        MATCH (n)
        WHERE n.id = $node_id
        RETURN n, labels(n) AS labels
        """
        results = self._run_query(query, {"node_id": node_id})
        
        if not results:
            return {}
        
        node_data = dict(results[0]['n'])
        node_data['labels'] = results[0]['labels']
        
        return node_data
    
    def get_node_relationships(self, node_id: str) -> List[Dict]:
        """
        Get all relationships for a node, both incoming and outgoing.
        
        Args:
            node_id: ID of the node
            
        Returns:
            List of relationships with source, target, and type information
        """
        query = """
        MATCH (n)-[r]-(m)
        WHERE n.id = $node_id
        RETURN n.id AS source_id, type(r) AS relationship, m.id AS target_id, 
               labels(n)[0] AS source_type, labels(m)[0] AS target_type,
               properties(r) AS rel_props
        """
        return self._run_query(query, {"node_id": node_id})
    
    def get_connected_nodes(self, node_id: str, max_depth: int = 2) -> Dict[str, Any]:
        """
        Get all nodes connected to the specified node up to a certain depth.
        
        Args:
            node_id: ID of the node
            max_depth: Maximum traversal depth (default: 2)
            
        Returns:
            Dictionary containing nodes and relationships in the subgraph
        """
        query = f"""
        MATCH path = (n)-[*1..{max_depth}]-(m)
        WHERE n.id = $node_id
        RETURN path
        """
        results = self._run_query(query, {"node_id": node_id})
        
        # Process results to extract nodes and relationships
        nodes = {}
        relationships = []
        
        for record in results:
            path = record['path']
            # Process each path
            for node in path.nodes:
                if node.id not in nodes:
                    node_data = dict(node)
                    node_data['labels'] = list(node.labels)
                    nodes[node.id] = node_data
            
            # Process relationships in the path
            for rel in path.relationships:
                relationships.append({
                    'source': rel.start_node.id,
                    'target': rel.end_node.id,
                    'type': rel.type,
                    'properties': dict(rel)
                })
        
        return {
            'nodes': list(nodes.values()),
            'relationships': relationships
        }
    
    def assess_node_criticality(self, node_id: str) -> Dict[str, Any]:
        """
        Assess the criticality of a node based on its properties and connections.
        
        Args:
            node_id: ID of the node to assess
            
        Returns:
            Dictionary with criticality assessment
        """
        node_details = self.get_node_details(node_id)
        if not node_details:
            return {"error": f"Node with ID {node_id} not found"}
        
        node_type = node_details['labels'][0] if node_details.get('labels') else "Unknown"
        
        # Get base criticality from node properties if available
        base_criticality = node_details.get('businessCriticalityScore', 0)
        if not base_criticality:
            # Use default from propagation config if available
            base_criticality = self.propagation_config.get(node_type, {}).get('impact_level', 5) * 10
        
        # Get relationships
        relationships = self.get_node_relationships(node_id)
        
        # Calculate enhanced criticality based on connections
        dependent_systems = [r for r in relationships if r['relationship'] == 'DEPENDS_ON' and r['target_id'] == node_id]
        managed_systems = [r for r in relationships if r['relationship'] == 'MANAGES' and r['source_id'] == node_id]
        
        # Adjust criticality based on dependencies
        connection_factor = 1.0 + (len(dependent_systems) * 0.05) + (len(managed_systems) * 0.03)
        
        adjusted_criticality = min(100, base_criticality * connection_factor)
        
        # Categorize criticality
        criticality_category = "Unknown"
        if adjusted_criticality >= 80:
            criticality_category = "Critical"
        elif adjusted_criticality >= 60:
            criticality_category = "High"
        elif adjusted_criticality >= 40:
            criticality_category = "Medium"
        else:
            criticality_category = "Low"
        
        return {
            "node_id": node_id,
            "node_type": node_type,
            "base_criticality": base_criticality,
            "adjusted_criticality": adjusted_criticality,
            "criticality_category": criticality_category,
            "dependent_system_count": len(dependent_systems),
            "managed_system_count": len(managed_systems),
            "total_relationships": len(relationships)
        }
    
    def analyze_change_impact(self, 
                               node_id: str, 
                               change_type: str, 
                               change_description: str = "",
                               change_params: Optional[Dict[str, Any]] = None) -> Dict[str, Any]:
        """
        Analyze the impact of a change on a node and its connected components.
        
        Args:
            node_id: ID of the node being changed
            change_type: Type of change (upgrade, configuration, hardware, etc.)
            change_description: Optional description of the change
            change_params: Optional additional parameters for the change
            
        Returns:
            Dictionary with impact analysis results
        """
        # Validate change type
        if change_type not in self.change_types:
            return {
                "error": f"Invalid change type: {change_type}. Valid types: {list(self.change_types.keys())}"
            }
        
        # Get node details
        node_details = self.get_node_details(node_id)
        if not node_details:
            return {"error": f"Node with ID {node_id} not found"}
        
        node_type = node_details['labels'][0] if node_details.get('labels') else "Unknown"
        node_name = node_details.get('name', node_id)
        
        # Get base impact factors
        base_impact_weight = self.change_types.get(change_type, 0.5)
        
        # Get node criticality
        criticality_assessment = self.assess_node_criticality(node_id)
        
        # Get connected nodes (direct relationships)
        relationships = self.get_node_relationships(node_id)
        
        # Calculate impact on connected nodes
        impacted_nodes = []
        total_impact_score = 0
        
        for rel in relationships:
            # Determine directionality (whether target or source is the connected node)
            is_outgoing = rel['source_id'] == node_id
            connected_node_id = rel['target_id'] if is_outgoing else rel['source_id']
            connected_node_type = rel['target_type'] if is_outgoing else rel['source_type']
            relationship_type = rel['relationship']
            
            # Skip if relationship type is not considered critical for impact
            if relationship_type not in self.critical_relationships:
                continue
            
            # Get connected node details
            connected_node = self.get_node_details(connected_node_id)
            if not connected_node:
                continue
            
            # Calculate impact propagation for this connection
            propagation_factor = self.propagation_config.get(node_type, {}).get('propagation_factor', 0.5)
            
            # Adjust based on relationship type
            relation_impact_factor = 1.0
            if relationship_type == "MANAGES":
                relation_impact_factor = 1.2
            elif relationship_type == "HOSTS":
                relation_impact_factor = 1.1
            elif relationship_type == "DEPENDS_ON":
                relation_impact_factor = 0.9 if is_outgoing else 1.3  # Impact is higher if something depends on current node
            
            # Calculate node-specific impact score
            base_node_criticality = connected_node.get('businessCriticalityScore', 50)
            connection_impact = base_impact_weight * propagation_factor * relation_impact_factor
            impact_score = base_node_criticality * connection_impact / 100
            
            # Determine impact category
            impact_category = "Unknown"
            if impact_score >= 70:
                impact_category = "Critical"
            elif impact_score >= 40:
                impact_category = "High"
            elif impact_score >= 20:
                impact_category = "Medium"
            else:
                impact_category = "Low"
            
            # Generate recommendations based on impact
            recommendations = self._generate_recommendations(
                node_type, connected_node_type, relationship_type, 
                impact_category, change_type
            )
            
            # Add to impacted nodes
            impacted_nodes.append({
                "node_id": connected_node_id,
                "node_name": connected_node.get('name', connected_node_id),
                "node_type": connected_node_type,
                "relationship": relationship_type,
                "relationship_direction": "outgoing" if is_outgoing else "incoming",
                "impact_score": impact_score,
                "impact_category": impact_category,
                "recommendations": recommendations
            })
            
            total_impact_score += impact_score
        
        # Sort impacted nodes by impact score descending
        impacted_nodes.sort(key=lambda x: x['impact_score'], reverse=True)
        
        # Overall impact assessment
        avg_impact = total_impact_score / len(impacted_nodes) if impacted_nodes else 0
        overall_impact_category = "Unknown"
        
        if avg_impact >= 60:
            overall_impact_category = "Critical"
        elif avg_impact >= 40:
            overall_impact_category = "High"
        elif avg_impact >= 20:
            overall_impact_category = "Medium"
        else:
            overall_impact_category = "Low"
        
        # Generate overall recommendations
        overall_recommendations = self._generate_overall_recommendations(
            node_type, change_type, overall_impact_category, len(impacted_nodes)
        )
        
        # Create change ticket reference
        change_ticket_id = f"CHG-{datetime.datetime.now().strftime('%Y%m%d')}-{random.randint(1000, 9999)}"
        
        return {
            "change_assessment": {
                "node_id": node_id,
                "node_name": node_name,
                "node_type": node_type,
                "change_type": change_type,
                "change_description": change_description,
                "criticality_assessment": criticality_assessment,
                "change_ticket_id": change_ticket_id,
                "assessment_timestamp": datetime.datetime.now().isoformat(),
            },
            "impact_summary": {
                "impacted_node_count": len(impacted_nodes),
                "overall_impact_score": avg_impact,
                "overall_impact_category": overall_impact_category,
                "total_impact_score": total_impact_score,
                "recommendations": overall_recommendations
            },
            "impacted_nodes": impacted_nodes
        }
    
    def _generate_recommendations(self, 
                                  source_type: str, 
                                  target_type: str, 
                                  relationship_type: str,
                                  impact_category: str, 
                                  change_type: str) -> List[str]:
        """
        Generate specific recommendations for a particular impact.
        
        Args:
            source_type: Type of source node
            target_type: Type of target node
            relationship_type: Type of relationship
            impact_category: Category of impact (Critical, High, Medium, Low)
            change_type: Type of change being made
            
        Returns:
            List of recommendations
        """
        recommendations = []
        
        # Generic recommendations based on impact category
        if impact_category == "Critical":
            recommendations.append(f"Consider scheduling maintenance window for the {target_type}")
            recommendations.append("Notify all stakeholders before proceeding")
            recommendations.append("Prepare detailed fallback plan for this component")
        elif impact_category == "High":
            recommendations.append(f"Alert {target_type} owner about potential disruption")
            recommendations.append("Schedule change during low-usage period")
            recommendations.append("Test connectivity after change")
        elif impact_category == "Medium":
            recommendations.append(f"Monitor {target_type} during and after change")
            recommendations.append("Have support team on standby")
        else:  # Low
            recommendations.append(f"Standard verification of {target_type} after change")
        
        # Specific recommendations based on relationship and node types
        if relationship_type == "HOSTS" and target_type == "VirtualMachine":
            if impact_category in ["Critical", "High"]:
                recommendations.append("Consider vMotion to another host before change")
                recommendations.append("Verify VM has recent backups")
            recommendations.append("Review VM resource reservations after change")
        
        elif relationship_type == "MANAGES" and source_type == "VCenterServer":
            recommendations.append("Verify management connectivity after change")
            if impact_category in ["Critical", "High"]:
                recommendations.append("Prepare for potential re-registration of managed entities")
        
        elif relationship_type == "USES_STORAGE" and source_type == "VirtualMachine":
            recommendations.append("Verify VM disk accessibility after change")
            if impact_category in ["Critical", "High"]:
                recommendations.append("Consider snapshot before change")
        
        elif relationship_type == "CONTAINS" and source_type == "VSphereCluster":
            if impact_category in ["Critical", "High"]:
                recommendations.append("Verify cluster has sufficient capacity for HA/DRS")
                recommendations.append("Check impact on vSAN if enabled")
        
        elif relationship_type == "IMPLEMENTS" and source_type == "NSXSwitch":
            recommendations.append("Verify network connectivity after change")
            if impact_category in ["Critical", "High"]:
                recommendations.append("Review security policies and firewall rules")
        
        # Add recommendations specific to change type
        if change_type == "upgrade":
            recommendations.append("Verify compatibility with connected components")
            recommendations.append("Plan for potential downtime")
        
        elif change_type == "configuration":
            recommendations.append("Document configuration changes for rollback")
            recommendations.append("Test configuration in isolation if possible")
        
        elif change_type == "hardware":
            recommendations.append("Verify hardware compatibility")
            recommendations.append("Schedule physical access if needed")
        
        elif change_type == "network":
            recommendations.append("Validate all network paths after change")
            recommendations.append("Test connectivity from multiple points")
        
        elif change_type == "decommission":
            recommendations.append("Verify no critical dependencies remain")
            recommendations.append("Archive configuration before decommissioning")
        
        return recommendations
    
    def _generate_overall_recommendations(self, 
                                         node_type: str, 
                                         change_type: str, 
                                         impact_category: str, 
                                         impacted_node_count: int) -> List[str]:
        """
        Generate overall recommendations for the change.
        
        Args:
            node_type: Type of node being changed
            change_type: Type of change
            impact_category: Overall impact category
            impacted_node_count: Number of impacted nodes
            
        Returns:
            List of overall recommendations
        """
        recommendations = []
        
        # Based on impact category
        if impact_category == "Critical":
            recommendations.append("Schedule an extended maintenance window")
            recommendations.append("Create comprehensive test plan for all affected systems")
            recommendations.append("Prepare detailed rollback procedures")
            recommendations.append("Notify all stakeholders with ample lead time")
            recommendations.append("Consider a staged approach to minimize overall impact")
            recommendations.append("Engage vendor support for the duration of the change")
        
        elif impact_category == "High":
            recommendations.append("Schedule change during off-hours")
            recommendations.append("Notify key stakeholders before implementation")
            recommendations.append("Prepare rollback plan for critical components")
            recommendations.append("Test thoroughly after change")
            recommendations.append("Have additional support staff available")
        
        elif impact_category == "Medium":
            recommendations.append("Schedule during standard maintenance window")
            recommendations.append("Notify system owners in advance")
            recommendations.append("Document rollback steps")
            recommendations.append("Perform standard testing after change")
        
        else:  # Low
            recommendations.append("Follow standard change process")
            recommendations.append("Document the change")
            recommendations.append("Verify system functionality after implementation")
        
        # Based on number of impacted nodes
        if impacted_node_count > 20:
            recommendations.append("Consider breaking down the change into smaller phases")
            recommendations.append("Create a detailed validation plan for each affected system")
        elif impacted_node_count > 10:
            recommendations.append("Prepare a checklist of systems to validate post-change")
        
        # Based on node type
        if node_type == "VCenterServer":
            recommendations.append("Verify management access to all infrastructure components after change")
            recommendations.append("Test vMotion, DRS, and HA functionality if applicable")
        
        elif node_type == "ESXiHost":
            recommendations.append("Verify VM functionality and performance after change")
            recommendations.append("Test network connectivity and storage access")
        
        elif node_type == "NSXManager" or node_type == "NSXEdge":
            recommendations.append("Verify all logical network paths after change")
            recommendations.append("Test north-south and east-west traffic patterns")
            recommendations.append("Validate security policy enforcement")
        
        elif node_type == "VSANCluster":
            recommendations.append("Verify data accessibility and storage policy compliance")
            recommendations.append("Check cluster health and resynchronization status")
        
        # Based on change type
        if change_type == "upgrade":
            recommendations.append("Verify compatibility with all connected systems")
            recommendations.append("Ensure backups are current before proceeding")
            recommendations.append("Check vendor documentation for known issues")
        
        elif change_type == "configuration":
            recommendations.append("Document all configuration parameters being changed")
            recommendations.append("Test configuration in a similar environment if possible")
        
        elif change_type == "network":
            recommendations.append("Validate connectivity across all affected networks")
            recommendations.append("Test from multiple source locations")
            recommendations.append("Verify security policies still apply correctly")
        
        elif change_type == "decommission":
            recommendations.append("Validate that all dependencies have been addressed")
            recommendations.append("Archive configuration and logs before decommissioning")
            recommendations.append("Update documentation to reflect the removal")
        
        return recommendations
    
    def generate_visualization_data(self, node_id: str, max_depth: int = 2) -> Dict:
        """
        Generate data for visualizing a node and its relationships.
        
        Args:
            node_id: ID of the central node
            max_depth: Maximum relationship depth
            
        Returns:
            Dictionary with nodes and links for visualization
        """
        subgraph = self.get_connected_nodes(node_id, max_depth)
        
        # Transform for visualization format
        nodes = []
        seen_node_ids = set()
        
        for node in subgraph['nodes']:
            if 'id' not in node:
                continue
                
            # Skip duplicates
            if node['id'] in seen_node_ids:
                continue
                
            seen_node_ids.add(node['id'])
            
            # Get primary label (node type)
            node_type = node.get('labels', ['Unknown'])[0]
            
            # Create visualization node
            vis_node = {
                'id': node['id'],
                'name': node.get('name', node['id']),
                'type': node_type,
                'criticality': node.get('businessCriticalityScore', 50)
            }
            
            # Mark the central node
            if node['id'] == node_id:
                vis_node['isCentral'] = True
            
            nodes.append(vis_node)
        
        # Process links
        links = []
        seen_links = set()
        
        for rel in subgraph['relationships']:
            # Create a unique identifier for this link
            link_id = f"{rel['source']}-{rel['type']}-{rel['target']}"
            
            # Skip duplicates
            if link_id in seen_links:
                continue
                
            seen_links.add(link_id)
            
            # Create visualization link
            links.append({
                'source': rel['source'],
                'target': rel['target'],
                'type': rel['type']
            })
        
        return {
            'nodes': nodes,
            'links': links
        }
    
    def simulate_change(self, 
                        node_id: str, 
                        change_type: str, 
                        simulation_depth: int = 3) -> Dict:
        """
        Simulate a change to assess cascading impacts across multiple levels.
        
        Args:
            node_id: ID of the node being changed
            change_type: Type of change
            simulation_depth: Depth of impact propagation to simulate
            
        Returns:
            Dictionary with simulation results
        """
        # Start with direct impact analysis
        direct_impact = self.analyze_change_impact(node_id, change_type)
        
        if "error" in direct_impact:
            return direct_impact
        
        # Initialize cascading impact data
        cascading_impacts = []
        all_impacted_nodes = set()
        all_impacted_nodes.add(node_id)
        
        # Process first level impacted nodes
        level_1_nodes = direct_impact['impacted_nodes']
        for node in level_1_nodes:
            all_impacted_nodes.add(node['node_id'])
        
        cascading_impacts.append({
            "level": 1,
            "impacted_nodes": level_1_nodes,
            "node_count": len(level_1_nodes)
        })
        
        # Process deeper levels
        current_level_nodes = [node['node_id'] for node in level_1_nodes]
        
        for level in range(2, simulation_depth + 1):
            level_nodes = []
            next_level_nodes = []
            
            # For each node in the current level
            for node_id in current_level_nodes:
                # Calculate reduced impact for this level
                reduced_change_type = self._get_reduced_change_type(change_type, level)
                
                # Calculate impact with reduced severity
                node_impact = self.analyze_change_impact(node_id, reduced_change_type)
                
                if "error" not in node_impact:
                    # Add to this level's impacts
                    for impacted in node_impact['impacted_nodes']:
                        if impacted['node_id'] not in all_impacted_nodes:
                            level_nodes.append(impacted)
                            all_impacted_nodes.add(impacted['node_id'])
                            next_level_nodes.append(impacted['node_id'])
            
            # Add this level to cascading impacts
            cascading_impacts.append({
                "level": level,
                "impacted_nodes": level_nodes,
                "node_count": len(level_nodes)
            })
            
            # Update current level for next iteration
            current_level_nodes = next_level_nodes
            
            # Stop if no more nodes to process
            if not current_level_nodes:
                break
        
        # Calculate overall metrics
        total_impacted = len(all_impacted_nodes) - 1  # Exclude the original node
        
        # Calculate maximum cascade depth actually reached
        actual_cascade_depth = len([c for c in cascading_impacts if c['node_count'] > 0])
        
        # Determine worst category across all levels
        impact_categories = ["Critical", "High", "Medium", "Low"]
        worst_category = "Low"
        
        for impact in cascading_impacts:
            for node in impact['impacted_nodes']:
                cat_idx = impact_categories.index(node['impact_category'])
                worst_idx = impact_categories.index(worst_category)
                if cat_idx < worst_idx:
                    worst_category = node['impact_category']
        
        return {
            "direct_impact": direct_impact['impact_summary'],
            "cascade_summary": {
                "original_node": {
                    "id": node_id,
                    "type": direct_impact['change_assessment']['node_type'],
                    "name": direct_impact['change_assessment']['node_name']
                },
                "change_type": change_type,
                "simulation_depth": simulation_depth,
                "actual_cascade_depth": actual_cascade_depth,
                "total_impacted_nodes": total_impacted,
                "worst_impact_category": worst_category,
                "timestamp": datetime.datetime.now().isoformat()
            },
            "cascading_impacts": cascading_impacts
        }
    
    def _get_reduced_change_type(self, change_type: str, level: int) -> str:
        """
        Get a reduced change type for cascading impact simulation.
        As impacts cascade further from the source, their severity typically reduces.
        
        Args:
            change_type: Original change type
            level: Current cascade level
            
        Returns:
            Reduced change type string
        """
        # For levels beyond 1, reduce the impact severity
        if level <= 1:
            return change_type
            
        # Map to less severe change types as cascades progress
        if change_type == "decommission":
            return "configuration" if level == 2 else "maintenance"
        elif change_type == "upgrade":
            return "configuration" if level == 2 else "maintenance"
        elif change_type == "hardware":
            return "maintenance"
        elif change_type == "network":
            return "configuration" if level == 2 else "maintenance"
        elif change_type == "configuration":
            return "maintenance"
        
        # Default fallback
        return "maintenance"
    
    def export_impact_assessment(self, assessment: Dict, format: str = "json") -> str:
        """
        Export the impact assessment results in the specified format.
        
        Args:
            assessment: Impact assessment results from analyze_change_impact()
            format: Output format ('json', 'html', or 'text')
            
        Returns:
            String representation of the assessment in the requested format
        """
        if format.lower() == "json":
            return json.dumps(assessment, indent=2)
        
        elif format.lower() == "html":
            # Generate an HTML report
            html = """
            <!DOCTYPE html>
            <html>
            <head>
                <title>VMware Change Impact Assessment</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    h1, h2, h3 { color: #333366; }
                    .section { margin-bottom: 20px; border: 1px solid #ddd; padding: 15px; border-radius: 5px; }
                    .critical { background-color: #ffdddd; }
                    .high { background-color: #ffffcc; }
                    .medium { background-color: #e6f3ff; }
                    .low { background-color: #eeffee; }
                    table { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    tr:nth-child(even) { background-color: #f9f9f9; }
                </style>
            </head>
            <body>
                <h1>VMware Change Impact Assessment</h1>
            """
            
            # Assessment info
            if 'change_assessment' in assessment:
                ca = assessment['change_assessment']
                html += f"""
                <div class="section">
                    <h2>Change Details</h2>
                    <p><strong>Node:</strong> {ca.get('node_name', 'Unknown')} ({ca.get('node_type', 'Unknown')})</p>
                    <p><strong>Change Type:</strong> {ca.get('change_type', 'Unknown')}</p>
                    <p><strong>Description:</strong> {ca.get('change_description', 'None provided')}</p>
                    <p><strong>Ticket ID:</strong> {ca.get('change_ticket_id', 'Not assigned')}</p>
                    <p><strong>Assessment Time:</strong> {ca.get('assessment_timestamp', 'Unknown')}</p>
                </div>
                """
            
            # Impact summary
            if 'impact_summary' in assessment:
                summary = assessment['impact_summary']
                category = summary.get('overall_impact_category', 'Unknown').lower()
                
                html += f"""
                <div class="section {category}">
                    <h2>Impact Summary</h2>
                    <p><strong>Overall Impact:</strong> {summary.get('overall_impact_category', 'Unknown')}
                       (Score: {summary.get('overall_impact_score', 0):.1f})</p>
                    <p><strong>Impacted Nodes:</strong> {summary.get('impacted_node_count', 0)}</p>
                    
                    <h3>Recommendations</h3>
                    <ul>
                """
                
                for rec in summary.get('recommendations', []):
                    html += f"<li>{rec}</li>\n"
                
                html += """
                    </ul>
                </div>
                """
            
            # Impacted nodes
            if 'impacted_nodes' in assessment and assessment['impacted_nodes']:
                html += """
                <div class="section">
                    <h2>Impacted Nodes</h2>
                    <table>
                        <tr>
                            <th>Node</th>
                            <th>Type</th>
                            <th>Relationship</th>
                            <th>Impact</th>
                            <th>Score</th>
                        </tr>
                """
                
                for node in assessment['impacted_nodes']:
                    category = node.get('impact_category', 'Unknown').lower()
                    html += f"""
                        <tr class="{category}">
                            <td>{node.get('node_name', 'Unknown')}</td>
                            <td>{node.get('node_type', 'Unknown')}</td>
                            <td>{node.get('relationship', 'Unknown')}</td>
                            <td>{node.get('impact_category', 'Unknown')}</td>
                            <td>{node.get('impact_score', 0):.1f}</td>
                        </tr>
                    """
                
                html += """
                    </table>
                </div>
                """
                
                # Node-specific recommendations for high impact nodes
                high_impact_nodes = [n for n in assessment['impacted_nodes'] 
                                    if n.get('impact_category') in ['Critical', 'High']]
                
                if high_impact_nodes:
                    html += """
                    <div class="section">
                        <h2>Key Recommendations for High-Impact Nodes</h2>
                    """
                    
                    for node in high_impact_nodes:
                        html += f"""
                        <h3>{node.get('node_name', 'Unknown')} ({node.get('node_type', 'Unknown')})</h3>
                        <ul>
                        """
                        
                        for rec in node.get('recommendations', []):
                            html += f"<li>{rec}</li>\n"
                            
                        html += "</ul>\n"
                    
                    html += "</div>\n"
            
            # Cascading impacts if present
            if 'cascading_impacts' in assessment:
                html += """
                <div class="section">
                    <h2>Cascading Impact Analysis</h2>
                """
                
                if 'cascade_summary' in assessment:
                    summary = assessment['cascade_summary']
                    html += f"""
                    <p><strong>Original Node:</strong> {summary.get('original_node', {}).get('name', 'Unknown')}</p>
                    <p><strong>Total Impacted Nodes:</strong> {summary.get('total_impacted_nodes', 0)}</p>
                    <p><strong>Cascade Depth:</strong> {summary.get('actual_cascade_depth', 0)}</p>
                    <p><strong>Worst Impact Category:</strong> {summary.get('worst_impact_category', 'Unknown')}</p>
                    """
                
                html += "<h3>Impact Levels</h3>\n"
                
                for cascade in assessment['cascading_impacts']:
                    level = cascade.get('level', 0)
                    count = cascade.get('node_count', 0)
                    
                    html += f"""
                    <h4>Level {level} - {count} nodes impacted</h4>
                    """
                    
                    if count > 0:
                        html += """
                        <table>
                            <tr>
                                <th>Node</th>
                                <th>Type</th>
                                <th>Impact</th>
                            </tr>
                        """
                        
                        for node in cascade.get('impacted_nodes', []):
                            category = node.get('impact_category', 'Unknown').lower()
                            html += f"""
                            <tr class="{category}">
                                <td>{node.get('node_name', 'Unknown')}</td>
                                <td>{node.get('node_type', 'Unknown')}</td>
                                <td>{node.get('impact_category', 'Unknown')}</td>
                            </tr>
                            """
                            
                        html += "</table>\n"
                
                html += "</div>\n"
            
            html += """
            </body>
            </html>
            """
            
            return html
            
        elif format.lower() == "text":
            # Generate a plain text report
            text = "=== VMWARE CHANGE IMPACT ASSESSMENT ===\n\n"
            
            # Assessment info
            if 'change_assessment' in assessment:
                ca = assessment['change_assessment']
                text += "== CHANGE DETAILS ==\n"
                text += f"Node: {ca.get('node_name', 'Unknown')} ({ca.get('node_type', 'Unknown')})\n"
                text += f"Change Type: {ca.get('change_type', 'Unknown')}\n"
                text += f"Description: {ca.get('change_description', 'None provided')}\n"
                text += f"Ticket ID: {ca.get('change_ticket_id', 'Not assigned')}\n"
                text += f"Assessment Time: {ca.get('assessment_timestamp', 'Unknown')}\n\n"
            
            # Impact summary
            if 'impact_summary' in assessment:
                summary = assessment['impact_summary']
                text += "== IMPACT SUMMARY ==\n"
                text += f"Overall Impact: {summary.get('overall_impact_category', 'Unknown')} "
                text += f"(Score: {summary.get('overall_impact_score', 0):.1f})\n"
                text += f"Impacted Nodes: {summary.get('impacted_node_count', 0)}\n\n"
                
                text += "Recommendations:\n"
                for i, rec in enumerate(summary.get('recommendations', []), 1):
                    text += f"{i}. {rec}\n"
                text += "\n"
            
            # Impacted nodes
            if 'impacted_nodes' in assessment and assessment['impacted_nodes']:
                text += "== IMPACTED NODES ==\n"
                text += f"{'Node':<30} {'Type':<20} {'Relationship':<20} {'Impact':<10} {'Score':<6}\n"
                text += "-" * 90 + "\n"
                
                for node in assessment['impacted_nodes']:
                    text += f"{node.get('node_name', 'Unknown'):<30} "
                    text += f"{node.get('node_type', 'Unknown'):<20} "
                    text += f"{node.get('relationship', 'Unknown'):<20} "
                    text += f"{node.get('impact_category', 'Unknown'):<10} "
                    text += f"{node.get('impact_score', 0):.1f}\n"
                
                text += "\n"
                
                # Node-specific recommendations for high impact nodes
                high_impact_nodes = [n for n in assessment['impacted_nodes'] 
                                    if n.get('impact_category') in ['Critical', 'High']]
                
                if high_impact_nodes:
                    text += "== KEY RECOMMENDATIONS FOR HIGH-IMPACT NODES ==\n"
                    
                    for node in high_impact_nodes:
                        text += f"\n{node.get('node_name', 'Unknown')} ({node.get('node_type', 'Unknown')}):\n"
                        
                        for i, rec in enumerate(node.get('recommendations', []), 1):
                            text += f"  {i}. {rec}\n"
            
            # Cascading impacts if present
            if 'cascading_impacts' in assessment:
                text += "\n== CASCADING IMPACT ANALYSIS ==\n"
                
                if 'cascade_summary' in assessment:
                    summary = assessment['cascade_summary']
                    text += f"Original Node: {summary.get('original_node', {}).get('name', 'Unknown')}\n"
                    text += f"Total Impacted Nodes: {summary.get('total_impacted_nodes', 0)}\n"
                    text += f"Cascade Depth: {summary.get('actual_cascade_depth', 0)}\n"
                    text += f"Worst Impact Category: {summary.get('worst_impact_category', 'Unknown')}\n\n"
                
                text += "Impact Levels:\n"
                
                for cascade in assessment['cascading_impacts']:
                    level = cascade.get('level', 0)
                    count = cascade.get('node_count', 0)
                    
                    text += f"\nLevel {level} - {count} nodes impacted\n"
                    
                    if count > 0:
                        text += f"{'Node':<30} {'Type':<20} {'Impact':<10}\n"
                        text += "-" * 60 + "\n"
                        
                        for node in cascade.get('impacted_nodes', []):
                            text += f"{node.get('node_name', 'Unknown'):<30} "
                            text += f"{node.get('node_type', 'Unknown'):<20} "
                            text += f"{node.get('impact_category', 'Unknown'):<10}\n"
            
            return text
        
        else:
            return f"Unsupported format: {format}. Supported formats are 'json', 'html', and 'text'."
    
    def generate_change_ticket(self, assessment: Dict) -> Dict:
        """
        Generate a change ticket based on impact assessment results.
        
        Args:
            assessment: Impact assessment results from analyze_change_impact()
            
        Returns:
            Dictionary containing change ticket information
        """
        if 'change_assessment' not in assessment:
            return {"error": "Invalid assessment data"}
        
        ca = assessment['change_assessment']
        summary = assessment.get('impact_summary', {})
        
        # Define change window based on impact
        impact_category = summary.get('overall_impact_category', 'Medium')
        
        if impact_category == 'Critical':
            duration_hours = 4
            day_offset = 14  # Two weeks notice
        elif impact_category == 'High':
            duration_hours = 3
            day_offset = 7   # One week notice
        elif impact_category == 'Medium':
            duration_hours = 2
            day_offset = 3   # Three days notice
        else:  # Low
            duration_hours = 1
            day_offset = 1   # One day notice
        
        # Calculate planned start date (default to weekend for higher impacts)
        planned_date = datetime.datetime.now() + datetime.timedelta(days=day_offset)
        
        # For Critical and High impacts, default to weekend
        if impact_category in ['Critical', 'High'] and planned_date.weekday() < 5:
            # Calculate days until Saturday
            days_to_add = 5 - planned_date.weekday()
            planned_date += datetime.timedelta(days=days_to_add)
        
        # Format dates
        planned_start = planned_date.replace(hour=22, minute=0, second=0).isoformat()  # Default to 10 PM
        planned_end = (planned_date.replace(hour=22, minute=0, second=0) + 
                      datetime.timedelta(hours=duration_hours)).isoformat()
        
        # Generate approver list based on impact
        approvers = ["Infrastructure Team Lead"]
        
        if impact_category in ['Critical', 'High']:
            approvers.append("IT Manager")
        if impact_category == 'Critical':
            approvers.append("Change Advisory Board")
            
        # Generate change ticket
        ticket = {
            "ticket_id": ca.get('change_ticket_id', f"CHG-{datetime.datetime.now().strftime('%Y%m%d')}-{random.randint(1000, 9999)}"),
            "title": f"{ca.get('change_type', 'Change').capitalize()} for {ca.get('node_type', 'component')} {ca.get('node_name', '')}",
            "description": ca.get('change_description', 'No description provided'),
            "change_type": ca.get('change_type', 'Unknown'),
            "status": "Draft",
            "impact_category": impact_category,
            "risk_score": summary.get('overall_impact_score', 50),
            "affected_components": [
                {
                    "primary": {
                        "id": ca.get('node_id', ''),
                        "name": ca.get('node_name', ''),
                        "type": ca.get('node_type', '')
                    }
                },
                {
                    "related": [
                        {
                            "id": node.get('node_id', ''),
                            "name": node.get('node_name', ''),
                            "type": node.get('node_type', ''),
                            "impact": node.get('impact_category', '')
                        } for node in assessment.get('impacted_nodes', [])[:5]  # Top 5 impacted nodes
                    ]
                }
            ],
            "schedule": {
                "planned_start": planned_start,
                "planned_end": planned_end,
                "duration_hours": duration_hours,
                "blackout_periods": []  # Could be populated from a calendar service
            },
            "approvers": approvers,
            "implementation_plan": [
                "Verify current system state and connectivity",
                f"Implement {ca.get('change_type', 'change')} on {ca.get('node_name', 'target system')}",
                "Verify functionality after change",
                "Test connectivity and performance",
                "Document results"
            ],
            "rollback_plan": [
                "Stop implementation if issues occur",
                "Restore previous configuration",
                "Verify system returns to previous state",
                "Document rollback actions taken"
            ],
            "communications_plan": {
                "pre_change_notification": [
                    {
                        "audience": "System Owners",
                        "timing": "48 hours before change",
                        "message": f"Planned {ca.get('change_type', 'maintenance')} will affect {ca.get('node_name', 'systems')}"
                    },
                    {
                        "audience": "End Users",
                        "timing": "24 hours before change",
                        "message": "Planned maintenance may cause brief service interruption"
                    }
                ],
                "during_change_updates": [
                    {
                        "audience": "IT Support Team",
                        "timing": "At start and completion of each major step",
                        "message": "Status updates on change progress"
                    }
                ],
                "post_change_notification": [
                    {
                        "audience": "All Stakeholders",
                        "timing": "Upon completion",
                        "message": "Change completed successfully"
                    }
                ]
            },
            "testing_plan": summary.get('recommendations', [])[:5],  # Use top recommendations as testing steps
            "created_date": datetime.datetime.now().isoformat(),
            "created_by": "VMware Change Impact Analyzer"
        }
        
        return ticket
    
    def track_actual_impact(self, change_ticket_id: str, actual_results: Dict) -> Dict:
        """
        Track the actual impact of a change after implementation.
        This can be used to compare predicted vs. actual impacts.
        
        Args:
            change_ticket_id: ID of the change ticket
            actual_results: Dictionary containing actual impact information
            
        Returns:
            Dictionary containing comparison of predicted vs. actual impact
        """
        # This would typically involve:
        # 1. Retrieving the original assessment from a database
        # 2. Comparing predicted vs. actual impacts
        # 3. Updating the knowledge base for better future predictions
        
        # For this example, we'll assume the actual_results is provided by the caller
        
        # Placeholder implementation
        comparison = {
            "change_ticket_id": change_ticket_id,
            "comparison_timestamp": datetime.datetime.now().isoformat(),
            "predicted_impact": {
                "category": actual_results.get("predicted_category", "Unknown"),
                "score": actual_results.get("predicted_score", 0),
                "impacted_node_count": actual_results.get("predicted_node_count", 0)
            },
            "actual_impact": {
                "category": actual_results.get("actual_category", "Unknown"),
                "affected_node_count": actual_results.get("actual_node_count", 0),
                "duration_minutes": actual_results.get("duration_minutes", 0),
                "unexpected_issues": actual_results.get("unexpected_issues", [])
            },
            "accuracy": {
                "category_match": actual_results.get("predicted_category") == actual_results.get("actual_category"),
                "node_count_difference": actual_results.get("actual_node_count", 0) - 
                                         actual_results.get("predicted_node_count", 0),
                "unexpected_issue_count": len(actual_results.get("unexpected_issues", [])),
                "overall_accuracy_percentage": actual_results.get("accuracy_percentage", 0)
            },
            "lessons_learned": actual_results.get("lessons_learned", []),
            "model_update_recommendations": []
        }
        
        # Generate model update recommendations based on accuracy
        if comparison["accuracy"]["category_match"] is False:
            comparison["model_update_recommendations"].append(
                f"Update impact model for {actual_results.get('node_type', 'node')} changes"
            )
        
        if abs(comparison["accuracy"]["node_count_difference"]) > 3:
            comparison["model_update_recommendations"].append(
                "Improve relationship traversal logic to better identify affected components"
            )
        
        if comparison["accuracy"]["unexpected_issue_count"] > 0:
            comparison["model_update_recommendations"].append(
                "Add new relationship types to capture dependencies that were missed"
            )
        
        return comparison


# Example usage and utility functions

def sample_neo4j_setup(uri: str, username: str, password: str):
    """
    Create sample data in Neo4j for testing the impact analyzer.
    This is just a utility function to populate a test database.
    
    Args:
        uri: Neo4j server URI
        username: Neo4j username
        password: Neo4j password
    """
    driver = GraphDatabase.driver(uri, auth=(username, password))
    
    with driver.session() as session:
        # Clear existing data
        session.run("MATCH (n) DETACH DELETE n")
        
        # Create sample nodes
        # vCenter
        session.run("""
        CREATE (vc:VCenterServer {
            id: 'vc-1001',
            name: 'vcenter01.vmware.local',
            version: '7.0.3',
            businessCriticalityScore: 90,
            environment: 'Production'
        })
        """)
        
        # ESXi Hosts
        session.run("""
        CREATE (esxi1:ESXiHost {
            id: 'host-1001',
            name: 'esxi01.vmware.local',
            version: '7.0.3',
            businessCriticalityScore: 85,
            cpuUsagePercentage: 65,
            memoryUsagePercentage: 75
        })
        CREATE (esxi2:ESXiHost {
            id: 'host-1002',
            name: 'esxi02.vmware.local',
            version: '7.0.3',
            businessCriticalityScore: 85,
            cpuUsagePercentage: 55,
            memoryUsagePercentage: 65
        })
        """)
        
        # Cluster
        session.run("""
        CREATE (cluster:VSphereCluster {
            id: 'cluster-1001',
            name: 'Production-Cluster',
            businessCriticalityScore: 80,
            haEnabled: true
        })
        """)
        
        # vSAN
        session.run("""
        CREATE (vsan:VSANCluster {
            id: 'vsan-1001',
            name: 'vSAN-Cluster',
            businessCriticalityScore: 85,
            vsanVersion: '7.0'
        })
        """)
        
        # Datastores
        session.run("""
        CREATE (ds1:Datastore {
            id: 'datastore-1001',
            name: 'vSAN-DS01',
            type: 'vSAN',
            businessCriticalityScore: 80,
            capacityGB: 2048,
            freeGB: 1024
        })
        CREATE (ds2:Datastore {
            id: 'datastore-1002',
            name: 'SAN-LUN01',
            type: 'VMFS',
            businessCriticalityScore: 75,
            capacityGB: 4096,
            freeGB: 2048
        })
        """)
        
        # NSX Components
        session.run("""
        CREATE (nsxm:NSXManager {
            id: 'nsxmgr-1001',
            name: 'nsxmgr-1001.nsx.local',
            nsxType: 'NSX-T',
            version: '3.2.0',
            businessCriticalityScore: 85
        })
        CREATE (edge:NSXEdge {
            id: 'edge-1001',
            name: 'edge-1001',
            edgeType: 'NSX-T Edge',
            businessCriticalityScore: 80
        })
        CREATE (switch:NSXSwitch {
            id: 'nsxswitch-1001',
            name: 'nsxswitch-1001',
            switchType: 'NSX-T Segment',
            businessCriticalityScore: 75
        })
        """)
        
        # Virtual Networks
        session.run("""
        CREATE (vnet1:VirtualNetwork {
            id: 'vnet-1001',
            name: 'Production-Net',
            type: 'NSX Segment',
            businessCriticalityScore: 85
        })
        CREATE (vnet2:VirtualNetwork {
            id: 'vnet-1002',
            name: 'Management',
            type: 'Distributed Port Group',
            businessCriticalityScore: 90
        })
        """)
        
        # VMs
        session.run("""
        CREATE (vm1:VirtualMachine {
            id: 'vm-1001',
            name: 'app-server-1',
            powerState: 'poweredOn',
            businessCriticalityScore: 90,
            application: 'ERP System',
            environment: 'Production'
        })
        CREATE (vm2:VirtualMachine {
            id: 'vm-1002',
            name: 'db-server-1',
            powerState: 'poweredOn',
            businessCriticalityScore: 95,
            application: 'Database Server',
            environment: 'Production'
        })
        CREATE (vm3:VirtualMachine {
            id: 'vm-1003',
            name: 'web-server-1',
            powerState: 'poweredOn',
            businessCriticalityScore: 85,
            application: 'Web Application',
            environment: 'Production'
        })
        CREATE (vm4:VirtualMachine {
            id: 'vm-1004',
            name: 'test-server-1',
            powerState: 'poweredOn',
            businessCriticalityScore: 60,
            application: 'Test Environment',
            environment: 'Test'
        })
        """)
        
        # Create relationships
        # vCenter relationships
        session.run("""
        MATCH (vc:VCenterServer {id: 'vc-1001'})
        MATCH (esxi:ESXiHost)
        CREATE (vc)-[:MANAGES {description: 'Manages host configuration and lifecycle'}]->(esxi)
        """)
        
        session.run("""
        MATCH (vc:VCenterServer {id: 'vc-1001'})
        MATCH (cluster:VSphereCluster {id: 'cluster-1001'})
        CREATE (vc)-[:MANAGES {description: 'Manages cluster configuration'}]->(cluster)
        """)
        
        session.run("""
        MATCH (vc:VCenterServer {id: 'vc-1001'})
        MATCH (vm:VirtualMachine)
        CREATE (vc)-[:MANAGES {description: 'Manages VM lifecycle'}]->(vm)
        """)
        
        session.run("""
        MATCH (vc:VCenterServer {id: 'vc-1001'})
        MATCH (ds:Datastore)
        CREATE (vc)-[:MANAGES {description: 'Manages storage'}]->(ds)
        """)
        
        session.run("""
        MATCH (vc:VCenterServer {id: 'vc-1001'})
        MATCH (nsxm:NSXManager {id: 'nsxmgr-1001'})
        CREATE (vc)-[:INTEGRATES_WITH {description: 'Management integration'}]->(nsxm)
        """)
        
        # Cluster relationships
        session.run("""
        MATCH (cluster:VSphereCluster {id: 'cluster-1001'})
        MATCH (esxi:ESXiHost)
        CREATE (cluster)-[:CONTAINS {description: 'Host membership in cluster'}]->(esxi)
        """)
        
        # vSAN relationships
        session.run("""
        MATCH (vsan:VSANCluster {id: 'vsan-1001'})
        MATCH (cluster:VSphereCluster {id: 'cluster-1001'})
        CREATE (vsan)-[:DEPLOYED_ON {description: 'vSAN deployment target'}]->(cluster)
        """)
        
        session.run("""
        MATCH (vsan:VSANCluster {id: 'vsan-1001'})
        MATCH (ds:Datastore {id: 'datastore-1001'})
        CREATE (vsan)-[:PROVIDES {description: 'Storage provisioning'}]->(ds)
        """)
        
        # ESXi relationships
        session.run("""
        MATCH (esxi:ESXiHost {id: 'host-1001'})
        MATCH (vm:VirtualMachine) WHERE vm.id IN ['vm-1001', 'vm-1002']
        CREATE (esxi)-[:HOSTS {description: 'Provides compute resources'}]->(vm)
        """)
        
        session.run("""
        MATCH (esxi:ESXiHost {id: 'host-1002'})
        MATCH (vm:VirtualMachine) WHERE vm.id IN ['vm-1003', 'vm-1004']
        CREATE (esxi)-[:HOSTS {description: 'Provides compute resources'}]->(vm)
        """)
        
        session.run("""
        MATCH (esxi:ESXiHost)
        MATCH (ds:Datastore)
        CREATE (esxi)-[:ACCESSES {description: 'Storage access'}]->(ds)
        """)
        
        session.run("""
        MATCH (esxi:ESXiHost)
        MATCH (vnet:VirtualNetwork)
        CREATE (esxi)-[:PROVIDES_NETWORK {description: 'Network connectivity'}]->(vnet)
        """)
        
        # VM relationships
        session.run("""
        MATCH (vm:VirtualMachine)
        MATCH (ds:Datastore)
        CREATE (vm)-[:USES_STORAGE {description: 'VM files stored on datastore'}]->(ds)
        """)
        
        session.run("""
        MATCH (vm:VirtualMachine)
        MATCH (vnet:VirtualNetwork)
        CREATE (vm)-[:CONNECTED_TO {description: 'Network connectivity'}]->(vnet)
        """)
        
        # Application dependencies
        session.run("""
        MATCH (vm1:VirtualMachine {id: 'vm-1003'}) // web server
        MATCH (vm2:VirtualMachine {id: 'vm-1001'}) // app server
        CREATE (vm1)-[:DEPENDS_ON {description: 'Application dependency'}]->(vm2)
        """)
        
        session.run("""
        MATCH (vm1:VirtualMachine {id: 'vm-1001'}) // app server
        MATCH (vm2:VirtualMachine {id: 'vm-1002'}) // db server
        CREATE (vm1)-[:DEPENDS_ON {description: 'Database dependency'}]->(vm2)
        """)
        
        # NSX relationships
        session.run("""
        MATCH (nsxm:NSXManager {id: 'nsxmgr-1001'})
        MATCH (edge:NSXEdge {id: 'edge-1001'})
        CREATE (nsxm)-[:MANAGES {description: 'NSX edge management'}]->(edge)
        """)
        
        session.run("""
        MATCH (nsxm:NSXManager {id: 'nsxmgr-1001'})
        MATCH (switch:NSXSwitch {id: 'nsxswitch-1001'})
        CREATE (nsxm)-[:MANAGES {description: 'NSX logical switch management'}]->(switch)
        """)
        
        session.run("""
        MATCH (nsxm:NSXManager {id: 'nsxmgr-1001'})
        MATCH (vnet:VirtualNetwork {id: 'vnet-1001'})
        CREATE (nsxm)-[:MANAGES {description: 'NSX network management'}]->(vnet)
        """)
        
        session.run("""
        MATCH (edge:NSXEdge {id: 'edge-1001'})
        MATCH (switch:NSXSwitch {id: 'nsxswitch-1001'})
        CREATE (edge)-[:CONNECTS {description: 'Network connectivity'}]->(switch)
        """)
        
        session.run("""
        MATCH (switch:NSXSwitch {id: 'nsxswitch-1001'})
        MATCH (vnet:VirtualNetwork {id: 'vnet-1001'})
        CREATE (switch)-[:IMPLEMENTS {description: 'Switch implementation'}]->(vnet)
        """)
        
    driver.close()
    
    print("Sample Neo4j database created for VMware Change Impact Analyzer")

def get_impact_color(impact_category):
    """
    Get a color code for impact visualization based on category.
    
    Args:
        impact_category: Impact category string
        
    Returns:
        Color hex code
    """
    if impact_category.lower() == 'critical':
        return '#FF4444'  # Red
    elif impact_category.lower() == 'high':
        return '#FFAA33'  # Orange
    elif impact_category.lower() == 'medium':
        return '#FFFF44'  # Yellow
    else:  # Low or Unknown
        return '#44FF44'  # Green

def demo_impact_analysis(neo4j_uri, username, password):
    """
    Run a demonstration of the impact analyzer.
    
    Args:
        neo4j_uri: Neo4j connection URI
        username: Neo4j username
        password: Neo4j password
    """
    # Create the impact analyzer
    analyzer = VMwareChangeImpactAnalyzer(neo4j_uri, username, password)
    
    try:
        # Analyze a change to the vCenter server (upgrade)
        print("Analyzing impact of vCenter upgrade...")
        vcenter_impact = analyzer.analyze_change_impact(
            'vc-1001', 
            'upgrade', 
            'Upgrade vCenter from 7.0.3 to 8.0.0'
        )
        
        # Export the results as text
        print(analyzer.export_impact_assessment(vcenter_impact, 'text'))
        
        # Save HTML report for vCenter upgrade
        with open('vcenter_upgrade_impact.html', 'w') as f:
            f.write(analyzer.export_impact_assessment(vcenter_impact, 'html'))
        
        print("HTML report saved to vcenter_upgrade_impact.html")
        
        # Generate a change ticket
        ticket = analyzer.generate_change_ticket(vcenter_impact)
        print(f"Change ticket generated: {ticket['ticket_id']}")
        
        # Analyze a change to an ESXi host (maintenance)
        print("\nAnalyzing impact of ESXi host maintenance...")
        esxi_impact = analyzer.analyze_change_impact(
            'host-1001', 
            'maintenance', 
            'Scheduled maintenance for hardware updates'
        )
        
        # Export as text
        print(analyzer.export_impact_assessment(esxi_impact, 'text'))
        
        # Analyze a cascading change (simulated decommission of production DB)
        print("\nAnalyzing cascading impact of database server decommission...")
        cascade_impact = analyzer.simulate_change('vm-1002', 'decommission', 3)
        
        # Export as text
        cascade_text = analyzer.export_impact_assessment({
            'change_assessment': vcenter_impact['change_assessment'],
            'impact_summary': cascade_impact['direct_impact'],
            'impacted_nodes': vcenter_impact['impacted_nodes'],
            'cascading_impacts': cascade_impact['cascading_impacts'],
            'cascade_summary': cascade_impact['cascade_summary']
        }, 'text')
        
        print(cascade_text)
        
        # Visualize the impact network
        viz_data = analyzer.generate_visualization_data('vc-1001')
        print(f"\nGenerated visualization data with {len(viz_data['nodes'])} nodes and {len(viz_data['links'])} links")
        
        # Track actual impact (simulated data)
        actual_results = {
            "predicted_category": "High",
            "predicted_score": 75,
            "predicted_node_count": 10,
            "actual_category": "Medium",
            "actual_node_count": 8,
            "duration_minutes": 45,
            "unexpected_issues": ["Network connectivity briefly lost"],
            "accuracy_percentage": 85,
            "node_type": "VCenterServer",
            "lessons_learned": [
                "Network impact was overestimated",
                "Actual downtime was shorter than predicted"
            ]
        }
        
        comparison = analyzer.track_actual_impact(ticket['ticket_id'], actual_results)
        print("\nImpact prediction accuracy:")
        print(f"Predicted vs. Actual Category: {comparison['accuracy']['category_match']}")
        print(f"Node Count Difference: {comparison['accuracy']['node_count_difference']}")
        print(f"Overall Accuracy: {comparison['accuracy']['overall_accuracy_percentage']}%")
        print("\nLessons Learned:")
        for lesson in comparison['lessons_learned']:
            print(f"- {lesson}")
        
    finally:
        analyzer.close()