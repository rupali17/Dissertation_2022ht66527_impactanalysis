import random
import uuid
import datetime
from typing import Dict, List, Tuple, Any, Optional, Set
from .vmware_nodes import VMwareEnvironmentGenerator

class VMwareRelationshipGenerator:
    """
    Enhanced generator for VMware environment relationships in Neo4j.
    Creates realistic relationships between components with proper tracking.
    """
    
    def __init__(self, vmware_generator, seed: Optional[int] = None):
        """
        Initialize the relationship generator.
        
        Args:
            vmware_generator: Instance of VMwareEnvironmentGenerator that created the nodes
            seed: Optional random seed for reproducible generation
        """
        if seed is not None:
            random.seed(seed)
        
        self.vmware_generator = vmware_generator
        
        # Track generated node IDs by type
        self.node_tracking = {
            "esxi_hosts": [],
            "vcenter_servers": [],
            "vms": [],
            "vsphere_clusters": [],
            "vsan_clusters": [],
            "datastores": [],
            "nsx_managers": [],
            "virtual_networks": [],
            "nsx_edges": [],
            "nsx_switches": []
        }
        
        # Track additional node metadata for smarter relationship creation
        self.node_metadata = {
            # Will be populated like: "host-1234": {"name": "esxi01", "cluster_id": "cluster-5678", ...}
        }
        
        # Track created relationships to avoid duplicates
        self.created_relationships = set()

        self.match_alias = list()
    
    def track_node(self, node_type: str, node_id: str, metadata: Dict[str, Any]) -> None:
        """
        Track a node that's been created so we can reference it for relationships later.
        
        Args:
            node_type: Type of node (esxi_hosts, vms, etc.)
            node_id: Unique ID of the node
            metadata: Additional node properties useful for relationship creation
        """
        if node_type in self.node_tracking:
            self.node_tracking[node_type].append(node_id)
            self.node_metadata[node_id] = metadata
    
    def generate_relationships(self) -> str:
        """
        Generate comprehensive relationships between all tracked nodes.
        
        Returns:
            str: Cypher script for creating all relationships
        """
        cypher_code = "// Generated VMware Environment Relationships\n\n"
        cypher_code += "// This script creates relationships between specific node instances\n"
        cypher_code += "// for a realistic VMware infrastructure topology\n\n"
        
        # Generate all relationship types
        relationship_functions = [
            self._generate_vcenter_management_relationships,
            self._generate_cluster_host_relationships,
            self._generate_vm_host_relationships,
            self._generate_storage_relationships,
            self._generate_network_relationships,
            self._generate_nsx_relationships,
            self._generate_vsan_relationships,
            self._generate_dependency_relationships
        ]
        
        for func in relationship_functions:
            cypher_code += func() + "\n"
        
        # Add summary of relationship creation
        relationship_count = len(self.created_relationships)
        cypher_code += f"// Generated {relationship_count} total relationships\n\n"
        
        return cypher_code
    
    def _relationship_exists(self, source_id: str, target_id: str, rel_type: str) -> bool:
        """
        Check if a relationship already exists to avoid duplicates.
        
        Args:
            source_id: Source node ID
            target_id: Target node ID
            rel_type: Relationship type
            
        Returns:
            bool: True if relationship already exists
        """
        rel_key = f"{source_id}|{rel_type}|{target_id}"
        if rel_key in self.created_relationships:
            return True
        
        self.created_relationships.add(rel_key)
        return False
    
    def _generate_vcenter_management_relationships(self) -> str:
        """Generate relationships from vCenter to managed components."""
        cypher = "// vCenter Management Relationships\n"
        
        if not self.node_tracking["vcenter_servers"]:
            return cypher + "// No vCenter servers defined\n"
        
        # Each vCenter manages multiple components
        for vcenter_id in self.node_tracking["vcenter_servers"]:
            vcenter_props = self.node_metadata.get(vcenter_id, {})
            
            # vCenter manages ESXi hosts
            for host_id in self.node_tracking["esxi_hosts"]:
                if not self._relationship_exists(vcenter_id, host_id, "MANAGES"):
                    cypher += f"MATCH (vc:VCenterServer {{id: '{vcenter_id}'}}) \n"
                    cypher += f"WITH vc \n"
                    cypher += f"MATCH (host:ESXiHost {{id: '{host_id}'}}) \n"
                    cypher += f"CREATE (vc)-[:MANAGES {{cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}}]->(host);\n\n"
            
            # vCenter manages vSphere clusters
            for cluster_id in self.node_tracking["vsphere_clusters"]:
                if not self._relationship_exists(vcenter_id, cluster_id, "MANAGES"):
                    cypher += f"MATCH (vc:VCenterServer {{id: '{vcenter_id}'}}) \n"
                    cypher += f"WITH vc \n"
                    cypher += f"MATCH (cluster:VSphereCluster {{id: '{cluster_id}'}}) \n"
                    cypher += f"CREATE (vc)-[:MANAGES {{cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '{self._random_recent_timestamp()}'}}]->(cluster);\n\n"
            
            # vCenter manages datastores
            for ds_id in self.node_tracking["datastores"]:
                if not self._relationship_exists(vcenter_id, ds_id, "MANAGES"):
                    cypher += f"MATCH (vc:VCenterServer {{id: '{vcenter_id}'}}) \n"
                    cypher += f"WITH vc \n"
                    cypher += f"MATCH (ds:Datastore {{id: '{ds_id}'}}) \n"
                    cypher += f"CREATE (vc)-[:MANAGES {{cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: {random.choice(['true', 'false'])}}}]->(ds);\n\n"
            
            # vCenter manages VMs
            for vm_id in self.node_tracking["vms"]:
                if not self._relationship_exists(vcenter_id, vm_id, "MANAGES"):
                    cypher += f"MATCH (vc:VCenterServer {{id: '{vcenter_id}'}}) \n"
                    cypher += f"WITH vc \n"
                    cypher += f"MATCH (vm:VirtualMachine {{id: '{vm_id}'}}) \n"
                    cypher += f"CREATE (vc)-[:MANAGES {{cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: '{random.choice(['PowerOn', 'Reconfigure', 'Snapshot', 'vMotion', 'EditSettings'])}'}}]->(vm);\n\n"
            
            # vCenter integrates with NSX Manager
            for nsx_id in self.node_tracking["nsx_managers"]:
                if not self._relationship_exists(vcenter_id, nsx_id, "INTEGRATES_WITH"):
                    cypher += f"MATCH (vc:VCenterServer {{id: '{vcenter_id}'}}) \n"
                    cypher += f"WITH vc \n"
                    cypher += f"MATCH (nsx:NSXManager {{id: '{nsx_id}'}}) \n"
                    cypher += f"CREATE (vc)-[:INTEGRATES_WITH {{cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '{self._random_recent_timestamp()}'}}]->(nsx);\n\n"
        
        return cypher
    
    def _generate_cluster_host_relationships(self) -> str:
        """Generate relationships between clusters and hosts."""
        cypher = "// Cluster and Host Relationships\n"
        
        if not self.node_tracking["vsphere_clusters"] or not self.node_tracking["esxi_hosts"]:
            return cypher + "// No clusters or hosts defined\n"
        
        # Assign hosts to clusters in a realistic distribution
        # 1. Determine number of hosts per cluster
        cluster_assignments = {}
        remaining_hosts = list(self.node_tracking["esxi_hosts"])
        
        for cluster_id in self.node_tracking["vsphere_clusters"]:
            cluster_props = self.node_metadata.get(cluster_id, {})
            host_count = cluster_props.get("hostCount", random.randint(2, max(2, min(8, len(remaining_hosts)))))
            
            # Assign up to host_count hosts to this cluster
            host_assignments = []
            for _ in range(min(host_count, len(remaining_hosts))):
                if remaining_hosts:
                    host = random.choice(remaining_hosts)
                    remaining_hosts.remove(host)
                    host_assignments.append(host)
            
            cluster_assignments[cluster_id] = host_assignments
            
            # Create CONTAINS relationships for this cluster
            for host_id in host_assignments:
                if not self._relationship_exists(cluster_id, host_id, "CONTAINS"):
                    join_date = self._random_past_timestamp(365)
                    cypher += f"MATCH (cluster:VSphereCluster {{id: '{cluster_id}'}}) \n"
                    cypher += f"WITH cluster \n"
                    cypher += f"MATCH (host:ESXiHost {{id: '{host_id}'}}) \n"
                    cypher += f"CREATE (cluster)-[:CONTAINS {{cardinality: '1:N', description: 'Host membership in cluster', joinDate: '{join_date}', membershipStatus: 'Active'}}]->(host);\n\n"
        
        # Any remaining hosts are standalone
        for host_id in remaining_hosts:
            # Update metadata to show this host is standalone
            if host_id in self.node_metadata:
                self.node_metadata[host_id]["is_standalone"] = True
        
        return cypher
    
    def _generate_vm_host_relationships(self) -> str:
        """Generate relationships between VMs and hosts."""
        cypher = "// VM and Host Relationships\n"
        
        if not self.node_tracking["vms"] or not self.node_tracking["esxi_hosts"]:
            return cypher + "// No VMs or hosts defined\n"
        
        # Distribute VMs across hosts with weighted randomness
        # Higher-resource hosts get more VMs
        host_capacities = {}
        total_capacity = 0
        
        for host_id in self.node_tracking["esxi_hosts"]:
            host_props = self.node_metadata.get(host_id, {})
            # Calculate capacity based on CPU and memory
            capacity = host_props.get("cpuTotalCores", 32) * host_props.get("memoryGB", 256) / 1000
            host_capacities[host_id] = capacity
            total_capacity += capacity
        
        # Normalize capacities to probabilities
        host_weights = {host_id: capacity / total_capacity for host_id, capacity in host_capacities.items()}
        
        # Assign VMs to hosts based on capacity weights
        for vm_id in self.node_tracking["vms"]:
            vm_props = self.node_metadata.get(vm_id, {})
            
            # Skip powered off VMs sometimes
            if vm_props.get("powerState") == "poweredOff" and random.random() < 0.2:
                continue
            
            # Choose host based on capacity weights
            host_id = random.choices(
                list(host_weights.keys()),
                weights=list(host_weights.values()),
                k=1
            )[0]
            
            # Create HOSTS relationship
            if not self._relationship_exists(host_id, vm_id, "HOSTS"):
                cypher += f"MATCH (host:ESXiHost {{id: '{host_id}'}}) \n"
                cypher += f"WITH host \n"
                cypher += f"MATCH (vm:VirtualMachine {{id: '{vm_id}'}}) \n"
                cypher += f"CREATE (host)-[:HOSTS {{cardinality: '1:N', description: 'Provides compute resources to VM', "
                cypher += f"vCpuReservation: {random.randint(0, 100)}, "
                cypher += f"memoryReservation: {random.randint(0, 100)}, "
                cypher += f"affinityType: '{random.choice(['Soft', 'Hard', 'None'])}'"
                cypher += f"}}]->(vm);\n\n"
                
                # Update VM metadata with host assignment
                if vm_id in self.node_metadata:
                    self.node_metadata[vm_id]["host_id"] = host_id
        
        return cypher
    
    def _generate_storage_relationships(self) -> str:
        """Generate storage relationships between components."""
        cypher = "// Storage Relationships\n"
        
        if not self.node_tracking["datastores"]:
            return cypher + "// No datastores defined\n"
        
        # 1. Create ESXi to Datastore relationships
        if self.node_tracking["esxi_hosts"]:
            cypher += "// ESXi Host to Datastore connections\n"
            
            for host_id in self.node_tracking["esxi_hosts"]:
                # Each host connects to 1-N datastores
                host_props = self.node_metadata.get(host_id, {})
                ds_count = random.randint(1, min(5, len(self.node_tracking["datastores"])))
                host_datastores = random.sample(self.node_tracking["datastores"], ds_count)
                
                for ds_id in host_datastores:
                    ds_props = self.node_metadata.get(ds_id, {})
                    access_mode = "ReadWrite" if random.random() < 0.9 else "ReadOnly"
                    
                    if not self._relationship_exists(host_id, ds_id, "ACCESSES"):
                        cypher += f"MATCH (host:ESXiHost {{id: '{host_id}'}}) \n"
                        cypher += f"WITH host \n"
                        cypher += f"MATCH (ds:Datastore {{id: '{ds_id}'}}) \n"
                        cypher += f"CREATE (host)-[:ACCESSES {{cardinality: 'N:M', description: 'Storage access', "
                        cypher += f"accessMode: '{access_mode}', "
                        cypher += f"mountPoint: '/vmfs/volumes/{ds_props.get('name', ds_id)}', "
                        cypher += f"multipathing: '{random.choice(['Fixed', 'RoundRobin', 'MRU'])}', "
                        cypher += f"activePaths: {random.randint(1, 4)}"
                        cypher += f"}}]->(ds);\n\n"
        
        # 2. Create VM to Datastore relationships
        if self.node_tracking["vms"]:
            cypher += "// VM to Datastore storage relationships\n"
            
            for vm_id in self.node_tracking["vms"]:
                vm_props = self.node_metadata.get(vm_id, {})
                
                # Each VM needs at least one datastore
                ds_count = min(vm_props.get("numVirtualDisks", 1), len(self.node_tracking["datastores"]))
                if ds_count == 0:
                    ds_count = 1
                
                vm_datastores = random.sample(self.node_tracking["datastores"], ds_count)
                
                for i, ds_id in enumerate(vm_datastores):
                    ds_props = self.node_metadata.get(ds_id, {})
                    
                    # Primary disk vs additional disk
                    disk_type = "System Disk" if i == 0 else f"Data Disk {i}"
                    disk_size_gb = 40 if i == 0 else random.choice([100, 200, 500, 1000])
                    
                    if not self._relationship_exists(vm_id, ds_id, "USES_STORAGE"):
                        cypher += f"MATCH (vm:VirtualMachine {{id: '{vm_id}'}}) \n"
                        cypher += f"WITH vm \n"
                        cypher += f"MATCH (ds:Datastore {{id: '{ds_id}'}}) \n"
                        cypher += f"CREATE (vm)-[:USES_STORAGE {{cardinality: 'N:M', description: 'VM files stored on datastore', "
                        cypher += f"diskType: '{disk_type}', "
                        cypher += f"sizeGB: {disk_size_gb}, "
                        cypher += f"format: 'vmdk', "
                        cypher += f"provisioningType: '{random.choice(['Thin', 'Thick', 'EagerZeroedThick'])}', "
                        cypher += f"storagePolicy: '{random.choice(['Standard', 'Gold', 'Silver', 'Bronze'])}',"
                        cypher += f"fileCount: {random.randint(1, 10)}"
                        cypher += f"}}]->(ds);\n\n"
        
        # 3. Create vSAN to Datastore relationships
        if self.node_tracking["vsan_clusters"] and self.node_tracking["datastores"]:
            cypher += "// vSAN to Datastore provisioning\n"
            
            for vsan_id in self.node_tracking["vsan_clusters"]:
                vsan_props = self.node_metadata.get(vsan_id, {})
                
                # Find a non-VMFS datastore for vSAN or create one if needed
                vsan_datastores = []
                for ds_id in self.node_tracking["datastores"]:
                    ds_props = self.node_metadata.get(ds_id, {})
                    if ds_props.get("type") == "vSAN":
                        vsan_datastores.append(ds_id)
                
                # If no vSAN datastores, associate with one existing one
                if not vsan_datastores and self.node_tracking["datastores"]:
                    vsan_datastores = [random.choice(self.node_tracking["datastores"])]
                
                

                for ds_id in vsan_datastores:
                    if not self._relationship_exists(vsan_id, ds_id, "PROVIDES"):
                        cypher += f"MATCH (vsan:VSANCluster {{id: '{vsan_id}'}}) \n"
                        cypher += f"WITH vsan \n"
                        cypher += f"MATCH (ds:Datastore {{id: '{ds_id}'}}) \n"
                        cypher += f"CREATE (vsan)-[:PROVIDES {{cardinality: '1:N', description: 'vSAN storage provisioning', "
                        cypher += f"policyName: '{random.choice(['vSAN Default Storage Policy', 'Encryption Policy', 'High Performance', 'Capacity Tier'])}', "
                        cypher += f"failuresToTolerate: {random.randint(1, 3)}, "
                        cypher += f"stripeWidth: {random.randint(1, 12)}, "
                        cypher += f"forceProvisioning: {random.choice(['true', 'false'])}"
                        cypher += f"}}]->(ds);\n\n"
        
        return cypher
    
    def _generate_network_relationships(self) -> str:
        """Generate network relationships between components."""
        cypher = "// Network Relationships\n"
        
        if not self.node_tracking["virtual_networks"]:
            return cypher + "// No virtual networks defined\n"
        
        # 1. ESXi hosts provide standard and distributed switches
        if self.node_tracking["esxi_hosts"] and self.node_tracking["virtual_networks"]:
            cypher += "// ESXi Host to Virtual Network relationships\n"
            
            for host_id in self.node_tracking["esxi_hosts"]:
                host_props = self.node_metadata.get(host_id, {})
                
                # Select some networks for this host
                net_count = random.randint(2, min(6, len(self.node_tracking["virtual_networks"])))
                host_networks = random.sample(self.node_tracking["virtual_networks"], net_count)
                
                for net_id in host_networks:
                    net_props = self.node_metadata.get(net_id, {})
                    
                    # Only connect to Standard or Distributed networks
                    net_type = net_props.get("type", "")
                    if not ("Standard" in net_type or "Distributed" in net_type):
                        continue
                    
                    if not self._relationship_exists(host_id, net_id, "PROVIDES_NETWORK"):
                        cypher += f"MATCH (host:ESXiHost {{id: '{host_id}'}}) \n"
                        cypher += f"WITH host \n"
                        cypher += f"MATCH (vnet:VirtualNetwork {{id: '{net_id}'}}) \n"
                        cypher += f"CREATE (host)-[:PROVIDES_NETWORK {{cardinality: '1:N', description: 'Network connectivity', "
                        cypher += f"uplinks: {random.randint(1, 4)}, "
                        cypher += f"redundancyStatus: '{random.choice(['Full', 'Partial', 'None'])}', "
                        cypher += f"uplinkUtilization: {random.randint(1, 90)}"
                        cypher += f"}}]->(vnet);\n\n"
        
        # 2. VMs connect to virtual networks
        if self.node_tracking["vms"] and self.node_tracking["virtual_networks"]:
            cypher += "// VM to Virtual Network connections\n"
            
            for vm_id in self.node_tracking["vms"]:
                vm_props = self.node_metadata.get(vm_id, {})
                
                # Skip powered off VMs sometimes
                if vm_props.get("powerState") == "poweredOff" and random.random() < 0.3:
                    continue
                
                # Each VM connects to 1-N networks
                nic_count = vm_props.get("numVirtualNics", random.randint(1, 3))
                
                # Ensure we don't try to assign more networks than exist
                nic_count = min(nic_count, len(self.node_tracking["virtual_networks"]))
                
                # It's common to have Management, vMotion, Storage networks
                vm_networks = []
                
                # For special network types, assign purposefully
                if vm_props.get("application") == "vCenter Server" or vm_props.get("application") == "NSX Manager":
                    # Look for management network first
                    for net_id in self.node_tracking["virtual_networks"]:
                        net_props = self.node_metadata.get(net_id, {})
                        if "Management" in net_props.get("name", ""):
                            vm_networks.append(net_id)
                            break
                
                # Add remaining random networks
                remaining_needed = nic_count - len(vm_networks)
                if remaining_needed > 0:
                    available_networks = [n for n in self.node_tracking["virtual_networks"] if n not in vm_networks]
                    vm_networks.extend(random.sample(available_networks, min(remaining_needed, len(available_networks))))
                
                # Create connections for each VM network
                for i, net_id in enumerate(vm_networks):
                    if not self._relationship_exists(vm_id, net_id, "CONNECTED_TO"):
                        cypher += f"MATCH (vm:VirtualMachine {{id: '{vm_id}'}}) \n"
                        cypher += f"WITH vm \n"
                        cypher += f"MATCH (vnet:VirtualNetwork {{id: '{net_id}'}}) \n"
                        cypher += f"CREATE (vm)-[:CONNECTED_TO {{cardinality: 'N:M', description: 'Network connectivity', "
                        cypher += f"adapterType: '{vm_props.get('networkType', 'vmxnet3')}', "
                        cypher += f"adapterNumber: {i}, "
                        cypher += f"connected: {random.choice(['true', 'true', 'true', 'false'])}, "  # Usually connected
                        cypher += f"ipAddress: '{self._generate_ip_address()}', "
                        cypher += f"macAddress: '{self._generate_mac_address()}'"
                        cypher += f"}}]->(vnet);\n\n"
        
        return cypher
    
    def _generate_nsx_relationships(self) -> str:
        """Generate NSX-related relationships."""
        cypher = "// NSX Management Relationships\n"
        
        if not self.node_tracking["nsx_managers"]:
            return cypher + "// No NSX components defined\n"
        
        # 1. NSX Manager manages Edges, Switches, and Networks
        for nsx_id in self.node_tracking["nsx_managers"]:
            nsx_props = self.node_metadata.get(nsx_id, {})
            
            # NSX Manager manages NSX Edges
            for edge_id in self.node_tracking["nsx_edges"]:
                if not self._relationship_exists(nsx_id, edge_id, "MANAGES"):
                    cypher += f"MATCH (nsx:NSXManager {{id: '{nsx_id}'}}) \n"
                    cypher += f"WITH nsx \n"
                    cypher += f"MATCH (edge:NSXEdge {{id: '{edge_id}'}}) \n"
                    cypher += f"CREATE (nsx)-[:MANAGES {{cardinality: '1:N', description: 'NSX edge management', "
                    cypher += f"managementConnection: 'API', "
                    cypher += f"lastSynchronized: '{self._random_recent_timestamp()}', "
                    cypher += f"configurationState: '{random.choice(['Synchronized', 'ConfigurationPending', 'OutOfSync'])}'"
                    cypher += f"}}]->(edge);\n\n"
            
            # NSX Manager manages NSX Switches
            for switch_id in self.node_tracking["nsx_switches"]:
                if not self._relationship_exists(nsx_id, switch_id, "MANAGES"):
                    cypher += f"MATCH (nsx:NSXManager {{id: '{nsx_id}'}}) \n"
                    cypher += f"WITH nsx \n"
                    cypher += f"MATCH (switch:NSXSwitch {{id: '{switch_id}'}}) \n"
                    cypher += f"CREATE (nsx)-[:MANAGES {{cardinality: '1:N', description: 'NSX logical switch management', "
                    cypher += f"managementType: 'API', "
                    cypher += f"lastUpdated: '{self._random_recent_timestamp()}'"
                    cypher += f"}}]->(switch);\n\n"
            
            # NSX Manager manages NSX-backed Virtual Networks
            for net_id in self.node_tracking["virtual_networks"]:
                net_props = self.node_metadata.get(net_id, {})
                
                # Only manage NSX networks
                if "NSX" not in net_props.get("type", ""):
                    continue
                
                if not self._relationship_exists(nsx_id, net_id, "MANAGES"):
                    cypher += f"MATCH (nsx:NSXManager {{id: '{nsx_id}'}}) \n"
                    cypher += f"WITH nsx \n"
                    cypher += f"MATCH (vnet:VirtualNetwork {{id: '{net_id}'}}) \n"
                    cypher += f"CREATE (nsx)-[:MANAGES {{cardinality: '1:N', description: 'NSX network management', "
                    cypher += f"transportZone: '{net_props.get('transportZone', 'default')}', "
                    cypher += f"logicalRouterConnection: {random.choice(['true', 'false'])}"
                    cypher += f"}}]->(vnet);\n\n"
        
        # 2. NSX component relationships
        cypher += "// NSX Component Relationships\n"
        
        # NSX Edge to Switch relationships
        if self.node_tracking["nsx_edges"] and self.node_tracking["nsx_switches"]:
            for edge_id in self.node_tracking["nsx_edges"]:
                edge_props = self.node_metadata.get(edge_id, {})
                
                # Each edge connects to some switches
                switch_count = random.randint(1, min(4, len(self.node_tracking["nsx_switches"])))
                edge_switches = random.sample(self.node_tracking["nsx_switches"], switch_count)
                
                for switch_id in edge_switches:
                    if not self._relationship_exists(edge_id, switch_id, "CONNECTS"):
                        cypher += f"MATCH (edge:NSXEdge {{id: '{edge_id}'}}) \n"
                        cypher += f"WITH edge \n"
                        cypher += f"MATCH (switch:NSXSwitch {{id: '{switch_id}'}}) \n"
                        cypher += f"CREATE (edge)-[:CONNECTS {{cardinality: 'N:M', description: 'Network connectivity', "
                        cypher += f"interfaceType: '{random.choice(['Uplink', 'Internal', 'Transit', 'Service'])}', "
                        cypher += f"bandwidthMbps: {random.choice([1000, 10000])}"
                        cypher += f"}}]->(switch);\n\n"
        
        # NSX Switch to Virtual Network relationships
        if self.node_tracking["nsx_switches"] and self.node_tracking["virtual_networks"]:
            for switch_id in self.node_tracking["nsx_switches"]:
                switch_props = self.node_metadata.get(switch_id, {})
                
                # Find NSX networks
                nsx_networks = []
                for net_id in self.node_tracking["virtual_networks"]:
                    net_props = self.node_metadata.get(net_id, {})
                    if "NSX" in net_props.get("type", ""):
                        nsx_networks.append(net_id)
                
                # If no NSX networks, skip
                if not nsx_networks:
                    continue
                
                # Each switch typically implements 1-3 logical networks
                net_count = random.randint(1, min(3, len(nsx_networks)))
                switch_networks = random.sample(nsx_networks, net_count)
                
                for net_id in switch_networks:
                    if not self._relationship_exists(switch_id, net_id, "IMPLEMENTS"):
                        cypher += f"MATCH (switch:NSXSwitch {{id: '{switch_id}'}}) \n"
                        cypher += f"WITH switch \n"
                        cypher += f"MATCH (vnet:VirtualNetwork {{id: '{net_id}'}}) \n"
                        cypher += f"CREATE (switch)-[:IMPLEMENTS {{cardinality: '1:1', description: 'Switch implementation', "
                        cypher += f"implementationType: '{random.choice(['Native', 'Gateway', 'Bridge'])}', "
                        cypher += f"adminState: '{random.choice(['Up', 'Down'])}'"
                        cypher += f"}}]->(vnet);\n\n"
        
        return cypher
    
    def _generate_vsan_relationships(self) -> str:
        """Generate vSAN-specific relationships."""
        cypher = "// vSAN Relationships\n"
        
        if not self.node_tracking["vsan_clusters"] or not self.node_tracking["vsphere_clusters"]:
            return cypher + "// No vSAN or vSphere clusters defined\n"
        
        # 1. vSAN to vSphere Cluster relationships
        for vsan_id in self.node_tracking["vsan_clusters"]:
            # Each vSAN should be associated with a vSphere cluster
            if not self.node_tracking["vsphere_clusters"]:
                continue
            
            # Ideally, associate with the cluster that contains the most hosts
            target_cluster_id = random.choice(self.node_tracking["vsphere_clusters"])
            
            if not self._relationship_exists(vsan_id, target_cluster_id, "DEPLOYED_ON"):
                cypher += f"MATCH (vsan:VSANCluster {{id: '{vsan_id}'}}) \n"
                cypher += f"WITH vsan \n"
                cypher += f"MATCH (cluster:VSphereCluster {{id: '{target_cluster_id}'}}) \n"
                cypher += f"CREATE (vsan)-[:DEPLOYED_ON {{cardinality: '1:1', description: 'vSAN deployment target', "
                cypher += f"deploymentDate: '{self._random_past_timestamp(365)}', "
                cypher += f"configurationState: '{random.choice(['Healthy', 'Warning', 'Error', 'Healthy'])}'"  # Mostly healthy
                cypher += f"}}]->(cluster);\n\n"
            
            # 2. vSAN to participating ESXi hosts
            # Get hosts in the target cluster
            for host_id in self.node_tracking["esxi_hosts"]:
                host_props = self.node_metadata.get(host_id, {})
                
                # Only hosts in the right cluster should participate
                if not self._relationship_exists(host_id, target_cluster_id, "CONTAINED_BY") and random.random() < 0.3:
                    continue
                
                if not self._relationship_exists(host_id, vsan_id, "PARTICIPATES_IN"):
                    diskgroups = random.randint(1, 3)
                    cypher += f"MATCH (host:ESXiHost {{id: '{host_id}'}}) \n"
                    cypher += f"WITH host \n"
                    cypher += f"MATCH (vsan:VSANCluster {{id: '{vsan_id}'}}) \n"
                    cypher += f"CREATE (host)-[:PARTICIPATES_IN {{cardinality: 'N:1', description: 'vSAN membership', "
                    cypher += f"diskGroups: {diskgroups}, "
                    cypher += f"cacheTierGB: {diskgroups * random.choice([200, 400, 800])}, "
                    cypher += f"capacityTierTB: {diskgroups * random.choice([2, 4, 8, 12])}, "
                    cypher += f"role: '{random.choice(['Data', 'Witness', 'Data+Witness'])}'"
                    cypher += f"}}]->(vsan);\n\n"
        
        return cypher
    
    def _generate_dependency_relationships(self) -> str:
        """Generate application dependency relationships between VMs."""
        cypher = "// VM Dependency Relationships\n"
        
        if len(self.node_tracking["vms"]) < 2:
            return cypher + "// Not enough VMs to create dependencies\n"
        
        # Identify VMs by potential role
        web_vms = []
        app_vms = []
        db_vms = []
        infra_vms = []
        
        for vm_id in self.node_tracking["vms"]:
            vm_props = self.node_metadata.get(vm_id, {})
            name = vm_props.get("name", "").lower()
            app = vm_props.get("application", "").lower()
            
            # Categorize by name/application
            if "web" in name or "frontend" in name or "nginx" in app or "apache" in app or "iis" in app:
                web_vms.append(vm_id)
            elif "app" in name or "middle" in name or "tomcat" in app or "jboss" in app:
                app_vms.append(vm_id)
            elif "db" in name or "sql" in name or "database" in app or "oracle" in app or "mysql" in app:
                db_vms.append(vm_id)
            elif "ad" in name or "dns" in name or "dhcp" in name or "infra" in name:
                infra_vms.append(vm_id)
        
        # Create tiered dependencies
        cypher += "// Web to App tier dependencies\n"
        for web_id in web_vms:
            # Each web server might depend on 1-2 app servers
            deps_count = min(len(app_vms), random.randint(1, 2))
            if deps_count == 0:
                continue
                
            for app_id in random.sample(app_vms, deps_count):
                if not self._relationship_exists(web_id, app_id, "DEPENDS_ON"):
                    cypher += f"MATCH (web:VirtualMachine {{id: '{web_id}'}}) \n"
                    cypher += f"WITH web \n"
                    cypher += f"MATCH (app:VirtualMachine {{id: '{app_id}'}}) \n"
                    cypher += f"CREATE (web)-[:DEPENDS_ON {{cardinality: 'N:M', description: 'Application dependency', "
                    cypher += f"dependencyType: 'AppServer', "
                    cypher += f"communicationProtocol: '{random.choice(['HTTP', 'HTTPS', 'RPC', 'Custom'])}', "
                    cypher += f"port: {random.choice([8080, 8443, 80, 443])}, "
                    cypher += f"criticality: '{random.choice(['High', 'Medium', 'Low'])}'"
                    cypher += f"}}]->(app);\n\n"
        
        cypher += "// App to DB tier dependencies\n"
        for app_id in app_vms:
            # Each app server might depend on 1-2 database servers
            deps_count = min(len(db_vms), random.randint(1, 2))
            if deps_count == 0:
                continue
                
            for db_id in random.sample(db_vms, deps_count):
                if not self._relationship_exists(app_id, db_id, "DEPENDS_ON"):
                    cypher += f"MATCH (app:VirtualMachine {{id: '{app_id}'}}) \n"
                    cypher += f"WITH app \n"
                    cypher += f"MATCH (db:VirtualMachine {{id: '{db_id}'}}) \n"
                    cypher += f"CREATE (app)-[:DEPENDS_ON {{cardinality: 'N:M', description: 'Database dependency', "
                    cypher += f"dependencyType: 'Database', "
                    cypher += f"communicationProtocol: '{random.choice(['JDBC', 'ODBC', 'Native'])}', "
                    cypher += f"port: {random.choice([1433, 3306, 5432, 1521])}, "
                    cypher += f"criticality: 'High'"
                    cypher += f"}}]->(db);\n\n"
        
        cypher += "// Infrastructure dependencies\n"
        # Most VMs depend on infrastructure
        if infra_vms:
            all_app_vms = web_vms + app_vms + db_vms
            for vm_id in random.sample(all_app_vms, min(len(all_app_vms), 5)):
                for infra_id in random.sample(infra_vms, min(len(infra_vms), 2)):
                    if not self._relationship_exists(vm_id, infra_id, "DEPENDS_ON"):
                        cypher += f"MATCH (vm:VirtualMachine {{id: '{vm_id}'}}) \n"
                        cypher += f"WITH vm \n"
                        cypher += f"MATCH (infra:VirtualMachine {{id: '{infra_id}'}}) \n"
                        cypher += f"CREATE (vm)-[:DEPENDS_ON {{cardinality: 'N:M', description: 'Infrastructure dependency', "
                        cypher += f"dependencyType: '{random.choice(['DNS', 'AD', 'LDAP', 'NTP'])}', "
                        cypher += f"communicationProtocol: '{random.choice(['TCP', 'UDP'])}', "
                        cypher += f"criticality: '{random.choice(['High', 'Medium'])}'"
                        cypher += f"}}]->(infra);\n\n"
        
        return cypher
    
    def _random_past_timestamp(self, max_days_ago: int) -> str:
        """Generate a random timestamp in the past."""
        days_ago = random.randint(1, max_days_ago)
        past_date = datetime.datetime.now() - datetime.timedelta(days=days_ago)
        return past_date.strftime("%Y-%m-%dT%H:%M:%S")
    
    def _random_recent_timestamp(self) -> str:
        """Generate a random recent timestamp (within last 7 days)."""
        return self._random_past_timestamp(7)
    
    def _generate_ip_address(self) -> str:
        """Generate a random IP address."""
        return f"{random.randint(10, 192)}.{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(1, 254)}"
    
    def _generate_mac_address(self) -> str:
        """Generate a random MAC address."""
        mac = [random.randint(0, 255) for _ in range(6)]
        return ':'.join([f"{x:02x}" for x in mac])


class EnhancedVMwareEnvironmentGenerator:
    """
    Enhanced version of VMwareEnvironmentGenerator that tracks node creation
    for better relationship generation.
    """
    
    def __init__(self, seed: Optional[int] = None):
        """
        Initialize the generator with an optional random seed for reproducibility.
        
        Args:
            seed: Optional random seed for reproducible generation
        """
        self.orig_generator = VMwareEnvironmentGenerator(seed)
        self.relationship_generator = VMwareRelationshipGenerator(self, seed)
    
    def generate_multiple_components(self, counts: Dict[str, int] = None) -> str:
        """
        Generate Neo4j Cypher script for multiple VMware infrastructure components
        with realistic relationships.
        
        Args:
            counts: Dictionary specifying the number of each component type to generate.
                   If None, defaults will be used.
                   
        Returns:
            str: Complete Neo4j Cypher script with nodes and relationships
        """
        if counts is None:
            counts = {
                "esxi_host": 3,
                "vcenter": 1,
                "vm": 5,
                "vsphere_cluster": 1,
                "vsan_cluster": 1,
                "datastore": 2,
                "nsx_manager": 1,
                "virtual_network": 3,
                "nsx_edge": 2,
                "nsx_switch": 2
            }
        
        # First generate all nodes and track them
        nodes_cypher = self._generate_nodes(counts)
        
        # Then generate relationships
        relationships_cypher = self.relationship_generator.generate_relationships()
        
        # Combine into one script
        cypher_code = "// Generated VMware Environment with Relationships for Neo4j\n\n"
        cypher_code += "// NODES\n"
        cypher_code += nodes_cypher + "\n"
        cypher_code += "// RELATIONSHIPS\n"
        cypher_code += relationships_cypher
        
        return cypher_code
    
    def _generate_nodes(self, counts: Dict[str, int]) -> str:
        """Generate all nodes and track them for relationship creation."""
        cypher_code = ""
        
        # Generate ESXi Hosts
        if counts.get("esxi_host", 0) > 0:
            cypher_code += "// ESXi Hosts\n"
            host_ids = random.sample(range(1001, 9999), counts["esxi_host"])
            for i, host_id in enumerate(host_ids):
                host_code = self.orig_generator.generate_esxi_host(host_id)
                cypher_code += host_code
                if i < counts["esxi_host"] - 1:
                    cypher_code += "\n\n"
                
                # Track this host
                host_id_str = f"host-{host_id}"
                metadata = self._extract_node_metadata(host_code)
                self.relationship_generator.track_node("esxi_hosts", host_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate vCenter Servers
        if counts.get("vcenter", 0) > 0:
            cypher_code += "// vCenter Servers\n"
            vcenter_ids = random.sample(range(1001, 9999), counts["vcenter"])
            for i, vcenter_id in enumerate(vcenter_ids):
                vcenter_code = self.orig_generator.generate_vcenter_server(vcenter_id)
                cypher_code += vcenter_code
                if i < counts["vcenter"] - 1:
                    cypher_code += "\n\n"
                
                # Track this vCenter
                vcenter_id_str = f"vc-{vcenter_id}"
                metadata = self._extract_node_metadata(vcenter_code)
                self.relationship_generator.track_node("vcenter_servers", vcenter_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate vSphere Clusters
        if counts.get("vsphere_cluster", 0) > 0:
            cypher_code += "// vSphere Clusters\n"
            cluster_ids = random.sample(range(1001, 9999), counts["vsphere_cluster"])
            for i, cluster_id in enumerate(cluster_ids):
                cluster_code = self.orig_generator.generate_vsphere_cluster(cluster_id)
                cypher_code += cluster_code
                if i < counts["vsphere_cluster"] - 1:
                    cypher_code += "\n\n"
                
                # Track this cluster
                cluster_id_str = f"cluster-{cluster_id}"
                metadata = self._extract_node_metadata(cluster_code)
                self.relationship_generator.track_node("vsphere_clusters", cluster_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate vSAN Clusters
        if counts.get("vsan_cluster", 0) > 0:
            cypher_code += "// vSAN Clusters\n"
            vsan_ids = random.sample(range(1001, 9999), counts["vsan_cluster"])
            for i, vsan_id in enumerate(vsan_ids):
                vsan_code = self.orig_generator.generate_vsan_cluster(vsan_id)
                cypher_code += vsan_code
                if i < counts["vsan_cluster"] - 1:
                    cypher_code += "\n\n"
                
                # Track this vSAN cluster
                vsan_id_str = f"vsan-{vsan_id}"
                metadata = self._extract_node_metadata(vsan_code)
                self.relationship_generator.track_node("vsan_clusters", vsan_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate Datastores
        if counts.get("datastore", 0) > 0:
            cypher_code += "// Datastores\n"
            datastore_ids = random.sample(range(1001, 9999), counts["datastore"])
            for i, datastore_id in enumerate(datastore_ids):
                datastore_code = self.orig_generator.generate_datastore(datastore_id)
                cypher_code += datastore_code
                if i < counts["datastore"] - 1:
                    cypher_code += "\n\n"
                
                # Track this datastore
                datastore_id_str = f"datastore-{datastore_id}"
                metadata = self._extract_node_metadata(datastore_code)
                self.relationship_generator.track_node("datastores", datastore_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate NSX Managers
        if counts.get("nsx_manager", 0) > 0:
            cypher_code += "// NSX Managers\n"
            nsx_ids = random.sample(range(1001, 9999), counts["nsx_manager"])
            for i, nsx_id in enumerate(nsx_ids):
                nsx_code = self.orig_generator.generate_nsx_manager(nsx_id)
                cypher_code += nsx_code
                if i < counts["nsx_manager"] - 1:
                    cypher_code += "\n\n"
                
                # Track this NSX Manager
                nsx_id_str = f"nsxmgr-{nsx_id}"
                metadata = self._extract_node_metadata(nsx_code)
                self.relationship_generator.track_node("nsx_managers", nsx_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate Virtual Networks
        if counts.get("virtual_network", 0) > 0:
            cypher_code += "// Virtual Networks\n"
            vnet_ids = random.sample(range(1001, 9999), counts["virtual_network"])
            for i, vnet_id in enumerate(vnet_ids):
                vnet_code = self.orig_generator.generate_virtual_network(vnet_id)
                cypher_code += vnet_code
                if i < counts["virtual_network"] - 1:
                    cypher_code += "\n\n"
                
                # Track this Virtual Network
                vnet_id_str = f"vnet-{vnet_id}"
                metadata = self._extract_node_metadata(vnet_code)
                self.relationship_generator.track_node("virtual_networks", vnet_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate NSX Edges
        if counts.get("nsx_edge", 0) > 0:
            cypher_code += "// NSX Edges\n"
            edge_ids = random.sample(range(1001, 9999), counts["nsx_edge"])
            for i, edge_id in enumerate(edge_ids):
                edge_code = self.orig_generator.generate_nsx_edge(edge_id)
                cypher_code += edge_code
                if i < counts["nsx_edge"] - 1:
                    cypher_code += "\n\n"
                
                # Track this NSX Edge
                edge_id_str = f"edge-{edge_id}"
                metadata = self._extract_node_metadata(edge_code)
                self.relationship_generator.track_node("nsx_edges", edge_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate NSX Switches
        if counts.get("nsx_switch", 0) > 0:
            cypher_code += "// NSX Switches\n"
            switch_ids = random.sample(range(1001, 9999), counts["nsx_switch"])
            for i, switch_id in enumerate(switch_ids):
                switch_code = self.orig_generator.generate_nsx_switch(switch_id)
                cypher_code += switch_code
                if i < counts["nsx_switch"] - 1:
                    cypher_code += "\n\n"
                
                # Track this NSX Switch
                switch_id_str = f"nsxswitch-{switch_id}"
                metadata = self._extract_node_metadata(switch_code)
                self.relationship_generator.track_node("nsx_switches", switch_id_str, metadata)
            cypher_code += "\n\n"
        
        # Generate Virtual Machines
        if counts.get("vm", 0) > 0:
            cypher_code += "// Virtual Machines\n"
            vm_ids = random.sample(range(1001, 9999), counts["vm"])
            for i, vm_id in enumerate(vm_ids):
                vm_code = self.orig_generator.generate_virtual_machine(vm_id)
                cypher_code += vm_code
                if i < counts["vm"] - 1:
                    cypher_code += "\n\n"
                
                # Track this VM
                vm_id_str = f"vm-{vm_id}"
                metadata = self._extract_node_metadata(vm_code)
                self.relationship_generator.track_node("vms", vm_id_str, metadata)
            cypher_code += ";\n\n"
        
        return cypher_code
    
    def _extract_node_metadata(self, node_code: str) -> Dict[str, Any]:
        """
        Extract key properties from a node's Cypher code for relationship creation.
        
        Args:
            node_code: Cypher CREATE statement for a node
            
        Returns:
            Dict with key properties extracted from the node
        """
        metadata = {}
        
        # Extract basic properties using simple parsing
        # This is a basic implementation - a more robust solution would use a proper parser
        
        # Look for property lines using regex-like approach
        lines = node_code.split('\n')
        for line in lines:
            line = line.strip()
            
            # Skip comments and blank lines
            if line.startswith('//') or not line:
                continue
            
            # Look for property assignments like "name: 'value',"
            if ':' in line and not line.startswith('CREATE'):
                parts = line.split(':', 1)
                if len(parts) == 2:
                    prop_name = parts[0].strip()
                    prop_value = parts[1].strip()
                    
                    # Remove trailing comma if present
                    if prop_value.endswith(','):
                        prop_value = prop_value[:-1]
                    
                    # Handle different value types
                    if prop_value.startswith("'") and prop_value.endswith("'"):
                        # String value
                        metadata[prop_name] = prop_value[1:-1]
                    elif prop_value.lower() in ['true', 'false']:
                        # Boolean value
                        metadata[prop_name] = prop_value.lower() == 'true'
                    else:
                        try:
                            # Try as number
                            if '.' in prop_value:
                                metadata[prop_name] = float(prop_value)
                            else:
                                metadata[prop_name] = int(prop_value)
                        except ValueError:
                            # Keep as string if parsing fails
                            metadata[prop_name] = prop_value
        
        return metadata