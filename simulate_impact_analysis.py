from impact.analyzer import VMwareChangeImpactAnalyzer

def main():
    # Initialize the analyzer
    analyzer = VMwareChangeImpactAnalyzer("neo4j://localhost:7687", "neo4j", "neo4jneo4j")

    node_id = "vsan-6301"

    # Analyze impact of upgrading vCenter
    impact = analyzer.analyze_change_impact(
        node_id=node_id,
        change_type="upgrade",       # Type of change
        change_description="Upgrade Virtual SAN from 7.0.3 to 8.0.0"  # Description
    )

    # Generate an HTML report
    html_report = analyzer.export_impact_assessment(impact, "html")

    # Save HTML report
    with open(f"sample_impact_reports/impact_report_{node_id}.html", "w") as f:
        f.write(html_report)

    # Create a change ticket
    ticket = analyzer.generate_change_ticket(impact)

    # Simulate cascading impact through multiple levels
    cascade_impact = analyzer.simulate_change(node_id, "upgrade", 3)

    # Generate a plain text report
    text_report = analyzer.export_impact_assessment(cascade_impact, "text")

    # Save text report
    with open(f"impact_report_{node_id}.txt", "w") as f:
        f.write(text_report)

if __name__ == "__main__":
    main()