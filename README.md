## VMWare Data Generation

### Setup
1. Create Virual Environment:
```bash
python3 -m venv venv
source venv/bin/activate
```

1. Install dependencies:
```bash
pip install -r requirements.txt
```

2. Ensure Neo4j is running

### Create Sample Data and Upload on Neo4j

1. Run `python data_generation.py` to generate the sample data.

### Simulate Change Management

1. Run `python simulate_impact_analysis.py` to simulate the change management process.