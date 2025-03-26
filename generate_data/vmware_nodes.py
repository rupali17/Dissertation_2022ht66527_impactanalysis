import random
import uuid
import datetime
import ipaddress
from typing import Dict, Any, List, Union, Optional, Tuple

class VMwareEnvironmentGenerator:
    """
    Comprehensive generator for VMware environment components in Neo4j.
    Creates realistic node data for VMware infrastructure components with impact assessment parameters.
    """
    
    def __init__(self, seed: Optional[int] = None):
        """
        Initialize the generator with an optional random seed for reproducibility.
        
        Args:
            seed: Optional random seed for reproducible generation
        """
        if seed is not None:
            random.seed(seed)
        
        self.today = datetime.date.today()
        # Track generated IDs to ensure uniqueness
        self.generated_ids = {
            "host": set(),
            "vcenter": set(),
            "vm": set(),
            "vsan": set(),
            "nsx": set(),
            "datastore": set(),
            "vsphere": set(),
            "vnet": set(),
            "nsxedge": set(),
            "nsxswitch": set(),
        }
        
    def random_past_date(self, max_days_ago: int) -> str:
        """Generate a random date in the past in YYYY-MM-DD format."""
        days_ago = random.randint(1, max_days_ago)
        return (self.today - datetime.timedelta(days=days_ago)).strftime("%Y-%m-%d")
    
    def random_future_date(self, max_days_ahead: int) -> str:
        """Generate a random date in the future in YYYY-MM-DD format."""
        days_ahead = random.randint(1, max_days_ahead)
        return (self.today + datetime.timedelta(days=days_ahead)).strftime("%Y-%m-%d")
    
    def format_property_value(self, value: Any) -> str:
        """Format property values correctly for Neo4j Cypher based on their type."""
        if isinstance(value, bool):
            return str(value).lower()
        elif isinstance(value, (int, float)):
            return str(value)
        elif isinstance(value, list):
            # Format array as Neo4j array
            items = ", ".join([f"'{item}'" for item in value])
            return f"[{items}]"
        else:
            # String values need quotes
            return f"'{value}'"
    
    def generate_unique_id(self, prefix: str, id_type: str) -> str:
        """Generate a unique ID for a given component type with specified prefix."""
        while True:
            id_num = random.randint(1001, 9999)
            id_str = f"{prefix}-{id_num}"
            if id_str not in self.generated_ids[id_type]:
                self.generated_ids[id_type].add(id_str)
                return id_str
    
    def generate_esxi_host(self, host_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for an enhanced ESXiHost node with impact assessment parameters.
        
        Args:
            host_id: Specific host ID to use. If None, a random ID will be generated.
            
        Returns:
            str: Neo4j Cypher CREATE statement for an ESXiHost node
        """
        if host_id is None:
            host_id = random.randint(1001, 9999)
        
        # Generate a dictionary of all node properties
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"host-{host_id}"
        properties["name"] = f"esxi{host_id:02d}.vmware.local"
        properties["uuid"] = str(uuid.uuid4())
        properties["fqdn"] = properties["name"]
        
        # Generate IP addresses in different subnets
        base_ip = ipaddress.IPv4Address("192.168.10.0") + (host_id % 253)
        vmotion_ip = ipaddress.IPv4Address("10.10.10.0") + (host_id % 253)
        storage_ip = ipaddress.IPv4Address("10.20.10.0") + (host_id % 253)
        
        properties["managementIP"] = str(base_ip)
        properties["vMotionIP"] = str(vmotion_ip)
        properties["storageIP"] = str(storage_ip)
        
        # ------- Version and Build -------
        version_choices = ["6.7.0", "7.0.0", "7.0.1", "7.0.2", "7.0.3", "8.0.0", "8.0.1"]
        target_version_choices = ["7.0.3", "8.0.0", "8.0.1", "8.0.2"]
        
        properties["version"] = random.choice(version_choices)
        
        # Ensure target version is newer than current version
        while True:
            properties["targetVersion"] = random.choice(target_version_choices)
            if properties["targetVersion"] > properties["version"]:
                break
        
        properties["buildNumber"] = str(random.randint(10000000, 99999999))
        properties["targetBuildNumber"] = str(random.randint(10000000, 99999999))
        
        current_major, current_minor, current_patch = map(int, properties["version"].split("."))
        target_major, target_minor, target_patch = map(int, properties["targetVersion"].split("."))
        
        if current_major != target_major:
            properties["versionGap"] = "Major"
        elif current_minor != target_minor:
            properties["versionGap"] = "Minor"
        else:
            properties["versionGap"] = "Patch"
        
        upgrade_paths = ["Direct", "Staged", "Complex"]
        properties["upgradePath"] = upgrade_paths[0] if properties["versionGap"] == "Patch" else random.choice(upgrade_paths)
        
        # ------- Hardware Details -------
        vendors = ["Dell Inc.", "HPE", "Cisco", "Lenovo", "Supermicro"]
        models = {
            "Dell Inc.": ["PowerEdge R750", "PowerEdge R650", "PowerEdge R940", "PowerEdge R840"],
            "HPE": ["ProLiant DL380 Gen10", "ProLiant DL360 Gen10", "ProLiant DL560 Gen10", "ProLiant DL380 Gen11"],
            "Cisco": ["UCS C240 M5", "UCS C220 M5", "UCS C480 M5", "UCS C240 M6"],
            "Lenovo": ["ThinkSystem SR650", "ThinkSystem SR630", "ThinkSystem SR860", "ThinkSystem SR950"],
            "Supermicro": ["SuperServer 1029U-TN10RT", "SuperServer 2029U-TR4", "SuperServer 6019U-TN4RT", "SuperServer 1029P-WT"]
        }
        
        properties["vendor"] = random.choice(vendors)
        properties["model"] = random.choice(models[properties["vendor"]])
        properties["serialNumber"] = ''.join(random.choices('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', k=10))
        
        lifecycle_statuses = ["Supported", "Limited Support", "End of Life"]
        properties["lifecycleStatus"] = random.choice(lifecycle_statuses)
        
        # End of support date is in the future for Supported, could be past for others
        if properties["lifecycleStatus"] == "Supported":
            end_year = random.randint(2026, 2030)
        elif properties["lifecycleStatus"] == "Limited Support":
            end_year = random.randint(2024, 2026)
        else:
            end_year = random.randint(2022, 2024)
            
        properties["endOfSupportDate"] = f"{end_year}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
        
        # ------- CPU and Memory Information -------
        cpu_types = [
            "Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz",
            "Intel(R) Xeon(R) Platinum 8380 CPU @ 2.30GHz", 
            "Intel(R) Xeon(R) Gold 6348 CPU @ 2.60GHz",
            "AMD EPYC 7763 64-Core Processor",
            "AMD EPYC 7542 32-Core Processor"
        ]
        
        properties["cpuType"] = random.choice(cpu_types)
        properties["cpuSockets"] = random.choice([2, 4, 8])
        properties["cpuCoresPerSocket"] = random.choice([8, 16, 24, 32, 64])
        properties["cpuThreadsPerCore"] = 2
        properties["cpuTotalCores"] = properties["cpuSockets"] * properties["cpuCoresPerSocket"]
        properties["cpuTotalThreads"] = properties["cpuTotalCores"] * properties["cpuThreadsPerCore"]
        properties["cpuSpeed"] = random.randint(2000, 3900)
        
        # Memory should be a power of 2
        memory_options = [128, 256, 512, 1024, 2048]
        properties["memoryGB"] = random.choice(memory_options)
        properties["memoryOverheadGB"] = round(properties["memoryGB"] * random.uniform(0.05, 0.1))
        properties["memoryAvailableGB"] = properties["memoryGB"] - properties["memoryOverheadGB"]
        
        # ------- Workload Impact Parameters -------
        properties["vmCount"] = random.randint(10, 100)
        properties["poweredOnVmCount"] = random.randint(int(properties["vmCount"] * 0.7), properties["vmCount"])
        properties["criticalVmCount"] = random.randint(1, min(int(properties["poweredOnVmCount"] * 0.4), 20))
        properties["criticalVmPercentage"] = round((properties["criticalVmCount"] / properties["vmCount"]) * 100, 1)
        properties["vCpuToCoreFactor"] = round(random.uniform(1.0, 8.0), 1)
        properties["memoryOvercommitFactor"] = round(random.uniform(1.0, 3.0), 1)
        
        # ------- Infrastructure Resilience -------
        properties["clusterN1Capacity"] = random.choice([True, False])
        # N+2 is less likely than N+1
        properties["clusterN2Capacity"] = False if not properties["clusterN1Capacity"] else random.choice([True, False, False])
        
        ha_statuses = ["Configured", "Disabled", "Degraded"]
        properties["haStatus"] = random.choice(ha_statuses)
        
        redundancy_options = ["Full", "Partial", "None"]
        redundancy_weights = [0.7, 0.25, 0.05]  # Most environments have full redundancy
        properties["networkRedundancy"] = random.choices(redundancy_options, weights=redundancy_weights)[0]
        properties["storageRedundancy"] = random.choices(redundancy_options, weights=redundancy_weights)[0]
        properties["redundantPowerSupplies"] = random.choices([True, False], weights=[0.9, 0.1])[0]
        
        # ------- Technical Compatibility -------
        compatibility_options = ["FullyCompatible", "LimitedCompatibility", "Incompatible"]
        compatibility_weights = [0.7, 0.25, 0.05]
        properties["hardwareCompatibilityStatus"] = random.choices(compatibility_options, weights=compatibility_weights)[0]
        
        # More complex upgrades need more updates
        if properties["versionGap"] == "Major":
            driver_max = 10
            firmware_max = 8
        elif properties["versionGap"] == "Minor":
            driver_max = 5
            firmware_max = 4
        else:
            driver_max = 2
            firmware_max = 1
        
        properties["driverUpdatesRequired"] = random.randint(0, driver_max)
        properties["firmwareUpdatesRequired"] = random.randint(0, firmware_max)
        properties["customVibCount"] = random.randint(0, 10)
        properties["thirdPartyExtensionCount"] = random.randint(0, 5)
        
        # Compatibility risk correlates with version gap and required updates
        risk_factors = properties["driverUpdatesRequired"] + properties["firmwareUpdatesRequired"] + (5 if properties["versionGap"] == "Major" else 0)
        
        if risk_factors > 10:
            properties["compatibilityRisk"] = "High"
        elif risk_factors > 5:
            properties["compatibilityRisk"] = "Medium"
        else:
            properties["compatibilityRisk"] = "Low"
        
        # ------- Operational Factors -------
        properties["vMotionEligibleVmPercentage"] = round(random.uniform(70.0, 100.0), 1)
        
        # Downtime correlates with version gap and compatibility risk
        if properties["versionGap"] == "Major" or properties["compatibilityRisk"] == "High":
            properties["estimatedDowntimeMinutes"] = random.randint(60, 180)
        elif properties["versionGap"] == "Minor" or properties["compatibilityRisk"] == "Medium":
            properties["estimatedDowntimeMinutes"] = random.randint(30, 90)
        else:
            properties["estimatedDowntimeMinutes"] = random.randint(15, 45)
        
        properties["configurationDriftScore"] = random.randint(0, 100)
        properties["activeVmSnapshotCount"] = random.randint(0, 20)
        properties["lastSuccessfulBackupDate"] = self.random_past_date(7)
        
        backup_status_options = ["Verified", "Partial", "Failed", "Unknown"]
        backup_status_weights = [0.8, 0.1, 0.05, 0.05]
        properties["backupVerificationStatus"] = random.choices(backup_status_options, weights=backup_status_weights)[0]
        
        properties["lastSuccessfulPatrikTestDate"] = self.random_past_date(30)
        
        # ------- Historical Data -------
        properties["previousPatchSuccessRate"] = round(random.uniform(70.0, 100.0), 1)
        properties["meanTimeBetweenFailures"] = random.randint(100, 800)
        properties["lastFailureDate"] = self.random_past_date(365)
        properties["incidentCount90Days"] = random.randint(0, 10)
        
        # Known issues correlates with version gap
        if properties["versionGap"] == "Major":
            properties["knownIssuesWithTargetVersion"] = random.randint(2, 10)
        elif properties["versionGap"] == "Minor":
            properties["knownIssuesWithTargetVersion"] = random.randint(1, 5)
        else:
            properties["knownIssuesWithTargetVersion"] = random.randint(0, 2)
        
        # ------- Business Impact -------
        # Critical VMs percentage influences business criticality
        if properties["criticalVmPercentage"] > 30:
            properties["businessCriticalityScore"] = random.randint(75, 100)
            properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        elif properties["criticalVmPercentage"] > 15:
            properties["businessCriticalityScore"] = random.randint(50, 75)
            properties["slaLevel"] = random.choice(["Silver", "Gold"])
        else:
            properties["businessCriticalityScore"] = random.randint(10, 50)
            properties["slaLevel"] = random.choice(["Bronze", "Silver"])
        
        # Service window
        service_window_start_hour = random.randint(0, 4)
        service_window_duration = random.randint(2, 6)
        service_window_end_hour = (service_window_start_hour + service_window_duration) % 24
        
        properties["serviceWindowStart"] = f"{service_window_start_hour:02d}:00"
        properties["serviceWindowEnd"] = f"{service_window_end_hour:02d}:00"
        properties["serviceWindowDay"] = random.choice(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"])
        
        # Impact metrics
        # Average 20 users per VM is a reasonable estimate
        properties["userImpactCount"] = properties["vmCount"] * random.randint(15, 25)
        properties["businessProcessesImpacted"] = random.randint(int(properties["criticalVmCount"] * 0.8), int(properties["criticalVmCount"] * 1.5) + 2)
        
        # Application tiers
        application_tiers = ["Web", "Application", "Database", "Middleware", "Analytics", "Batch", "Integration"]
        num_tiers = random.randint(1, len(application_tiers))
        properties["applicationTiersHosted"] = random.sample(application_tiers, num_tiers)
        
        # ------- General Status and Performance -------
        connection_states = ["connected", "disconnected", "notResponding"]
        connection_weights = [0.95, 0.03, 0.02]
        properties["connectionState"] = random.choices(connection_states, weights=connection_weights)[0]
        properties["maintenanceMode"] = random.choice([True, False])
        
        # If in maintenance mode, more likely to be powered off
        if properties["maintenanceMode"]:
            power_states = ["poweredOn", "poweredOff", "standBy"]
            power_weights = [0.2, 0.7, 0.1]
        else:
            power_states = ["poweredOn", "poweredOff", "standBy"]
            power_weights = [0.95, 0.03, 0.02]
        
        properties["powerState"] = random.choices(power_states, weights=power_weights)[0]
        
        # Usage metrics based on power state
        if properties["powerState"] == "poweredOn":
            properties["cpuUsagePercentage"] = random.randint(5, 85)
            properties["cpuUsageMhz"] = int((properties["cpuUsagePercentage"] / 100) * properties["cpuTotalCores"] * properties["cpuSpeed"])
            properties["memoryUsagePercentage"] = random.randint(40, 90)
            properties["memoryUsageGB"] = int((properties["memoryUsagePercentage"] / 100) * properties["memoryAvailableGB"])
            properties["uptimeDays"] = random.randint(1, 365)
        else:
            properties["cpuUsagePercentage"] = 0
            properties["cpuUsageMhz"] = 0
            properties["memoryUsagePercentage"] = 0
            properties["memoryUsageGB"] = 0
            properties["uptimeDays"] = 0
        
        # ------- Standard Configuration -------
        properties["ntpServer"] = random.choice(["ntp.vmware.local", "time.windows.com", "pool.ntp.org", "time.google.com"])
        properties["sshEnabled"] = random.choice([True, False])
        properties["lockdownMode"] = random.choice(["normal", "strict", "disabled"])
        properties["hyperthreadingEnabled"] = random.choice([True, True, False])  # More likely to be enabled
        
        # ------- Advanced Features -------
        evc_modes = ["intel-broadwell", "intel-skylake", "intel-cascadelake", "intel-icelake", "amd-milan", "amd-rome"]
        properties["evcMode"] = random.choice(evc_modes)
        properties["vGpuEnabled"] = random.choice([True, False])
        properties["nestedVirtualizationEnabled"] = random.choice([True, False])
        
        # ------- DRS and HA Configuration -------
        drs_levels = ["manual", "partiallyAutomated", "fullyAutomated"]
        properties["drsAutomationLevel"] = random.choice(drs_levels)
        properties["drsVmotionRate"] = random.randint(1, 5)
        properties["haEnabled"] = random.choice([True, True, False])  # More likely to be enabled
        properties["haPriority"] = random.choice(["low", "medium", "high"])
        
        # ------- Change Management -------
        properties["lastPatchDate"] = self.random_past_date(180)
        
        # Last boot time should be ISO format with time
        boot_days_ago = random.randint(1, properties["uptimeDays"] or 30)
        boot_date = self.today - datetime.timedelta(days=boot_days_ago)
        boot_hour = random.randint(0, 23)
        boot_minute = random.randint(0, 59)
        boot_second = random.randint(0, 59)
        properties["lastBootTime"] = f"{boot_date.strftime('%Y-%m-%d')}T{boot_hour:02d}:{boot_minute:02d}:{boot_second:02d}Z"
        
        # Change request IDs
        last_change_date = self.today - datetime.timedelta(days=random.randint(10, 90))
        last_change_seq = random.randint(1, 999)
        properties["lastChangeRequestID"] = f"CR-{last_change_date.strftime('%Y%m%d')}-{last_change_seq:03d}"
        
        properties["lastChangeRequestStatus"] = random.choice(["Completed", "Failed", "Canceled"])
        
        # Pending change request if we're planning an upgrade
        pending_change_date = self.today + datetime.timedelta(days=random.randint(7, 60))
        pending_change_seq = random.randint(1, 999)
        properties["pendingChangeRequestID"] = f"CR-{pending_change_date.strftime('%Y%m%d')}-{pending_change_seq:03d}"
        
        properties["changeWindowAssigned"] = random.choice([True, False])
        
        # Change risk score correlates with other risk factors
        base_risk = 40
        if properties["versionGap"] == "Major":
            base_risk += 20
        elif properties["versionGap"] == "Minor":
            base_risk += 10
        
        if properties["compatibilityRisk"] == "High":
            base_risk += 20
        elif properties["compatibilityRisk"] == "Medium":
            base_risk += 10
        
        if properties["criticalVmPercentage"] > 30:
            base_risk += 15
        elif properties["criticalVmPercentage"] > 15:
            base_risk += 5
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-10, 10), 100)
        
        # ------- Compliance and Security -------
        compliance_options = ["compliant", "nonCompliant", "unknown"]
        compliance_weights = [0.8, 0.15, 0.05]
        properties["complianceStatus"] = random.choices(compliance_options, weights=compliance_weights)[0]
        
        security_options = ["compliant", "warning", "critical", "unknown"]
        security_weights = [0.7, 0.2, 0.05, 0.05]
        properties["securityProfileStatus"] = random.choices(security_options, weights=security_weights)[0]
        
        # Vulnerability counts - correlate with security profile
        if properties["securityProfileStatus"] == "critical":
            properties["vulnerablilityCount"] = random.randint(15, 30)
            properties["criticalVulnerabilityCount"] = random.randint(5, 10)
        elif properties["securityProfileStatus"] == "warning":
            properties["vulnerablilityCount"] = random.randint(5, 15)
            properties["criticalVulnerabilityCount"] = random.randint(1, 4)
        else:
            properties["vulnerablilityCount"] = random.randint(0, 5)
            properties["criticalVulnerabilityCount"] = random.randint(0, 1)
        
        properties["lastSecurityScanDate"] = self.random_past_date(30)
        properties["securityBaselineVariance"] = random.randint(0, 20)
        
        # Compliance with standards
        if properties["securityProfileStatus"] == "compliant":
            properties["pciCompliance"] = random.choices([True, False], weights=[0.9, 0.1])[0]
            properties["hipaaCompliance"] = random.choices([True, False], weights=[0.9, 0.1])[0]
        elif properties["securityProfileStatus"] == "warning":
            properties["pciCompliance"] = random.choices([True, False], weights=[0.5, 0.5])[0]
            properties["hipaaCompliance"] = random.choices([True, False], weights=[0.5, 0.5])[0]
        else:
            properties["pciCompliance"] = random.choices([True, False], weights=[0.1, 0.9])[0]
            properties["hipaaCompliance"] = random.choices([True, False], weights=[0.1, 0.9])[0]
        
        # Generate the Neo4j Cypher code
        cypher_code = f"CREATE (esxi_{host_id}:ESXiHost {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "uuid", "fqdn", "managementIP", "vMotionIP", "storageIP"
            ],
            "Version and Build": [
                "version", "buildNumber", "targetVersion", "targetBuildNumber", 
                "versionGap", "upgradePath"
            ],
            "Hardware Details": [
                "vendor", "model", "serialNumber", "lifecycleStatus", "endOfSupportDate"
            ],
            "CPU and Memory Information": [
                "cpuType", "cpuSockets", "cpuCoresPerSocket", "cpuThreadsPerCore",
                "cpuTotalCores", "cpuTotalThreads", "cpuSpeed", "memoryGB",
                "memoryAvailableGB", "memoryOverheadGB"
            ],
            "Workload Impact Parameters": [
                "vmCount", "poweredOnVmCount", "criticalVmCount", "criticalVmPercentage",
                "vCpuToCoreFactor", "memoryOvercommitFactor"
            ],
            "Infrastructure Resilience": [
                "clusterN1Capacity", "clusterN2Capacity", "haStatus", "networkRedundancy",
                "storageRedundancy", "redundantPowerSupplies"
            ],
            "Technical Compatibility": [
                "hardwareCompatibilityStatus", "driverUpdatesRequired", "firmwareUpdatesRequired",
                "customVibCount", "thirdPartyExtensionCount", "compatibilityRisk"
            ],
            "Operational Factors": [
                "vMotionEligibleVmPercentage", "estimatedDowntimeMinutes", "configurationDriftScore",
                "activeVmSnapshotCount", "lastSuccessfulBackupDate", "backupVerificationStatus",
                "lastSuccessfulPatrikTestDate"
            ],
            "Historical Data": [
                "previousPatchSuccessRate", "meanTimeBetweenFailures", "lastFailureDate",
                "incidentCount90Days", "knownIssuesWithTargetVersion"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "serviceWindowStart", "serviceWindowEnd",
                "serviceWindowDay", "userImpactCount", "businessProcessesImpacted", "applicationTiersHosted"
            ],
            "General Status and Performance": [
                "connectionState", "maintenanceMode", "powerState", "cpuUsageMhz",
                "cpuUsagePercentage", "memoryUsageGB", "memoryUsagePercentage", "uptimeDays"
            ],
            "Standard Configuration": [
                "ntpServer", "sshEnabled", "lockdownMode", "hyperthreadingEnabled"
            ],
            "Advanced Features": [
                "evcMode", "vGpuEnabled", "nestedVirtualizationEnabled"
            ],
            "DRS and HA Configuration": [
                "drsAutomationLevel", "drsVmotionRate", "haEnabled", "haPriority"
            ],
            "Change Management": [
                "lastPatchDate", "lastBootTime", "lastChangeRequestID", "lastChangeRequestStatus",
                "pendingChangeRequestID", "changeWindowAssigned", "changeRiskScore"
            ],
            "Compliance and Security": [
                "complianceStatus", "securityProfileStatus", "vulnerablilityCount",
                "criticalVulnerabilityCount", "lastSecurityScanDate", "securityBaselineVariance",
                "pciCompliance", "hipaaCompliance"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_vcenter_server(self, vcenter_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for a vCenter Server node with impact assessment parameters.
        
        Args:
            vcenter_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for a vCenter Server node
        """
        if vcenter_id is None:
            vcenter_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"vc-{vcenter_id}"
        properties["name"] = f"vcenter{vcenter_id:02d}.vmware.local"
        properties["uuid"] = str(uuid.uuid4())
        properties["fqdn"] = properties["name"]
        properties["instanceId"] = ''.join(random.choices('0123456789abcdef', k=8))
        
        # IP addresses
        base_ip = ipaddress.IPv4Address("192.168.1.0") + (vcenter_id % 253)
        properties["managementIP"] = str(base_ip)
        
        # ------- Version and Build -------
        version_choices = ["6.7.0", "7.0.0", "7.0.3", "8.0.0", "8.0.1"]
        target_version_choices = ["7.0.3", "8.0.0", "8.0.1", "8.0.2"]
        
        properties["version"] = random.choice(version_choices)
        
        # Ensure target version is newer than current version
        while True:
            properties["targetVersion"] = random.choice(target_version_choices)
            if properties["targetVersion"] > properties["version"]:
                break
        
        properties["buildNumber"] = str(random.randint(10000000, 99999999))
        properties["targetBuildNumber"] = str(random.randint(10000000, 99999999))
        
        current_major, current_minor, current_patch = map(int, properties["version"].split("."))
        target_major, target_minor, target_patch = map(int, properties["targetVersion"].split("."))
        
        if current_major != target_major:
            properties["versionGap"] = "Major"
        elif current_minor != target_minor:
            properties["versionGap"] = "Minor"
        else:
            properties["versionGap"] = "Patch"
        
        upgrade_paths = ["Direct", "Staged", "Complex"]
        properties["upgradePath"] = upgrade_paths[0] if properties["versionGap"] == "Patch" else random.choice(upgrade_paths)
        
        # ------- Deployment Type -------
        deployment_types = ["VCSA Appliance", "Windows-based"]
        deployment_weights = [0.9, 0.1]  # VCSA is more common now
        properties["deploymentType"] = random.choices(deployment_types, weights=deployment_weights)[0]
        
        # Size depends on the environment scale
        size_options = ["tiny", "small", "medium", "large", "x-large"]
        properties["deploymentSize"] = random.choice(size_options)
        
        # Deployment topology
        topology_options = ["Standalone", "HA", "Enhanced Linked Mode"]
        topology_weights = [0.4, 0.4, 0.2]
        properties["deploymentTopology"] = random.choices(topology_options, weights=topology_weights)[0]
        
        # ------- Resource Allocation -------
        if properties["deploymentSize"] == "tiny":
            properties["cpuCount"] = 2
            properties["memoryGB"] = 12
            properties["diskGB"] = 300
        elif properties["deploymentSize"] == "small":
            properties["cpuCount"] = 4
            properties["memoryGB"] = 16
            properties["diskGB"] = 340
        elif properties["deploymentSize"] == "medium":
            properties["cpuCount"] = 8
            properties["memoryGB"] = 24
            properties["diskGB"] = 525
        elif properties["deploymentSize"] == "large":
            properties["cpuCount"] = 16
            properties["memoryGB"] = 32
            properties["diskGB"] = 740
        else:  # x-large
            properties["cpuCount"] = 24
            properties["memoryGB"] = 48
            properties["diskGB"] = 1180
        
        # ------- Capacity and Scale -------
        if properties["deploymentSize"] == "tiny":
            max_hosts = 10
            max_vms = 100
        elif properties["deploymentSize"] == "small":
            max_hosts = 100
            max_vms = 1000
        elif properties["deploymentSize"] == "medium":
            max_hosts = 400
            max_vms = 4000
        elif properties["deploymentSize"] == "large":
            max_hosts = 1000
            max_vms = 10000
        else:  # x-large
            max_hosts = 2000
            max_vms = 35000
        
        properties["maxHostCapacity"] = max_hosts
        properties["maxVMCapacity"] = max_vms
        
        # Current utilization
        properties["currentHostCount"] = random.randint(1, max_hosts)
        properties["currentVMCount"] = random.randint(properties["currentHostCount"] * 5, min(properties["currentHostCount"] * 15, max_vms))
        properties["currentClusterCount"] = random.randint(1, max(1, properties["currentHostCount"] // 10))
        properties["currentDatacenterCount"] = random.randint(1, max(1, properties["currentClusterCount"] // 3))
        
        properties["hostUtilizationPercentage"] = round((properties["currentHostCount"] / max_hosts) * 100, 1)
        properties["vmUtilizationPercentage"] = round((properties["currentVMCount"] / max_vms) * 100, 1)
        
        # ------- Database Configuration -------
        if properties["deploymentType"] == "VCSA Appliance":
            properties["databaseType"] = "Embedded PostgreSQL"
            properties["databaseSizeGB"] = round(properties["diskGB"] * 0.4)
        else:
            db_types = ["Microsoft SQL Server", "Oracle", "PostgreSQL"]
            properties["databaseType"] = random.choice(db_types)
            properties["databaseSizeGB"] = random.randint(50, 500)
        
        properties["databaseStatusHealth"] = random.choice(["green", "yellow", "red"])
        
        # ------- Authentication and SSO -------
        auth_providers = ["Active Directory", "LDAP", "Local OS", "Smart Card", "RSA SecurID", "SAML"]
        num_providers = random.randint(1, 3)
        properties["authenticationProviders"] = random.sample(auth_providers, num_providers)
        
        properties["ssoDomain"] = "vsphere.local"
        properties["ssoSiteId"] = "default-site"
        properties["passwordExpirationEnabled"] = random.choice([True, False])
        properties["passwordExpirationDays"] = random.randint(30, 180)
        properties["lockoutEnabled"] = random.choice([True, True, False])  # More likely to be enabled
        properties["lockoutFailureCount"] = random.randint(3, 10)
        
        # ------- Performance and Status -------
        properties["cpuUsagePercentage"] = random.randint(5, 80)
        properties["memoryUsagePercentage"] = random.randint(40, 90)
        properties["diskUsagePercentage"] = random.randint(30, 85)
        properties["serviceStatusHealth"] = random.choice(["green", "yellow", "red"])
        properties["serviceUptime"] = random.randint(1, 500)
        
        # ------- High Availability -------
        if properties["deploymentTopology"] == "HA":
            properties["haEnabled"] = True
            properties["haMode"] = random.choice(["Active-Passive", "Active-Active"])
            properties["haStatus"] = random.choice(["Protected", "Degraded", "Isolated", "Unprotected"])
            properties["haLastFailoverDate"] = self.random_past_date(365) if random.random() < 0.3 else None
            properties["haAutomaticFailover"] = random.choice([True, False])
        else:
            properties["haEnabled"] = False
            properties["haMode"] = None
            properties["haStatus"] = "NotConfigured"
            properties["haLastFailoverDate"] = None
            properties["haAutomaticFailover"] = False
        
        # ------- Networking Configuration -------
        properties["networkInterfaceCount"] = random.randint(1, 4)
        properties["networkVlanId"] = random.randint(1, 4094)
        properties["firewallEnabled"] = random.choice([True, False])
        properties["ipv6Enabled"] = random.choice([True, False])
        
        # ------- License and Support -------
        license_editions = ["Standard", "Enterprise", "Enterprise Plus"]
        license_weights = [0.1, 0.2, 0.7]  # Enterprise Plus is most common
        properties["licenseEdition"] = random.choices(license_editions, weights=license_weights)[0]
        properties["licensedHostCount"] = max(properties["currentHostCount"], random.randint(properties["currentHostCount"], properties["currentHostCount"] * 2))
        
        expiration_year = random.randint(datetime.date.today().year, datetime.date.today().year + 3)
        properties["licenseExpirationDate"] = f"{expiration_year}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
        
        support_levels = ["Basic", "Production", "Business Critical", "Mission Critical"]
        properties["supportLevel"] = random.choice(support_levels)
        properties["supportExpirationDate"] = properties["licenseExpirationDate"]
        
        # ------- Change Management -------
        properties["lastPatchDate"] = self.random_past_date(180)
        properties["lastBootTime"] = f"{self.random_past_date(properties['serviceUptime'])}T{random.randint(0, 23):02d}:{random.randint(0, 59):02d}:{random.randint(0, 59):02d}Z"
        
        # Change request IDs
        last_change_date = self.today - datetime.timedelta(days=random.randint(10, 90))
        last_change_seq = random.randint(1, 999)
        properties["lastChangeRequestID"] = f"CR-{last_change_date.strftime('%Y%m%d')}-{last_change_seq:03d}"
        
        properties["lastChangeRequestStatus"] = random.choice(["Completed", "Failed", "Canceled"])
        
        # Pending change request if we're planning an upgrade
        pending_change_date = self.today + datetime.timedelta(days=random.randint(7, 60))
        pending_change_seq = random.randint(1, 999)
        properties["pendingChangeRequestID"] = f"CR-{pending_change_date.strftime('%Y%m%d')}-{pending_change_seq:03d}"
        
        properties["changeWindowAssigned"] = random.choice([True, False])
        
        # Change risk calculation
        base_risk = 50  # vCenter changes have higher base risk
        if properties["versionGap"] == "Major":
            base_risk += 20
        elif properties["versionGap"] == "Minor":
            base_risk += 10
        
        if properties["hostUtilizationPercentage"] > 70:
            base_risk += 15
        elif properties["hostUtilizationPercentage"] > 40:
            base_risk += 5
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-10, 10), 100)
        
        # ------- Business Impact -------
        # vCenter is typically a critical component
        properties["businessCriticalityScore"] = random.randint(80, 100)
        properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        
        # Service window
        service_window_start_hour = random.randint(0, 4)
        service_window_duration = random.randint(2, 6)
        service_window_end_hour = (service_window_start_hour + service_window_duration) % 24
        
        properties["serviceWindowStart"] = f"{service_window_start_hour:02d}:00"
        properties["serviceWindowEnd"] = f"{service_window_end_hour:02d}:00"
        properties["serviceWindowDay"] = random.choice(["Saturday", "Sunday"])
        
        # Impact metrics - vCenter impacts all managed hosts and VMs
        properties["userImpactCount"] = properties["currentVMCount"] * random.randint(1, 3)  # Estimated users per VM
        properties["businessServicesImpacted"] = random.randint(5, 50)
        
        # ------- Compliance and Security -------
        compliance_options = ["compliant", "nonCompliant", "unknown"]
        compliance_weights = [0.8, 0.15, 0.05]
        properties["complianceStatus"] = random.choices(compliance_options, weights=compliance_weights)[0]
        
        security_options = ["compliant", "warning", "critical", "unknown"]
        security_weights = [0.7, 0.2, 0.05, 0.05]
        properties["securityProfileStatus"] = random.choices(security_options, weights=security_weights)[0]
        
        # Vulnerability counts - correlate with security profile
        if properties["securityProfileStatus"] == "critical":
            properties["vulnerablilityCount"] = random.randint(10, 25)
            properties["criticalVulnerabilityCount"] = random.randint(3, 8)
        elif properties["securityProfileStatus"] == "warning":
            properties["vulnerablilityCount"] = random.randint(3, 12)
            properties["criticalVulnerabilityCount"] = random.randint(1, 3)
        else:
            properties["vulnerablilityCount"] = random.randint(0, 5)
            properties["criticalVulnerabilityCount"] = random.randint(0, 1)
        
        properties["lastSecurityScanDate"] = self.random_past_date(30)
        properties["securityBaselineVariance"] = random.randint(0, 15)
        
        # Compliance with standards
        if properties["securityProfileStatus"] == "compliant":
            properties["pciCompliance"] = random.choices([True, False], weights=[0.9, 0.1])[0]
            properties["hipaaCompliance"] = random.choices([True, False], weights=[0.9, 0.1])[0]
        elif properties["securityProfileStatus"] == "warning":
            properties["pciCompliance"] = random.choices([True, False], weights=[0.5, 0.5])[0]
            properties["hipaaCompliance"] = random.choices([True, False], weights=[0.5, 0.5])[0]
        else:
            properties["pciCompliance"] = random.choices([True, False], weights=[0.1, 0.9])[0]
            properties["hipaaCompliance"] = random.choices([True, False], weights=[0.1, 0.9])[0]
        
        # ------- Backup Configuration -------
        properties["backupScheduled"] = random.choice([True, True, False])  # More likely to be backed up
        properties["backupFrequency"] = random.choice(["Daily", "Weekly", "Bi-Weekly", "Monthly"])
        properties["lastSuccessfulBackupDate"] = self.random_past_date(14)
        
        backup_status_options = ["Successful", "Partial", "Failed", "Unknown"]
        backup_status_weights = [0.7, 0.2, 0.05, 0.05]
        properties["lastBackupStatus"] = random.choices(backup_status_options, weights=backup_status_weights)[0]
        
        properties["backupRetentionDays"] = random.randint(30, 365)
        properties["disasterRecoveryEnabled"] = random.choice([True, False])
        
        # Generate the Neo4j Cypher code
        cypher_code = f"CREATE (vc_{vcenter_id}:VCenterServer {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "uuid", "fqdn", "instanceId", "managementIP"
            ],
            "Version and Build": [
                "version", "buildNumber", "targetVersion", "targetBuildNumber", 
                "versionGap", "upgradePath"
            ],
            "Deployment Type": [
                "deploymentType", "deploymentSize", "deploymentTopology"
            ],
            "Resource Allocation": [
                "cpuCount", "memoryGB", "diskGB"
            ],
            "Capacity and Scale": [
                "maxHostCapacity", "maxVMCapacity", "currentHostCount", "currentVMCount",
                "currentClusterCount", "currentDatacenterCount", "hostUtilizationPercentage",
                "vmUtilizationPercentage"
            ],
            "Database Configuration": [
                "databaseType", "databaseSizeGB", "databaseStatusHealth"
            ],
            "Authentication and SSO": [
                "authenticationProviders", "ssoDomain", "ssoSiteId", "passwordExpirationEnabled",
                "passwordExpirationDays", "lockoutEnabled", "lockoutFailureCount"
            ],
            "Performance and Status": [
                "cpuUsagePercentage", "memoryUsagePercentage", "diskUsagePercentage",
                "serviceStatusHealth", "serviceUptime"
            ],
            "High Availability": [
                "haEnabled", "haMode", "haStatus", "haLastFailoverDate", "haAutomaticFailover"
            ],
            "Networking Configuration": [
                "networkInterfaceCount", "networkVlanId", "firewallEnabled", "ipv6Enabled"
            ],
            "License and Support": [
                "licenseEdition", "licensedHostCount", "licenseExpirationDate",
                "supportLevel", "supportExpirationDate"
            ],
            "Change Management": [
                "lastPatchDate", "lastBootTime", "lastChangeRequestID", "lastChangeRequestStatus",
                "pendingChangeRequestID", "changeWindowAssigned", "changeRiskScore"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "serviceWindowStart", "serviceWindowEnd",
                "serviceWindowDay", "userImpactCount", "businessServicesImpacted"
            ],
            "Compliance and Security": [
                "complianceStatus", "securityProfileStatus", "vulnerablilityCount",
                "criticalVulnerabilityCount", "lastSecurityScanDate", "securityBaselineVariance",
                "pciCompliance", "hipaaCompliance"
            ],
            "Backup Configuration": [
                "backupScheduled", "backupFrequency", "lastSuccessfulBackupDate",
                "lastBackupStatus", "backupRetentionDays", "disasterRecoveryEnabled"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_virtual_machine(self, vm_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for a Virtual Machine node with impact assessment parameters.
        
        Args:
            vm_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for a Virtual Machine node
        """
        if vm_id is None:
            vm_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"vm-{vm_id}"
        properties["name"] = f"vm-{vm_id:04d}"
        properties["displayName"] = random.choice([
            f"app-server-{vm_id}", f"db-server-{vm_id}", f"web-server-{vm_id}", 
            f"file-server-{vm_id}", f"auth-server-{vm_id}", f"test-server-{vm_id}",
            f"dev-server-{vm_id}", f"util-server-{vm_id}", f"backup-server-{vm_id}"
        ])
        properties["uuid"] = str(uuid.uuid4())
        properties["instanceUuid"] = str(uuid.uuid4())
        properties["biosUuid"] = "42 " + " ".join([f"{int(x, 16):02x}" for x in str(uuid.uuid4()).split('-')])
        
        # ------- Guest OS Details -------
        os_families = ["windowsGuest", "linuxGuest", "otherGuest"]
        os_family_weights = [0.6, 0.35, 0.05]
        properties["guestFamily"] = random.choices(os_families, weights=os_family_weights)[0]
        
        if properties["guestFamily"] == "windowsGuest":
            os_types = [
                "Microsoft Windows Server 2016", 
                "Microsoft Windows Server 2019", 
                "Microsoft Windows Server 2022",
                "Microsoft Windows 10 (64-bit)",
                "Microsoft Windows 11 (64-bit)"
            ]
            os_weights = [0.2, 0.4, 0.3, 0.05, 0.05]
            properties["guestOS"] = random.choices(os_types, weights=os_weights)[0]
            properties["guestFullName"] = f"{properties['guestOS']} (64-bit)"
        elif properties["guestFamily"] == "linuxGuest":
            os_types = [
                "Ubuntu Linux 20.04", 
                "Ubuntu Linux 22.04",
                "Red Hat Enterprise Linux 8",
                "Red Hat Enterprise Linux 9",
                "SUSE Linux Enterprise 15",
                "CentOS 7",
                "Oracle Linux 8"
            ]
            properties["guestOS"] = random.choice(os_types)
            properties["guestFullName"] = f"{properties['guestOS']} (64-bit)"
        else:
            other_os = ["FreeBSD 12", "FreeBSD 13", "Solaris 11", "Oracle Solaris 11.4", "Other 64-bit"]
            properties["guestOS"] = random.choice(other_os)
            properties["guestFullName"] = f"{properties['guestOS']} (64-bit)"
        
        # Guest state depends on power state, defined later
        properties["guestHostname"] = properties["displayName"].lower() + ".internal.local"
        
        # ------- VM Configuration -------
        cpu_options = [1, 2, 4, 8, 16, 32, 64]
        cpu_weights = [0.05, 0.15, 0.35, 0.25, 0.15, 0.04, 0.01]
        properties["vcpus"] = random.choices(cpu_options, weights=cpu_weights)[0]
        properties["coresPerSocket"] = random.choice([1, 2, 4, 8])
        properties["memoryGB"] = random.choice([2, 4, 8, 16, 32, 64, 128, 256])
        
        # Advanced VM configuration
        properties["memoryReservationGB"] = random.randint(0, properties["memoryGB"] // 2)
        properties["memoryLimitGB"] = properties["memoryGB"]
        properties["cpuReservationMhz"] = random.randint(0, 1000 * properties["vcpus"] // 2)
        properties["cpuLimitMhz"] = 0  # 0 means unlimited
        
        # Disk configuration
        properties["numVirtualDisks"] = random.randint(1, 6)
        disk_sizes = []
        for i in range(properties["numVirtualDisks"]):
            # First disk typically has OS
            if i == 0:
                disk_sizes.append(random.choice([40, 60, 80, 100, 128]))
            else:
                disk_sizes.append(random.choice([50, 100, 200, 300, 500, 1000, 2000]))
        
        properties["totalStorageGB"] = sum(disk_sizes)
        properties["diskSizes"] = disk_sizes
        
        # Network configuration
        properties["numVirtualNics"] = random.randint(1, 4)
        properties["networkType"] = "vmxnet3" if random.random() < 0.9 else "e1000"
        
        # Hardware version - newer is more common
        hw_versions = [
            "vmx-10", "vmx-11", "vmx-13", "vmx-14", "vmx-15", "vmx-17", "vmx-19"
        ]
        hw_weights = [0.05, 0.05, 0.1, 0.1, 0.2, 0.2, 0.3]
        properties["virtualHardwareVersion"] = random.choices(hw_versions, weights=hw_weights)[0]
        
        # Boot options
        properties["firmware"] = random.choice(["bios", "efi"])
        properties["bootDelay"] = random.choice([0, 2000, 5000, 10000])
        
        # ------- Performance and Status -------
        power_states = ["poweredOn", "poweredOff", "suspended"]
        power_weights = [0.8, 0.15, 0.05]
        properties["powerState"] = random.choices(power_states, weights=power_weights)[0]
        
        connection_states = ["connected", "disconnected", "orphaned", "inaccessible"]
        connection_weights = [0.9, 0.05, 0.03, 0.02]
        properties["connectionState"] = random.choices(connection_states, weights=connection_weights)[0]
        
        # Update guest state based on power state
        if properties["powerState"] == "poweredOn":
            guest_states = ["running", "shuttingDown", "resetting", "standby"]
            guest_weights = [0.95, 0.02, 0.02, 0.01]
            properties["guestState"] = random.choices(guest_states, weights=guest_weights)[0]
            
            # Performance metrics for running VMs
            properties["cpuUsage"] = random.randint(5, 90)  # Percentage
            properties["memoryUsage"] = random.randint(int(properties["memoryGB"] * 0.2), int(properties["memoryGB"] * 0.9))  # GB
            properties["uptimeDays"] = random.randint(1, 365)
            
            # Tools status for running VMs
            tools_statuses = ["toolsOk", "toolsOld", "toolsNotRunning"]
            tools_weights = [0.7, 0.2, 0.1]
            properties["guestToolsStatus"] = random.choices(tools_statuses, weights=tools_weights)[0]
            properties["guestToolsVersion"] = str(random.randint(10000, 12999))
        else:
            properties["guestState"] = "notRunning"
            properties["cpuUsage"] = 0
            properties["memoryUsage"] = 0
            properties["uptimeDays"] = 0
            properties["guestToolsStatus"] = "toolsNotRunning"
            properties["guestToolsVersion"] = str(random.randint(10000, 12999))
        
        # ------- Advanced Features -------
        properties["vMotionEnabled"] = random.choice([True, True, False])  # More likely enabled
        ft_states = ["notConfigured", "disabled", "enabled", "needSecondary"]
        ft_weights = [0.8, 0.05, 0.1, 0.05]
        properties["faultToleranceState"] = random.choices(ft_states, weights=ft_weights)[0]
        properties["snapshots"] = random.randint(0, 5)
        properties["consolidationNeeded"] = random.choices([True, False], weights=[0.1, 0.9])[0]
        
        # ------- Resource Allocation -------
        disk_types = ["thin", "thick", "eagerzeroedthick"]
        disk_weights = [0.7, 0.2, 0.1]
        properties["diskProvisionType"] = random.choices(disk_types, weights=disk_weights)[0]
        properties["swapplacement"] = random.choice(["hostLocal", "vmDirectory"])
        properties["balloonedMemory"] = 0  # Normal case
        
        # ------- Business Context -------
        apps = ["ERP System", "CRM", "Email Server", "Web Application", "Database Server", 
                "File Server", "Domain Controller", "Print Server", "Backup Server", 
                "Monitoring Tool", "Development Environment", "Test Environment", "CI/CD Pipeline"]
        properties["application"] = random.choice(apps)
        
        environments = ["Production", "Development", "Test", "QA", "Staging", "DR"]
        env_weights = [0.5, 0.2, 0.1, 0.1, 0.05, 0.05]
        properties["environment"] = random.choices(environments, weights=env_weights)[0]
        
        departments = ["IT Operations", "Development Team", "Database Team", "Security Team", 
                      "Network Team", "Finance", "HR", "Sales", "Marketing", "Legal", "Executive"]
        properties["owner"] = random.choice(departments)
        properties["costCenter"] = f"CC-{random.randint(100000, 999999)}"
        
        # Criticality depends on environment
        if properties["environment"] == "Production":
            crit_options = ["Critical", "High", "Medium", "Low"]
            crit_weights = [0.3, 0.5, 0.15, 0.05]
        elif properties["environment"] == "DR":
            crit_options = ["Critical", "High", "Medium", "Low"]
            crit_weights = [0.2, 0.4, 0.3, 0.1]
        else:
            crit_options = ["Critical", "High", "Medium", "Low"]
            crit_weights = [0.05, 0.15, 0.3, 0.5]
        
        properties["criticality"] = random.choices(crit_options, weights=crit_weights)[0]
        
        # ------- Management -------
        # Creation date is in the past
        creation_date = self.today - datetime.timedelta(days=random.randint(30, 1000))
        properties["creationDate"] = f"{creation_date.strftime('%Y-%m-%d')}T{random.randint(0, 23):02d}:{random.randint(0, 59):02d}:{random.randint(0, 59):02d}Z"
        
        # Backup dates should be recent for running VMs
        if properties["powerState"] == "poweredOn":
            properties["lastBackupDate"] = f"{self.random_past_date(14)}T{random.randint(0, 23):02d}:{random.randint(0, 59):02d}:{random.randint(0, 59):02d}Z"
        else:
            days_ago = random.randint(14, 90)
            backup_date = self.today - datetime.timedelta(days=days_ago)
            properties["lastBackupDate"] = f"{backup_date.strftime('%Y-%m-%d')}T{random.randint(0, 23):02d}:{random.randint(0, 59):02d}:{random.randint(0, 59):02d}Z"
        
        # Last patch date depends on OS type and security status
        properties["lastPatchDate"] = self.random_past_date(180)
        
        # Maintenance window depends on environment and criticality
        if properties["environment"] == "Production" and properties["criticality"] in ["Critical", "High"]:
            days = ["Saturday", "Sunday"]
            day_weights = [0.3, 0.7]
            start_hours = [0, 1, 2, 22, 23]
        elif properties["environment"] == "Production":
            days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
            day_weights = [0.1, 0.1, 0.1, 0.1, 0.1, 0.25, 0.25]
            start_hours = [0, 1, 2, 18, 19, 20, 21, 22, 23]
        else:
            days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
            day_weights = [1/7, 1/7, 1/7, 1/7, 1/7, 1/7, 1/7]
            start_hours = list(range(0, 24))
        
        maint_day = random.choices(days, weights=day_weights)[0]
        maint_start = random.choice(start_hours)
        maint_end = (maint_start + random.randint(2, 6)) % 24
        properties["maintenanceWindow"] = f"{maint_day} {maint_start:02d}:00-{maint_end:02d}:00"
        
        # ------- Compliance and Security -------
        # Compliance correlates with patch date - older patches mean less compliance
        patch_date = datetime.datetime.strptime(properties["lastPatchDate"], "%Y-%m-%d").date()
        days_since_patched = (self.today - patch_date).days
        
        if days_since_patched > 120:
            comp_options = ["compliant", "nonCompliant", "unknown"]
            comp_weights = [0.1, 0.8, 0.1]
            sec_options = ["secure", "warning", "risk"]
            sec_weights = [0.1, 0.3, 0.6]
        elif days_since_patched > 60:
            comp_options = ["compliant", "nonCompliant", "unknown"]
            comp_weights = [0.4, 0.5, 0.1]
            sec_options = ["secure", "warning", "risk"]
            sec_weights = [0.3, 0.5, 0.2]
        else:
            comp_options = ["compliant", "nonCompliant", "unknown"]
            comp_weights = [0.8, 0.15, 0.05]
            sec_options = ["secure", "warning", "risk"]
            sec_weights = [0.7, 0.25, 0.05]
        
        properties["complianceStatus"] = random.choices(comp_options, weights=comp_weights)[0]
        properties["securityStatus"] = random.choices(sec_options, weights=sec_weights)[0]
        
        # ------- Change Management -------
        # Last change request
        last_change_date = self.today - datetime.timedelta(days=random.randint(10, 180))
        last_change_seq = random.randint(1, 999)
        properties["lastChangeRequestID"] = f"CR-{last_change_date.strftime('%Y%m%d')}-{last_change_seq:03d}"
        properties["lastChangeRequestStatus"] = random.choice(["Completed", "Failed", "Canceled"])
        properties["lastChangeType"] = random.choice([
            "OS Patching", "Software Installation", "Configuration Change", 
            "Resource Allocation", "Hardware Upgrade", "Migration", "New Deployment"
        ])
        
        # Pending changes
        has_pending = random.random() < 0.3  # 30% chance of pending change
        if has_pending:
            pending_change_date = self.today + datetime.timedelta(days=random.randint(7, 60))
            pending_change_seq = random.randint(1, 999)
            properties["pendingChangeRequestID"] = f"CR-{pending_change_date.strftime('%Y%m%d')}-{pending_change_seq:03d}"
            properties["pendingChangeType"] = random.choice([
                "OS Patching", "Software Installation", "Configuration Change", 
                "Resource Allocation", "Hardware Upgrade", "Migration", "Decommission"
            ])
            properties["scheduledChangeDate"] = self.random_future_date(60)
        else:
            properties["pendingChangeRequestID"] = None
            properties["pendingChangeType"] = None
            properties["scheduledChangeDate"] = None
        
        # ------- Impact Assessment -------
        # Business criticality influences impact scores
        if properties["criticality"] == "Critical":
            base_impact = 80
        elif properties["criticality"] == "High":
            base_impact = 60
        elif properties["criticality"] == "Medium":
            base_impact = 40
        else:
            base_impact = 20
        
        # Environment affects impact
        if properties["environment"] == "Production":
            base_impact += 20
        elif properties["environment"] == "DR":
            base_impact += 10
        
        # Add some randomness
        properties["businessImpactScore"] = min(base_impact + random.randint(-10, 10), 100)
        
        # Estimated users depends on application type
        if "Database" in properties["application"] or "ERP" in properties["application"]:
            properties["estimatedUserCount"] = random.randint(50, 500)
        elif "Web" in properties["application"] or "CRM" in properties["application"]:
            properties["estimatedUserCount"] = random.randint(20, 300)
        else:
            properties["estimatedUserCount"] = random.randint(5, 100)
        
        # Dependencies
        dep_count = random.randint(0, 8)
        if dep_count > 0:
            dep_types = ["Database", "Web Server", "Application Server", "File Server", 
                         "Authentication", "Load Balancer", "Cache", "Queue", "API Gateway"]
            properties["dependencies"] = random.sample(dep_types, dep_count)
        else:
            properties["dependencies"] = []
        
        # Number of dependent systems
        properties["dependentSystemCount"] = random.randint(0, 10)
        
        # Generate the Cypher code for the node
        cypher_code = f"CREATE (vm_{vm_id}:VirtualMachine {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "displayName", "uuid", "instanceUuid", "biosUuid"
            ],
            "Guest OS Details": [
                "guestOS", "guestFamily", "guestFullName", "guestState", 
                "guestHostname", "guestToolsStatus", "guestToolsVersion"
            ],
            "VM Configuration": [
                "vcpus", "coresPerSocket", "memoryGB", "memoryReservationGB", 
                "memoryLimitGB", "cpuReservationMhz", "cpuLimitMhz", "numVirtualDisks", 
                "totalStorageGB", "diskSizes", "numVirtualNics", "networkType",
                "virtualHardwareVersion", "firmware", "bootDelay"
            ],
            "Performance and Status": [
                "powerState", "connectionState", "cpuUsage", "memoryUsage", "uptimeDays"
            ],
            "Advanced Features": [
                "vMotionEnabled", "faultToleranceState", "snapshots", "consolidationNeeded"
            ],
            "Resource Allocation": [
                "diskProvisionType", "swapplacement", "balloonedMemory"
            ],
            "Business Context": [
                "application", "environment", "owner", "costCenter", "criticality"
            ],
            "Management": [
                "creationDate", "lastBackupDate", "lastPatchDate", "maintenanceWindow"
            ],
            "Compliance and Security": [
                "complianceStatus", "securityStatus"
            ],
            "Change Management": [
                "lastChangeRequestID", "lastChangeRequestStatus", "lastChangeType",
                "pendingChangeRequestID", "pendingChangeType", "scheduledChangeDate"
            ],
            "Impact Assessment": [
                "businessImpactScore", "estimatedUserCount", "dependencies", "dependentSystemCount"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_vsphere_cluster(self, cluster_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for a vSphere Cluster node with impact assessment parameters.
        
        Args:
            cluster_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for a vSphere Cluster node
        """
        if cluster_id is None:
            cluster_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"cluster-{cluster_id}"
        properties["name"] = f"Cluster-{cluster_id}"
        properties["moRef"] = f"domain-c{random.randint(1, 9999)}"
        
        # ------- Cluster Type and Purpose -------
        cluster_types = ["Management", "Compute", "Edge", "DMZ", "VDI", "Test/Dev", "Production"]
        properties["clusterType"] = random.choice(cluster_types)
        properties["datacenter"] = random.choice(["DC-East", "DC-West", "DC-Central", "DC-Europe", "DC-APAC"])
        
        # ------- Capacity and Scale -------
        properties["hostCount"] = random.randint(2, 32)
        properties["vmCount"] = properties["hostCount"] * random.randint(5, 25)
        properties["totalCpuCores"] = properties["hostCount"] * random.randint(32, 96)
        properties["totalMemoryGB"] = properties["hostCount"] * random.randint(256, 768)
        
        properties["allocatedCpuPercentage"] = round(random.uniform(50, 95), 1)
        properties["allocatedMemoryPercentage"] = round(random.uniform(60, 92), 1)
        
        properties["cpuOvercommitRatio"] = round(random.uniform(2, 8), 1)
        properties["memoryOvercommitRatio"] = round(random.uniform(1.2, 3), 1)
        
        # ------- HA Configuration -------
        properties["haEnabled"] = random.choice([True, True, False])  # More likely enabled
        
        if properties["haEnabled"]:
            ha_admission_controls = ["hostFailures", "clusterResource", "failoverHosts", "disabled"]
            ha_weights = [0.4, 0.3, 0.2, 0.1]
            properties["haAdmissionControlPolicy"] = random.choices(ha_admission_controls, weights=ha_weights)[0]
            
            if properties["haAdmissionControlPolicy"] == "hostFailures":
                properties["haHostFailuresTolerate"] = random.randint(1, min(3, properties["hostCount"] // 2))
                properties["haSlotCpuMHz"] = random.randint(500, 2000)
                properties["haSlotMemoryMB"] = random.randint(1024, 8192)
            elif properties["haAdmissionControlPolicy"] == "clusterResource":
                properties["haClusterCpuPercent"] = random.randint(10, 50)
                properties["haClusterMemoryPercent"] = random.randint(10, 50)
            elif properties["haAdmissionControlPolicy"] == "failoverHosts":
                properties["haFailoverHostCount"] = random.randint(1, min(2, properties["hostCount"] // 3))
            
            properties["haVmMonitoring"] = random.choice(["vmMonitoring", "vmAndAppMonitoring", "disabled"])
            properties["haRestartPriority"] = random.choice(["disabled", "low", "medium", "high", "highest"])
            properties["haIsolationResponse"] = random.choice(["powerOff", "shutdown", "leave"])
        else:
            properties["haAdmissionControlPolicy"] = "disabled"
            properties["haVmMonitoring"] = "disabled"
            properties["haRestartPriority"] = "disabled"
            properties["haIsolationResponse"] = "powerOff"
        
        # ------- DRS Configuration -------
        properties["drsEnabled"] = random.choice([True, True, False])  # More likely enabled
        
        if properties["drsEnabled"]:
            properties["drsAutomationLevel"] = random.choice(["fullyAutomated", "partiallyAutomated", "manual"])
            properties["drsMigrationThreshold"] = random.randint(1, 5)  # 1=conservative, 5=aggressive
            properties["drsVmHardwareCompatibility"] = random.choice([True, False])
            properties["predictiveDrs"] = random.choice([True, False])
            properties["vmDistribution"] = random.choice(["even", "consolidate", "powerManagement"])
        else:
            properties["drsAutomationLevel"] = "manual"
            properties["drsMigrationThreshold"] = 3
            properties["drsVmHardwareCompatibility"] = False
            properties["predictiveDrs"] = False
            properties["vmDistribution"] = "even"
        
        # ------- Advanced Features -------
        properties["evcMode"] = random.choice([
            "intel-broadwell", "intel-skylake", "intel-cascadelake", "intel-icelake", 
            "amd-milan", "amd-rome", "disabled"
        ])
        
        properties["evcModeEnabled"] = properties["evcMode"] != "disabled"
        properties["vSanEnabled"] = random.choice([True, False])
        properties["vmEncryptionEnabled"] = random.choice([True, False])
        properties["proactiveHaEnabled"] = random.choice([True, False])
        
        # ------- Resource Management -------
        properties["resourcePoolCount"] = random.randint(1, 10)
        properties["dpmEnabled"] = random.choice([True, False])
        
        if properties["dpmEnabled"]:
            properties["dpmAutomationLevel"] = random.choice(["manual", "automated"])
            properties["dpmThreshold"] = random.randint(1, 5)  # 1=conservative, 5=aggressive
        else:
            properties["dpmAutomationLevel"] = "manual"
            properties["dpmThreshold"] = 3
        
        # ------- Performance and Health -------
        health_states = ["green", "yellow", "red"]
        health_weights = [0.8, 0.15, 0.05]
        properties["overallStatus"] = random.choices(health_states, weights=health_weights)[0]
        
        properties["cpuUsagePercentage"] = round(random.uniform(20, 85), 1)
        properties["memoryUsagePercentage"] = round(random.uniform(40, 90), 1)
        properties["currentCpuFailoverCapacity"] = round(100 - properties["cpuUsagePercentage"])
        properties["currentMemoryFailoverCapacity"] = round(100 - properties["memoryUsagePercentage"])
        
        properties["vmCpuReadiness"] = round(random.uniform(0, 5), 2)  # Percentage
        properties["vmMemorySwapRate"] = round(random.uniform(0, 10), 2)  # MB/s
        
        # ------- Business Impact -------
        # Criticality based on cluster type and VM count
        if properties["clusterType"] in ["Management", "Production"] or properties["vmCount"] > 100:
            properties["businessCriticalityScore"] = random.randint(80, 100)
            properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        elif properties["clusterType"] in ["Compute", "VDI"] or properties["vmCount"] > 50:
            properties["businessCriticalityScore"] = random.randint(60, 80)
            properties["slaLevel"] = random.choice(["Silver", "Gold"])
        else:
            properties["businessCriticalityScore"] = random.randint(30, 60)
            properties["slaLevel"] = random.choice(["Bronze", "Silver"])
        
        # Maintenance window - usually off-hours
        service_window_start_hour = random.randint(0, 4)
        service_window_duration = random.randint(4, 8)
        service_window_end_hour = (service_window_start_hour + service_window_duration) % 24
        
        properties["serviceWindowStart"] = f"{service_window_start_hour:02d}:00"
        properties["serviceWindowEnd"] = f"{service_window_end_hour:02d}:00"
        properties["serviceWindowDay"] = random.choice(["Saturday", "Sunday"])
        
        # Impact metrics
        if properties["businessCriticalityScore"] > 80:
            properties["estimatedImpactUsers"] = properties["vmCount"] * random.randint(15, 30)
        else:
            properties["estimatedImpactUsers"] = properties["vmCount"] * random.randint(5, 15)
        
        # ------- Change Management -------
        properties["lastConfigChangeDate"] = self.random_past_date(90)
        
        # Change risk calculation
        base_risk = 40
        
        # Higher host count = higher risk
        if properties["hostCount"] > 16:
            base_risk += 20
        elif properties["hostCount"] > 8:
            base_risk += 10
        
        # High utilization = higher risk
        if properties["cpuUsagePercentage"] > 80 or properties["memoryUsagePercentage"] > 85:
            base_risk += 15
        elif properties["cpuUsagePercentage"] > 70 or properties["memoryUsagePercentage"] > 75:
            base_risk += 10
        
        # Critical applications = higher risk
        if properties["businessCriticalityScore"] > 80:
            base_risk += 20
        elif properties["businessCriticalityScore"] > 60:
            base_risk += 10
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-5, 5), 100)
        
        # Recommended precautions based on risk
        if properties["changeRiskScore"] > 70:
            properties["changeImpactCategory"] = "High"
            properties["recommendedPrecautions"] = [
                "Plan for extended maintenance window",
                "Prepare detailed rollback plan",
                "Pre-notify all stakeholders",
                "Schedule during lowest usage period",
                "Perform on subset of cluster first"
            ]
        elif properties["changeRiskScore"] > 40:
            properties["changeImpactCategory"] = "Medium"
            properties["recommendedPrecautions"] = [
                "Standard maintenance window",
                "Prepare rollback plan",
                "Notify key stakeholders",
                "Schedule during off-hours"
            ]
        else:
            properties["changeImpactCategory"] = "Low"
            properties["recommendedPrecautions"] = [
                "Standard change process",
                "Notification to IT team",
                "Basic rollback plan"
            ]
        
        # ------- Compliance and Operations -------
        compliance_options = ["compliant", "nonCompliant", "unknown"]
        compliance_weights = [0.8, 0.15, 0.05]
        properties["complianceStatus"] = random.choices(compliance_options, weights=compliance_weights)[0]
        
        # Last successful operation data
        properties["lastSuccessfulVmotionDate"] = self.random_past_date(14)
        properties["vmotionSuccessRate"] = round(random.uniform(95, 100), 1)
        properties["lastDrsInvocationDate"] = self.random_past_date(7)
        properties["lastDrsRecommendationCount"] = random.randint(0, 20)
        
        # History of outages or disruptions
        properties["unplannedOutageCount90Days"] = random.randint(0, 3)
        properties["plannedOutageCount90Days"] = random.randint(0, 5)
        properties["totalDowntimeMinutes90Days"] = properties["unplannedOutageCount90Days"] * random.randint(10, 120) + \
                                                  properties["plannedOutageCount90Days"] * random.randint(30, 180)
        
        # Generate the Cypher code for the node
        cypher_code = f"CREATE (cluster_{cluster_id}:VSphereCluster {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "moRef", "clusterType", "datacenter"
            ],
            "Capacity and Scale": [
                "hostCount", "vmCount", "totalCpuCores", "totalMemoryGB",
                "allocatedCpuPercentage", "allocatedMemoryPercentage",
                "cpuOvercommitRatio", "memoryOvercommitRatio"
            ],
            "HA Configuration": [
                "haEnabled", "haAdmissionControlPolicy", "haHostFailuresTolerate",
                "haSlotCpuMHz", "haSlotMemoryMB", "haClusterCpuPercent",
                "haClusterMemoryPercent", "haFailoverHostCount", "haVmMonitoring",
                "haRestartPriority", "haIsolationResponse"
            ],
            "DRS Configuration": [
                "drsEnabled", "drsAutomationLevel", "drsMigrationThreshold",
                "drsVmHardwareCompatibility", "predictiveDrs", "vmDistribution"
            ],
            "Advanced Features": [
                "evcMode", "evcModeEnabled", "vSanEnabled", "vmEncryptionEnabled",
                "proactiveHaEnabled"
            ],
            "Resource Management": [
                "resourcePoolCount", "dpmEnabled", "dpmAutomationLevel", "dpmThreshold"
            ],
            "Performance and Health": [
                "overallStatus", "cpuUsagePercentage", "memoryUsagePercentage",
                "currentCpuFailoverCapacity", "currentMemoryFailoverCapacity",
                "vmCpuReadiness", "vmMemorySwapRate"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "serviceWindowStart",
                "serviceWindowEnd", "serviceWindowDay", "estimatedImpactUsers"
            ],
            "Change Management": [
                "lastConfigChangeDate", "changeRiskScore", "changeImpactCategory",
                "recommendedPrecautions"
            ],
            "Compliance and Operations": [
                "complianceStatus", "lastSuccessfulVmotionDate", "vmotionSuccessRate",
                "lastDrsInvocationDate", "lastDrsRecommendationCount",
                "unplannedOutageCount90Days", "plannedOutageCount90Days",
                "totalDowntimeMinutes90Days"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_vsan_cluster(self, vsan_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for a vSAN Cluster node with impact assessment parameters.
        
        Args:
            vsan_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for a vSAN Cluster node
        """
        if vsan_id is None:
            vsan_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"vsan-{vsan_id}"
        properties["name"] = f"vSAN-Cluster-{vsan_id}"
        properties["uuid"] = str(uuid.uuid4())
        properties["associatedCluster"] = f"Cluster-{random.randint(1001, 9999)}"
        
        # ------- vSAN Configuration -------
        vsan_versions = ["6.7", "7.0", "8.0"]
        properties["vsanVersion"] = random.choice(vsan_versions)
        
        # File services generally available in newer versions
        properties["vsanFileServicesEnabled"] = (properties["vsanVersion"] >= "7.0") and random.choice([True, False])
        
        deployment_types = ["Hybrid", "All-Flash", "All-Flash with Deduplication and Compression", "vSAN Express Storage Architecture"]
        deployment_weights = [0.1, 0.3, 0.5, 0.1]  # All-Flash with dedupe is more common
        properties["deploymentType"] = random.choices(deployment_types, weights=deployment_weights)[0]
        
        # Determine if using stretched cluster
        properties["stretchedClusterEnabled"] = random.choice([True, False])
        if properties["stretchedClusterEnabled"]:
            properties["secondarySite"] = random.choice(["Site-B", "DR-Site", "Secondary-DC", "Colo-Facility"])
            properties["witnessHost"] = f"witness-{random.randint(1, 9)}.vsanwitness.local"
            properties["preferredSite"] = random.choice(["Primary", "Secondary", "None"])
            properties["sitePingLatency"] = random.randint(1, 10)  # ms
        
        # Encryption and data protection
        properties["encryptionEnabled"] = random.choice([True, False])
        if properties["encryptionEnabled"]:
            properties["encryptionKmsServer"] = f"kms.{random.choice(['company', 'enterprise', 'corp'])}.local"
        
        properties["checksumEnabled"] = random.choice([True, True, False])  # More likely enabled
        properties["rebuildDelay"] = random.randint(30, 120)  # Minutes
        
        # ------- Capacity and Resources -------
        properties["hostCount"] = random.randint(3, 32)
        properties["diskGroupsPerHost"] = random.randint(1, 5)
        
        if properties["deploymentType"] == "Hybrid":
            ssd_per_diskgroup = 1
            hdd_per_diskgroup = random.randint(4, 7)
            ssd_capacity_gb = random.choice([400, 800, 1600])
            hdd_capacity_gb = random.choice([2000, 4000, 6000, 8000, 10000])
            
            properties["totalCacheTierTB"] = round((ssd_capacity_gb * properties["diskGroupsPerHost"] * properties["hostCount"]) / 1024, 1)
            properties["totalCapacityTierTB"] = round((hdd_capacity_gb * hdd_per_diskgroup * properties["diskGroupsPerHost"] * properties["hostCount"]) / 1024, 1)
            properties["totalRawCapacityTB"] = properties["totalCapacityTierTB"]
        else:
            # All-Flash configurations
            ssd_per_diskgroup = random.randint(1, 2)  # Cache disks
            capacity_ssd_per_diskgroup = random.randint(3, 7)  # Capacity disks
            cache_ssd_capacity_gb = random.choice([800, 1600, 3200])
            capacity_ssd_capacity_gb = random.choice([3840, 7680, 15360, 30720])
            
            properties["totalCacheTierTB"] = round((cache_ssd_capacity_gb * ssd_per_diskgroup * properties["diskGroupsPerHost"] * properties["hostCount"]) / 1024, 1)
            properties["totalCapacityTierTB"] = round((capacity_ssd_capacity_gb * capacity_ssd_per_diskgroup * properties["diskGroupsPerHost"] * properties["hostCount"]) / 1024, 1)
            properties["totalRawCapacityTB"] = properties["totalCapacityTierTB"]
        
        # Space efficiency and utilization
        if "Deduplication" in properties["deploymentType"]:
            properties["deduplicationEnabled"] = True
            properties["compressionEnabled"] = True
            properties["dedupeRatio"] = round(random.uniform(1.5, 4.0), 2)
            properties["spaceEfficiencyRatio"] = properties["dedupeRatio"]
            properties["effectiveCapacityTB"] = round(properties["totalRawCapacityTB"] * properties["spaceEfficiencyRatio"], 1)
        elif properties["deploymentType"] == "vSAN Express Storage Architecture":
            properties["deduplicationEnabled"] = True
            properties["compressionEnabled"] = True
            properties["dedupeRatio"] = round(random.uniform(2.0, 5.0), 2)
            properties["spaceEfficiencyRatio"] = properties["dedupeRatio"]
            properties["effectiveCapacityTB"] = round(properties["totalRawCapacityTB"] * properties["spaceEfficiencyRatio"], 1)
        else:
            properties["deduplicationEnabled"] = False
            properties["compressionEnabled"] = False
            properties["dedupeRatio"] = 1.0
            properties["spaceEfficiencyRatio"] = 1.0
            properties["effectiveCapacityTB"] = properties["totalRawCapacityTB"]
        
        # Usage metrics
        properties["usedCapacityTB"] = round(properties["effectiveCapacityTB"] * random.uniform(0.3, 0.85), 1)
        properties["freeCapacityTB"] = round(properties["effectiveCapacityTB"] - properties["usedCapacityTB"], 1)
        properties["capacityUtilizationPercentage"] = round((properties["usedCapacityTB"] / properties["effectiveCapacityTB"]) * 100, 1)
        
        # ------- Storage Policy and Configuration -------
        properties["defaultPolicyName"] = "vSAN Default Storage Policy"
        properties["storagePolicyCount"] = random.randint(1, 5)
        
        ft_methods = ["RAID-1", "RAID-5", "RAID-6", "RAID-1+RAID-5", "RAID-1+RAID-6"]
        ft_weights = [0.3, 0.3, 0.2, 0.1, 0.1]
        properties["primaryFailureToleranceMethod"] = random.choices(ft_methods, weights=ft_weights)[0]
        
        properties["primaryFailuresToTolerate"] = random.randint(1, 3)
        properties["secondaryFailuresToTolerate"] = properties["primaryFailuresToTolerate"] - 1 if properties["primaryFailuresToTolerate"] > 1 else 0
        
        properties["objectRepairTimer"] = random.randint(30, 240)  # minutes
        properties["diskStripeWidth"] = random.randint(1, 12)
        
        # ------- Performance and Health -------
        health_states = ["green", "yellow", "red"]
        health_weights = [0.8, 0.15, 0.05]
        properties["overallHealth"] = random.choices(health_states, weights=health_weights)[0]
        
        # Component health
        for component in ["diskHealth", "networkHealth", "dataHealth", "clusterHealth"]:
            properties[component] = random.choices(health_states, weights=health_weights)[0]
        
        # Performance metrics
        properties["averageReadLatencyMs"] = round(random.uniform(1, 10), 2)
        properties["averageWriteLatencyMs"] = round(random.uniform(1, 15), 2)
        properties["iopsRead"] = random.randint(1000, 50000)
        properties["iopsWrite"] = random.randint(500, 30000)
        properties["throughputReadMBps"] = random.randint(100, 2000)
        properties["throughputWriteMBps"] = random.randint(50, 1500)
        properties["congestionPercentage"] = round(random.uniform(0, 20), 1)
        
        # ------- Operational Status -------
        properties["rebuildingComponents"] = random.randint(0, 5)
        properties["degradedComponents"] = random.randint(0, 8)
        properties["rebalancingPercentage"] = random.randint(0, 100)
        properties["resyncingPercentage"] = random.randint(0, 100)
        
        # ------- Resiliency Status -------
        if properties["rebuildingComponents"] > 0 or properties["degradedComponents"] > 0:
            properties["dataAtRisk"] = random.choice([True, False])
        else:
            properties["dataAtRisk"] = False
        
        properties["hostFailuresClusterToleratesNow"] = min(properties["primaryFailuresToTolerate"], properties["hostCount"] - 1)
        
        # ------- Change Management -------
        properties["lastComponentReplacementDate"] = self.random_past_date(90)
        properties["lastStoragePolicyChangeDate"] = self.random_past_date(180)
        properties["lastCapacityExpansionDate"] = self.random_past_date(365)
        
        # Change risk calculation
        base_risk = 50  # Storage changes are riskier
        
        # Factors affecting risk
        if properties["capacityUtilizationPercentage"] > 85:
            base_risk += 20
        elif properties["capacityUtilizationPercentage"] > 70:
            base_risk += 10
        
        if properties["stretchedClusterEnabled"]:
            base_risk += 15
        
        if properties["deploymentType"] == "Hybrid":
            base_risk += 10  # Hybrid is older and riskier to change
        
        if properties["rebuildingComponents"] > 0 or properties["degradedComponents"] > 0:
            base_risk += 25
        
        if properties["overallHealth"] == "yellow":
            base_risk += 15
        elif properties["overallHealth"] == "red":
            base_risk += 30
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-10, 10), 100)
        
        # Impact assessment based on risk
        if properties["changeRiskScore"] > 70:
            properties["changeImpactCategory"] = "High"
            properties["recommendedPrecautions"] = [
                "Schedule extended maintenance window",
                "Verify backup of critical VMs",
                "Pre-evacuate non-essential workloads",
                "Have vendor support on standby",
                "Validate stretched cluster witness connectivity"
            ]
        elif properties["changeRiskScore"] > 40:
            properties["changeImpactCategory"] = "Medium"
            properties["recommendedPrecautions"] = [
                "Standard maintenance window",
                "Ensure component compatibility",
                "Schedule during off-hours",
                "Verify backup of critical VMs"
            ]
        else:
            properties["changeImpactCategory"] = "Low"
            properties["recommendedPrecautions"] = [
                "Standard change process",
                "Validate component compatibility",
                "Schedule during regular maintenance window"
            ]
        
        # ------- Business Impact -------
        # vSAN is typically critical infrastructure
        properties["businessCriticalityScore"] = random.randint(70, 100)
        properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        properties["estimatedVmsImpacted"] = random.randint(properties["hostCount"] * 5, properties["hostCount"] * 20)
        properties["estimatedUsersImpacted"] = properties["estimatedVmsImpacted"] * random.randint(5, 20)
        
        # Generate the Cypher code for the node
        cypher_code = f"CREATE (vsan_{vsan_id}:VSANCluster {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "uuid", "associatedCluster"
            ],
            "vSAN Configuration": [
                "vsanVersion", "vsanFileServicesEnabled", "deploymentType",
                "stretchedClusterEnabled", "secondarySite", "witnessHost", 
                "preferredSite", "sitePingLatency", "encryptionEnabled",
                "encryptionKmsServer", "checksumEnabled", "rebuildDelay"
            ],
            "Capacity and Resources": [
                "hostCount", "diskGroupsPerHost", "totalCacheTierTB", 
                "totalCapacityTierTB", "totalRawCapacityTB", "deduplicationEnabled",
                "compressionEnabled", "dedupeRatio", "spaceEfficiencyRatio",
                "effectiveCapacityTB", "usedCapacityTB", "freeCapacityTB",
                "capacityUtilizationPercentage"
            ],
            "Storage Policy and Configuration": [
                "defaultPolicyName", "storagePolicyCount", "primaryFailureToleranceMethod",
                "primaryFailuresToTolerate", "secondaryFailuresToTolerate",
                "objectRepairTimer", "diskStripeWidth"
            ],
            "Performance and Health": [
                "overallHealth", "diskHealth", "networkHealth", "dataHealth",
                "clusterHealth", "averageReadLatencyMs", "averageWriteLatencyMs",
                "iopsRead", "iopsWrite", "throughputReadMBps", "throughputWriteMBps",
                "congestionPercentage"
            ],
            "Operational Status": [
                "rebuildingComponents", "degradedComponents", "rebalancingPercentage",
                "resyncingPercentage"
            ],
            "Resiliency Status": [
                "dataAtRisk", "hostFailuresClusterToleratesNow"
            ],
            "Change Management": [
                "lastComponentReplacementDate", "lastStoragePolicyChangeDate",
                "lastCapacityExpansionDate", "changeRiskScore", "changeImpactCategory",
                "recommendedPrecautions"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "estimatedVmsImpacted",
                "estimatedUsersImpacted"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_datastore(self, datastore_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for a Datastore node with impact assessment parameters.
        
        Args:
            datastore_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for a Datastore node
        """
        if datastore_id is None:
            datastore_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"datastore-{datastore_id}"
        properties["name"] = random.choice([
            f"DS{datastore_id:04d}", 
            f"SAN-LUN{datastore_id:02d}",
            f"NFS-Vol{datastore_id:02d}",
            f"vSAN-DS{datastore_id:02d}",
            f"VMFS-{datastore_id:03d}",
            f"Local-{datastore_id:03d}"
        ])
        properties["moRef"] = f"datastore-{random.randint(1, 9999)}"
        properties["url"] = f"ds:///{properties['name']}"
        
        # ------- Datastore Type and Configuration -------
        datastore_types = ["VMFS", "NFS", "vSAN", "vVol", "Local"]
        type_weights = [0.5, 0.25, 0.15, 0.05, 0.05]
        properties["type"] = random.choices(datastore_types, weights=type_weights)[0]
        
        if properties["type"] == "VMFS":
            properties["filesystemVersion"] = random.choice(["VMFS-5", "VMFS-6"])
            properties["blockSizeKB"] = random.choice([1, 2, 4, 8])
            properties["maxFileSize"] = "62TB" if properties["filesystemVersion"] == "VMFS-6" else "2TB"
            properties["storageArrayType"] = random.choice(["FC", "iSCSI", "FCoE", "NVMe-oF"])
            properties["multipleExtents"] = random.choice([True, False])
        elif properties["type"] == "NFS":
            properties["nfsVersion"] = random.choice(["3", "4.1"])
            properties["remoteHost"] = f"nfs-{random.randint(1, 10)}.{random.choice(['storage', 'san', 'nas'])}.local"
            properties["remotePath"] = f"/vol/{properties['name']}"
            properties["accessMode"] = random.choice(["ReadWrite", "ReadOnly"])
            properties["multipleExtents"] = False
        elif properties["type"] == "vSAN":
            properties["vsanClusterId"] = f"vsan-{random.randint(1001, 9999)}"
            properties["vsanObjectCount"] = random.randint(100, 10000)
            properties["defaultStoragePolicy"] = "vSAN Default Storage Policy"
            properties["multipleExtents"] = False
        elif properties["type"] == "vVol":
            properties["storageArrayId"] = f"array-{random.randint(1001, 9999)}"
            properties["storageContainerId"] = f"container-{random.randint(1001, 9999)}"
            properties["protocatalId"] = random.randint(10000000, 99999999)
            properties["providerName"] = random.choice(["Dell EMC", "HPE", "NetApp", "Pure Storage", "IBM"])
            properties["multipleExtents"] = False
        else:  # Local
            properties["localPathOnHost"] = f"/vmfs/volumes/local-{random.randint(1, 100)}"
            properties["hostId"] = f"host-{random.randint(1001, 9999)}"
            properties["multipleExtents"] = False
        
        # ------- Capacity and Allocation -------
        capacity_gb_options = [256, 512, 1024, 2048, 4096, 8192, 16384, 32768]
        properties["capacityGB"] = random.choice(capacity_gb_options)
        properties["provisionedGB"] = round(properties["capacityGB"] * random.uniform(0.3, 1.2), 1)
        properties["usedGB"] = round(properties["capacityGB"] * random.uniform(0.2, 0.9), 1)
        properties["freeGB"] = round(properties["capacityGB"] - properties["usedGB"], 1)
        properties["freePercentage"] = round((properties["freeGB"] / properties["capacityGB"]) * 100, 1)
        
        # Alert for low space
        if properties["freePercentage"] < 10:
            properties["spaceStatus"] = "critical"
        elif properties["freePercentage"] < 20:
            properties["spaceStatus"] = "warning"
        else:
            properties["spaceStatus"] = "normal"
        
        # ------- Performance and Status -------
        health_states = ["green", "yellow", "red"]
        health_weights = [0.8, 0.15, 0.05]
        properties["overallStatus"] = random.choices(health_states, weights=health_weights)[0]
        
        properties["accessible"] = random.choice([True, True, True, False])  # Usually accessible
        if not properties["accessible"]:
            properties["accessibilityIssue"] = random.choice([
                "Path down", "Storage array offline", "Network connectivity issue",
                "Maintenance mode", "APD condition", "PDL condition"
            ])
        
        properties["maintenanceMode"] = random.choice([True, False])
        
        # Performance metrics based on type
        if properties["type"] in ["VMFS", "vSAN", "vVol"]:
            # SAN/block-based better performance
            properties["averageReadLatencyMs"] = round(random.uniform(1, 15), 2)
            properties["averageWriteLatencyMs"] = round(random.uniform(1, 20), 2)
            properties["maxReadLatencyMs"] = round(properties["averageReadLatencyMs"] * random.uniform(2, 5), 2)
            properties["maxWriteLatencyMs"] = round(properties["averageWriteLatencyMs"] * random.uniform(2, 5), 2)
            properties["iopsRead"] = random.randint(1000, 50000)
            properties["iopsWrite"] = random.randint(500, 30000)
            properties["throughputReadMBps"] = random.randint(100, 2000)
            properties["throughputWriteMBps"] = random.randint(50, 1500)
        else:
            # NAS/file-based usually lower performance
            properties["averageReadLatencyMs"] = round(random.uniform(2, 25), 2)
            properties["averageWriteLatencyMs"] = round(random.uniform(3, 30), 2)
            properties["maxReadLatencyMs"] = round(properties["averageReadLatencyMs"] * random.uniform(2, 5), 2)
            properties["maxWriteLatencyMs"] = round(properties["averageWriteLatencyMs"] * random.uniform(2, 5), 2)
            properties["iopsRead"] = random.randint(500, 20000)
            properties["iopsWrite"] = random.randint(200, 10000)
            properties["throughputReadMBps"] = random.randint(50, 1000)
            properties["throughputWriteMBps"] = random.randint(25, 750)
        
        # ------- Multipathing and Connectivity -------
        if properties["type"] in ["VMFS", "vVol"]:
            multipathing_policies = ["Fixed", "MRU", "RR", "VMW_PSP_RR", "VMW_PSP_FIXED", "VMW_PSP_MRU"]
            properties["multipathingPolicy"] = random.choice(multipathing_policies)
            properties["pathCount"] = random.randint(2, 16)
            properties["activePathCount"] = random.randint(1, properties["pathCount"])
            properties["deadPathCount"] = random.randint(0, properties["pathCount"] - properties["activePathCount"])
            properties["standbyPathCount"] = properties["pathCount"] - properties["activePathCount"] - properties["deadPathCount"]
        
        # ------- VM Content -------
        properties["vmCount"] = random.randint(1, 100)
        properties["templateCount"] = random.randint(0, 10)
        properties["isoCount"] = random.randint(0, 20)
        properties["totalVmdkCount"] = random.randint(properties["vmCount"], properties["vmCount"] * 5)
        properties["snapshotVmdkCount"] = random.randint(0, properties["totalVmdkCount"] // 10)
        
        # Critical VM information
        properties["criticalVmCount"] = random.randint(0, properties["vmCount"] // 4)
        properties["productionVmCount"] = random.randint(properties["criticalVmCount"], properties["vmCount"] // 2)
        
        # ------- Change Management -------
        properties["lastExpansionDate"] = self.random_past_date(180)
        properties["lastFilesystemCheckDate"] = self.random_past_date(90)
        properties["lastPerformanceIssueDate"] = self.random_past_date(120)
        
        # Change risk calculation
        base_risk = 40
        
        # Factors affecting risk
        if properties["freePercentage"] < 15:
            base_risk += 25
        elif properties["freePercentage"] < 30:
            base_risk += 15
        
        if not properties["accessible"] or properties["overallStatus"] == "red":
            base_risk += 40
        elif properties["overallStatus"] == "yellow":
            base_risk += 20
        
        if properties["criticalVmCount"] > 10 or properties["criticalVmCount"] > (properties["vmCount"] * 0.3):
            base_risk += 20
        
        if properties["averageReadLatencyMs"] > 20 or properties["averageWriteLatencyMs"] > 25:
            base_risk += 15
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-10, 10), 100)
        
        # Impact assessment based on risk
        if properties["changeRiskScore"] > 70:
            properties["changeImpactCategory"] = "High"
            properties["recommendedPrecautions"] = [
                "Migrate critical VMs prior to maintenance",
                "Ensure multiple backups available",
                "Validate storage connectivity pre-change",
                "Prepare rollback plan",
                "Schedule extended maintenance window",
                "Test change in a similar environment first"
            ]
        elif properties["changeRiskScore"] > 40:
            properties["changeImpactCategory"] = "Medium"
            properties["recommendedPrecautions"] = [
                "Verify recent backups",
                "Schedule during off-hours",
                "Migrate high-priority workloads if possible",
                "Prepare basic rollback plan"
            ]
        else:
            properties["changeImpactCategory"] = "Low"
            properties["recommendedPrecautions"] = [
                "Standard change process",
                "Verify storage availability",
                "Perform during regular maintenance window"
            ]
        
        # ------- Business Impact -------
        # Calculate criticality based on VMs and performance
        if properties["criticalVmCount"] > 10 or properties["productionVmCount"] > 50:
            properties["businessCriticalityScore"] = random.randint(80, 100)
            properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        elif properties["criticalVmCount"] > 5 or properties["productionVmCount"] > 20:
            properties["businessCriticalityScore"] = random.randint(60, 80)
            properties["slaLevel"] = random.choice(["Silver", "Gold"])
        else:
            properties["businessCriticalityScore"] = random.randint(30, 60)
            properties["slaLevel"] = random.choice(["Bronze", "Silver"])
        
        properties["estimatedUsersImpacted"] = properties["vmCount"] * random.randint(5, 20)
        properties["businessServicesImpacted"] = random.randint(1, 10)
        
        # Generate the Cypher code for the node
        cypher_code = f"CREATE (ds_{datastore_id}:Datastore {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "moRef", "url"
            ],
            "Datastore Type and Configuration": [
                "type", "filesystemVersion", "blockSizeKB", "maxFileSize", 
                "storageArrayType", "nfsVersion", "remoteHost", "remotePath", 
                "accessMode", "vsanClusterId", "vsanObjectCount", "defaultStoragePolicy",
                "storageArrayId", "storageContainerId", "protocatalId", "providerName",
                "localPathOnHost", "hostId", "multipleExtents"
            ],
            "Capacity and Allocation": [
                "capacityGB", "provisionedGB", "usedGB", "freeGB", 
                "freePercentage", "spaceStatus"
            ],
            "Performance and Status": [
                "overallStatus", "accessible", "accessibilityIssue", "maintenanceMode",
                "averageReadLatencyMs", "averageWriteLatencyMs", "maxReadLatencyMs", 
                "maxWriteLatencyMs", "iopsRead", "iopsWrite", "throughputReadMBps", 
                "throughputWriteMBps"
            ],
            "Multipathing and Connectivity": [
                "multipathingPolicy", "pathCount", "activePathCount", 
                "deadPathCount", "standbyPathCount"
            ],
            "VM Content": [
                "vmCount", "templateCount", "isoCount", "totalVmdkCount", 
                "snapshotVmdkCount", "criticalVmCount", "productionVmCount"
            ],
            "Change Management": [
                "lastExpansionDate", "lastFilesystemCheckDate", "lastPerformanceIssueDate",
                "changeRiskScore", "changeImpactCategory", "recommendedPrecautions"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "estimatedUsersImpacted",
                "businessServicesImpacted"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_nsx_manager(self, nsx_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for an NSX Manager node with impact assessment parameters.
        
        Args:
            nsx_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for an NSX Manager node
        """
        if nsx_id is None:
            nsx_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"nsxmgr-{nsx_id}"
        properties["name"] = f"nsxmgr-{nsx_id}.nsx.local"
        properties["uuid"] = str(uuid.uuid4())
        properties["fqdn"] = properties["name"]
        properties["managementIP"] = str(ipaddress.IPv4Address("192.168.20.0") + (nsx_id % 253))
        
        # ------- NSX Version and Edition -------
        # NSX-T is more modern than NSX-V
        nsx_types = ["NSX-T", "NSX-V"]
        nsx_type_weights = [0.9, 0.1]
        properties["nsxType"] = random.choices(nsx_types, weights=nsx_type_weights)[0]
        
        if properties["nsxType"] == "NSX-T":
            # NSX-T versions
            version_options = ["3.0.0", "3.1.0", "3.1.3", "3.2.0", "3.2.1", "4.0.0", "4.0.1", "4.1.0"]
            properties["version"] = random.choice(version_options)
            properties["buildNumber"] = str(random.randint(10000000, 99999999))
            
            # NSX-T editions
            edition_options = ["Standard", "Professional", "Advanced", "Enterprise Plus"]
            edition_weights = [0.1, 0.2, 0.3, 0.4]  # Enterprise Plus is most common
            properties["edition"] = random.choices(edition_options, weights=edition_weights)[0]
        else:
            # NSX-V versions
            version_options = ["6.4.4", "6.4.5", "6.4.6", "6.4.10"]
            properties["version"] = random.choice(version_options)
            properties["buildNumber"] = str(random.randint(10000000, 99999999))
            
            # NSX-V editions
            edition_options = ["Standard", "Advanced", "Enterprise"]
            edition_weights = [0.2, 0.3, 0.5]
            properties["edition"] = random.choices(edition_options, weights=edition_weights)[0]
        
        # Target version for upgrades
        current_version = version_options.index(properties["version"])
        if current_version < len(version_options) - 1:
            properties["targetVersion"] = version_options[current_version + 1]
            properties["targetBuildNumber"] = str(random.randint(10000000, 99999999))
            properties["versionGap"] = "Minor"  # Simplification
        else:
            properties["targetVersion"] = properties["version"]
            properties["targetBuildNumber"] = properties["buildNumber"]
            properties["versionGap"] = "None"
        
        # ------- Deployment Type -------
        if properties["nsxType"] == "NSX-T":
            deployment_types = ["Standalone", "Active-Standby Cluster", "Active-Active Cluster"]
            deployment_weights = [0.3, 0.5, 0.2]
            properties["deploymentType"] = random.choices(deployment_types, weights=deployment_weights)[0]
            
            # Manager count based on deployment type
            if properties["deploymentType"] == "Standalone":
                properties["nsxManagerCount"] = 1
            elif properties["deploymentType"] == "Active-Standby Cluster":
                properties["nsxManagerCount"] = random.choice([2, 3])
            else:
                properties["nsxManagerCount"] = 3
        else:
            deployment_types = ["Standalone", "NSX Manager Cluster"]
            deployment_weights = [0.4, 0.6]
            properties["deploymentType"] = random.choices(deployment_types, weights=deployment_weights)[0]
            
            if properties["deploymentType"] == "Standalone":
                properties["nsxManagerCount"] = 1
            else:
                properties["nsxManagerCount"] = 3
        
        # ------- Resource Allocation -------
        if properties["nsxType"] == "NSX-T":
            # NSX-T Manager sizing
            size_options = ["Small", "Medium", "Large", "Extra Large"]
            properties["applianceSize"] = random.choice(size_options)
            
            if properties["applianceSize"] == "Small":
                properties["vcpus"] = 4
                properties["memoryGB"] = 16
                properties["diskGB"] = 200
            elif properties["applianceSize"] == "Medium":
                properties["vcpus"] = 6
                properties["memoryGB"] = 24
                properties["diskGB"] = 300
            elif properties["applianceSize"] == "Large":
                properties["vcpus"] = 12
                properties["memoryGB"] = 48
                properties["diskGB"] = 400
            else:  # Extra Large
                properties["vcpus"] = 16
                properties["memoryGB"] = 64
                properties["diskGB"] = 500
        else:
            # NSX-V has different sizing
            properties["applianceSize"] = random.choice(["Small", "Medium", "Large"])
            
            if properties["applianceSize"] == "Small":
                properties["vcpus"] = 4
                properties["memoryGB"] = 16
                properties["diskGB"] = 120
            elif properties["applianceSize"] == "Medium":
                properties["vcpus"] = 8
                properties["memoryGB"] = 24
                properties["diskGB"] = 240
            else:  # Large
                properties["vcpus"] = 16
                properties["memoryGB"] = 32
                properties["diskGB"] = 360
        
        # ------- Network Infrastructure Scale -------
        if properties["nsxType"] == "NSX-T":
            # NSX-T can scale larger than NSX-V
            properties["transportNodeCount"] = random.randint(4, 200)
            properties["edgeNodeCount"] = random.randint(2, 32)
            properties["logicalSwitchCount"] = random.randint(10, 1000)
            properties["logicalRouterCount"] = random.randint(5, 200)
            properties["segmentCount"] = random.randint(10, 2000)
            properties["firewallRuleCount"] = random.randint(50, 10000)
            properties["natRuleCount"] = random.randint(10, 2000)
            properties["ipSetsCount"] = random.randint(20, 500)
            properties["securityGroupCount"] = random.randint(10, 500)
            properties["serviceCount"] = random.randint(50, 500)
            properties["dhcpServerCount"] = random.randint(1, 20)
            properties["lbCount"] = random.randint(0, 50)
            properties["vpnCount"] = random.randint(0, 20)
        else:
            # NSX-V scale
            properties["transportNodeCount"] = random.randint(4, 100)
            properties["edgeNodeCount"] = random.randint(2, 8)
            properties["logicalSwitchCount"] = random.randint(10, 500)
            properties["logicalRouterCount"] = random.randint(5, 100)
            properties["firewallRuleCount"] = random.randint(50, 5000)
            properties["natRuleCount"] = random.randint(10, 500)
            properties["ipSetsCount"] = random.randint(10, 200)
            properties["securityGroupCount"] = random.randint(10, 200)
            properties["serviceCount"] = random.randint(20, 200)
            properties["dhcpServerCount"] = random.randint(1, 10)
            properties["lbCount"] = random.randint(0, 20)
            properties["vpnCount"] = random.randint(0, 10)
        
        # Scale utilization percentage - How close to capacity limits
        properties["scaleUtilizationPercentage"] = random.randint(30, 90)
        
        # ------- Performance and Status -------
        health_states = ["green", "yellow", "red"]
        health_weights = [0.8, 0.15, 0.05]
        properties["overallStatus"] = random.choices(health_states, weights=health_weights)[0]
        
        # Component health
        components = ["controllerCluster", "managementPlane", "dataPlane", "edge", "firewall"]
        for component in components:
            properties[f"{component}Status"] = random.choices(health_states, weights=health_weights)[0]
        
        properties["cpuUsagePercentage"] = random.randint(5, 80)
        properties["memoryUsagePercentage"] = random.randint(40, 90)
        properties["diskUsagePercentage"] = random.randint(30, 85)
        properties["databaseUsagePercentage"] = random.randint(20, 90)
        
        # Service status
        properties["serviceUptime"] = random.randint(1, 500)  # days
        
        # ------- Connectivity and Integration -------
        properties["vcenterConnected"] = random.choice([True, True, False])  # Usually connected
        properties["controlClusterConnected"] = random.choice([True, True, False])
        properties["syslogServerConfigured"] = random.choice([True, False])
        properties["backupConfigured"] = random.choice([True, False])
        
        # Authentication configuration
        auth_providers = ["Local", "LDAP", "Active Directory", "VMware Identity Manager"]
        properties["authenticationProvider"] = random.choice(auth_providers)
        
        # ------- License and Support -------
        expiration_year = random.randint(datetime.date.today().year, datetime.date.today().year + 3)
        properties["licenseExpirationDate"] = f"{expiration_year}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
        
        support_levels = ["Basic", "Production", "Business Critical", "Mission Critical"]
        properties["supportLevel"] = random.choice(support_levels)
        properties["supportExpirationDate"] = properties["licenseExpirationDate"]
        
        # ------- Change Management -------
        properties["lastPatchDate"] = self.random_past_date(180)
        properties["lastBackupDate"] = self.random_past_date(7)
        properties["lastConfigChangeDate"] = self.random_past_date(30)
        
        # Change risk calculation
        base_risk = 60  # NSX changes are high risk
        
        # Factors affecting risk
        if properties["nsxType"] == "NSX-V":
            base_risk += 20  # Legacy product
        
        if properties["versionGap"] != "None":
            base_risk += 15
        
        if properties["scaleUtilizationPercentage"] > 80:
            base_risk += 20
        elif properties["scaleUtilizationPercentage"] > 60:
            base_risk += 10
        
        if any(properties[f"{component}Status"] == "red" for component in components):
            base_risk += 25
        elif any(properties[f"{component}Status"] == "yellow" for component in components):
            base_risk += 15
        
        if not properties["backupConfigured"]:
            base_risk += 20
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-10, 10), 100)
        
        # Recommended precautions based on risk
        if properties["changeRiskScore"] > 70:
            properties["changeImpactCategory"] = "High"
            properties["recommendedPrecautions"] = [
                "Schedule extended maintenance window",
                "Perform full backup before change",
                "Notify all application teams",
                "Have vendor support on standby",
                "Test in development environment first",
                "Prepare detailed rollback plan"
            ]
        elif properties["changeRiskScore"] > 50:
            properties["changeImpactCategory"] = "Medium"
            properties["recommendedPrecautions"] = [
                "Schedule during off-hours",
                "Perform backup before change",
                "Notify key stakeholders",
                "Have basic rollback plan",
                "Monitor closely during change"
            ]
        else:
            properties["changeImpactCategory"] = "Low"
            properties["recommendedPrecautions"] = [
                "Standard change process",
                "Verify backup is recent",
                "Monitor during change"
            ]
        
        # ------- Business Impact -------
        # NSX is network infrastructure, so usually high impact
        properties["businessCriticalityScore"] = random.randint(70, 100)
        properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        
        # Impact metrics
        properties["estimatedVmsImpacted"] = random.randint(properties["logicalSwitchCount"] * 5, properties["logicalSwitchCount"] * 20)
        properties["estimatedUsersImpacted"] = properties["estimatedVmsImpacted"] * random.randint(5, 20)
        properties["estimatedApplicationsImpacted"] = random.randint(5, 50)
        
        # ------- Compliance and Security -------
        compliance_options = ["compliant", "nonCompliant", "unknown"]
        compliance_weights = [0.8, 0.15, 0.05]
        properties["complianceStatus"] = random.choices(compliance_options, weights=compliance_weights)[0]
        
        security_options = ["secure", "warning", "risk"]
        security_weights = [0.7, 0.2, 0.1]
        properties["securityStatus"] = random.choices(security_options, weights=security_weights)[0]
        
        # Vulnerability counts
        properties["vulnerabilityCount"] = random.randint(0, 15)
        properties["criticalVulnerabilityCount"] = random.randint(0, min(5, properties["vulnerabilityCount"]))
        properties["lastSecurityScanDate"] = self.random_past_date(30)
        
        # Generate the Cypher code for the node
        cypher_code = f"CREATE (nsxm_{nsx_id}:NSXManager {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "uuid", "fqdn", "managementIP"
            ],
            "NSX Version and Edition": [
                "nsxType", "version", "buildNumber", "edition", 
                "targetVersion", "targetBuildNumber", "versionGap"
            ],
            "Deployment Type": [
                "deploymentType", "nsxManagerCount", "applianceSize"
            ],
            "Resource Allocation": [
                "vcpus", "memoryGB", "diskGB"
            ],
            "Network Infrastructure Scale": [
                "transportNodeCount", "edgeNodeCount", "logicalSwitchCount", 
                "logicalRouterCount", "segmentCount", "firewallRuleCount", 
                "natRuleCount", "ipSetsCount", "securityGroupCount", 
                "serviceCount", "dhcpServerCount", "lbCount", "vpnCount",
                "scaleUtilizationPercentage"
            ],
            "Performance and Status": [
                "overallStatus", "controllerClusterStatus", "managementPlaneStatus", 
                "dataPlaneStatus", "edgeStatus", "firewallStatus", 
                "cpuUsagePercentage", "memoryUsagePercentage", "diskUsagePercentage", 
                "databaseUsagePercentage", "serviceUptime"
            ],
            "Connectivity and Integration": [
                "vcenterConnected", "controlClusterConnected", 
                "syslogServerConfigured", "backupConfigured", "authenticationProvider"
            ],
            "License and Support": [
                "licenseExpirationDate", "supportLevel", "supportExpirationDate"
            ],
            "Change Management": [
                "lastPatchDate", "lastBackupDate", "lastConfigChangeDate", 
                "changeRiskScore", "changeImpactCategory", "recommendedPrecautions"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "estimatedVmsImpacted", 
                "estimatedUsersImpacted", "estimatedApplicationsImpacted"
            ],
            "Compliance and Security": [
                "complianceStatus", "securityStatus", "vulnerabilityCount", 
                "criticalVulnerabilityCount", "lastSecurityScanDate"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_virtual_network(self, vnet_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for a Virtual Network node with impact assessment parameters.
        
        Args:
            vnet_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for a Virtual Network node
        """
        if vnet_id is None:
            vnet_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"vnet-{vnet_id}"
        net_names = [
            f"VLAN{random.randint(1, 4094)}", 
            f"VM-Network-{vnet_id:02d}",
            f"Prod-Net-{vnet_id:02d}", 
            f"Dev-Net-{vnet_id:02d}",
            f"Management", 
            f"vMotion", 
            f"Storage", 
            f"DMZ-{vnet_id:02d}",
            f"Frontend-{vnet_id:02d}", 
            f"Backend-{vnet_id:02d}", 
            f"Web-Tier-{vnet_id:02d}",
            f"App-Tier-{vnet_id:02d}", 
            f"DB-Tier-{vnet_id:02d}", 
            f"Test-{vnet_id:02d}",
            f"QA-{vnet_id:02d}", 
            f"Staging-{vnet_id:02d}"
        ]
        properties["name"] = random.choice(net_names)
        properties["moRef"] = f"network-{random.randint(1, 9999)}"
        
        # ------- Network Type and Configuration -------
        # Determine type based on name heuristics
        if "Management" in properties["name"] or "vMotion" in properties["name"] or "Storage" in properties["name"]:
            net_types = ["Standard vSwitch Port Group", "Distributed Port Group"]
            type_weights = [0.3, 0.7]
        else:
            net_types = ["Standard vSwitch Port Group", "Distributed Port Group", "NSX Logical Switch", "NSX Segment"]
            type_weights = [0.2, 0.3, 0.2, 0.3]
        
        properties["type"] = random.choices(net_types, weights=type_weights)[0]
        
        # VLAN configuration
        if properties["type"] in ["Standard vSwitch Port Group", "Distributed Port Group"]:
            # Traditional networks usually have VLAN tags
            vlan_types = ["VLAN", "VLAN Trunking", "Private VLAN"]
            vlan_weights = [0.8, 0.15, 0.05]
            properties["vlanType"] = random.choices(vlan_types, weights=vlan_weights)[0]
            
            if properties["vlanType"] == "VLAN":
                properties["vlanId"] = random.randint(1, 4094)
            elif properties["vlanType"] == "VLAN Trunking":
                start_vlan = random.randint(1, 3000)
                end_vlan = random.randint(start_vlan + 1, min(start_vlan + 100, 4094))
                properties["vlanRange"] = f"{start_vlan}-{end_vlan}"
            elif properties["vlanType"] == "Private VLAN":
                properties["primaryVlanId"] = random.randint(1, 4000)
                properties["secondaryVlanId"] = random.randint(1, 1000)
                properties["pvlanType"] = random.choice(["Promiscuous", "Isolated", "Community"])
        else:
            # NSX networks might have VLAN backing or overlay
            transport_types = ["VLAN", "Overlay"]
            transport_weights = [0.3, 0.7]
            properties["transportType"] = random.choices(transport_types, weights=transport_weights)[0]
            
            if properties["transportType"] == "VLAN":
                properties["vlanId"] = random.randint(1, 4094)
            else:
                properties["vni"] = random.randint(5000, 16777215)  # VNI range
                properties["replicationMode"] = random.choice(["Hierarchical", "Hybrid", "Unicast"])
        
        # Switch association
        if properties["type"] == "Standard vSwitch Port Group":
            properties["switchName"] = f"vSwitch{random.randint(0, 9)}"
            properties["hostCount"] = random.randint(1, 32)
        elif properties["type"] == "Distributed Port Group":
            properties["switchName"] = random.choice([
                "dvSwitch-Production", "dvSwitch-Management", "dvSwitch-DMZ",
                f"dvs-{random.randint(1, 99)}"
            ])
            properties["dvSwitchUuid"] = str(uuid.uuid4())
            properties["portGroupKey"] = f"dvportgroup-{random.randint(1, 9999)}"
            properties["hostCount"] = random.randint(2, 64)
        elif properties["type"] == "NSX Logical Switch":
            properties["transportZone"] = random.choice([
                "TZ-Overlay", "TZ-VLAN", f"TZ-{random.randint(1, 99)}"
            ])
            properties["controlPlaneMode"] = random.choice(["Unicast", "Hybrid", "Multicast"])
            properties["hostCount"] = random.randint(2, 128)
        else:  # NSX Segment
            properties["transportZone"] = random.choice([
                "TZ-Overlay", "TZ-VLAN", f"TZ-{random.randint(1, 99)}"
            ])
            properties["segmentType"] = random.choice(["Regular", "Service", "Extended"])
            properties["hostCount"] = random.randint(2, 200)
        
        # ------- Network Configuration -------
        # MTU configuration
        if "vMotion" in properties["name"] or "Storage" in properties["name"] or "Overlay" in properties.get("transportType", ""):
            # Jumbo frames are common for these network types
            properties["mtu"] = random.choice([1500, 9000, 9000, 9000])  # More likely to have jumbo frames
        else:
            properties["mtu"] = random.choice([1500, 1500, 1500, 9000])  # Standard MTU more common
        
        # Security policy
        properties["allowPromiscuous"] = random.choice([True, False])
        properties["allowForgedTransmits"] = random.choice([True, False])
        properties["allowMacChanges"] = random.choice([True, False])
        
        # Traffic shaping
        properties["trafficShapingEnabled"] = random.choice([True, False])
        if properties["trafficShapingEnabled"]:
            properties["averageBandwidthMbps"] = random.randint(10, 10000)
            properties["peakBandwidthMbps"] = properties["averageBandwidthMbps"] + random.randint(0, 1000)
            properties["burstSizeKB"] = random.choice([1024, 2048, 5120, 10240])
        
        # Team policy
        teaming_policies = ["LoadBalanceSrcID", "LoadBalanceSrcMAC", "LoadBalanceIP", "ExplicitFailover"]
        properties["teamingPolicy"] = random.choice(teaming_policies)
        properties["activeUplinkCount"] = random.randint(1, 4)
        properties["standbyUplinkCount"] = random.randint(0, 2)
        properties["unusedUplinkCount"] = random.randint(0, 2)
        
        # ------- IP Assignment -------
        properties["ipAddressManagement"] = random.choice(["DHCP", "Static", "None"])
        
        if properties["ipAddressManagement"] != "None":
            subnet_octet1 = random.randint(10, 192)
            subnet_octet2 = random.randint(0, 255)
            subnet_octet3 = random.randint(0, 255)
            properties["subnet"] = f"{subnet_octet1}.{subnet_octet2}.{subnet_octet3}.0/24"
            
            if properties["ipAddressManagement"] == "DHCP":
                properties["dhcpServer"] = f"{subnet_octet1}.{subnet_octet2}.{subnet_octet3}.{random.randint(1, 10)}"
                properties["dhcpRangeStart"] = f"{subnet_octet1}.{subnet_octet2}.{subnet_octet3}.{random.randint(20, 50)}"
                properties["dhcpRangeEnd"] = f"{subnet_octet1}.{subnet_octet2}.{subnet_octet3}.{random.randint(200, 250)}"
            
            # Default gateway, DNS servers, etc.
            properties["defaultGateway"] = f"{subnet_octet1}.{subnet_octet2}.{subnet_octet3}.1"
            properties["dnsServer1"] = f"{random.randint(8, 192)}.{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(1, 10)}"
            properties["dnsServer2"] = f"{random.randint(8, 192)}.{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(1, 10)}"
        
        # ------- Usage and Scale -------
        properties["connectedVmCount"] = random.randint(1, 500)
        properties["connectedVnicCount"] = random.randint(properties["connectedVmCount"], properties["connectedVmCount"] * 2)
        
        properties["estimatedTrafficMbps"] = random.randint(1, 5000)
        properties["peakTrafficMbps"] = properties["estimatedTrafficMbps"] + random.randint(100, 2000)
        
        # Critical VM count depends on network purpose
        if ("Production" in properties["name"] or "Prod" in properties["name"] or 
            "Frontend" in properties["name"] or "Backend" in properties["name"] or 
            "DB" in properties["name"]):
            properties["criticalVmCount"] = random.randint(max(1, properties["connectedVmCount"] // 10), max(2, properties["connectedVmCount"] // 3))
        elif "Management" in properties["name"]:
            properties["criticalVmCount"] = random.randint(max(1, properties["connectedVmCount"] // 5), max(2, properties["connectedVmCount"] // 2))
        else:
            properties["criticalVmCount"] = random.randint(0, max(1, properties["connectedVmCount"] // 20))
        
        # ------- Performance and Status -------
        health_states = ["green", "yellow", "red"]
        health_weights = [0.85, 0.1, 0.05]
        properties["overallStatus"] = random.choices(health_states, weights=health_weights)[0]
        
        properties["uplinkUtilizationPercentage"] = random.randint(1, 80)
        properties["averagePacketLoss"] = round(random.uniform(0, 0.5), 3)  # Percentage
        properties["networkLatencyMs"] = round(random.uniform(0.1, 5), 2)
        
        # ------- Security and Isolation -------
        properties["isolationStatus"] = random.choice(["NotIsolated", "Isolated", "PartiallyIsolated"])
        properties["associatedFirewallRules"] = random.randint(0, 50)
        properties["microSegmentationEnabled"] = random.choice([True, False])
        
        # ------- Change Management -------
        properties["lastConfigChangeDate"] = self.random_past_date(90)
        properties["lastNetworkIssueDate"] = self.random_past_date(180)
        
        # Change risk calculation
        base_risk = 40
        
        # Factors affecting risk
        if properties["connectedVmCount"] > 100:
            base_risk += 20
        elif properties["connectedVmCount"] > 50:
            base_risk += 10
        
        if properties["criticalVmCount"] > 10:
            base_risk += 20
        elif properties["criticalVmCount"] > 5:
            base_risk += 10
        
        if properties["overallStatus"] == "red":
            base_risk += 25
        elif properties["overallStatus"] == "yellow":
            base_risk += 15
        
        if "Management" in properties["name"] or "vMotion" in properties["name"] or "Storage" in properties["name"]:
            base_risk += 20  # Infrastructure networks
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-10, 10), 100)
        
        # Recommended precautions based on risk
        if properties["changeRiskScore"] > 70:
            properties["changeImpactCategory"] = "High"
            properties["recommendedPrecautions"] = [
                "Schedule change during lowest traffic period",
                "Verify VM connectivity requirements",
                "Prepare rollback plan",
                "Test change in a non-production environment",
                "Notify all application teams",
                "Validate all uplinks and teaming settings"
            ]
        elif properties["changeRiskScore"] > 40:
            properties["changeImpactCategory"] = "Medium"
            properties["recommendedPrecautions"] = [
                "Schedule during off-hours",
                "Validate critical VM connectivity",
                "Have basic rollback plan",
                "Notify key stakeholders"
            ]
        else:
            properties["changeImpactCategory"] = "Low"
            properties["recommendedPrecautions"] = [
                "Standard change process",
                "Monitor network during change",
                "Verify VM connectivity after change"
            ]
        
        # ------- Business Impact -------
        # Impact assessment based on network purpose and connected VMs
        if properties["criticalVmCount"] > 10 or "Management" in properties["name"]:
            properties["businessCriticalityScore"] = random.randint(80, 100)
            properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        elif properties["criticalVmCount"] > 5 or "Production" in properties["name"] or "Prod" in properties["name"]:
            properties["businessCriticalityScore"] = random.randint(60, 80)
            properties["slaLevel"] = random.choice(["Silver", "Gold"])
        else:
            properties["businessCriticalityScore"] = random.randint(30, 60)
            properties["slaLevel"] = random.choice(["Bronze", "Silver"])
        
        # Impact metrics
        properties["estimatedUsersImpacted"] = properties["connectedVmCount"] * random.randint(5, 20)
        properties["businessServicesImpacted"] = random.randint(1, max(5, properties["criticalVmCount"]))
        
        # ------- Compliance and Audit -------
        properties["lastComplianceCheckDate"] = self.random_past_date(30)
        
        compliance_options = ["compliant", "nonCompliant", "partiallyCompliant", "unknown"]
        compliance_weights = [0.7, 0.1, 0.15, 0.05]
        properties["complianceStatus"] = random.choices(compliance_options, weights=compliance_weights)[0]
        
        properties["securityZone"] = random.choice([
            "Internal", "DMZ", "External", "PCI", "Production", "Development", 
            "Management", "Test", "Quarantine", "None"
        ])
        
        # Generate the Cypher code for the node
        cypher_code = f"CREATE (vnet_{vnet_id}:VirtualNetwork {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "moRef"
            ],
            "Network Type and Configuration": [
                "type", "vlanType", "vlanId", "vlanRange", "primaryVlanId", 
                "secondaryVlanId", "pvlanType", "transportType", "vni", 
                "replicationMode", "switchName", "dvSwitchUuid", "portGroupKey",
                "hostCount", "transportZone", "controlPlaneMode", "segmentType"
            ],
            "Network Configuration": [
                "mtu", "allowPromiscuous", "allowForgedTransmits", "allowMacChanges",
                "trafficShapingEnabled", "averageBandwidthMbps", "peakBandwidthMbps",
                "burstSizeKB", "teamingPolicy", "activeUplinkCount", 
                "standbyUplinkCount", "unusedUplinkCount"
            ],
            "IP Assignment": [
                "ipAddressManagement", "subnet", "dhcpServer", "dhcpRangeStart",
                "dhcpRangeEnd", "defaultGateway", "dnsServer1", "dnsServer2"
            ],
            "Usage and Scale": [
                "connectedVmCount", "connectedVnicCount", "estimatedTrafficMbps",
                "peakTrafficMbps", "criticalVmCount"
            ],
            "Performance and Status": [
                "overallStatus", "uplinkUtilizationPercentage", "averagePacketLoss",
                "networkLatencyMs"
            ],
            "Security and Isolation": [
                "isolationStatus", "associatedFirewallRules", "microSegmentationEnabled"
            ],
            "Change Management": [
                "lastConfigChangeDate", "lastNetworkIssueDate", "changeRiskScore",
                "changeImpactCategory", "recommendedPrecautions"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "estimatedUsersImpacted",
                "businessServicesImpacted"
            ],
            "Compliance and Audit": [
                "lastComplianceCheckDate", "complianceStatus", "securityZone"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_nsx_edge(self, edge_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for an NSX Edge node with impact assessment parameters.
        
        Args:
            edge_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for an NSX Edge node
        """
        if edge_id is None:
            edge_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"edge-{edge_id}"
        properties["name"] = f"edge-{edge_id:04d}"
        properties["uuid"] = str(uuid.uuid4())
        
        # ------- Edge Type and Version -------
        edge_types = ["NSX-T Edge", "NSX-V Edge"]
        edge_type_weights = [0.8, 0.2]  # NSX-T more common now
        properties["edgeType"] = random.choices(edge_types, weights=edge_type_weights)[0]
        
        if properties["edgeType"] == "NSX-T Edge":
            # NSX-T Edge node types
            node_types = ["Edge Node", "Edge Cluster"]
            node_weights = [0.7, 0.3]
            properties["nodeType"] = random.choices(node_types, weights=node_weights)[0]
            
            # NSX-T versions
            version_options = ["3.0.0", "3.1.0", "3.1.3", "3.2.0", "3.2.1", "4.0.0", "4.0.1"]
            properties["version"] = random.choice(version_options)
            
            if properties["nodeType"] == "Edge Cluster":
                properties["clusterSize"] = random.randint(2, 8)
                properties["haEnabled"] = True
                properties["activeNodeCount"] = properties["clusterSize"]
            else:
                form_factors = ["VM", "Bare Metal"]
                form_weights = [0.8, 0.2]
                properties["formFactor"] = random.choices(form_factors, weights=form_weights)[0]
        else:
            # NSX-V Edge types
            v_edge_types = ["Compact", "Large", "Quad Large", "X-Large"]
            v_edge_weights = [0.1, 0.4, 0.3, 0.2]
            properties["nodeType"] = random.choices(v_edge_types, weights=v_edge_weights)[0]
            
            # NSX-V versions
            version_options = ["6.4.4", "6.4.5", "6.4.6", "6.4.10"]
            properties["version"] = random.choice(version_options)
            
            # Common for NSX-V Edges
            ha_options = ["Active-Standby", "Active-Active", "None"]
            ha_weights = [0.6, 0.2, 0.2]
            properties["haMode"] = random.choices(ha_options, weights=ha_weights)[0]
            
            if properties["haMode"] != "None":
                properties["haEnabled"] = True
                properties["haStatus"] = random.choice(["Healthy", "Degraded", "Disconnected"])
                properties["activeNodeCount"] = 1 if properties["haMode"] == "Active-Standby" else 2
            else:
                properties["haEnabled"] = False
                properties["activeNodeCount"] = 1
        
        # ------- Resource Allocation -------
        if properties["edgeType"] == "NSX-T Edge":
            if properties["nodeType"] == "Edge Cluster":
                # Represent total cluster resources
                properties["totalVcpus"] = properties["clusterSize"] * random.choice([8, 16, 32])
                properties["totalMemoryGB"] = properties["clusterSize"] * random.choice([32, 64, 128])
                properties["totalDiskGB"] = properties["clusterSize"] * random.choice([200, 400, 800])
            else:
                if properties["formFactor"] == "VM":
                    # VM Edge Node 
                    properties["vcpus"] = random.choice([8, 16, 32])
                    properties["memoryGB"] = random.choice([32, 64, 128])
                    properties["diskGB"] = random.choice([200, 400, 800])
                else:
                    # Bare Metal Edge Node
                    properties["cpuSockets"] = random.choice([1, 2])
                    properties["cpuCores"] = random.choice([8, 16, 24, 32])
                    properties["memoryGB"] = random.choice([64, 128, 256])
                    properties["diskGB"] = random.choice([500, 1000, 2000])
        else:
            # NSX-V Edge resource allocation based on type
            if properties["nodeType"] == "Compact":
                properties["vcpus"] = 1
                properties["memoryGB"] = 1
                properties["diskGB"] = 10
            elif properties["nodeType"] == "Large":
                properties["vcpus"] = 2
                properties["memoryGB"] = 4
                properties["diskGB"] = 20
            elif properties["nodeType"] == "Quad Large":
                properties["vcpus"] = 4
                properties["memoryGB"] = 8
                properties["diskGB"] = 40
            else:  # X-Large
                properties["vcpus"] = 6
                properties["memoryGB"] = 12
                properties["diskGB"] = 60
        
        # ------- Network Configuration -------
        properties["managementIP"] = str(ipaddress.IPv4Address("192.168.20.0") + (edge_id % 253))
        
        # Interfaces
        properties["interfaceCount"] = random.randint(2, 8)
        interface_types = ["EXTERNAL", "INTERNAL", "UPLINK", "TRUNK"]
        properties["interfaceTypes"] = random.choices(interface_types, k=min(properties["interfaceCount"], len(interface_types)))
        
        # BGP configuration
        properties["bgpEnabled"] = random.choice([True, False])
        if properties["bgpEnabled"]:
            properties["localASN"] = random.randint(64512, 65534)  # Private AS range
            properties["bgpPeerCount"] = random.randint(1, 4)
            properties["routesAdvertised"] = random.randint(10, 1000)
            properties["routesLearned"] = random.randint(10, 1000)
        
        # ------- Services Enabled -------
        # Service enablement
        services = [
            "Routing", "LoadBalancer", "Firewall", "NAT", "VPN", "DHCP", "DNS",
            "L2VPN", "IPSec", "SSL-VPN", "StatefulFirewall", "DFW"
        ]
        
        # Generate random set of enabled services (at least routing will be enabled)
        num_services = random.randint(1, len(services))
        enabled_services = ["Routing"]  # Always have routing
        if num_services > 1:
            other_services = random.sample(services[1:], num_services - 1)
            enabled_services.extend(other_services)
        
        properties["enabledServices"] = enabled_services
        
        # Service configurations based on what's enabled
        if "LoadBalancer" in enabled_services:
            properties["lbPoolCount"] = random.randint(1, 20)
            properties["lbVirtualServerCount"] = random.randint(1, 20)
            properties["lbThroughputMbps"] = random.randint(100, 10000)
            properties["lbConnectionsPerSecond"] = random.randint(1000, 100000)
            properties["lbConcurrentConnections"] = random.randint(10000, 1000000)
            properties["lbAlgorithm"] = random.choice(["ROUND_ROBIN", "LEAST_CONNECTION", "IP_HASH", "URI"])
        
        if "Firewall" in enabled_services or "StatefulFirewall" in enabled_services:
            properties["firewallRuleCount"] = random.randint(10, 1000)
            properties["firewallThroughputMbps"] = random.randint(500, 20000)
            properties["firewallConnectionsPerSecond"] = random.randint(5000, 200000)
            properties["firewallConcurrentConnections"] = random.randint(50000, 2000000)
        
        if "NAT" in enabled_services:
            properties["natRuleCount"] = random.randint(5, 500)
        
        if "VPN" in enabled_services or "IPSec" in enabled_services or "SSL-VPN" in enabled_services:
            properties["vpnTunnelCount"] = random.randint(1, 50)
            properties["vpnThroughputMbps"] = random.randint(50, 5000)
            properties["vpnConnectionCount"] = random.randint(1, 1000)
        
        if "DHCP" in enabled_services:
            properties["dhcpPoolCount"] = random.randint(1, 10)
            properties["dhcpLeaseCount"] = random.randint(10, 5000)
        
        # ------- Performance and Status -------
        health_states = ["green", "yellow", "red"]
        health_weights = [0.8, 0.15, 0.05]
        properties["overallStatus"] = random.choices(health_states, weights=health_weights)[0]
        
        properties["cpuUsagePercentage"] = random.randint(5, 80)
        properties["memoryUsagePercentage"] = random.randint(20, 90)
        properties["diskUsagePercentage"] = random.randint(10, 70)
        
        properties["packetLossPercentage"] = round(random.uniform(0, 1.0), 3)
        properties["throughputMbps"] = random.randint(100, 10000)
        properties["maxThroughputMbps"] = properties["throughputMbps"] + random.randint(1000, 10000)
        
        properties["connectionCount"] = random.randint(1000, 1000000)
        properties["connectionsPerSecond"] = random.randint(100, 50000)
        
        # ------- Edge Gateway Information -------
        if "Routing" in enabled_services:
            properties["defaultGateway"] = f"192.168.{random.randint(1, 254)}.1"
            
            routing_protocols = []
            if properties["bgpEnabled"]:
                routing_protocols.append("BGP")
            
            other_protocols = ["OSPF", "IS-IS", "Static"]
            routing_protocols.extend(random.sample(other_protocols, random.randint(0, len(other_protocols))))
            properties["routingProtocols"] = routing_protocols
            
            properties["staticRouteCount"] = random.randint(0, 100)
            properties["dynamicRouteCount"] = random.randint(0, 1000)
        
        # ------- Change Management -------
        properties["lastConfigChangeDate"] = self.random_past_date(90)
        properties["lastFailoverDate"] = self.random_past_date(180) if properties.get("haEnabled", False) else None
        properties["lastPatchDate"] = self.random_past_date(180)
        
        # Change risk calculation
        base_risk = 60  # Edge changes are high risk
        
        # Factors affecting risk
        if "LoadBalancer" in enabled_services and properties.get("lbVirtualServerCount", 0) > 10:
            base_risk += 15
        
        if "Firewall" in enabled_services and properties.get("firewallRuleCount", 0) > 500:
            base_risk += 15
        
        if properties.get("bgpEnabled", False) and properties.get("bgpPeerCount", 0) > 2:
            base_risk += 20
        
        if properties.get("throughputMbps", 0) > 5000:
            base_risk += 10
        
        if properties["overallStatus"] == "red":
            base_risk += 25
        elif properties["overallStatus"] == "yellow":
            base_risk += 15
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-10, 10), 100)
        
        # Recommended precautions based on risk
        if properties["changeRiskScore"] > 70:
            properties["changeImpactCategory"] = "High"
            properties["recommendedPrecautions"] = [
                "Schedule during lowest traffic period",
                "Create full configuration backup",
                "Notify all application teams",
                "Have vendor support on standby",
                "Test in development environment first",
                "Perform impact analysis on all services",
                "Prepare detailed rollback plan"
            ]
        elif properties["changeRiskScore"] > 50:
            properties["changeImpactCategory"] = "Medium"
            properties["recommendedPrecautions"] = [
                "Schedule during off-hours",
                "Backup configuration before change",
                "Notify key stakeholders",
                "Have basic rollback plan",
                "Validate key services after change"
            ]
        else:
            properties["changeImpactCategory"] = "Low"
            properties["recommendedPrecautions"] = [
                "Standard change process",
                "Verify configuration backup is recent",
                "Monitor during change",
                "Test connectivity after change"
            ]
        
        # ------- Business Impact -------
        # Edge devices are typically critical infrastructure
        properties["businessCriticalityScore"] = random.randint(70, 100)
        properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        
        # Impact metrics based on services
        affected_vms_factor = 0
        
        if "LoadBalancer" in enabled_services:
            affected_vms_factor += properties.get("lbVirtualServerCount", 0) * 10
        
        if "Routing" in enabled_services:
            affected_vms_factor += 50
        
        if "VPN" in enabled_services or "IPSec" in enabled_services:
            affected_vms_factor += properties.get("vpnTunnelCount", 0) * 5
        
        if "NAT" in enabled_services:
            affected_vms_factor += properties.get("natRuleCount", 0) * 2
        
        # Ensure some minimum impact
        affected_vms_factor = max(affected_vms_factor, 20)
        
        properties["estimatedVmsImpacted"] = random.randint(affected_vms_factor // 2, affected_vms_factor * 2)
        properties["estimatedUsersImpacted"] = properties["estimatedVmsImpacted"] * random.randint(5, 20)
        properties["estimatedApplicationsImpacted"] = random.randint(1, max(5, properties["estimatedVmsImpacted"] // 10))
        
        # ------- Security and Compliance -------
        compliance_options = ["compliant", "nonCompliant", "unknown"]
        compliance_weights = [0.8, 0.15, 0.05]
        properties["complianceStatus"] = random.choices(compliance_options, weights=compliance_weights)[0]
        
        security_options = ["secure", "warning", "risk"]
        security_weights = [0.7, 0.2, 0.1]
        properties["securityStatus"] = random.choices(security_options, weights=security_weights)[0]
        
        # Vulnerability counts
        properties["vulnerabilityCount"] = random.randint(0, 10)
        properties["criticalVulnerabilityCount"] = random.randint(0, min(3, properties["vulnerabilityCount"]))
        properties["lastSecurityScanDate"] = self.random_past_date(30)
        
        # Generate the Cypher code for the node
        cypher_code = f"CREATE (edge_{edge_id}:NSXEdge {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "uuid"
            ],
            "Edge Type and Version": [
                "edgeType", "nodeType", "version", "clusterSize", "haEnabled", 
                "activeNodeCount", "formFactor", "haMode", "haStatus"
            ],
            "Resource Allocation": [
                "vcpus", "memoryGB", "diskGB", "totalVcpus", "totalMemoryGB", 
                "totalDiskGB", "cpuSockets", "cpuCores"
            ],
            "Network Configuration": [
                "managementIP", "interfaceCount", "interfaceTypes", "bgpEnabled", 
                "localASN", "bgpPeerCount", "routesAdvertised", "routesLearned"
            ],
            "Services Enabled": [
                "enabledServices", "lbPoolCount", "lbVirtualServerCount", "lbThroughputMbps", 
                "lbConnectionsPerSecond", "lbConcurrentConnections", "lbAlgorithm", 
                "firewallRuleCount", "firewallThroughputMbps", "firewallConnectionsPerSecond", 
                "firewallConcurrentConnections", "natRuleCount", "vpnTunnelCount", 
                "vpnThroughputMbps", "vpnConnectionCount", "dhcpPoolCount", "dhcpLeaseCount"
            ],
            "Performance and Status": [
                "overallStatus", "cpuUsagePercentage", "memoryUsagePercentage", 
                "diskUsagePercentage", "packetLossPercentage", "throughputMbps", 
                "maxThroughputMbps", "connectionCount", "connectionsPerSecond"
            ],
            "Edge Gateway Information": [
                "defaultGateway", "routingProtocols", "staticRouteCount", "dynamicRouteCount"
            ],
            "Change Management": [
                "lastConfigChangeDate", "lastFailoverDate", "lastPatchDate",
                "changeRiskScore", "changeImpactCategory", "recommendedPrecautions"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "estimatedVmsImpacted",
                "estimatedUsersImpacted", "estimatedApplicationsImpacted"
            ],
            "Security and Compliance": [
                "complianceStatus", "securityStatus", "vulnerabilityCount",
                "criticalVulnerabilityCount", "lastSecurityScanDate"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_nsx_switch(self, switch_id: Optional[int] = None) -> str:
        """
        Generate a Neo4j Cypher script for an NSX Switch node with impact assessment parameters.
        
        Args:
            switch_id: Optional specific ID to use
            
        Returns:
            str: Neo4j Cypher CREATE statement for an NSX Switch node
        """
        if switch_id is None:
            switch_id = random.randint(1001, 9999)
        
        properties = {}
        
        # ------- Basic Identification -------
        properties["id"] = f"nsxswitch-{switch_id}"
        properties["name"] = f"nsxswitch-{switch_id:04d}"
        properties["uuid"] = str(uuid.uuid4())
        
        # ------- Switch Type and Version -------
        switch_types = ["NSX-T Logical Switch", "NSX-T Segment", "NSX-V Logical Switch"]
        switch_type_weights = [0.3, 0.6, 0.1]  # NSX-T Segment is more modern
        properties["switchType"] = random.choices(switch_types, weights=switch_type_weights)[0]
        
        if "NSX-T" in properties["switchType"]:
            # NSX-T versions
            version_options = ["3.0.0", "3.1.0", "3.1.3", "3.2.0", "3.2.1", "4.0.0", "4.0.1"]
            properties["version"] = random.choice(version_options)
        else:
            # NSX-V versions
            version_options = ["6.4.4", "6.4.5", "6.4.6", "6.4.10"]
            properties["version"] = random.choice(version_options)
        
        # ------- Network Configuration -------
        # Admin state and operational state
        properties["adminState"] = random.choices(["UP", "DOWN"], weights=[0.95, 0.05])[0]
        
        if properties["adminState"] == "UP":
            properties["operationalState"] = random.choices(["UP", "DOWN", "DEGRADED"], weights=[0.9, 0.05, 0.05])[0]
        else:
            properties["operationalState"] = "DOWN"
        
        # Transport zone and replication
        if "NSX-T" in properties["switchType"]:
            tz_types = ["OVERLAY", "VLAN"]
            tz_weights = [0.7, 0.3]
            properties["transportZoneType"] = random.choices(tz_types, weights=tz_weights)[0]
            
            if properties["transportZoneType"] == "OVERLAY":
                properties["transportZone"] = random.choice(["TZ-Overlay", f"TZ-Overlay-{random.randint(1, 10)}"])
                properties["replicationMode"] = random.choice(["HIERARCHICAL", "HEADEND", "SOURCE"])
                properties["vni"] = random.randint(5000, 16777215)  # VNI range
            else:
                properties["transportZone"] = random.choice(["TZ-VLAN", f"TZ-VLAN-{random.randint(1, 10)}"])
                properties["vlanId"] = random.randint(1, 4094)
        else:
            properties["transportZone"] = random.choice(["globalroot-0", f"globalroot-{random.randint(1, 10)}"])
            properties["controlPlaneMode"] = random.choice(["UNICAST_MODE", "HYBRID_MODE", "MULTICAST_MODE"])
            properties["vxlanId"] = random.randint(5000, 16000000)
        
        # Connection options
        if "Segment" in properties["switchType"]:
            # Connectivity and segment specific properties
            properties["connectivityPath"] = f"/infra/tier-1s/Tier-1-{random.randint(1, 10)}"
            segment_types = ["Regular", "Service", "Extended"]
            segment_weights = [0.8, 0.15, 0.05]
            properties["segmentType"] = random.choices(segment_types, weights=segment_weights)[0]
            
            if properties["segmentType"] == "Extended":
                properties["remoteSite"] = random.choice(["SiteA", "SiteB", "Remote-DC"])
                properties["localEgress"] = random.choice([True, False])
        
        # IP assignment
        ip_configs = ["DHCP", "Static", "None"]
        ip_weights = [0.4, 0.4, 0.2]
        properties["ipAssignment"] = random.choices(ip_configs, weights=ip_weights)[0]
        
        if properties["ipAssignment"] in ["DHCP", "Static"]:
            subnet_octet1 = random.randint(10, 192)
            subnet_octet2 = random.randint(0, 255)
            subnet_octet3 = random.randint(0, 255)
            properties["subnet"] = f"{subnet_octet1}.{subnet_octet2}.{subnet_octet3}.0/24"
            
            if properties["ipAssignment"] == "DHCP":
                properties["dhcpConfigPath"] = f"/infra/dhcp-server-configs/dhcp-{random.randint(1, 100)}"
            
            properties["gatewayIP"] = f"{subnet_octet1}.{subnet_octet2}.{subnet_octet3}.1"
        
        # MTU configuration
        properties["mtu"] = random.choice([1500, 1600, 9000])
        
        # ------- Usage and Scale -------
        properties["transportNodeCount"] = random.randint(2, 64)
        properties["connectedVmCount"] = random.randint(1, 500)
        
        # Traffic stats
        properties["averageThroughputMbps"] = random.randint(10, 5000)
        properties["peakThroughputMbps"] = properties["averageThroughputMbps"] + random.randint(100, 2000)
        properties["packetRatePps"] = random.randint(1000, 1000000)
        
        # MAC addresses and ARP tables
        properties["macAddressCount"] = random.randint(properties["connectedVmCount"], properties["connectedVmCount"] * 2)
        properties["arpEntryCount"] = random.randint(properties["connectedVmCount"], properties["connectedVmCount"] * 3)
        
        # ------- Security Configuration -------
        if "NSX-T" in properties["switchType"]:
            properties["micorsegmentationEnabled"] = random.choice([True, False])
            properties["associatedDfwRuleCount"] = random.randint(0, 200) if properties["micorsegmentationEnabled"] else 0
            properties["spoofguardEnabled"] = random.choice([True, False])
        else:
            properties["spoofguardEnabled"] = random.choice([True, False])
        
        # Switch security
        properties["promiscuousModeEnabled"] = random.choice([True, False])
        properties["macLearningEnabled"] = random.choice([True, False])
        properties["forgedTransmitsEnabled"] = random.choice([True, False])
        
        # ------- Performance and Status -------
        health_states = ["green", "yellow", "red"]
        health_weights = [0.85, 0.1, 0.05]
        properties["overallStatus"] = random.choices(health_states, weights=health_weights)[0]
        
        # Packet and drops
        properties["rxPackets"] = random.randint(1000000, 1000000000)
        properties["txPackets"] = random.randint(1000000, 1000000000)
        properties["rxDroppedPackets"] = random.randint(0, 10000)
        properties["txDroppedPackets"] = random.randint(0, 10000)
        
        properties["packetLossPercentage"] = round(
            ((properties["rxDroppedPackets"] + properties["txDroppedPackets"]) / 
             (properties["rxPackets"] + properties["txPackets"])) * 100, 5
        )
        
        # ------- Change Management -------
        properties["lastConfigChangeDate"] = self.random_past_date(90)
        properties["lastTopologyChangeDate"] = self.random_past_date(180)
        
        # Change risk calculation
        base_risk = 50
        
        # Factors affecting risk
        if properties["connectedVmCount"] > 100:
            base_risk += 20
        elif properties["connectedVmCount"] > 50:
            base_risk += 10
        
        if properties["transportNodeCount"] > 32:
            base_risk += 10
        
        if properties["overallStatus"] == "red":
            base_risk += 25
        elif properties["overallStatus"] == "yellow":
            base_risk += 15
        
        if properties["micorsegmentationEnabled"] if "micorsegmentationEnabled" in properties else False:
            base_risk += 15
        
        # Add some randomness
        properties["changeRiskScore"] = min(base_risk + random.randint(-10, 10), 100)
        
        # Recommended precautions based on risk
        if properties["changeRiskScore"] > 70:
            properties["changeImpactCategory"] = "High"
            properties["recommendedPrecautions"] = [
                "Schedule maintenance window during off-hours",
                "Validate all workload connectivity requirements",
                "Prepare detailed rollback plan",
                "Test changes in development environment first",
                "Notify all application teams",
                "Validate security policy impact"
            ]
        elif properties["changeRiskScore"] > 40:
            properties["changeImpactCategory"] = "Medium"
            properties["recommendedPrecautions"] = [
                "Schedule during low traffic periods",
                "Verify critical workload connectivity",
                "Have basic rollback plan",
                "Notify key stakeholders"
            ]
        else:
            properties["changeImpactCategory"] = "Low"
            properties["recommendedPrecautions"] = [
                "Standard change process",
                "Monitor network during change",
                "Verify connectivity after change"
            ]
        
        # ------- Business Impact -------
        # Impact assessment based on connected VM count
        if properties["connectedVmCount"] > 100:
            properties["businessCriticalityScore"] = random.randint(80, 100)
            properties["slaLevel"] = random.choice(["Gold", "Platinum"])
        elif properties["connectedVmCount"] > 50:
            properties["businessCriticalityScore"] = random.randint(60, 80)
            properties["slaLevel"] = random.choice(["Silver", "Gold"])
        else:
            properties["businessCriticalityScore"] = random.randint(30, 60)
            properties["slaLevel"] = random.choice(["Bronze", "Silver"])
        
        # Impact metrics
        properties["estimatedUsersImpacted"] = properties["connectedVmCount"] * random.randint(5, 20)
        properties["businessServicesImpacted"] = random.randint(1, max(5, properties["connectedVmCount"] // 20))
        
        # ------- Compliance and Audit -------
        properties["lastComplianceCheckDate"] = self.random_past_date(30)
        
        compliance_options = ["compliant", "nonCompliant", "partiallyCompliant", "unknown"]
        compliance_weights = [0.7, 0.1, 0.15, 0.05]
        properties["complianceStatus"] = random.choices(compliance_options, weights=compliance_weights)[0]
        
        # Generate the Cypher code for the node
        cypher_code = f"CREATE (nsxs_{switch_id}:NSXSwitch {{\n"
        
        # Organize properties by category for readability
        property_categories = {
            "Basic Identification": [
                "id", "name", "uuid"
            ],
            "Switch Type and Version": [
                "switchType", "version"
            ],
            "Network Configuration": [
                "adminState", "operationalState", "transportZoneType", "transportZone",
                "replicationMode", "vni", "vlanId", "controlPlaneMode", "vxlanId",
                "connectivityPath", "segmentType", "remoteSite", "localEgress",
                "ipAssignment", "subnet", "dhcpConfigPath", "gatewayIP", "mtu"
            ],
            "Usage and Scale": [
                "transportNodeCount", "connectedVmCount", "averageThroughputMbps",
                "peakThroughputMbps", "packetRatePps", "macAddressCount", "arpEntryCount"
            ],
            "Security Configuration": [
                "micorsegmentationEnabled", "associatedDfwRuleCount", "spoofguardEnabled",
                "promiscuousModeEnabled", "macLearningEnabled", "forgedTransmitsEnabled"
            ],
            "Performance and Status": [
                "overallStatus", "rxPackets", "txPackets", "rxDroppedPackets",
                "txDroppedPackets", "packetLossPercentage"
            ],
            "Change Management": [
                "lastConfigChangeDate", "lastTopologyChangeDate", "changeRiskScore",
                "changeImpactCategory", "recommendedPrecautions"
            ],
            "Business Impact": [
                "businessCriticalityScore", "slaLevel", "estimatedUsersImpacted",
                "businessServicesImpacted"
            ],
            "Compliance and Audit": [
                "lastComplianceCheckDate", "complianceStatus"
            ]
        }
        
        # Build the Cypher properties by category
        for category, prop_names in property_categories.items():
            cypher_code += f"    // {category}\n"
            for prop in prop_names:
                if prop in properties:
                    cypher_code += f"    {prop}: {self.format_property_value(properties[prop])},\n"
            cypher_code += "\n"
        
        # Remove the last comma and newline
        cypher_code = cypher_code.rstrip(",\n") + "\n"
        cypher_code += "})"
        
        return cypher_code

    def generate_multiple_components(self, counts: Dict[str, int] = None) -> str:
        """
        Generate Neo4j Cypher script for multiple VMware infrastructure components.
        
        Args:
            counts: Dictionary specifying the number of each component type to generate.
                   If None, defaults will be used.
                   
        Returns:
            str: Complete Neo4j Cypher script with multiple components
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
        
        cypher_code = "// Generated VMware Environment for Neo4j\n\n"
        
        # Generate ESXi Hosts
        if counts.get("esxi_host", 0) > 0:
            cypher_code += "// ESXi Hosts\n"
            host_ids = random.sample(range(1001, 9999), counts["esxi_host"])
            for i, host_id in enumerate(host_ids):
                cypher_code += self.generate_esxi_host(host_id)
                if i < counts["esxi_host"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate vCenter Servers
        if counts.get("vcenter", 0) > 0:
            cypher_code += "// vCenter Servers\n"
            vcenter_ids = random.sample(range(1001, 9999), counts["vcenter"])
            for i, vcenter_id in enumerate(vcenter_ids):
                cypher_code += self.generate_vcenter_server(vcenter_id)
                if i < counts["vcenter"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate vSphere Clusters
        if counts.get("vsphere_cluster", 0) > 0:
            cypher_code += "// vSphere Clusters\n"
            cluster_ids = random.sample(range(1001, 9999), counts["vsphere_cluster"])
            for i, cluster_id in enumerate(cluster_ids):
                cypher_code += self.generate_vsphere_cluster(cluster_id)
                if i < counts["vsphere_cluster"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate vSAN Clusters
        if counts.get("vsan_cluster", 0) > 0:
            cypher_code += "// vSAN Clusters\n"
            vsan_ids = random.sample(range(1001, 9999), counts["vsan_cluster"])
            for i, vsan_id in enumerate(vsan_ids):
                cypher_code += self.generate_vsan_cluster(vsan_id)
                if i < counts["vsan_cluster"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate Datastores
        if counts.get("datastore", 0) > 0:
            cypher_code += "// Datastores\n"
            datastore_ids = random.sample(range(1001, 9999), counts["datastore"])
            for i, datastore_id in enumerate(datastore_ids):
                cypher_code += self.generate_datastore(datastore_id)
                if i < counts["datastore"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate NSX Managers
        if counts.get("nsx_manager", 0) > 0:
            cypher_code += "// NSX Managers\n"
            nsx_ids = random.sample(range(1001, 9999), counts["nsx_manager"])
            for i, nsx_id in enumerate(nsx_ids):
                cypher_code += self.generate_nsx_manager(nsx_id)
                if i < counts["nsx_manager"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate Virtual Networks
        if counts.get("virtual_network", 0) > 0:
            cypher_code += "// Virtual Networks\n"
            vnet_ids = random.sample(range(1001, 9999), counts["virtual_network"])
            for i, vnet_id in enumerate(vnet_ids):
                cypher_code += self.generate_virtual_network(vnet_id)
                if i < counts["virtual_network"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate NSX Edges
        if counts.get("nsx_edge", 0) > 0:
            cypher_code += "// NSX Edges\n"
            edge_ids = random.sample(range(1001, 9999), counts["nsx_edge"])
            for i, edge_id in enumerate(edge_ids):
                cypher_code += self.generate_nsx_edge(edge_id)
                if i < counts["nsx_edge"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate NSX Switches
        if counts.get("nsx_switch", 0) > 0:
            cypher_code += "// NSX Switches\n"
            switch_ids = random.sample(range(1001, 9999), counts["nsx_switch"])
            for i, switch_id in enumerate(switch_ids):
                cypher_code += self.generate_nsx_switch(switch_id)
                if i < counts["nsx_switch"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate Virtual Machines
        if counts.get("vm", 0) > 0:
            cypher_code += "// Virtual Machines\n"
            vm_ids = random.sample(range(1001, 9999), counts["vm"])
            for i, vm_id in enumerate(vm_ids):
                cypher_code += self.generate_virtual_machine(vm_id)
                if i < counts["vm"] - 1:
                    cypher_code += "\n\n"
            cypher_code += "\n\n"
        
        # Generate sample relationships
        cypher_code += self.generate_sample_relationships()
        
        return cypher_code
    
    def generate_sample_relationships(self) -> str:
        """
        Generate sample relationships between nodes for a complete VMware environment.
        This creates a minimal set of relationships to demonstrate the data model.
        
        Returns:
            str: Cypher statements for creating relationships
        """
        cypher_code = "// Sample Relationships\n\n"
        
        # vCenter manages ESXi, Clusters, VMs, NSX Manager, Datastores
        cypher_code += "// vCenter Management Relationships\n"
        cypher_code += "MATCH (vc:VCenterServer), (esxi:ESXiHost)\n"
        cypher_code += "CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages lifecycle and configuration'}]->(esxi);\n\n"
        
        cypher_code += "MATCH (vc:VCenterServer), (cluster:VSphereCluster)\n"
        cypher_code += "CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration'}]->(cluster);\n\n"
        
        cypher_code += "MATCH (vc:VCenterServer), (vm:VirtualMachine)\n"
        cypher_code += "CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle'}]->(vm);\n\n"
        
        cypher_code += "MATCH (vc:VCenterServer), (ds:Datastore)\n"
        cypher_code += "CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage allocation'}]->(ds);\n\n"
        
        cypher_code += "MATCH (vc:VCenterServer), (nsx:NSXManager)\n"
        cypher_code += "CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Integration for network management'}]->(nsx);\n\n"
        
        # Cluster contains ESXi hosts
        cypher_code += "// Cluster Membership\n"
        cypher_code += "MATCH (cluster:VSphereCluster), (esxi:ESXiHost)\n"
        cypher_code += "CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster'}]->(esxi);\n\n"
        
        # vSAN Cluster relationships
        cypher_code += "// vSAN Relationships\n"
        cypher_code += "MATCH (vsan:VSANCluster), (cluster:VSphereCluster)\n"
        cypher_code += "CREATE (vsan)-[:DEPLOYED_ON {cardinality: '1:1', description: 'vSAN deployment target'}]->(cluster);\n\n"
        
        cypher_code += "MATCH (vsan:VSANCluster), (ds:Datastore)\n"
        cypher_code += "CREATE (vsan)-[:PROVIDES {cardinality: '1:N', description: 'Storage provisioning'}]->(ds);\n\n"
        
        # ESXi hosts VMs and provides access to datastores and networks
        cypher_code += "// ESXi Hosting and Access Relationships\n"
        cypher_code += "MATCH (esxi:ESXiHost), (vm:VirtualMachine)\n"
        cypher_code += "CREATE (esxi)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources'}]->(vm);\n\n"
        
        cypher_code += "MATCH (esxi:ESXiHost), (ds:Datastore)\n"
        cypher_code += "CREATE (esxi)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access'}]->(ds);\n\n"
        
        cypher_code += "MATCH (esxi:ESXiHost), (vnet:VirtualNetwork)\n"
        cypher_code += "WHERE vnet.type CONTAINS 'Standard' OR vnet.type CONTAINS 'Distributed'\n"
        cypher_code += "CREATE (esxi)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity'}]->(vnet);\n\n"
        
        # VM relationships to datastores and networks
        cypher_code += "// VM Resource Relationships\n"
        cypher_code += "MATCH (vm:VirtualMachine), (ds:Datastore)\n"
        cypher_code += "CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore'}]->(ds);\n\n"
        
        cypher_code += "MATCH (vm:VirtualMachine), (vnet:VirtualNetwork)\n"
        cypher_code += "CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity'}]->(vnet);\n\n"
        
        # NSX relationships
        cypher_code += "// NSX Management Relationships\n"
        cypher_code += "MATCH (nsx:NSXManager), (edge:NSXEdge)\n"
        cypher_code += "CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management'}]->(edge);\n\n"
        
        cypher_code += "MATCH (nsx:NSXManager), (nsxswitch:NSXSwitch)\n"
        cypher_code += "CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX logical switch management'}]->(nsxswitch);\n\n"
        
        cypher_code += "MATCH (nsx:NSXManager), (vnet:VirtualNetwork)\n"
        cypher_code += "WHERE vnet.type CONTAINS 'NSX'\n"
        cypher_code += "CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX network management'}]->(vnet);\n\n"
        
        # NSX Edge and Switch relationships
        cypher_code += "// NSX Edge and Switch Relationships\n"
        cypher_code += "MATCH (edge:NSXEdge), (nsxswitch:NSXSwitch)\n"
        cypher_code += "CREATE (edge)-[:CONNECTS {cardinality: 'N:M', description: 'Network connectivity'}]->(nsxswitch);\n\n"
        
        cypher_code += "MATCH (nsxswitch:NSXSwitch), (vnet:VirtualNetwork)\n"
        cypher_code += "WHERE vnet.type CONTAINS 'NSX'\n"
        cypher_code += "CREATE (nsxswitch)-[:IMPLEMENTS {cardinality: '1:1', description: 'Switch implementation'}]->(vnet);\n\n"
        
        return cypher_code