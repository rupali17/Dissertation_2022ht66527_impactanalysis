from generate_data.vmware_edges import EnhancedVMwareEnvironmentGenerator
from neo4j import GraphDatabase
from tqdm import tqdm


def main():
    uri = "neo4j://localhost:7687"
    username = "neo4j"
    password = "neo4jneo4j"
    # Use seed for reproducible output
    generator = EnhancedVMwareEnvironmentGenerator(seed=1806)  

    # Generate a complete environment with relationships
    env_script = generator.generate_multiple_components({
    "esxi_host": 12,
    "vcenter": 5,
    "vm": 20,
    "vsphere_cluster": 2,
    "vsan_cluster": 1,
    "datastore": 10,
    "nsx_manager": 2,
    "virtual_network": 10,
    "nsx_edge": 4,
    "nsx_switch": 2
    })

    env_script = env_script.split(';')
    final_outcome = env_script[-1]

    # env_script = ';'.join(env_script[:-1])

    print(final_outcome)

    # Save to file
    with open('vmware_environment_with_relationships.cypher', 'w') as f:
        f.write(';'.join(env_script[:-1]))

    driver = GraphDatabase.driver(uri, auth=(username, password))

    with driver.session() as session:
        for query in tqdm(env_script[:-1], desc="Executing queries"):
            result = session.run(query, {})
            # print(result)

    driver.close()

if __name__ == "__main__":
    main()