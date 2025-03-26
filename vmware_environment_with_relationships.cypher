// Generated VMware Environment with Relationships for Neo4j

// NODES
// ESXi Hosts
CREATE (esxi_2068:ESXiHost {
    // Basic Identification
    id: 'host-2068',
    name: 'esxi2068.vmware.local',
    uuid: '989db842-9b3c-4511-bdff-387eec56186e',
    fqdn: 'esxi2068.vmware.local',
    managementIP: '192.168.10.44',
    vMotionIP: '10.10.10.44',
    storageIP: '10.20.10.44',

    // Version and Build
    version: '6.7.0',
    buildNumber: '91454123',
    targetVersion: '8.0.0',
    targetBuildNumber: '33734479',
    versionGap: 'Major',
    upgradePath: 'Complex',

    // Hardware Details
    vendor: 'HPE',
    model: 'ProLiant DL360 Gen10',
    serialNumber: '0N8AVZU6JR',
    lifecycleStatus: 'End of Life',
    endOfSupportDate: '2022-07-03',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz',
    cpuSockets: 8,
    cpuCoresPerSocket: 64,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 512,
    cpuTotalThreads: 1024,
    cpuSpeed: 3452,
    memoryGB: 512,
    memoryAvailableGB: 467,
    memoryOverheadGB: 45,

    // Workload Impact Parameters
    vmCount: 17,
    poweredOnVmCount: 15,
    criticalVmCount: 6,
    criticalVmPercentage: 35.3,
    vCpuToCoreFactor: 3.3,
    memoryOvercommitFactor: 2.0,

    // Infrastructure Resilience
    clusterN1Capacity: false,
    clusterN2Capacity: false,
    haStatus: 'Disabled',
    networkRedundancy: 'Full',
    storageRedundancy: 'Partial',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'FullyCompatible',
    driverUpdatesRequired: 1,
    firmwareUpdatesRequired: 5,
    customVibCount: 1,
    thirdPartyExtensionCount: 3,
    compatibilityRisk: 'High',

    // Operational Factors
    vMotionEligibleVmPercentage: 75.7,
    estimatedDowntimeMinutes: 107,
    configurationDriftScore: 54,
    activeVmSnapshotCount: 11,
    lastSuccessfulBackupDate: '2025-03-15',
    backupVerificationStatus: 'Failed',
    lastSuccessfulPatrikTestDate: '2025-02-16',

    // Historical Data
    previousPatchSuccessRate: 73.1,
    meanTimeBetweenFailures: 599,
    lastFailureDate: '2024-09-09',
    incidentCount90Days: 0,
    knownIssuesWithTargetVersion: 5,

    // Business Impact
    businessCriticalityScore: 93,
    slaLevel: 'Platinum',
    serviceWindowStart: '02:00',
    serviceWindowEnd: '08:00',
    serviceWindowDay: 'Monday',
    userImpactCount: 357,
    businessProcessesImpacted: 8,
    applicationTiersHosted: ['Analytics', 'Integration', 'Middleware', 'Application', 'Web'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: true,
    powerState: 'poweredOff',
    cpuUsageMhz: 0,
    cpuUsagePercentage: 0,
    memoryUsageGB: 0,
    memoryUsagePercentage: 0,
    uptimeDays: 0,

    // Standard Configuration
    ntpServer: 'ntp.vmware.local',
    sshEnabled: false,
    lockdownMode: 'normal',
    hyperthreadingEnabled: true,

    // Advanced Features
    evcMode: 'amd-rome',
    vGpuEnabled: false,
    nestedVirtualizationEnabled: false,

    // DRS and HA Configuration
    drsAutomationLevel: 'fullyAutomated',
    drsVmotionRate: 3,
    haEnabled: true,
    haPriority: 'medium',

    // Change Management
    lastPatchDate: '2025-01-13',
    lastBootTime: '2025-03-11T01:41:50Z',
    lastChangeRequestID: 'CR-20250211-619',
    lastChangeRequestStatus: 'Canceled',
    pendingChangeRequestID: 'CR-20250406-188',
    changeWindowAssigned: false,
    changeRiskScore: 100,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 4,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-15',
    securityBaselineVariance: 17,
    pciCompliance: true,
    hipaaCompliance: true
})

CREATE (esxi_9335:ESXiHost {
    // Basic Identification
    id: 'host-9335',
    name: 'esxi9335.vmware.local',
    uuid: '1e447b5d-0114-49db-ab8a-92aff4a05511',
    fqdn: 'esxi9335.vmware.local',
    managementIP: '192.168.10.227',
    vMotionIP: '10.10.10.227',
    storageIP: '10.20.10.227',

    // Version and Build
    version: '6.7.0',
    buildNumber: '17231403',
    targetVersion: '8.0.1',
    targetBuildNumber: '82917324',
    versionGap: 'Major',
    upgradePath: 'Complex',

    // Hardware Details
    vendor: 'HPE',
    model: 'ProLiant DL380 Gen10',
    serialNumber: 'SAF3K8YB6K',
    lifecycleStatus: 'Supported',
    endOfSupportDate: '2029-02-02',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz',
    cpuSockets: 8,
    cpuCoresPerSocket: 16,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 128,
    cpuTotalThreads: 256,
    cpuSpeed: 2806,
    memoryGB: 256,
    memoryAvailableGB: 238,
    memoryOverheadGB: 18,

    // Workload Impact Parameters
    vmCount: 75,
    poweredOnVmCount: 56,
    criticalVmCount: 14,
    criticalVmPercentage: 18.7,
    vCpuToCoreFactor: 7.4,
    memoryOvercommitFactor: 2.2,

    // Infrastructure Resilience
    clusterN1Capacity: false,
    clusterN2Capacity: false,
    haStatus: 'Configured',
    networkRedundancy: 'Full',
    storageRedundancy: 'Full',
    redundantPowerSupplies: false,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'Incompatible',
    driverUpdatesRequired: 2,
    firmwareUpdatesRequired: 5,
    customVibCount: 9,
    thirdPartyExtensionCount: 4,
    compatibilityRisk: 'High',

    // Operational Factors
    vMotionEligibleVmPercentage: 91.1,
    estimatedDowntimeMinutes: 119,
    configurationDriftScore: 91,
    activeVmSnapshotCount: 19,
    lastSuccessfulBackupDate: '2025-03-16',
    backupVerificationStatus: 'Unknown',
    lastSuccessfulPatrikTestDate: '2025-02-23',

    // Historical Data
    previousPatchSuccessRate: 81.8,
    meanTimeBetweenFailures: 492,
    lastFailureDate: '2024-06-17',
    incidentCount90Days: 4,
    knownIssuesWithTargetVersion: 2,

    // Business Impact
    businessCriticalityScore: 54,
    slaLevel: 'Silver',
    serviceWindowStart: '00:00',
    serviceWindowEnd: '06:00',
    serviceWindowDay: 'Thursday',
    userImpactCount: 1500,
    businessProcessesImpacted: 11,
    applicationTiersHosted: ['Middleware', 'Web', 'Integration', 'Database'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: true,
    powerState: 'poweredOff',
    cpuUsageMhz: 0,
    cpuUsagePercentage: 0,
    memoryUsageGB: 0,
    memoryUsagePercentage: 0,
    uptimeDays: 0,

    // Standard Configuration
    ntpServer: 'time.google.com',
    sshEnabled: false,
    lockdownMode: 'disabled',
    hyperthreadingEnabled: true,

    // Advanced Features
    evcMode: 'intel-skylake',
    vGpuEnabled: false,
    nestedVirtualizationEnabled: true,

    // DRS and HA Configuration
    drsAutomationLevel: 'partiallyAutomated',
    drsVmotionRate: 3,
    haEnabled: false,
    haPriority: 'low',

    // Change Management
    lastPatchDate: '2024-11-03',
    lastBootTime: '2025-03-15T13:07:41Z',
    lastChangeRequestID: 'CR-20250222-781',
    lastChangeRequestStatus: 'Completed',
    pendingChangeRequestID: 'CR-20250326-026',
    changeWindowAssigned: true,
    changeRiskScore: 83,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 3,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-14',
    securityBaselineVariance: 11,
    pciCompliance: false,
    hipaaCompliance: true
})

CREATE (esxi_5301:ESXiHost {
    // Basic Identification
    id: 'host-5301',
    name: 'esxi5301.vmware.local',
    uuid: 'c8fa1b47-614d-4631-aadc-78bb56110400',
    fqdn: 'esxi5301.vmware.local',
    managementIP: '192.168.10.241',
    vMotionIP: '10.10.10.241',
    storageIP: '10.20.10.241',

    // Version and Build
    version: '7.0.2',
    buildNumber: '93110311',
    targetVersion: '8.0.0',
    targetBuildNumber: '37129337',
    versionGap: 'Major',
    upgradePath: 'Direct',

    // Hardware Details
    vendor: 'Dell Inc.',
    model: 'PowerEdge R840',
    serialNumber: '45IRQNS80W',
    lifecycleStatus: 'Limited Support',
    endOfSupportDate: '2026-11-28',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Gold 6348 CPU @ 2.60GHz',
    cpuSockets: 4,
    cpuCoresPerSocket: 24,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 96,
    cpuTotalThreads: 192,
    cpuSpeed: 3807,
    memoryGB: 256,
    memoryAvailableGB: 230,
    memoryOverheadGB: 26,

    // Workload Impact Parameters
    vmCount: 87,
    poweredOnVmCount: 68,
    criticalVmCount: 13,
    criticalVmPercentage: 14.9,
    vCpuToCoreFactor: 5.6,
    memoryOvercommitFactor: 1.3,

    // Infrastructure Resilience
    clusterN1Capacity: false,
    clusterN2Capacity: false,
    haStatus: 'Disabled',
    networkRedundancy: 'Full',
    storageRedundancy: 'Full',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'LimitedCompatibility',
    driverUpdatesRequired: 5,
    firmwareUpdatesRequired: 2,
    customVibCount: 5,
    thirdPartyExtensionCount: 3,
    compatibilityRisk: 'High',

    // Operational Factors
    vMotionEligibleVmPercentage: 99.0,
    estimatedDowntimeMinutes: 144,
    configurationDriftScore: 90,
    activeVmSnapshotCount: 4,
    lastSuccessfulBackupDate: '2025-03-13',
    backupVerificationStatus: 'Verified',
    lastSuccessfulPatrikTestDate: '2025-02-28',

    // Historical Data
    previousPatchSuccessRate: 97.5,
    meanTimeBetweenFailures: 316,
    lastFailureDate: '2024-07-15',
    incidentCount90Days: 3,
    knownIssuesWithTargetVersion: 2,

    // Business Impact
    businessCriticalityScore: 44,
    slaLevel: 'Bronze',
    serviceWindowStart: '03:00',
    serviceWindowEnd: '08:00',
    serviceWindowDay: 'Monday',
    userImpactCount: 1653,
    businessProcessesImpacted: 13,
    applicationTiersHosted: ['Middleware', 'Batch', 'Application', 'Integration', 'Analytics'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: true,
    powerState: 'poweredOff',
    cpuUsageMhz: 0,
    cpuUsagePercentage: 0,
    memoryUsageGB: 0,
    memoryUsagePercentage: 0,
    uptimeDays: 0,

    // Standard Configuration
    ntpServer: 'ntp.vmware.local',
    sshEnabled: false,
    lockdownMode: 'disabled',
    hyperthreadingEnabled: true,

    // Advanced Features
    evcMode: 'intel-icelake',
    vGpuEnabled: true,
    nestedVirtualizationEnabled: true,

    // DRS and HA Configuration
    drsAutomationLevel: 'fullyAutomated',
    drsVmotionRate: 1,
    haEnabled: true,
    haPriority: 'medium',

    // Change Management
    lastPatchDate: '2024-12-26',
    lastBootTime: '2025-02-15T03:24:23Z',
    lastChangeRequestID: 'CR-20250206-605',
    lastChangeRequestStatus: 'Completed',
    pendingChangeRequestID: 'CR-20250426-386',
    changeWindowAssigned: true,
    changeRiskScore: 74,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 0,
    criticalVulnerabilityCount: 1,
    lastSecurityScanDate: '2025-02-20',
    securityBaselineVariance: 9,
    pciCompliance: true,
    hipaaCompliance: true
})

CREATE (esxi_5384:ESXiHost {
    // Basic Identification
    id: 'host-5384',
    name: 'esxi5384.vmware.local',
    uuid: 'f57f6ec5-ab55-457a-ac81-e2eca477a333',
    fqdn: 'esxi5384.vmware.local',
    managementIP: '192.168.10.71',
    vMotionIP: '10.10.10.71',
    storageIP: '10.20.10.71',

    // Version and Build
    version: '7.0.0',
    buildNumber: '34019879',
    targetVersion: '8.0.2',
    targetBuildNumber: '99953975',
    versionGap: 'Major',
    upgradePath: 'Complex',

    // Hardware Details
    vendor: 'Dell Inc.',
    model: 'PowerEdge R840',
    serialNumber: 'WB2EACHYEL',
    lifecycleStatus: 'Supported',
    endOfSupportDate: '2026-09-23',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Gold 6348 CPU @ 2.60GHz',
    cpuSockets: 4,
    cpuCoresPerSocket: 16,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 64,
    cpuTotalThreads: 128,
    cpuSpeed: 3466,
    memoryGB: 2048,
    memoryAvailableGB: 1914,
    memoryOverheadGB: 134,

    // Workload Impact Parameters
    vmCount: 64,
    poweredOnVmCount: 46,
    criticalVmCount: 3,
    criticalVmPercentage: 4.7,
    vCpuToCoreFactor: 1.7,
    memoryOvercommitFactor: 2.5,

    // Infrastructure Resilience
    clusterN1Capacity: true,
    clusterN2Capacity: false,
    haStatus: 'Degraded',
    networkRedundancy: 'Full',
    storageRedundancy: 'Full',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'FullyCompatible',
    driverUpdatesRequired: 7,
    firmwareUpdatesRequired: 2,
    customVibCount: 10,
    thirdPartyExtensionCount: 5,
    compatibilityRisk: 'High',

    // Operational Factors
    vMotionEligibleVmPercentage: 95.5,
    estimatedDowntimeMinutes: 162,
    configurationDriftScore: 49,
    activeVmSnapshotCount: 2,
    lastSuccessfulBackupDate: '2025-03-13',
    backupVerificationStatus: 'Failed',
    lastSuccessfulPatrikTestDate: '2025-02-24',

    // Historical Data
    previousPatchSuccessRate: 75.7,
    meanTimeBetweenFailures: 292,
    lastFailureDate: '2024-09-07',
    incidentCount90Days: 5,
    knownIssuesWithTargetVersion: 8,

    // Business Impact
    businessCriticalityScore: 30,
    slaLevel: 'Bronze',
    serviceWindowStart: '01:00',
    serviceWindowEnd: '07:00',
    serviceWindowDay: 'Friday',
    userImpactCount: 1344,
    businessProcessesImpacted: 3,
    applicationTiersHosted: ['Application', 'Analytics', 'Web', 'Database'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: true,
    powerState: 'poweredOn',
    cpuUsageMhz: 28837,
    cpuUsagePercentage: 13,
    memoryUsageGB: 995,
    memoryUsagePercentage: 52,
    uptimeDays: 303,

    // Standard Configuration
    ntpServer: 'ntp.vmware.local',
    sshEnabled: false,
    lockdownMode: 'normal',
    hyperthreadingEnabled: true,

    // Advanced Features
    evcMode: 'intel-icelake',
    vGpuEnabled: false,
    nestedVirtualizationEnabled: true,

    // DRS and HA Configuration
    drsAutomationLevel: 'manual',
    drsVmotionRate: 1,
    haEnabled: true,
    haPriority: 'low',

    // Change Management
    lastPatchDate: '2024-09-27',
    lastBootTime: '2025-02-16T00:10:04Z',
    lastChangeRequestID: 'CR-20250115-191',
    lastChangeRequestStatus: 'Failed',
    pendingChangeRequestID: 'CR-20250324-245',
    changeWindowAssigned: false,
    changeRiskScore: 70,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 3,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-08',
    securityBaselineVariance: 9,
    pciCompliance: false,
    hipaaCompliance: true
})

CREATE (esxi_4993:ESXiHost {
    // Basic Identification
    id: 'host-4993',
    name: 'esxi4993.vmware.local',
    uuid: '9c02eb62-2ddc-4ff9-8249-fbe98c56bbff',
    fqdn: 'esxi4993.vmware.local',
    managementIP: '192.168.10.186',
    vMotionIP: '10.10.10.186',
    storageIP: '10.20.10.186',

    // Version and Build
    version: '7.0.0',
    buildNumber: '74324793',
    targetVersion: '7.0.3',
    targetBuildNumber: '83587894',
    versionGap: 'Patch',
    upgradePath: 'Direct',

    // Hardware Details
    vendor: 'Dell Inc.',
    model: 'PowerEdge R650',
    serialNumber: 'A2RRTETTOA',
    lifecycleStatus: 'Supported',
    endOfSupportDate: '2028-08-20',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Platinum 8380 CPU @ 2.30GHz',
    cpuSockets: 8,
    cpuCoresPerSocket: 64,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 512,
    cpuTotalThreads: 1024,
    cpuSpeed: 3528,
    memoryGB: 512,
    memoryAvailableGB: 478,
    memoryOverheadGB: 34,

    // Workload Impact Parameters
    vmCount: 81,
    poweredOnVmCount: 65,
    criticalVmCount: 6,
    criticalVmPercentage: 7.4,
    vCpuToCoreFactor: 5.7,
    memoryOvercommitFactor: 1.7,

    // Infrastructure Resilience
    clusterN1Capacity: false,
    clusterN2Capacity: false,
    haStatus: 'Degraded',
    networkRedundancy: 'Full',
    storageRedundancy: 'Full',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'LimitedCompatibility',
    driverUpdatesRequired: 0,
    firmwareUpdatesRequired: 0,
    customVibCount: 5,
    thirdPartyExtensionCount: 4,
    compatibilityRisk: 'Low',

    // Operational Factors
    vMotionEligibleVmPercentage: 96.4,
    estimatedDowntimeMinutes: 23,
    configurationDriftScore: 18,
    activeVmSnapshotCount: 5,
    lastSuccessfulBackupDate: '2025-03-12',
    backupVerificationStatus: 'Partial',
    lastSuccessfulPatrikTestDate: '2025-02-28',

    // Historical Data
    previousPatchSuccessRate: 78.1,
    meanTimeBetweenFailures: 331,
    lastFailureDate: '2024-08-28',
    incidentCount90Days: 0,
    knownIssuesWithTargetVersion: 0,

    // Business Impact
    businessCriticalityScore: 36,
    slaLevel: 'Bronze',
    serviceWindowStart: '02:00',
    serviceWindowEnd: '07:00',
    serviceWindowDay: 'Friday',
    userImpactCount: 1377,
    businessProcessesImpacted: 11,
    applicationTiersHosted: ['Database', 'Batch'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: false,
    powerState: 'poweredOn',
    cpuUsageMhz: 523837,
    cpuUsagePercentage: 29,
    memoryUsageGB: 239,
    memoryUsagePercentage: 50,
    uptimeDays: 178,

    // Standard Configuration
    ntpServer: 'pool.ntp.org',
    sshEnabled: false,
    lockdownMode: 'normal',
    hyperthreadingEnabled: false,

    // Advanced Features
    evcMode: 'intel-broadwell',
    vGpuEnabled: false,
    nestedVirtualizationEnabled: false,

    // DRS and HA Configuration
    drsAutomationLevel: 'fullyAutomated',
    drsVmotionRate: 4,
    haEnabled: false,
    haPriority: 'medium',

    // Change Management
    lastPatchDate: '2024-11-20',
    lastBootTime: '2025-03-10T02:59:21Z',
    lastChangeRequestID: 'CR-20241231-229',
    lastChangeRequestStatus: 'Completed',
    pendingChangeRequestID: 'CR-20250422-718',
    changeWindowAssigned: true,
    changeRiskScore: 31,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'unknown',
    vulnerablilityCount: 3,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-13',
    securityBaselineVariance: 9,
    pciCompliance: false,
    hipaaCompliance: false
})

CREATE (esxi_6515:ESXiHost {
    // Basic Identification
    id: 'host-6515',
    name: 'esxi6515.vmware.local',
    uuid: 'c4ef877e-5724-450f-a08d-78b47c6f5225',
    fqdn: 'esxi6515.vmware.local',
    managementIP: '192.168.10.190',
    vMotionIP: '10.10.10.190',
    storageIP: '10.20.10.190',

    // Version and Build
    version: '7.0.3',
    buildNumber: '59357105',
    targetVersion: '8.0.2',
    targetBuildNumber: '83479969',
    versionGap: 'Major',
    upgradePath: 'Complex',

    // Hardware Details
    vendor: 'Supermicro',
    model: 'SuperServer 1029P-WT',
    serialNumber: 'Y1H6TA1NVE',
    lifecycleStatus: 'End of Life',
    endOfSupportDate: '2023-12-26',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz',
    cpuSockets: 4,
    cpuCoresPerSocket: 16,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 64,
    cpuTotalThreads: 128,
    cpuSpeed: 3578,
    memoryGB: 128,
    memoryAvailableGB: 118,
    memoryOverheadGB: 10,

    // Workload Impact Parameters
    vmCount: 99,
    poweredOnVmCount: 84,
    criticalVmCount: 16,
    criticalVmPercentage: 16.2,
    vCpuToCoreFactor: 7.7,
    memoryOvercommitFactor: 1.8,

    // Infrastructure Resilience
    clusterN1Capacity: false,
    clusterN2Capacity: false,
    haStatus: 'Configured',
    networkRedundancy: 'Full',
    storageRedundancy: 'Full',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'FullyCompatible',
    driverUpdatesRequired: 4,
    firmwareUpdatesRequired: 5,
    customVibCount: 6,
    thirdPartyExtensionCount: 2,
    compatibilityRisk: 'High',

    // Operational Factors
    vMotionEligibleVmPercentage: 98.2,
    estimatedDowntimeMinutes: 140,
    configurationDriftScore: 33,
    activeVmSnapshotCount: 4,
    lastSuccessfulBackupDate: '2025-03-11',
    backupVerificationStatus: 'Verified',
    lastSuccessfulPatrikTestDate: '2025-02-26',

    // Historical Data
    previousPatchSuccessRate: 96.0,
    meanTimeBetweenFailures: 782,
    lastFailureDate: '2024-09-03',
    incidentCount90Days: 2,
    knownIssuesWithTargetVersion: 7,

    // Business Impact
    businessCriticalityScore: 64,
    slaLevel: 'Gold',
    serviceWindowStart: '04:00',
    serviceWindowEnd: '10:00',
    serviceWindowDay: 'Saturday',
    userImpactCount: 2079,
    businessProcessesImpacted: 18,
    applicationTiersHosted: ['Application'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: false,
    powerState: 'poweredOn',
    cpuUsageMhz: 114496,
    cpuUsagePercentage: 50,
    memoryUsageGB: 81,
    memoryUsagePercentage: 69,
    uptimeDays: 73,

    // Standard Configuration
    ntpServer: 'ntp.vmware.local',
    sshEnabled: false,
    lockdownMode: 'disabled',
    hyperthreadingEnabled: true,

    // Advanced Features
    evcMode: 'intel-broadwell',
    vGpuEnabled: false,
    nestedVirtualizationEnabled: false,

    // DRS and HA Configuration
    drsAutomationLevel: 'manual',
    drsVmotionRate: 3,
    haEnabled: true,
    haPriority: 'high',

    // Change Management
    lastPatchDate: '2025-01-15',
    lastBootTime: '2025-02-04T14:38:07Z',
    lastChangeRequestID: 'CR-20250105-430',
    lastChangeRequestStatus: 'Completed',
    pendingChangeRequestID: 'CR-20250505-828',
    changeWindowAssigned: true,
    changeRiskScore: 87,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 5,
    criticalVulnerabilityCount: 1,
    lastSecurityScanDate: '2025-03-13',
    securityBaselineVariance: 20,
    pciCompliance: true,
    hipaaCompliance: true
})

CREATE (esxi_9526:ESXiHost {
    // Basic Identification
    id: 'host-9526',
    name: 'esxi9526.vmware.local',
    uuid: '66d57763-6a6f-43b2-b2fb-6561fe22b0d7',
    fqdn: 'esxi9526.vmware.local',
    managementIP: '192.168.10.165',
    vMotionIP: '10.10.10.165',
    storageIP: '10.20.10.165',

    // Version and Build
    version: '7.0.1',
    buildNumber: '45918374',
    targetVersion: '8.0.1',
    targetBuildNumber: '73762620',
    versionGap: 'Major',
    upgradePath: 'Direct',

    // Hardware Details
    vendor: 'Supermicro',
    model: 'SuperServer 6019U-TN4RT',
    serialNumber: 'W73Z52VCGB',
    lifecycleStatus: 'Limited Support',
    endOfSupportDate: '2026-04-16',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz',
    cpuSockets: 2,
    cpuCoresPerSocket: 64,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 128,
    cpuTotalThreads: 256,
    cpuSpeed: 3091,
    memoryGB: 256,
    memoryAvailableGB: 235,
    memoryOverheadGB: 21,

    // Workload Impact Parameters
    vmCount: 44,
    poweredOnVmCount: 41,
    criticalVmCount: 11,
    criticalVmPercentage: 25.0,
    vCpuToCoreFactor: 3.0,
    memoryOvercommitFactor: 1.1,

    // Infrastructure Resilience
    clusterN1Capacity: false,
    clusterN2Capacity: false,
    haStatus: 'Degraded',
    networkRedundancy: 'Partial',
    storageRedundancy: 'Full',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'FullyCompatible',
    driverUpdatesRequired: 0,
    firmwareUpdatesRequired: 0,
    customVibCount: 4,
    thirdPartyExtensionCount: 3,
    compatibilityRisk: 'Low',

    // Operational Factors
    vMotionEligibleVmPercentage: 88.9,
    estimatedDowntimeMinutes: 179,
    configurationDriftScore: 32,
    activeVmSnapshotCount: 5,
    lastSuccessfulBackupDate: '2025-03-13',
    backupVerificationStatus: 'Verified',
    lastSuccessfulPatrikTestDate: '2025-03-06',

    // Historical Data
    previousPatchSuccessRate: 98.4,
    meanTimeBetweenFailures: 349,
    lastFailureDate: '2024-08-21',
    incidentCount90Days: 5,
    knownIssuesWithTargetVersion: 8,

    // Business Impact
    businessCriticalityScore: 63,
    slaLevel: 'Gold',
    serviceWindowStart: '03:00',
    serviceWindowEnd: '08:00',
    serviceWindowDay: 'Tuesday',
    userImpactCount: 748,
    businessProcessesImpacted: 16,
    applicationTiersHosted: ['Application'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: true,
    powerState: 'poweredOff',
    cpuUsageMhz: 0,
    cpuUsagePercentage: 0,
    memoryUsageGB: 0,
    memoryUsagePercentage: 0,
    uptimeDays: 0,

    // Standard Configuration
    ntpServer: 'time.google.com',
    sshEnabled: true,
    lockdownMode: 'disabled',
    hyperthreadingEnabled: false,

    // Advanced Features
    evcMode: 'intel-icelake',
    vGpuEnabled: true,
    nestedVirtualizationEnabled: true,

    // DRS and HA Configuration
    drsAutomationLevel: 'partiallyAutomated',
    drsVmotionRate: 2,
    haEnabled: true,
    haPriority: 'high',

    // Change Management
    lastPatchDate: '2024-12-11',
    lastBootTime: '2025-03-06T00:02:55Z',
    lastChangeRequestID: 'CR-20241225-300',
    lastChangeRequestStatus: 'Failed',
    pendingChangeRequestID: 'CR-20250424-846',
    changeWindowAssigned: false,
    changeRiskScore: 75,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'warning',
    vulnerablilityCount: 13,
    criticalVulnerabilityCount: 1,
    lastSecurityScanDate: '2025-02-20',
    securityBaselineVariance: 4,
    pciCompliance: false,
    hipaaCompliance: false
})

CREATE (esxi_2307:ESXiHost {
    // Basic Identification
    id: 'host-2307',
    name: 'esxi2307.vmware.local',
    uuid: '95353a70-2478-425d-9e11-b4f81eb18c23',
    fqdn: 'esxi2307.vmware.local',
    managementIP: '192.168.10.30',
    vMotionIP: '10.10.10.30',
    storageIP: '10.20.10.30',

    // Version and Build
    version: '6.7.0',
    buildNumber: '63815788',
    targetVersion: '8.0.2',
    targetBuildNumber: '31502207',
    versionGap: 'Major',
    upgradePath: 'Staged',

    // Hardware Details
    vendor: 'Supermicro',
    model: 'SuperServer 1029P-WT',
    serialNumber: '1HKAFVYV8C',
    lifecycleStatus: 'Supported',
    endOfSupportDate: '2030-03-02',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Platinum 8380 CPU @ 2.30GHz',
    cpuSockets: 8,
    cpuCoresPerSocket: 16,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 128,
    cpuTotalThreads: 256,
    cpuSpeed: 3103,
    memoryGB: 2048,
    memoryAvailableGB: 1899,
    memoryOverheadGB: 149,

    // Workload Impact Parameters
    vmCount: 31,
    poweredOnVmCount: 29,
    criticalVmCount: 11,
    criticalVmPercentage: 35.5,
    vCpuToCoreFactor: 6.6,
    memoryOvercommitFactor: 2.0,

    // Infrastructure Resilience
    clusterN1Capacity: false,
    clusterN2Capacity: false,
    haStatus: 'Disabled',
    networkRedundancy: 'Full',
    storageRedundancy: 'Full',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'FullyCompatible',
    driverUpdatesRequired: 8,
    firmwareUpdatesRequired: 7,
    customVibCount: 9,
    thirdPartyExtensionCount: 5,
    compatibilityRisk: 'High',

    // Operational Factors
    vMotionEligibleVmPercentage: 74.1,
    estimatedDowntimeMinutes: 147,
    configurationDriftScore: 53,
    activeVmSnapshotCount: 14,
    lastSuccessfulBackupDate: '2025-03-16',
    backupVerificationStatus: 'Verified',
    lastSuccessfulPatrikTestDate: '2025-02-18',

    // Historical Data
    previousPatchSuccessRate: 86.6,
    meanTimeBetweenFailures: 675,
    lastFailureDate: '2024-07-15',
    incidentCount90Days: 10,
    knownIssuesWithTargetVersion: 3,

    // Business Impact
    businessCriticalityScore: 88,
    slaLevel: 'Gold',
    serviceWindowStart: '03:00',
    serviceWindowEnd: '05:00',
    serviceWindowDay: 'Wednesday',
    userImpactCount: 682,
    businessProcessesImpacted: 14,
    applicationTiersHosted: ['Application', 'Middleware', 'Batch', 'Database', 'Analytics', 'Integration', 'Web'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: true,
    powerState: 'poweredOff',
    cpuUsageMhz: 0,
    cpuUsagePercentage: 0,
    memoryUsageGB: 0,
    memoryUsagePercentage: 0,
    uptimeDays: 0,

    // Standard Configuration
    ntpServer: 'time.google.com',
    sshEnabled: true,
    lockdownMode: 'strict',
    hyperthreadingEnabled: false,

    // Advanced Features
    evcMode: 'intel-cascadelake',
    vGpuEnabled: true,
    nestedVirtualizationEnabled: true,

    // DRS and HA Configuration
    drsAutomationLevel: 'fullyAutomated',
    drsVmotionRate: 3,
    haEnabled: true,
    haPriority: 'low',

    // Change Management
    lastPatchDate: '2024-12-10',
    lastBootTime: '2025-02-19T14:22:15Z',
    lastChangeRequestID: 'CR-20250216-839',
    lastChangeRequestStatus: 'Completed',
    pendingChangeRequestID: 'CR-20250408-682',
    changeWindowAssigned: true,
    changeRiskScore: 99,

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 1,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-02-28',
    securityBaselineVariance: 15,
    pciCompliance: true,
    hipaaCompliance: true
})

CREATE (esxi_2440:ESXiHost {
    // Basic Identification
    id: 'host-2440',
    name: 'esxi2440.vmware.local',
    uuid: '5e2e9d20-b54f-4269-8e87-3167ae82b8e4',
    fqdn: 'esxi2440.vmware.local',
    managementIP: '192.168.10.163',
    vMotionIP: '10.10.10.163',
    storageIP: '10.20.10.163',

    // Version and Build
    version: '6.7.0',
    buildNumber: '79684642',
    targetVersion: '8.0.0',
    targetBuildNumber: '87069977',
    versionGap: 'Major',
    upgradePath: 'Staged',

    // Hardware Details
    vendor: 'Cisco',
    model: 'UCS C220 M5',
    serialNumber: 'W965ORQRC5',
    lifecycleStatus: 'Supported',
    endOfSupportDate: '2026-03-20',

    // CPU and Memory Information
    cpuType: 'AMD EPYC 7763 64-Core Processor',
    cpuSockets: 8,
    cpuCoresPerSocket: 32,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 256,
    cpuTotalThreads: 512,
    cpuSpeed: 3661,
    memoryGB: 2048,
    memoryAvailableGB: 1881,
    memoryOverheadGB: 167,

    // Workload Impact Parameters
    vmCount: 14,
    poweredOnVmCount: 14,
    criticalVmCount: 3,
    criticalVmPercentage: 21.4,
    vCpuToCoreFactor: 7.5,
    memoryOvercommitFactor: 2.3,

    // Infrastructure Resilience
    clusterN1Capacity: true,
    clusterN2Capacity: true,
    haStatus: 'Degraded',
    networkRedundancy: 'Full',
    storageRedundancy: 'Full',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'FullyCompatible',
    driverUpdatesRequired: 4,
    firmwareUpdatesRequired: 3,
    customVibCount: 0,
    thirdPartyExtensionCount: 5,
    compatibilityRisk: 'High',

    // Operational Factors
    vMotionEligibleVmPercentage: 73.8,
    estimatedDowntimeMinutes: 108,
    configurationDriftScore: 17,
    activeVmSnapshotCount: 12,
    lastSuccessfulBackupDate: '2025-03-10',
    backupVerificationStatus: 'Partial',
    lastSuccessfulPatrikTestDate: '2025-02-24',

    // Historical Data
    previousPatchSuccessRate: 70.9,
    meanTimeBetweenFailures: 753,
    lastFailureDate: '2024-04-30',
    incidentCount90Days: 5,
    knownIssuesWithTargetVersion: 6,

    // Business Impact
    businessCriticalityScore: 57,
    slaLevel: 'Silver',
    serviceWindowStart: '02:00',
    serviceWindowEnd: '05:00',
    serviceWindowDay: 'Wednesday',
    userImpactCount: 210,
    businessProcessesImpacted: 5,
    applicationTiersHosted: ['Web', 'Application', 'Database', 'Batch', 'Analytics', 'Integration'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: false,
    powerState: 'poweredOn',
    cpuUsageMhz: 646679,
    cpuUsagePercentage: 69,
    memoryUsageGB: 1222,
    memoryUsagePercentage: 65,
    uptimeDays: 309,

    // Standard Configuration
    ntpServer: 'pool.ntp.org',
    sshEnabled: true,
    lockdownMode: 'normal',
    hyperthreadingEnabled: false,

    // Advanced Features
    evcMode: 'intel-cascadelake',
    vGpuEnabled: false,
    nestedVirtualizationEnabled: true,

    // DRS and HA Configuration
    drsAutomationLevel: 'fullyAutomated',
    drsVmotionRate: 3,
    haEnabled: false,
    haPriority: 'low',

    // Change Management
    lastPatchDate: '2024-10-05',
    lastBootTime: '2024-09-29T01:56:03Z',
    lastChangeRequestID: 'CR-20250220-144',
    lastChangeRequestStatus: 'Failed',
    pendingChangeRequestID: 'CR-20250422-134',
    changeWindowAssigned: false,
    changeRiskScore: 76,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 4,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-02-28',
    securityBaselineVariance: 1,
    pciCompliance: true,
    hipaaCompliance: true
})

CREATE (esxi_5043:ESXiHost {
    // Basic Identification
    id: 'host-5043',
    name: 'esxi5043.vmware.local',
    uuid: 'f1853035-9ac8-4671-8e07-d0b74c2ee1a1',
    fqdn: 'esxi5043.vmware.local',
    managementIP: '192.168.10.236',
    vMotionIP: '10.10.10.236',
    storageIP: '10.20.10.236',

    // Version and Build
    version: '7.0.0',
    buildNumber: '81621202',
    targetVersion: '8.0.1',
    targetBuildNumber: '63144874',
    versionGap: 'Major',
    upgradePath: 'Staged',

    // Hardware Details
    vendor: 'HPE',
    model: 'ProLiant DL380 Gen11',
    serialNumber: '1UCP2EUU22',
    lifecycleStatus: 'Limited Support',
    endOfSupportDate: '2026-06-24',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Platinum 8380 CPU @ 2.30GHz',
    cpuSockets: 2,
    cpuCoresPerSocket: 64,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 128,
    cpuTotalThreads: 256,
    cpuSpeed: 2473,
    memoryGB: 2048,
    memoryAvailableGB: 1860,
    memoryOverheadGB: 188,

    // Workload Impact Parameters
    vmCount: 47,
    poweredOnVmCount: 33,
    criticalVmCount: 3,
    criticalVmPercentage: 6.4,
    vCpuToCoreFactor: 4.7,
    memoryOvercommitFactor: 2.8,

    // Infrastructure Resilience
    clusterN1Capacity: false,
    clusterN2Capacity: false,
    haStatus: 'Configured',
    networkRedundancy: 'Full',
    storageRedundancy: 'Full',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'Incompatible',
    driverUpdatesRequired: 4,
    firmwareUpdatesRequired: 4,
    customVibCount: 7,
    thirdPartyExtensionCount: 2,
    compatibilityRisk: 'High',

    // Operational Factors
    vMotionEligibleVmPercentage: 98.4,
    estimatedDowntimeMinutes: 136,
    configurationDriftScore: 84,
    activeVmSnapshotCount: 13,
    lastSuccessfulBackupDate: '2025-03-12',
    backupVerificationStatus: 'Verified',
    lastSuccessfulPatrikTestDate: '2025-03-11',

    // Historical Data
    previousPatchSuccessRate: 76.5,
    meanTimeBetweenFailures: 111,
    lastFailureDate: '2025-01-31',
    incidentCount90Days: 8,
    knownIssuesWithTargetVersion: 7,

    // Business Impact
    businessCriticalityScore: 12,
    slaLevel: 'Bronze',
    serviceWindowStart: '00:00',
    serviceWindowEnd: '02:00',
    serviceWindowDay: 'Tuesday',
    userImpactCount: 940,
    businessProcessesImpacted: 3,
    applicationTiersHosted: ['Integration', 'Middleware', 'Analytics'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: true,
    powerState: 'poweredOff',
    cpuUsageMhz: 0,
    cpuUsagePercentage: 0,
    memoryUsageGB: 0,
    memoryUsagePercentage: 0,
    uptimeDays: 0,

    // Standard Configuration
    ntpServer: 'time.windows.com',
    sshEnabled: true,
    lockdownMode: 'normal',
    hyperthreadingEnabled: false,

    // Advanced Features
    evcMode: 'intel-broadwell',
    vGpuEnabled: true,
    nestedVirtualizationEnabled: true,

    // DRS and HA Configuration
    drsAutomationLevel: 'partiallyAutomated',
    drsVmotionRate: 2,
    haEnabled: true,
    haPriority: 'high',

    // Change Management
    lastPatchDate: '2024-12-09',
    lastBootTime: '2025-03-11T16:07:36Z',
    lastChangeRequestID: 'CR-20241219-557',
    lastChangeRequestStatus: 'Completed',
    pendingChangeRequestID: 'CR-20250414-797',
    changeWindowAssigned: false,
    changeRiskScore: 83,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 5,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-02-22',
    securityBaselineVariance: 12,
    pciCompliance: true,
    hipaaCompliance: true
})

CREATE (esxi_9642:ESXiHost {
    // Basic Identification
    id: 'host-9642',
    name: 'esxi9642.vmware.local',
    uuid: '34c31a9d-c178-4d6a-b13c-56fcf79de72d',
    fqdn: 'esxi9642.vmware.local',
    managementIP: '192.168.10.28',
    vMotionIP: '10.10.10.28',
    storageIP: '10.20.10.28',

    // Version and Build
    version: '8.0.0',
    buildNumber: '21134724',
    targetVersion: '8.0.1',
    targetBuildNumber: '80812295',
    versionGap: 'Patch',
    upgradePath: 'Direct',

    // Hardware Details
    vendor: 'Supermicro',
    model: 'SuperServer 1029P-WT',
    serialNumber: 'R1W8VS9JBD',
    lifecycleStatus: 'End of Life',
    endOfSupportDate: '2024-12-28',

    // CPU and Memory Information
    cpuType: 'AMD EPYC 7763 64-Core Processor',
    cpuSockets: 4,
    cpuCoresPerSocket: 32,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 128,
    cpuTotalThreads: 256,
    cpuSpeed: 3555,
    memoryGB: 512,
    memoryAvailableGB: 464,
    memoryOverheadGB: 48,

    // Workload Impact Parameters
    vmCount: 83,
    poweredOnVmCount: 73,
    criticalVmCount: 18,
    criticalVmPercentage: 21.7,
    vCpuToCoreFactor: 1.9,
    memoryOvercommitFactor: 2.4,

    // Infrastructure Resilience
    clusterN1Capacity: true,
    clusterN2Capacity: true,
    haStatus: 'Degraded',
    networkRedundancy: 'Partial',
    storageRedundancy: 'Partial',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'FullyCompatible',
    driverUpdatesRequired: 2,
    firmwareUpdatesRequired: 1,
    customVibCount: 0,
    thirdPartyExtensionCount: 0,
    compatibilityRisk: 'Low',

    // Operational Factors
    vMotionEligibleVmPercentage: 89.0,
    estimatedDowntimeMinutes: 29,
    configurationDriftScore: 58,
    activeVmSnapshotCount: 15,
    lastSuccessfulBackupDate: '2025-03-14',
    backupVerificationStatus: 'Verified',
    lastSuccessfulPatrikTestDate: '2025-03-10',

    // Historical Data
    previousPatchSuccessRate: 73.2,
    meanTimeBetweenFailures: 557,
    lastFailureDate: '2024-08-09',
    incidentCount90Days: 10,
    knownIssuesWithTargetVersion: 0,

    // Business Impact
    businessCriticalityScore: 59,
    slaLevel: 'Silver',
    serviceWindowStart: '02:00',
    serviceWindowEnd: '06:00',
    serviceWindowDay: 'Friday',
    userImpactCount: 1411,
    businessProcessesImpacted: 24,
    applicationTiersHosted: ['Integration', 'Middleware', 'Analytics', 'Database', 'Application', 'Batch', 'Web'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: false,
    powerState: 'poweredOn',
    cpuUsageMhz: 263923,
    cpuUsagePercentage: 58,
    memoryUsageGB: 269,
    memoryUsagePercentage: 58,
    uptimeDays: 207,

    // Standard Configuration
    ntpServer: 'ntp.vmware.local',
    sshEnabled: true,
    lockdownMode: 'strict',
    hyperthreadingEnabled: true,

    // Advanced Features
    evcMode: 'intel-cascadelake',
    vGpuEnabled: true,
    nestedVirtualizationEnabled: false,

    // DRS and HA Configuration
    drsAutomationLevel: 'fullyAutomated',
    drsVmotionRate: 5,
    haEnabled: true,
    haPriority: 'low',

    // Change Management
    lastPatchDate: '2024-10-30',
    lastBootTime: '2024-12-21T06:42:49Z',
    lastChangeRequestID: 'CR-20241223-379',
    lastChangeRequestStatus: 'Failed',
    pendingChangeRequestID: 'CR-20250424-804',
    changeWindowAssigned: true,
    changeRiskScore: 43,

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 0,
    criticalVulnerabilityCount: 1,
    lastSecurityScanDate: '2025-02-17',
    securityBaselineVariance: 15,
    pciCompliance: false,
    hipaaCompliance: true
})

CREATE (esxi_7451:ESXiHost {
    // Basic Identification
    id: 'host-7451',
    name: 'esxi7451.vmware.local',
    uuid: 'b2e87a81-0cf2-4ad8-a69c-fa2432ff8a1a',
    fqdn: 'esxi7451.vmware.local',
    managementIP: '192.168.10.114',
    vMotionIP: '10.10.10.114',
    storageIP: '10.20.10.114',

    // Version and Build
    version: '8.0.0',
    buildNumber: '85269573',
    targetVersion: '8.0.1',
    targetBuildNumber: '65901215',
    versionGap: 'Patch',
    upgradePath: 'Direct',

    // Hardware Details
    vendor: 'Dell Inc.',
    model: 'PowerEdge R840',
    serialNumber: 'BN4P3XNHDH',
    lifecycleStatus: 'End of Life',
    endOfSupportDate: '2024-04-20',

    // CPU and Memory Information
    cpuType: 'Intel(R) Xeon(R) Gold 6348 CPU @ 2.60GHz',
    cpuSockets: 8,
    cpuCoresPerSocket: 16,
    cpuThreadsPerCore: 2,
    cpuTotalCores: 128,
    cpuTotalThreads: 256,
    cpuSpeed: 3841,
    memoryGB: 256,
    memoryAvailableGB: 239,
    memoryOverheadGB: 17,

    // Workload Impact Parameters
    vmCount: 58,
    poweredOnVmCount: 40,
    criticalVmCount: 10,
    criticalVmPercentage: 17.2,
    vCpuToCoreFactor: 6.2,
    memoryOvercommitFactor: 1.5,

    // Infrastructure Resilience
    clusterN1Capacity: true,
    clusterN2Capacity: false,
    haStatus: 'Degraded',
    networkRedundancy: 'Full',
    storageRedundancy: 'Partial',
    redundantPowerSupplies: true,

    // Technical Compatibility
    hardwareCompatibilityStatus: 'FullyCompatible',
    driverUpdatesRequired: 0,
    firmwareUpdatesRequired: 1,
    customVibCount: 10,
    thirdPartyExtensionCount: 2,
    compatibilityRisk: 'Low',

    // Operational Factors
    vMotionEligibleVmPercentage: 73.1,
    estimatedDowntimeMinutes: 34,
    configurationDriftScore: 53,
    activeVmSnapshotCount: 19,
    lastSuccessfulBackupDate: '2025-03-15',
    backupVerificationStatus: 'Partial',
    lastSuccessfulPatrikTestDate: '2025-02-20',

    // Historical Data
    previousPatchSuccessRate: 76.8,
    meanTimeBetweenFailures: 168,
    lastFailureDate: '2024-06-30',
    incidentCount90Days: 9,
    knownIssuesWithTargetVersion: 0,

    // Business Impact
    businessCriticalityScore: 53,
    slaLevel: 'Gold',
    serviceWindowStart: '01:00',
    serviceWindowEnd: '05:00',
    serviceWindowDay: 'Saturday',
    userImpactCount: 870,
    businessProcessesImpacted: 17,
    applicationTiersHosted: ['Middleware', 'Analytics', 'Integration', 'Batch', 'Application'],

    // General Status and Performance
    connectionState: 'connected',
    maintenanceMode: true,
    powerState: 'poweredOff',
    cpuUsageMhz: 0,
    cpuUsagePercentage: 0,
    memoryUsageGB: 0,
    memoryUsagePercentage: 0,
    uptimeDays: 0,

    // Standard Configuration
    ntpServer: 'time.windows.com',
    sshEnabled: true,
    lockdownMode: 'disabled',
    hyperthreadingEnabled: true,

    // Advanced Features
    evcMode: 'amd-milan',
    vGpuEnabled: true,
    nestedVirtualizationEnabled: true,

    // DRS and HA Configuration
    drsAutomationLevel: 'partiallyAutomated',
    drsVmotionRate: 1,
    haEnabled: true,
    haPriority: 'high',

    // Change Management
    lastPatchDate: '2025-01-29',
    lastBootTime: '2025-03-12T03:25:07Z',
    lastChangeRequestID: 'CR-20241227-962',
    lastChangeRequestStatus: 'Canceled',
    pendingChangeRequestID: 'CR-20250429-908',
    changeWindowAssigned: true,
    changeRiskScore: 36,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 1,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-08',
    securityBaselineVariance: 14,
    pciCompliance: false,
    hipaaCompliance: true
})

// vCenter Servers
CREATE (vc_8348:VCenterServer {
    // Basic Identification
    id: 'vc-8348',
    name: 'vcenter8348.vmware.local',
    uuid: 'b66cae15-5a6a-41b2-9117-9fa56626ab0e',
    fqdn: 'vcenter8348.vmware.local',
    instanceId: 'e2731bd2',
    managementIP: '192.168.1.252',

    // Version and Build
    version: '7.0.3',
    buildNumber: '27216444',
    targetVersion: '8.0.2',
    targetBuildNumber: '36550852',
    versionGap: 'Major',
    upgradePath: 'Direct',

    // Deployment Type
    deploymentType: 'VCSA Appliance',
    deploymentSize: 'tiny',
    deploymentTopology: 'HA',

    // Resource Allocation
    cpuCount: 2,
    memoryGB: 12,
    diskGB: 300,

    // Capacity and Scale
    maxHostCapacity: 10,
    maxVMCapacity: 100,
    currentHostCount: 10,
    currentVMCount: 61,
    currentClusterCount: 1,
    currentDatacenterCount: 1,
    hostUtilizationPercentage: 100.0,
    vmUtilizationPercentage: 61.0,

    // Database Configuration
    databaseType: 'Embedded PostgreSQL',
    databaseSizeGB: 120,
    databaseStatusHealth: 'yellow',

    // Authentication and SSO
    authenticationProviders: ['SAML'],
    ssoDomain: 'vsphere.local',
    ssoSiteId: 'default-site',
    passwordExpirationEnabled: true,
    passwordExpirationDays: 67,
    lockoutEnabled: false,
    lockoutFailureCount: 8,

    // Performance and Status
    cpuUsagePercentage: 5,
    memoryUsagePercentage: 73,
    diskUsagePercentage: 74,
    serviceStatusHealth: 'yellow',
    serviceUptime: 180,

    // High Availability
    haEnabled: true,
    haMode: 'Active-Passive',
    haStatus: 'Protected',
    haLastFailoverDate: 'None',
    haAutomaticFailover: true,

    // Networking Configuration
    networkInterfaceCount: 2,
    networkVlanId: 3242,
    firewallEnabled: false,
    ipv6Enabled: false,

    // License and Support
    licenseEdition: 'Enterprise Plus',
    licensedHostCount: 18,
    licenseExpirationDate: '2028-11-04',
    supportLevel: 'Mission Critical',
    supportExpirationDate: '2028-11-04',

    // Change Management
    lastPatchDate: '2025-01-14',
    lastBootTime: '2024-12-03T15:07:57Z',
    lastChangeRequestID: 'CR-20250106-418',
    lastChangeRequestStatus: 'Canceled',
    pendingChangeRequestID: 'CR-20250402-984',
    changeWindowAssigned: true,
    changeRiskScore: 90,

    // Business Impact
    businessCriticalityScore: 80,
    slaLevel: 'Gold',
    serviceWindowStart: '00:00',
    serviceWindowEnd: '03:00',
    serviceWindowDay: 'Saturday',
    userImpactCount: 183,
    businessServicesImpacted: 23,

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 0,
    criticalVulnerabilityCount: 1,
    lastSecurityScanDate: '2025-03-16',
    securityBaselineVariance: 7,
    pciCompliance: true,
    hipaaCompliance: true,

    // Backup Configuration
    backupScheduled: true,
    backupFrequency: 'Monthly',
    lastSuccessfulBackupDate: '2025-03-16',
    lastBackupStatus: 'Successful',
    backupRetentionDays: 85,
    disasterRecoveryEnabled: false
})

CREATE (vc_3546:VCenterServer {
    // Basic Identification
    id: 'vc-3546',
    name: 'vcenter3546.vmware.local',
    uuid: '45507b6c-a917-452f-8b2c-34ef5bfcafbc',
    fqdn: 'vcenter3546.vmware.local',
    instanceId: '9e8795a2',
    managementIP: '192.168.1.4',

    // Version and Build
    version: '7.0.3',
    buildNumber: '80328604',
    targetVersion: '8.0.2',
    targetBuildNumber: '65227117',
    versionGap: 'Major',
    upgradePath: 'Complex',

    // Deployment Type
    deploymentType: 'VCSA Appliance',
    deploymentSize: 'large',
    deploymentTopology: 'Standalone',

    // Resource Allocation
    cpuCount: 16,
    memoryGB: 32,
    diskGB: 740,

    // Capacity and Scale
    maxHostCapacity: 1000,
    maxVMCapacity: 10000,
    currentHostCount: 670,
    currentVMCount: 7233,
    currentClusterCount: 19,
    currentDatacenterCount: 2,
    hostUtilizationPercentage: 67.0,
    vmUtilizationPercentage: 72.3,

    // Database Configuration
    databaseType: 'Embedded PostgreSQL',
    databaseSizeGB: 296,
    databaseStatusHealth: 'red',

    // Authentication and SSO
    authenticationProviders: ['Active Directory', 'RSA SecurID'],
    ssoDomain: 'vsphere.local',
    ssoSiteId: 'default-site',
    passwordExpirationEnabled: false,
    passwordExpirationDays: 50,
    lockoutEnabled: false,
    lockoutFailureCount: 8,

    // Performance and Status
    cpuUsagePercentage: 50,
    memoryUsagePercentage: 90,
    diskUsagePercentage: 41,
    serviceStatusHealth: 'yellow',
    serviceUptime: 46,

    // High Availability
    haEnabled: false,
    haMode: 'None',
    haStatus: 'NotConfigured',
    haLastFailoverDate: 'None',
    haAutomaticFailover: false,

    // Networking Configuration
    networkInterfaceCount: 4,
    networkVlanId: 1077,
    firewallEnabled: true,
    ipv6Enabled: true,

    // License and Support
    licenseEdition: 'Enterprise Plus',
    licensedHostCount: 768,
    licenseExpirationDate: '2027-11-24',
    supportLevel: 'Basic',
    supportExpirationDate: '2027-11-24',

    // Change Management
    lastPatchDate: '2025-01-24',
    lastBootTime: '2025-03-12T21:53:39Z',
    lastChangeRequestID: 'CR-20250118-475',
    lastChangeRequestStatus: 'Failed',
    pendingChangeRequestID: 'CR-20250414-072',
    changeWindowAssigned: true,
    changeRiskScore: 80,

    // Business Impact
    businessCriticalityScore: 85,
    slaLevel: 'Gold',
    serviceWindowStart: '00:00',
    serviceWindowEnd: '02:00',
    serviceWindowDay: 'Sunday',
    userImpactCount: 7233,
    businessServicesImpacted: 25,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 4,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-16',
    securityBaselineVariance: 6,
    pciCompliance: true,
    hipaaCompliance: true,

    // Backup Configuration
    backupScheduled: false,
    backupFrequency: 'Bi-Weekly',
    lastSuccessfulBackupDate: '2025-03-09',
    lastBackupStatus: 'Successful',
    backupRetentionDays: 223,
    disasterRecoveryEnabled: false
})

CREATE (vc_6729:VCenterServer {
    // Basic Identification
    id: 'vc-6729',
    name: 'vcenter6729.vmware.local',
    uuid: 'f25f63c2-6282-4892-8300-dda9ec2bd94a',
    fqdn: 'vcenter6729.vmware.local',
    instanceId: '95cca0c4',
    managementIP: '192.168.1.151',

    // Version and Build
    version: '7.0.3',
    buildNumber: '26005247',
    targetVersion: '8.0.2',
    targetBuildNumber: '16234689',
    versionGap: 'Major',
    upgradePath: 'Direct',

    // Deployment Type
    deploymentType: 'Windows-based',
    deploymentSize: 'tiny',
    deploymentTopology: 'Standalone',

    // Resource Allocation
    cpuCount: 2,
    memoryGB: 12,
    diskGB: 300,

    // Capacity and Scale
    maxHostCapacity: 10,
    maxVMCapacity: 100,
    currentHostCount: 10,
    currentVMCount: 98,
    currentClusterCount: 1,
    currentDatacenterCount: 1,
    hostUtilizationPercentage: 100.0,
    vmUtilizationPercentage: 98.0,

    // Database Configuration
    databaseType: 'PostgreSQL',
    databaseSizeGB: 120,
    databaseStatusHealth: 'red',

    // Authentication and SSO
    authenticationProviders: ['Active Directory', 'LDAP'],
    ssoDomain: 'vsphere.local',
    ssoSiteId: 'default-site',
    passwordExpirationEnabled: false,
    passwordExpirationDays: 50,
    lockoutEnabled: true,
    lockoutFailureCount: 5,

    // Performance and Status
    cpuUsagePercentage: 57,
    memoryUsagePercentage: 47,
    diskUsagePercentage: 66,
    serviceStatusHealth: 'red',
    serviceUptime: 371,

    // High Availability
    haEnabled: false,
    haMode: 'None',
    haStatus: 'NotConfigured',
    haLastFailoverDate: 'None',
    haAutomaticFailover: false,

    // Networking Configuration
    networkInterfaceCount: 2,
    networkVlanId: 775,
    firewallEnabled: false,
    ipv6Enabled: true,

    // License and Support
    licenseEdition: 'Enterprise Plus',
    licensedHostCount: 20,
    licenseExpirationDate: '2027-05-18',
    supportLevel: 'Business Critical',
    supportExpirationDate: '2027-05-18',

    // Change Management
    lastPatchDate: '2025-02-26',
    lastBootTime: '2024-07-18T17:18:03Z',
    lastChangeRequestID: 'CR-20250127-519',
    lastChangeRequestStatus: 'Completed',
    pendingChangeRequestID: 'CR-20250418-747',
    changeWindowAssigned: false,
    changeRiskScore: 93,

    // Business Impact
    businessCriticalityScore: 88,
    slaLevel: 'Platinum',
    serviceWindowStart: '04:00',
    serviceWindowEnd: '06:00',
    serviceWindowDay: 'Sunday',
    userImpactCount: 98,
    businessServicesImpacted: 43,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 2,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-15',
    securityBaselineVariance: 7,
    pciCompliance: true,
    hipaaCompliance: true,

    // Backup Configuration
    backupScheduled: true,
    backupFrequency: 'Weekly',
    lastSuccessfulBackupDate: '2025-03-03',
    lastBackupStatus: 'Successful',
    backupRetentionDays: 303,
    disasterRecoveryEnabled: true
})

CREATE (vc_5451:VCenterServer {
    // Basic Identification
    id: 'vc-5451',
    name: 'vcenter5451.vmware.local',
    uuid: '5df7b49e-f1f1-47d2-8417-a582a83ca4eb',
    fqdn: 'vcenter5451.vmware.local',
    instanceId: '09ce8b86',
    managementIP: '192.168.1.138',

    // Version and Build
    version: '7.0.0',
    buildNumber: '31448059',
    targetVersion: '8.0.2',
    targetBuildNumber: '83156221',
    versionGap: 'Major',
    upgradePath: 'Direct',

    // Deployment Type
    deploymentType: 'VCSA Appliance',
    deploymentSize: 'small',
    deploymentTopology: 'Enhanced Linked Mode',

    // Resource Allocation
    cpuCount: 4,
    memoryGB: 16,
    diskGB: 340,

    // Capacity and Scale
    maxHostCapacity: 100,
    maxVMCapacity: 1000,
    currentHostCount: 76,
    currentVMCount: 918,
    currentClusterCount: 1,
    currentDatacenterCount: 1,
    hostUtilizationPercentage: 76.0,
    vmUtilizationPercentage: 91.8,

    // Database Configuration
    databaseType: 'Embedded PostgreSQL',
    databaseSizeGB: 136,
    databaseStatusHealth: 'green',

    // Authentication and SSO
    authenticationProviders: ['Local OS', 'SAML'],
    ssoDomain: 'vsphere.local',
    ssoSiteId: 'default-site',
    passwordExpirationEnabled: true,
    passwordExpirationDays: 132,
    lockoutEnabled: true,
    lockoutFailureCount: 8,

    // Performance and Status
    cpuUsagePercentage: 22,
    memoryUsagePercentage: 74,
    diskUsagePercentage: 60,
    serviceStatusHealth: 'yellow',
    serviceUptime: 74,

    // High Availability
    haEnabled: false,
    haMode: 'None',
    haStatus: 'NotConfigured',
    haLastFailoverDate: 'None',
    haAutomaticFailover: false,

    // Networking Configuration
    networkInterfaceCount: 4,
    networkVlanId: 2242,
    firewallEnabled: false,
    ipv6Enabled: false,

    // License and Support
    licenseEdition: 'Enterprise',
    licensedHostCount: 106,
    licenseExpirationDate: '2025-01-28',
    supportLevel: 'Production',
    supportExpirationDate: '2025-01-28',

    // Change Management
    lastPatchDate: '2024-12-27',
    lastBootTime: '2025-03-05T23:59:53Z',
    lastChangeRequestID: 'CR-20250210-414',
    lastChangeRequestStatus: 'Failed',
    pendingChangeRequestID: 'CR-20250331-140',
    changeWindowAssigned: false,
    changeRiskScore: 93,

    // Business Impact
    businessCriticalityScore: 82,
    slaLevel: 'Gold',
    serviceWindowStart: '04:00',
    serviceWindowEnd: '08:00',
    serviceWindowDay: 'Saturday',
    userImpactCount: 918,
    businessServicesImpacted: 45,

    // Compliance and Security
    complianceStatus: 'unknown',
    securityProfileStatus: 'warning',
    vulnerablilityCount: 7,
    criticalVulnerabilityCount: 2,
    lastSecurityScanDate: '2025-02-27',
    securityBaselineVariance: 14,
    pciCompliance: false,
    hipaaCompliance: true,

    // Backup Configuration
    backupScheduled: true,
    backupFrequency: 'Weekly',
    lastSuccessfulBackupDate: '2025-03-12',
    lastBackupStatus: 'Successful',
    backupRetentionDays: 154,
    disasterRecoveryEnabled: false
})

CREATE (vc_5728:VCenterServer {
    // Basic Identification
    id: 'vc-5728',
    name: 'vcenter5728.vmware.local',
    uuid: 'feeeaa57-b584-4bad-a712-bbaaac5aa591',
    fqdn: 'vcenter5728.vmware.local',
    instanceId: 'accc976e',
    managementIP: '192.168.1.162',

    // Version and Build
    version: '8.0.1',
    buildNumber: '59306243',
    targetVersion: '8.0.2',
    targetBuildNumber: '74171356',
    versionGap: 'Patch',
    upgradePath: 'Direct',

    // Deployment Type
    deploymentType: 'VCSA Appliance',
    deploymentSize: 'medium',
    deploymentTopology: 'Standalone',

    // Resource Allocation
    cpuCount: 8,
    memoryGB: 24,
    diskGB: 525,

    // Capacity and Scale
    maxHostCapacity: 400,
    maxVMCapacity: 4000,
    currentHostCount: 90,
    currentVMCount: 1240,
    currentClusterCount: 5,
    currentDatacenterCount: 1,
    hostUtilizationPercentage: 22.5,
    vmUtilizationPercentage: 31.0,

    // Database Configuration
    databaseType: 'Embedded PostgreSQL',
    databaseSizeGB: 210,
    databaseStatusHealth: 'green',

    // Authentication and SSO
    authenticationProviders: ['Local OS', 'SAML', 'Smart Card'],
    ssoDomain: 'vsphere.local',
    ssoSiteId: 'default-site',
    passwordExpirationEnabled: true,
    passwordExpirationDays: 143,
    lockoutEnabled: true,
    lockoutFailureCount: 8,

    // Performance and Status
    cpuUsagePercentage: 45,
    memoryUsagePercentage: 68,
    diskUsagePercentage: 54,
    serviceStatusHealth: 'red',
    serviceUptime: 172,

    // High Availability
    haEnabled: false,
    haMode: 'None',
    haStatus: 'NotConfigured',
    haLastFailoverDate: 'None',
    haAutomaticFailover: false,

    // Networking Configuration
    networkInterfaceCount: 2,
    networkVlanId: 3453,
    firewallEnabled: true,
    ipv6Enabled: true,

    // License and Support
    licenseEdition: 'Enterprise Plus',
    licensedHostCount: 95,
    licenseExpirationDate: '2026-01-15',
    supportLevel: 'Business Critical',
    supportExpirationDate: '2026-01-15',

    // Change Management
    lastPatchDate: '2025-03-06',
    lastBootTime: '2025-01-18T01:07:47Z',
    lastChangeRequestID: 'CR-20241220-606',
    lastChangeRequestStatus: 'Completed',
    pendingChangeRequestID: 'CR-20250329-171',
    changeWindowAssigned: true,
    changeRiskScore: 44,

    // Business Impact
    businessCriticalityScore: 81,
    slaLevel: 'Gold',
    serviceWindowStart: '03:00',
    serviceWindowEnd: '08:00',
    serviceWindowDay: 'Sunday',
    userImpactCount: 3720,
    businessServicesImpacted: 33,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityProfileStatus: 'compliant',
    vulnerablilityCount: 0,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-16',
    securityBaselineVariance: 13,
    pciCompliance: false,
    hipaaCompliance: true,

    // Backup Configuration
    backupScheduled: false,
    backupFrequency: 'Daily',
    lastSuccessfulBackupDate: '2025-03-14',
    lastBackupStatus: 'Successful',
    backupRetentionDays: 141,
    disasterRecoveryEnabled: true
})

// vSphere Clusters
CREATE (cluster_4581:VSphereCluster {
    // Basic Identification
    id: 'cluster-4581',
    name: 'Cluster-4581',
    moRef: 'domain-c6623',
    clusterType: 'VDI',
    datacenter: 'DC-East',

    // Capacity and Scale
    hostCount: 27,
    vmCount: 297,
    totalCpuCores: 1431,
    totalMemoryGB: 20196,
    allocatedCpuPercentage: 54.8,
    allocatedMemoryPercentage: 85.5,
    cpuOvercommitRatio: 4.2,
    memoryOvercommitRatio: 2.3,

    // HA Configuration
    haEnabled: true,
    haAdmissionControlPolicy: 'hostFailures',
    haHostFailuresTolerate: 3,
    haSlotCpuMHz: 1088,
    haSlotMemoryMB: 2085,
    haVmMonitoring: 'vmAndAppMonitoring',
    haRestartPriority: 'disabled',
    haIsolationResponse: 'powerOff',

    // DRS Configuration
    drsEnabled: true,
    drsAutomationLevel: 'manual',
    drsMigrationThreshold: 5,
    drsVmHardwareCompatibility: false,
    predictiveDrs: true,
    vmDistribution: 'powerManagement',

    // Advanced Features
    evcMode: 'intel-cascadelake',
    evcModeEnabled: true,
    vSanEnabled: true,
    vmEncryptionEnabled: false,
    proactiveHaEnabled: true,

    // Resource Management
    resourcePoolCount: 6,
    dpmEnabled: true,
    dpmAutomationLevel: 'automated',
    dpmThreshold: 1,

    // Performance and Health
    overallStatus: 'green',
    cpuUsagePercentage: 44.8,
    memoryUsagePercentage: 47.5,
    currentCpuFailoverCapacity: 55,
    currentMemoryFailoverCapacity: 52,
    vmCpuReadiness: 4.57,
    vmMemorySwapRate: 3.63,

    // Business Impact
    businessCriticalityScore: 83,
    slaLevel: 'Platinum',
    serviceWindowStart: '02:00',
    serviceWindowEnd: '09:00',
    serviceWindowDay: 'Saturday',
    estimatedImpactUsers: 8316,

    // Change Management
    lastConfigChangeDate: '2025-01-02',
    changeRiskScore: 76,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Plan for extended maintenance window', 'Prepare detailed rollback plan', 'Pre-notify all stakeholders', 'Schedule during lowest usage period', 'Perform on subset of cluster first'],

    // Compliance and Operations
    complianceStatus: 'nonCompliant',
    lastSuccessfulVmotionDate: '2025-03-04',
    vmotionSuccessRate: 99.2,
    lastDrsInvocationDate: '2025-03-16',
    lastDrsRecommendationCount: 5,
    unplannedOutageCount90Days: 3,
    plannedOutageCount90Days: 1,
    totalDowntimeMinutes90Days: 439
})

CREATE (cluster_2856:VSphereCluster {
    // Basic Identification
    id: 'cluster-2856',
    name: 'Cluster-2856',
    moRef: 'domain-c1003',
    clusterType: 'Management',
    datacenter: 'DC-APAC',

    // Capacity and Scale
    hostCount: 8,
    vmCount: 72,
    totalCpuCores: 616,
    totalMemoryGB: 4808,
    allocatedCpuPercentage: 94.3,
    allocatedMemoryPercentage: 76.2,
    cpuOvercommitRatio: 4.7,
    memoryOvercommitRatio: 1.6,

    // HA Configuration
    haEnabled: true,
    haAdmissionControlPolicy: 'hostFailures',
    haHostFailuresTolerate: 3,
    haSlotCpuMHz: 1988,
    haSlotMemoryMB: 2759,
    haVmMonitoring: 'disabled',
    haRestartPriority: 'medium',
    haIsolationResponse: 'leave',

    // DRS Configuration
    drsEnabled: false,
    drsAutomationLevel: 'manual',
    drsMigrationThreshold: 3,
    drsVmHardwareCompatibility: false,
    predictiveDrs: false,
    vmDistribution: 'even',

    // Advanced Features
    evcMode: 'disabled',
    evcModeEnabled: false,
    vSanEnabled: true,
    vmEncryptionEnabled: true,
    proactiveHaEnabled: false,

    // Resource Management
    resourcePoolCount: 5,
    dpmEnabled: false,
    dpmAutomationLevel: 'manual',
    dpmThreshold: 3,

    // Performance and Health
    overallStatus: 'yellow',
    cpuUsagePercentage: 29.1,
    memoryUsagePercentage: 65.5,
    currentCpuFailoverCapacity: 71,
    currentMemoryFailoverCapacity: 34,
    vmCpuReadiness: 4.56,
    vmMemorySwapRate: 3.55,

    // Business Impact
    businessCriticalityScore: 86,
    slaLevel: 'Gold',
    serviceWindowStart: '04:00',
    serviceWindowEnd: '10:00',
    serviceWindowDay: 'Sunday',
    estimatedImpactUsers: 1584,

    // Change Management
    lastConfigChangeDate: '2025-03-13',
    changeRiskScore: 61,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Standard maintenance window', 'Prepare rollback plan', 'Notify key stakeholders', 'Schedule during off-hours'],

    // Compliance and Operations
    complianceStatus: 'compliant',
    lastSuccessfulVmotionDate: '2025-03-05',
    vmotionSuccessRate: 97.6,
    lastDrsInvocationDate: '2025-03-10',
    lastDrsRecommendationCount: 19,
    unplannedOutageCount90Days: 0,
    plannedOutageCount90Days: 0,
    totalDowntimeMinutes90Days: 0
})

// vSAN Clusters
CREATE (vsan_6301:VSANCluster {
    // Basic Identification
    id: 'vsan-6301',
    name: 'vSAN-Cluster-6301',
    uuid: '0c497a85-cb94-4db5-90cc-c49e23a0b2a5',
    associatedCluster: 'Cluster-1598',

    // vSAN Configuration
    vsanVersion: '6.7',
    vsanFileServicesEnabled: false,
    deploymentType: 'Hybrid',
    stretchedClusterEnabled: true,
    secondarySite: 'DR-Site',
    witnessHost: 'witness-1.vsanwitness.local',
    preferredSite: 'Primary',
    sitePingLatency: 6,
    encryptionEnabled: true,
    encryptionKmsServer: 'kms.company.local',
    checksumEnabled: true,
    rebuildDelay: 83,

    // Capacity and Resources
    hostCount: 10,
    diskGroupsPerHost: 3,
    totalCacheTierTB: 11.7,
    totalCapacityTierTB: 234.4,
    totalRawCapacityTB: 234.4,
    deduplicationEnabled: false,
    compressionEnabled: false,
    dedupeRatio: 1.0,
    spaceEfficiencyRatio: 1.0,
    effectiveCapacityTB: 234.4,
    usedCapacityTB: 107.3,
    freeCapacityTB: 127.1,
    capacityUtilizationPercentage: 45.8,

    // Storage Policy and Configuration
    defaultPolicyName: 'vSAN Default Storage Policy',
    storagePolicyCount: 3,
    primaryFailureToleranceMethod: 'RAID-1+RAID-5',
    primaryFailuresToTolerate: 3,
    secondaryFailuresToTolerate: 2,
    objectRepairTimer: 60,
    diskStripeWidth: 12,

    // Performance and Health
    overallHealth: 'red',
    diskHealth: 'red',
    networkHealth: 'green',
    dataHealth: 'green',
    clusterHealth: 'green',
    averageReadLatencyMs: 7.27,
    averageWriteLatencyMs: 2.19,
    iopsRead: 22316,
    iopsWrite: 18400,
    throughputReadMBps: 1210,
    throughputWriteMBps: 266,
    congestionPercentage: 3.9,

    // Operational Status
    rebuildingComponents: 3,
    degradedComponents: 1,
    rebalancingPercentage: 74,
    resyncingPercentage: 60,

    // Resiliency Status
    dataAtRisk: false,
    hostFailuresClusterToleratesNow: 3,

    // Change Management
    lastComponentReplacementDate: '2024-12-24',
    lastStoragePolicyChangeDate: '2025-02-03',
    lastCapacityExpansionDate: '2024-10-12',
    changeRiskScore: 100,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule extended maintenance window', 'Verify backup of critical VMs', 'Pre-evacuate non-essential workloads', 'Have vendor support on standby', 'Validate stretched cluster witness connectivity'],

    // Business Impact
    businessCriticalityScore: 96,
    slaLevel: 'Platinum',
    estimatedVmsImpacted: 129,
    estimatedUsersImpacted: 1161
})

// Datastores
CREATE (ds_6451:Datastore {
    // Basic Identification
    id: 'datastore-6451',
    name: 'SAN-LUN6451',
    moRef: 'datastore-6953',
    url: 'ds:///SAN-LUN6451',

    // Datastore Type and Configuration
    type: 'VMFS',
    filesystemVersion: 'VMFS-6',
    blockSizeKB: 8,
    maxFileSize: '62TB',
    storageArrayType: 'iSCSI',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 8192,
    provisionedGB: 8339.2,
    usedGB: 4136.8,
    freeGB: 4055.2,
    freePercentage: 49.5,
    spaceStatus: 'normal',

    // Performance and Status
    overallStatus: 'green',
    accessible: false,
    accessibilityIssue: 'APD condition',
    maintenanceMode: true,
    averageReadLatencyMs: 2.4,
    averageWriteLatencyMs: 8.28,
    maxReadLatencyMs: 11.83,
    maxWriteLatencyMs: 27.29,
    iopsRead: 13535,
    iopsWrite: 8325,
    throughputReadMBps: 523,
    throughputWriteMBps: 835,

    // Multipathing and Connectivity
    multipathingPolicy: 'RR',
    pathCount: 6,
    activePathCount: 1,
    deadPathCount: 2,
    standbyPathCount: 3,

    // VM Content
    vmCount: 54,
    templateCount: 3,
    isoCount: 15,
    totalVmdkCount: 182,
    snapshotVmdkCount: 0,
    criticalVmCount: 3,
    productionVmCount: 24,

    // Change Management
    lastExpansionDate: '2024-11-13',
    lastFilesystemCheckDate: '2025-02-14',
    lastPerformanceIssueDate: '2025-01-11',
    changeRiskScore: 75,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Migrate critical VMs prior to maintenance', 'Ensure multiple backups available', 'Validate storage connectivity pre-change', 'Prepare rollback plan', 'Schedule extended maintenance window', 'Test change in a similar environment first'],

    // Business Impact
    businessCriticalityScore: 78,
    slaLevel: 'Silver',
    estimatedUsersImpacted: 810,
    businessServicesImpacted: 2
})

CREATE (ds_2550:Datastore {
    // Basic Identification
    id: 'datastore-2550',
    name: 'DS2550',
    moRef: 'datastore-3309',
    url: 'ds:///DS2550',

    // Datastore Type and Configuration
    type: 'VMFS',
    filesystemVersion: 'VMFS-5',
    blockSizeKB: 2,
    maxFileSize: '2TB',
    storageArrayType: 'iSCSI',
    multipleExtents: true,

    // Capacity and Allocation
    capacityGB: 32768,
    provisionedGB: 37767.7,
    usedGB: 28296.0,
    freeGB: 4472.0,
    freePercentage: 13.6,
    spaceStatus: 'warning',

    // Performance and Status
    overallStatus: 'green',
    accessible: true,
    maintenanceMode: true,
    averageReadLatencyMs: 12.67,
    averageWriteLatencyMs: 13.21,
    maxReadLatencyMs: 49.36,
    maxWriteLatencyMs: 36.3,
    iopsRead: 44593,
    iopsWrite: 2928,
    throughputReadMBps: 165,
    throughputWriteMBps: 158,

    // Multipathing and Connectivity
    multipathingPolicy: 'VMW_PSP_MRU',
    pathCount: 10,
    activePathCount: 2,
    deadPathCount: 8,
    standbyPathCount: 0,

    // VM Content
    vmCount: 59,
    templateCount: 7,
    isoCount: 20,
    totalVmdkCount: 263,
    snapshotVmdkCount: 21,
    criticalVmCount: 11,
    productionVmCount: 14,

    // Change Management
    lastExpansionDate: '2024-11-12',
    lastFilesystemCheckDate: '2025-02-12',
    lastPerformanceIssueDate: '2024-12-10',
    changeRiskScore: 76,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Migrate critical VMs prior to maintenance', 'Ensure multiple backups available', 'Validate storage connectivity pre-change', 'Prepare rollback plan', 'Schedule extended maintenance window', 'Test change in a similar environment first'],

    // Business Impact
    businessCriticalityScore: 87,
    slaLevel: 'Platinum',
    estimatedUsersImpacted: 531,
    businessServicesImpacted: 7
})

CREATE (ds_5368:Datastore {
    // Basic Identification
    id: 'datastore-5368',
    name: 'DS5368',
    moRef: 'datastore-3591',
    url: 'ds:///DS5368',

    // Datastore Type and Configuration
    type: 'vSAN',
    vsanClusterId: 'vsan-7091',
    vsanObjectCount: 5613,
    defaultStoragePolicy: 'vSAN Default Storage Policy',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 16384,
    provisionedGB: 17425.6,
    usedGB: 8143.4,
    freeGB: 8240.6,
    freePercentage: 50.3,
    spaceStatus: 'normal',

    // Performance and Status
    overallStatus: 'green',
    accessible: true,
    maintenanceMode: true,
    averageReadLatencyMs: 12.09,
    averageWriteLatencyMs: 17.04,
    maxReadLatencyMs: 60.07,
    maxWriteLatencyMs: 40.94,
    iopsRead: 5599,
    iopsWrite: 25911,
    throughputReadMBps: 1727,
    throughputWriteMBps: 229,

    // Multipathing and Connectivity

    // VM Content
    vmCount: 52,
    templateCount: 5,
    isoCount: 17,
    totalVmdkCount: 79,
    snapshotVmdkCount: 6,
    criticalVmCount: 10,
    productionVmCount: 25,

    // Change Management
    lastExpansionDate: '2025-02-04',
    lastFilesystemCheckDate: '2025-01-02',
    lastPerformanceIssueDate: '2024-12-20',
    changeRiskScore: 43,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Verify recent backups', 'Schedule during off-hours', 'Migrate high-priority workloads if possible', 'Prepare basic rollback plan'],

    // Business Impact
    businessCriticalityScore: 78,
    slaLevel: 'Silver',
    estimatedUsersImpacted: 936,
    businessServicesImpacted: 5
})

CREATE (ds_9054:Datastore {
    // Basic Identification
    id: 'datastore-9054',
    name: 'DS9054',
    moRef: 'datastore-6651',
    url: 'ds:///DS9054',

    // Datastore Type and Configuration
    type: 'NFS',
    nfsVersion: '3',
    remoteHost: 'nfs-3.nas.local',
    remotePath: '/vol/DS9054',
    accessMode: 'ReadWrite',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 16384,
    provisionedGB: 5136.8,
    usedGB: 4746.9,
    freeGB: 11637.1,
    freePercentage: 71.0,
    spaceStatus: 'normal',

    // Performance and Status
    overallStatus: 'green',
    accessible: true,
    maintenanceMode: true,
    averageReadLatencyMs: 3.36,
    averageWriteLatencyMs: 24.37,
    maxReadLatencyMs: 14.49,
    maxWriteLatencyMs: 100.45,
    iopsRead: 14113,
    iopsWrite: 3400,
    throughputReadMBps: 417,
    throughputWriteMBps: 265,

    // Multipathing and Connectivity

    // VM Content
    vmCount: 59,
    templateCount: 9,
    isoCount: 18,
    totalVmdkCount: 73,
    snapshotVmdkCount: 2,
    criticalVmCount: 0,
    productionVmCount: 26,

    // Change Management
    lastExpansionDate: '2024-10-26',
    lastFilesystemCheckDate: '2025-02-12',
    lastPerformanceIssueDate: '2025-01-10',
    changeRiskScore: 41,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Verify recent backups', 'Schedule during off-hours', 'Migrate high-priority workloads if possible', 'Prepare basic rollback plan'],

    // Business Impact
    businessCriticalityScore: 79,
    slaLevel: 'Gold',
    estimatedUsersImpacted: 1180,
    businessServicesImpacted: 9
})

CREATE (ds_1656:Datastore {
    // Basic Identification
    id: 'datastore-1656',
    name: 'vSAN-DS1656',
    moRef: 'datastore-1678',
    url: 'ds:///vSAN-DS1656',

    // Datastore Type and Configuration
    type: 'Local',
    localPathOnHost: '/vmfs/volumes/local-15',
    hostId: 'host-7556',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 8192,
    provisionedGB: 3855.7,
    usedGB: 5982.5,
    freeGB: 2209.5,
    freePercentage: 27.0,
    spaceStatus: 'normal',

    // Performance and Status
    overallStatus: 'green',
    accessible: true,
    maintenanceMode: true,
    averageReadLatencyMs: 3.09,
    averageWriteLatencyMs: 17.45,
    maxReadLatencyMs: 6.93,
    maxWriteLatencyMs: 40.45,
    iopsRead: 10909,
    iopsWrite: 9704,
    throughputReadMBps: 685,
    throughputWriteMBps: 91,

    // Multipathing and Connectivity

    // VM Content
    vmCount: 13,
    templateCount: 10,
    isoCount: 13,
    totalVmdkCount: 27,
    snapshotVmdkCount: 2,
    criticalVmCount: 1,
    productionVmCount: 6,

    // Change Management
    lastExpansionDate: '2024-10-20',
    lastFilesystemCheckDate: '2025-02-07',
    lastPerformanceIssueDate: '2024-12-11',
    changeRiskScore: 57,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Verify recent backups', 'Schedule during off-hours', 'Migrate high-priority workloads if possible', 'Prepare basic rollback plan'],

    // Business Impact
    businessCriticalityScore: 44,
    slaLevel: 'Bronze',
    estimatedUsersImpacted: 78,
    businessServicesImpacted: 7
})

CREATE (ds_3998:Datastore {
    // Basic Identification
    id: 'datastore-3998',
    name: 'NFS-Vol3998',
    moRef: 'datastore-8518',
    url: 'ds:///NFS-Vol3998',

    // Datastore Type and Configuration
    type: 'VMFS',
    filesystemVersion: 'VMFS-6',
    blockSizeKB: 2,
    maxFileSize: '62TB',
    storageArrayType: 'FC',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 16384,
    provisionedGB: 8928.6,
    usedGB: 6559.1,
    freeGB: 9824.9,
    freePercentage: 60.0,
    spaceStatus: 'normal',

    // Performance and Status
    overallStatus: 'green',
    accessible: true,
    maintenanceMode: false,
    averageReadLatencyMs: 1.82,
    averageWriteLatencyMs: 12.83,
    maxReadLatencyMs: 6.72,
    maxWriteLatencyMs: 63.06,
    iopsRead: 2543,
    iopsWrite: 29638,
    throughputReadMBps: 587,
    throughputWriteMBps: 621,

    // Multipathing and Connectivity
    multipathingPolicy: 'VMW_PSP_FIXED',
    pathCount: 4,
    activePathCount: 4,
    deadPathCount: 0,
    standbyPathCount: 0,

    // VM Content
    vmCount: 86,
    templateCount: 1,
    isoCount: 20,
    totalVmdkCount: 247,
    snapshotVmdkCount: 0,
    criticalVmCount: 15,
    productionVmCount: 27,

    // Change Management
    lastExpansionDate: '2024-09-27',
    lastFilesystemCheckDate: '2024-12-28',
    lastPerformanceIssueDate: '2025-02-06',
    changeRiskScore: 50,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Verify recent backups', 'Schedule during off-hours', 'Migrate high-priority workloads if possible', 'Prepare basic rollback plan'],

    // Business Impact
    businessCriticalityScore: 88,
    slaLevel: 'Platinum',
    estimatedUsersImpacted: 430,
    businessServicesImpacted: 6
})

CREATE (ds_9608:Datastore {
    // Basic Identification
    id: 'datastore-9608',
    name: 'DS9608',
    moRef: 'datastore-5460',
    url: 'ds:///DS9608',

    // Datastore Type and Configuration
    type: 'NFS',
    nfsVersion: '3',
    remoteHost: 'nfs-8.nas.local',
    remotePath: '/vol/DS9608',
    accessMode: 'ReadOnly',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 16384,
    provisionedGB: 12612.1,
    usedGB: 5063.6,
    freeGB: 11320.4,
    freePercentage: 69.1,
    spaceStatus: 'normal',

    // Performance and Status
    overallStatus: 'green',
    accessible: true,
    maintenanceMode: false,
    averageReadLatencyMs: 24.27,
    averageWriteLatencyMs: 4.43,
    maxReadLatencyMs: 76.16,
    maxWriteLatencyMs: 13.88,
    iopsRead: 13086,
    iopsWrite: 5047,
    throughputReadMBps: 846,
    throughputWriteMBps: 316,

    // Multipathing and Connectivity

    // VM Content
    vmCount: 56,
    templateCount: 7,
    isoCount: 18,
    totalVmdkCount: 176,
    snapshotVmdkCount: 17,
    criticalVmCount: 1,
    productionVmCount: 5,

    // Change Management
    lastExpansionDate: '2025-03-02',
    lastFilesystemCheckDate: '2025-01-26',
    lastPerformanceIssueDate: '2025-03-10',
    changeRiskScore: 45,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Verify recent backups', 'Schedule during off-hours', 'Migrate high-priority workloads if possible', 'Prepare basic rollback plan'],

    // Business Impact
    businessCriticalityScore: 37,
    slaLevel: 'Silver',
    estimatedUsersImpacted: 448,
    businessServicesImpacted: 3
})

CREATE (ds_3755:Datastore {
    // Basic Identification
    id: 'datastore-3755',
    name: 'VMFS-3755',
    moRef: 'datastore-5450',
    url: 'ds:///VMFS-3755',

    // Datastore Type and Configuration
    type: 'vSAN',
    vsanClusterId: 'vsan-1652',
    vsanObjectCount: 5413,
    defaultStoragePolicy: 'vSAN Default Storage Policy',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 512,
    provisionedGB: 313.3,
    usedGB: 251.1,
    freeGB: 260.9,
    freePercentage: 51.0,
    spaceStatus: 'normal',

    // Performance and Status
    overallStatus: 'green',
    accessible: false,
    accessibilityIssue: 'Maintenance mode',
    maintenanceMode: true,
    averageReadLatencyMs: 12.68,
    averageWriteLatencyMs: 17.11,
    maxReadLatencyMs: 58.81,
    maxWriteLatencyMs: 47.75,
    iopsRead: 28711,
    iopsWrite: 12166,
    throughputReadMBps: 1425,
    throughputWriteMBps: 1373,

    // Multipathing and Connectivity

    // VM Content
    vmCount: 56,
    templateCount: 10,
    isoCount: 6,
    totalVmdkCount: 95,
    snapshotVmdkCount: 9,
    criticalVmCount: 4,
    productionVmCount: 21,

    // Change Management
    lastExpansionDate: '2024-11-23',
    lastFilesystemCheckDate: '2025-02-04',
    lastPerformanceIssueDate: '2025-02-09',
    changeRiskScore: 89,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Migrate critical VMs prior to maintenance', 'Ensure multiple backups available', 'Validate storage connectivity pre-change', 'Prepare rollback plan', 'Schedule extended maintenance window', 'Test change in a similar environment first'],

    // Business Impact
    businessCriticalityScore: 60,
    slaLevel: 'Gold',
    estimatedUsersImpacted: 280,
    businessServicesImpacted: 9
})

CREATE (ds_6063:Datastore {
    // Basic Identification
    id: 'datastore-6063',
    name: 'Local-6063',
    moRef: 'datastore-6110',
    url: 'ds:///Local-6063',

    // Datastore Type and Configuration
    type: 'VMFS',
    filesystemVersion: 'VMFS-5',
    blockSizeKB: 4,
    maxFileSize: '2TB',
    storageArrayType: 'NVMe-oF',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 2048,
    provisionedGB: 1682.9,
    usedGB: 918.1,
    freeGB: 1129.9,
    freePercentage: 55.2,
    spaceStatus: 'normal',

    // Performance and Status
    overallStatus: 'green',
    accessible: true,
    maintenanceMode: false,
    averageReadLatencyMs: 1.8,
    averageWriteLatencyMs: 18.86,
    maxReadLatencyMs: 5.47,
    maxWriteLatencyMs: 60.26,
    iopsRead: 6093,
    iopsWrite: 25253,
    throughputReadMBps: 1949,
    throughputWriteMBps: 1156,

    // Multipathing and Connectivity
    multipathingPolicy: 'Fixed',
    pathCount: 10,
    activePathCount: 5,
    deadPathCount: 4,
    standbyPathCount: 1,

    // VM Content
    vmCount: 24,
    templateCount: 8,
    isoCount: 11,
    totalVmdkCount: 96,
    snapshotVmdkCount: 2,
    criticalVmCount: 2,
    productionVmCount: 3,

    // Change Management
    lastExpansionDate: '2024-09-22',
    lastFilesystemCheckDate: '2025-02-20',
    lastPerformanceIssueDate: '2025-02-25',
    changeRiskScore: 31,
    changeImpactCategory: 'Low',
    recommendedPrecautions: ['Standard change process', 'Verify storage availability', 'Perform during regular maintenance window'],

    // Business Impact
    businessCriticalityScore: 31,
    slaLevel: 'Silver',
    estimatedUsersImpacted: 336,
    businessServicesImpacted: 7
})

CREATE (ds_6123:Datastore {
    // Basic Identification
    id: 'datastore-6123',
    name: 'DS6123',
    moRef: 'datastore-6938',
    url: 'ds:///DS6123',

    // Datastore Type and Configuration
    type: 'vSAN',
    vsanClusterId: 'vsan-8052',
    vsanObjectCount: 6638,
    defaultStoragePolicy: 'vSAN Default Storage Policy',
    multipleExtents: false,

    // Capacity and Allocation
    capacityGB: 16384,
    provisionedGB: 13898.3,
    usedGB: 13592.1,
    freeGB: 2791.9,
    freePercentage: 17.0,
    spaceStatus: 'warning',

    // Performance and Status
    overallStatus: 'green',
    accessible: false,
    accessibilityIssue: 'Network connectivity issue',
    maintenanceMode: false,
    averageReadLatencyMs: 13.07,
    averageWriteLatencyMs: 11.73,
    maxReadLatencyMs: 38.56,
    maxWriteLatencyMs: 39.08,
    iopsRead: 13700,
    iopsWrite: 3909,
    throughputReadMBps: 1663,
    throughputWriteMBps: 1500,

    // Multipathing and Connectivity

    // VM Content
    vmCount: 77,
    templateCount: 10,
    isoCount: 10,
    totalVmdkCount: 347,
    snapshotVmdkCount: 22,
    criticalVmCount: 16,
    productionVmCount: 29,

    // Change Management
    lastExpansionDate: '2024-10-29',
    lastFilesystemCheckDate: '2025-01-24',
    lastPerformanceIssueDate: '2024-12-26',
    changeRiskScore: 100,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Migrate critical VMs prior to maintenance', 'Ensure multiple backups available', 'Validate storage connectivity pre-change', 'Prepare rollback plan', 'Schedule extended maintenance window', 'Test change in a similar environment first'],

    // Business Impact
    businessCriticalityScore: 100,
    slaLevel: 'Platinum',
    estimatedUsersImpacted: 924,
    businessServicesImpacted: 5
})

// NSX Managers
CREATE (nsxm_2461:NSXManager {
    // Basic Identification
    id: 'nsxmgr-2461',
    name: 'nsxmgr-2461.nsx.local',
    uuid: '7365a351-b9d2-4728-83a3-9ab76f9626dd',
    fqdn: 'nsxmgr-2461.nsx.local',
    managementIP: '192.168.20.184',

    // NSX Version and Edition
    nsxType: 'NSX-T',
    version: '3.0.0',
    buildNumber: '68682731',
    edition: 'Professional',
    targetVersion: '3.1.0',
    targetBuildNumber: '15072210',
    versionGap: 'Minor',

    // Deployment Type
    deploymentType: 'Active-Active Cluster',
    nsxManagerCount: 3,
    applianceSize: 'Large',

    // Resource Allocation
    vcpus: 12,
    memoryGB: 48,
    diskGB: 400,

    // Network Infrastructure Scale
    transportNodeCount: 26,
    edgeNodeCount: 7,
    logicalSwitchCount: 423,
    logicalRouterCount: 131,
    segmentCount: 1822,
    firewallRuleCount: 3118,
    natRuleCount: 940,
    ipSetsCount: 110,
    securityGroupCount: 204,
    serviceCount: 86,
    dhcpServerCount: 6,
    lbCount: 34,
    vpnCount: 5,
    scaleUtilizationPercentage: 34,

    // Performance and Status
    overallStatus: 'red',
    controllerClusterStatus: 'green',
    managementPlaneStatus: 'yellow',
    dataPlaneStatus: 'green',
    edgeStatus: 'green',
    firewallStatus: 'green',
    cpuUsagePercentage: 7,
    memoryUsagePercentage: 64,
    diskUsagePercentage: 68,
    databaseUsagePercentage: 72,
    serviceUptime: 470,

    // Connectivity and Integration
    vcenterConnected: false,
    controlClusterConnected: true,
    syslogServerConfigured: true,
    backupConfigured: false,
    authenticationProvider: 'Active Directory',

    // License and Support
    licenseExpirationDate: '2025-09-17',
    supportLevel: 'Business Critical',
    supportExpirationDate: '2025-09-17',

    // Change Management
    lastPatchDate: '2025-01-14',
    lastBackupDate: '2025-03-16',
    lastConfigChangeDate: '2025-02-19',
    changeRiskScore: 100,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule extended maintenance window', 'Perform full backup before change', 'Notify all application teams', 'Have vendor support on standby', 'Test in development environment first', 'Prepare detailed rollback plan'],

    // Business Impact
    businessCriticalityScore: 70,
    slaLevel: 'Platinum',
    estimatedVmsImpacted: 7851,
    estimatedUsersImpacted: 125616,
    estimatedApplicationsImpacted: 12,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'risk',
    vulnerabilityCount: 10,
    criticalVulnerabilityCount: 3,
    lastSecurityScanDate: '2025-02-19'
})

CREATE (nsxm_8711:NSXManager {
    // Basic Identification
    id: 'nsxmgr-8711',
    name: 'nsxmgr-8711.nsx.local',
    uuid: '6fc06d25-09c1-41bc-b474-ebcdf1ef815c',
    fqdn: 'nsxmgr-8711.nsx.local',
    managementIP: '192.168.20.109',

    // NSX Version and Edition
    nsxType: 'NSX-T',
    version: '4.0.0',
    buildNumber: '90477164',
    edition: 'Professional',
    targetVersion: '4.0.1',
    targetBuildNumber: '15512673',
    versionGap: 'Minor',

    // Deployment Type
    deploymentType: 'Standalone',
    nsxManagerCount: 1,
    applianceSize: 'Small',

    // Resource Allocation
    vcpus: 4,
    memoryGB: 16,
    diskGB: 200,

    // Network Infrastructure Scale
    transportNodeCount: 172,
    edgeNodeCount: 13,
    logicalSwitchCount: 348,
    logicalRouterCount: 143,
    segmentCount: 1961,
    firewallRuleCount: 3645,
    natRuleCount: 647,
    ipSetsCount: 151,
    securityGroupCount: 244,
    serviceCount: 245,
    dhcpServerCount: 14,
    lbCount: 14,
    vpnCount: 17,
    scaleUtilizationPercentage: 34,

    // Performance and Status
    overallStatus: 'green',
    controllerClusterStatus: 'yellow',
    managementPlaneStatus: 'green',
    dataPlaneStatus: 'green',
    edgeStatus: 'green',
    firewallStatus: 'green',
    cpuUsagePercentage: 23,
    memoryUsagePercentage: 61,
    diskUsagePercentage: 71,
    databaseUsagePercentage: 34,
    serviceUptime: 488,

    // Connectivity and Integration
    vcenterConnected: false,
    controlClusterConnected: true,
    syslogServerConfigured: true,
    backupConfigured: true,
    authenticationProvider: 'VMware Identity Manager',

    // License and Support
    licenseExpirationDate: '2027-07-24',
    supportLevel: 'Production',
    supportExpirationDate: '2027-07-24',

    // Change Management
    lastPatchDate: '2025-03-07',
    lastBackupDate: '2025-03-13',
    lastConfigChangeDate: '2025-03-08',
    changeRiskScore: 80,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule extended maintenance window', 'Perform full backup before change', 'Notify all application teams', 'Have vendor support on standby', 'Test in development environment first', 'Prepare detailed rollback plan'],

    // Business Impact
    businessCriticalityScore: 71,
    slaLevel: 'Platinum',
    estimatedVmsImpacted: 6175,
    estimatedUsersImpacted: 80275,
    estimatedApplicationsImpacted: 28,

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'secure',
    vulnerabilityCount: 1,
    criticalVulnerabilityCount: 1,
    lastSecurityScanDate: '2025-03-16'
})

// Virtual Networks
CREATE (vnet_7354:VirtualNetwork {
    // Basic Identification
    id: 'vnet-7354',
    name: 'App-Tier-7354',
    moRef: 'network-586',

    // Network Type and Configuration
    type: 'NSX Logical Switch',
    transportType: 'Overlay',
    vni: 9479998,
    replicationMode: 'Hierarchical',
    hostCount: 21,
    transportZone: 'TZ-Overlay',
    controlPlaneMode: 'Multicast',

    // Network Configuration
    mtu: 9000,
    allowPromiscuous: true,
    allowForgedTransmits: false,
    allowMacChanges: true,
    trafficShapingEnabled: false,
    teamingPolicy: 'LoadBalanceSrcMAC',
    activeUplinkCount: 3,
    standbyUplinkCount: 2,
    unusedUplinkCount: 0,

    // IP Assignment
    ipAddressManagement: 'Static',
    subnet: '83.250.174.0/24',
    defaultGateway: '83.250.174.1',
    dnsServer1: '133.93.3.6',
    dnsServer2: '99.60.74.1',

    // Usage and Scale
    connectedVmCount: 113,
    connectedVnicCount: 144,
    estimatedTrafficMbps: 4327,
    peakTrafficMbps: 6227,
    criticalVmCount: 5,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 17,
    averagePacketLoss: 0.2,
    networkLatencyMs: 0.5,

    // Security and Isolation
    isolationStatus: 'Isolated',
    associatedFirewallRules: 44,
    microSegmentationEnabled: true,

    // Change Management
    lastConfigChangeDate: '2025-02-16',
    lastNetworkIssueDate: '2024-11-09',
    changeRiskScore: 61,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Schedule during off-hours', 'Validate critical VM connectivity', 'Have basic rollback plan', 'Notify key stakeholders'],

    // Business Impact
    businessCriticalityScore: 33,
    slaLevel: 'Bronze',
    estimatedUsersImpacted: 678,
    businessServicesImpacted: 1,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-03-05',
    complianceStatus: 'compliant',
    securityZone: 'External'
})

CREATE (vnet_1383:VirtualNetwork {
    // Basic Identification
    id: 'vnet-1383',
    name: 'Prod-Net-1383',
    moRef: 'network-716',

    // Network Type and Configuration
    type: 'Standard vSwitch Port Group',
    vlanType: 'VLAN',
    vlanId: 2213,
    switchName: 'vSwitch0',
    hostCount: 14,

    // Network Configuration
    mtu: 1500,
    allowPromiscuous: true,
    allowForgedTransmits: false,
    allowMacChanges: false,
    trafficShapingEnabled: true,
    averageBandwidthMbps: 3910,
    peakBandwidthMbps: 4642,
    burstSizeKB: 2048,
    teamingPolicy: 'LoadBalanceSrcMAC',
    activeUplinkCount: 4,
    standbyUplinkCount: 0,
    unusedUplinkCount: 2,

    // IP Assignment
    ipAddressManagement: 'Static',
    subnet: '180.50.126.0/24',
    defaultGateway: '180.50.126.1',
    dnsServer1: '177.237.35.1',
    dnsServer2: '151.202.65.2',

    // Usage and Scale
    connectedVmCount: 493,
    connectedVnicCount: 798,
    estimatedTrafficMbps: 3576,
    peakTrafficMbps: 3760,
    criticalVmCount: 153,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 71,
    averagePacketLoss: 0.175,
    networkLatencyMs: 1.5,

    // Security and Isolation
    isolationStatus: 'Isolated',
    associatedFirewallRules: 4,
    microSegmentationEnabled: false,

    // Change Management
    lastConfigChangeDate: '2025-01-19',
    lastNetworkIssueDate: '2024-10-11',
    changeRiskScore: 88,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule change during lowest traffic period', 'Verify VM connectivity requirements', 'Prepare rollback plan', 'Test change in a non-production environment', 'Notify all application teams', 'Validate all uplinks and teaming settings'],

    // Business Impact
    businessCriticalityScore: 98,
    slaLevel: 'Platinum',
    estimatedUsersImpacted: 8381,
    businessServicesImpacted: 19,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-02-21',
    complianceStatus: 'compliant',
    securityZone: 'Test'
})

CREATE (vnet_2170:VirtualNetwork {
    // Basic Identification
    id: 'vnet-2170',
    name: 'Dev-Net-2170',
    moRef: 'network-5564',

    // Network Type and Configuration
    type: 'Standard vSwitch Port Group',
    vlanType: 'VLAN',
    vlanId: 994,
    switchName: 'vSwitch0',
    hostCount: 18,

    // Network Configuration
    mtu: 1500,
    allowPromiscuous: false,
    allowForgedTransmits: true,
    allowMacChanges: false,
    trafficShapingEnabled: false,
    teamingPolicy: 'LoadBalanceSrcID',
    activeUplinkCount: 4,
    standbyUplinkCount: 0,
    unusedUplinkCount: 1,

    // IP Assignment
    ipAddressManagement: 'Static',
    subnet: '60.80.98.0/24',
    defaultGateway: '60.80.98.1',
    dnsServer1: '10.146.12.7',
    dnsServer2: '155.118.64.10',

    // Usage and Scale
    connectedVmCount: 378,
    connectedVnicCount: 431,
    estimatedTrafficMbps: 3109,
    peakTrafficMbps: 3254,
    criticalVmCount: 7,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 58,
    averagePacketLoss: 0.02,
    networkLatencyMs: 1.47,

    // Security and Isolation
    isolationStatus: 'NotIsolated',
    associatedFirewallRules: 8,
    microSegmentationEnabled: true,

    // Change Management
    lastConfigChangeDate: '2025-01-10',
    lastNetworkIssueDate: '2024-12-16',
    changeRiskScore: 79,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule change during lowest traffic period', 'Verify VM connectivity requirements', 'Prepare rollback plan', 'Test change in a non-production environment', 'Notify all application teams', 'Validate all uplinks and teaming settings'],

    // Business Impact
    businessCriticalityScore: 73,
    slaLevel: 'Gold',
    estimatedUsersImpacted: 2646,
    businessServicesImpacted: 6,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-03-13',
    complianceStatus: 'compliant',
    securityZone: 'Internal'
})

CREATE (vnet_6196:VirtualNetwork {
    // Basic Identification
    id: 'vnet-6196',
    name: 'Storage',
    moRef: 'network-8424',

    // Network Type and Configuration
    type: 'Standard vSwitch Port Group',
    vlanType: 'VLAN',
    vlanId: 2904,
    switchName: 'vSwitch7',
    hostCount: 15,

    // Network Configuration
    mtu: 9000,
    allowPromiscuous: false,
    allowForgedTransmits: false,
    allowMacChanges: false,
    trafficShapingEnabled: false,
    teamingPolicy: 'LoadBalanceSrcMAC',
    activeUplinkCount: 4,
    standbyUplinkCount: 1,
    unusedUplinkCount: 1,

    // IP Assignment
    ipAddressManagement: 'None',

    // Usage and Scale
    connectedVmCount: 414,
    connectedVnicCount: 523,
    estimatedTrafficMbps: 3505,
    peakTrafficMbps: 4615,
    criticalVmCount: 1,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 40,
    averagePacketLoss: 0.014,
    networkLatencyMs: 0.78,

    // Security and Isolation
    isolationStatus: 'Isolated',
    associatedFirewallRules: 48,
    microSegmentationEnabled: true,

    // Change Management
    lastConfigChangeDate: '2025-02-13',
    lastNetworkIssueDate: '2025-03-14',
    changeRiskScore: 79,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule change during lowest traffic period', 'Verify VM connectivity requirements', 'Prepare rollback plan', 'Test change in a non-production environment', 'Notify all application teams', 'Validate all uplinks and teaming settings'],

    // Business Impact
    businessCriticalityScore: 59,
    slaLevel: 'Silver',
    estimatedUsersImpacted: 3726,
    businessServicesImpacted: 2,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-03-13',
    complianceStatus: 'nonCompliant',
    securityZone: 'DMZ'
})

CREATE (vnet_4912:VirtualNetwork {
    // Basic Identification
    id: 'vnet-4912',
    name: 'Staging-4912',
    moRef: 'network-8301',

    // Network Type and Configuration
    type: 'Distributed Port Group',
    vlanType: 'VLAN',
    vlanId: 1905,
    switchName: 'dvSwitch-Management',
    dvSwitchUuid: '8b477d46-7d07-4427-b3f4-2319c0fa37a5',
    portGroupKey: 'dvportgroup-6598',
    hostCount: 36,

    // Network Configuration
    mtu: 1500,
    allowPromiscuous: false,
    allowForgedTransmits: false,
    allowMacChanges: false,
    trafficShapingEnabled: true,
    averageBandwidthMbps: 2643,
    peakBandwidthMbps: 2886,
    burstSizeKB: 5120,
    teamingPolicy: 'LoadBalanceIP',
    activeUplinkCount: 3,
    standbyUplinkCount: 0,
    unusedUplinkCount: 2,

    // IP Assignment
    ipAddressManagement: 'Static',
    subnet: '109.6.50.0/24',
    defaultGateway: '109.6.50.1',
    dnsServer1: '111.31.194.1',
    dnsServer2: '13.68.255.1',

    // Usage and Scale
    connectedVmCount: 38,
    connectedVnicCount: 60,
    estimatedTrafficMbps: 1992,
    peakTrafficMbps: 3632,
    criticalVmCount: 1,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 80,
    averagePacketLoss: 0.087,
    networkLatencyMs: 1.28,

    // Security and Isolation
    isolationStatus: 'NotIsolated',
    associatedFirewallRules: 21,
    microSegmentationEnabled: true,

    // Change Management
    lastConfigChangeDate: '2025-01-28',
    lastNetworkIssueDate: '2025-01-25',
    changeRiskScore: 50,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Schedule during off-hours', 'Validate critical VM connectivity', 'Have basic rollback plan', 'Notify key stakeholders'],

    // Business Impact
    businessCriticalityScore: 55,
    slaLevel: 'Silver',
    estimatedUsersImpacted: 532,
    businessServicesImpacted: 3,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-02-24',
    complianceStatus: 'partiallyCompliant',
    securityZone: 'External'
})

CREATE (vnet_3146:VirtualNetwork {
    // Basic Identification
    id: 'vnet-3146',
    name: 'Test-3146',
    moRef: 'network-8711',

    // Network Type and Configuration
    type: 'Distributed Port Group',
    vlanType: 'VLAN',
    vlanId: 101,
    switchName: 'dvs-67',
    dvSwitchUuid: 'aed65e07-f582-416d-9468-22adbf6b9ac6',
    portGroupKey: 'dvportgroup-820',
    hostCount: 25,

    // Network Configuration
    mtu: 1500,
    allowPromiscuous: true,
    allowForgedTransmits: false,
    allowMacChanges: false,
    trafficShapingEnabled: true,
    averageBandwidthMbps: 5439,
    peakBandwidthMbps: 5715,
    burstSizeKB: 10240,
    teamingPolicy: 'LoadBalanceSrcID',
    activeUplinkCount: 4,
    standbyUplinkCount: 1,
    unusedUplinkCount: 1,

    // IP Assignment
    ipAddressManagement: 'Static',
    subnet: '177.0.94.0/24',
    defaultGateway: '177.0.94.1',
    dnsServer1: '106.111.29.7',
    dnsServer2: '155.94.17.10',

    // Usage and Scale
    connectedVmCount: 25,
    connectedVnicCount: 29,
    estimatedTrafficMbps: 4762,
    peakTrafficMbps: 5262,
    criticalVmCount: 0,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 17,
    averagePacketLoss: 0.476,
    networkLatencyMs: 4.35,

    // Security and Isolation
    isolationStatus: 'NotIsolated',
    associatedFirewallRules: 4,
    microSegmentationEnabled: true,

    // Change Management
    lastConfigChangeDate: '2025-01-07',
    lastNetworkIssueDate: '2024-09-21',
    changeRiskScore: 49,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Schedule during off-hours', 'Validate critical VM connectivity', 'Have basic rollback plan', 'Notify key stakeholders'],

    // Business Impact
    businessCriticalityScore: 38,
    slaLevel: 'Silver',
    estimatedUsersImpacted: 450,
    businessServicesImpacted: 2,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-03-08',
    complianceStatus: 'compliant',
    securityZone: 'None'
})

CREATE (vnet_6003:VirtualNetwork {
    // Basic Identification
    id: 'vnet-6003',
    name: 'vMotion',
    moRef: 'network-4792',

    // Network Type and Configuration
    type: 'Standard vSwitch Port Group',
    vlanType: 'VLAN',
    vlanId: 3448,
    switchName: 'vSwitch5',
    hostCount: 31,

    // Network Configuration
    mtu: 1500,
    allowPromiscuous: false,
    allowForgedTransmits: true,
    allowMacChanges: false,
    trafficShapingEnabled: false,
    teamingPolicy: 'LoadBalanceIP',
    activeUplinkCount: 1,
    standbyUplinkCount: 1,
    unusedUplinkCount: 1,

    // IP Assignment
    ipAddressManagement: 'DHCP',
    subnet: '100.152.173.0/24',
    dhcpServer: '100.152.173.8',
    dhcpRangeStart: '100.152.173.24',
    dhcpRangeEnd: '100.152.173.249',
    defaultGateway: '100.152.173.1',
    dnsServer1: '141.98.63.8',
    dnsServer2: '74.191.249.1',

    // Usage and Scale
    connectedVmCount: 131,
    connectedVnicCount: 215,
    estimatedTrafficMbps: 237,
    peakTrafficMbps: 1391,
    criticalVmCount: 6,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 70,
    averagePacketLoss: 0.073,
    networkLatencyMs: 1.75,

    // Security and Isolation
    isolationStatus: 'PartiallyIsolated',
    associatedFirewallRules: 17,
    microSegmentationEnabled: false,

    // Change Management
    lastConfigChangeDate: '2024-12-21',
    lastNetworkIssueDate: '2024-11-13',
    changeRiskScore: 82,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule change during lowest traffic period', 'Verify VM connectivity requirements', 'Prepare rollback plan', 'Test change in a non-production environment', 'Notify all application teams', 'Validate all uplinks and teaming settings'],

    // Business Impact
    businessCriticalityScore: 77,
    slaLevel: 'Silver',
    estimatedUsersImpacted: 786,
    businessServicesImpacted: 4,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-02-21',
    complianceStatus: 'partiallyCompliant',
    securityZone: 'Development'
})

CREATE (vnet_6931:VirtualNetwork {
    // Basic Identification
    id: 'vnet-6931',
    name: 'VM-Network-6931',
    moRef: 'network-3245',

    // Network Type and Configuration
    type: 'Distributed Port Group',
    vlanType: 'VLAN Trunking',
    vlanRange: '2383-2444',
    switchName: 'dvSwitch-DMZ',
    dvSwitchUuid: '7960976f-6805-4de1-adb1-36f46bd9b3ba',
    portGroupKey: 'dvportgroup-9495',
    hostCount: 42,

    // Network Configuration
    mtu: 9000,
    allowPromiscuous: true,
    allowForgedTransmits: false,
    allowMacChanges: true,
    trafficShapingEnabled: true,
    averageBandwidthMbps: 6777,
    peakBandwidthMbps: 7314,
    burstSizeKB: 10240,
    teamingPolicy: 'LoadBalanceIP',
    activeUplinkCount: 4,
    standbyUplinkCount: 0,
    unusedUplinkCount: 0,

    // IP Assignment
    ipAddressManagement: 'DHCP',
    subnet: '23.116.237.0/24',
    dhcpServer: '23.116.237.5',
    dhcpRangeStart: '23.116.237.47',
    dhcpRangeEnd: '23.116.237.214',
    defaultGateway: '23.116.237.1',
    dnsServer1: '89.87.67.6',
    dnsServer2: '145.203.204.4',

    // Usage and Scale
    connectedVmCount: 301,
    connectedVnicCount: 549,
    estimatedTrafficMbps: 2375,
    peakTrafficMbps: 3873,
    criticalVmCount: 13,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 13,
    averagePacketLoss: 0.026,
    networkLatencyMs: 4.88,

    // Security and Isolation
    isolationStatus: 'Isolated',
    associatedFirewallRules: 6,
    microSegmentationEnabled: false,

    // Change Management
    lastConfigChangeDate: '2025-03-06',
    lastNetworkIssueDate: '2025-02-21',
    changeRiskScore: 73,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule change during lowest traffic period', 'Verify VM connectivity requirements', 'Prepare rollback plan', 'Test change in a non-production environment', 'Notify all application teams', 'Validate all uplinks and teaming settings'],

    // Business Impact
    businessCriticalityScore: 84,
    slaLevel: 'Platinum',
    estimatedUsersImpacted: 3913,
    businessServicesImpacted: 5,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-03-10',
    complianceStatus: 'compliant',
    securityZone: 'Internal'
})

CREATE (vnet_6463:VirtualNetwork {
    // Basic Identification
    id: 'vnet-6463',
    name: 'Web-Tier-6463',
    moRef: 'network-4486',

    // Network Type and Configuration
    type: 'NSX Segment',
    transportType: 'Overlay',
    vni: 13548093,
    replicationMode: 'Hybrid',
    hostCount: 77,
    transportZone: 'TZ-VLAN',
    segmentType: 'Service',

    // Network Configuration
    mtu: 9000,
    allowPromiscuous: false,
    allowForgedTransmits: false,
    allowMacChanges: true,
    trafficShapingEnabled: false,
    teamingPolicy: 'LoadBalanceSrcID',
    activeUplinkCount: 1,
    standbyUplinkCount: 0,
    unusedUplinkCount: 1,

    // IP Assignment
    ipAddressManagement: 'DHCP',
    subnet: '192.70.121.0/24',
    dhcpServer: '192.70.121.4',
    dhcpRangeStart: '192.70.121.21',
    dhcpRangeEnd: '192.70.121.208',
    defaultGateway: '192.70.121.1',
    dnsServer1: '88.213.50.4',
    dnsServer2: '150.160.121.3',

    // Usage and Scale
    connectedVmCount: 127,
    connectedVnicCount: 184,
    estimatedTrafficMbps: 210,
    peakTrafficMbps: 1791,
    criticalVmCount: 0,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 47,
    averagePacketLoss: 0.413,
    networkLatencyMs: 2.62,

    // Security and Isolation
    isolationStatus: 'NotIsolated',
    associatedFirewallRules: 49,
    microSegmentationEnabled: false,

    // Change Management
    lastConfigChangeDate: '2025-02-22',
    lastNetworkIssueDate: '2024-10-31',
    changeRiskScore: 63,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Schedule during off-hours', 'Validate critical VM connectivity', 'Have basic rollback plan', 'Notify key stakeholders'],

    // Business Impact
    businessCriticalityScore: 60,
    slaLevel: 'Bronze',
    estimatedUsersImpacted: 762,
    businessServicesImpacted: 3,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-02-18',
    complianceStatus: 'partiallyCompliant',
    securityZone: 'Internal'
})

CREATE (vnet_6936:VirtualNetwork {
    // Basic Identification
    id: 'vnet-6936',
    name: 'Web-Tier-6936',
    moRef: 'network-1459',

    // Network Type and Configuration
    type: 'NSX Logical Switch',
    transportType: 'Overlay',
    vni: 13224635,
    replicationMode: 'Unicast',
    hostCount: 113,
    transportZone: 'TZ-Overlay',
    controlPlaneMode: 'Unicast',

    // Network Configuration
    mtu: 1500,
    allowPromiscuous: false,
    allowForgedTransmits: true,
    allowMacChanges: true,
    trafficShapingEnabled: true,
    averageBandwidthMbps: 1903,
    peakBandwidthMbps: 2675,
    burstSizeKB: 2048,
    teamingPolicy: 'ExplicitFailover',
    activeUplinkCount: 4,
    standbyUplinkCount: 2,
    unusedUplinkCount: 1,

    // IP Assignment
    ipAddressManagement: 'Static',
    subnet: '174.77.58.0/24',
    defaultGateway: '174.77.58.1',
    dnsServer1: '129.247.68.10',
    dnsServer2: '191.193.173.3',

    // Usage and Scale
    connectedVmCount: 313,
    connectedVnicCount: 608,
    estimatedTrafficMbps: 4676,
    peakTrafficMbps: 6523,
    criticalVmCount: 2,

    // Performance and Status
    overallStatus: 'green',
    uplinkUtilizationPercentage: 35,
    averagePacketLoss: 0.305,
    networkLatencyMs: 4.23,

    // Security and Isolation
    isolationStatus: 'Isolated',
    associatedFirewallRules: 37,
    microSegmentationEnabled: true,

    // Change Management
    lastConfigChangeDate: '2025-01-28',
    lastNetworkIssueDate: '2024-12-11',
    changeRiskScore: 66,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Schedule during off-hours', 'Validate critical VM connectivity', 'Have basic rollback plan', 'Notify key stakeholders'],

    // Business Impact
    businessCriticalityScore: 58,
    slaLevel: 'Bronze',
    estimatedUsersImpacted: 5634,
    businessServicesImpacted: 1,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-03-09',
    complianceStatus: 'compliant',
    securityZone: 'Management'
})

// NSX Edges
CREATE (edge_9768:NSXEdge {
    // Basic Identification
    id: 'edge-9768',
    name: 'edge-9768',
    uuid: '65788bf2-f7fa-4cbb-9f3c-7276c58b42e2',

    // Edge Type and Version
    edgeType: 'NSX-T Edge',
    nodeType: 'Edge Cluster',
    version: '4.0.1',
    clusterSize: 8,
    haEnabled: true,
    activeNodeCount: 8,

    // Resource Allocation
    totalVcpus: 128,
    totalMemoryGB: 256,
    totalDiskGB: 3200,

    // Network Configuration
    managementIP: '192.168.20.154',
    interfaceCount: 8,
    interfaceTypes: ['UPLINK', 'UPLINK', 'INTERNAL', 'UPLINK'],
    bgpEnabled: false,

    // Services Enabled
    enabledServices: ['Routing', 'LoadBalancer', 'DFW'],
    lbPoolCount: 20,
    lbVirtualServerCount: 17,
    lbThroughputMbps: 8932,
    lbConnectionsPerSecond: 72434,
    lbConcurrentConnections: 381497,
    lbAlgorithm: 'URI',

    // Performance and Status
    overallStatus: 'yellow',
    cpuUsagePercentage: 6,
    memoryUsagePercentage: 76,
    diskUsagePercentage: 13,
    packetLossPercentage: 0.187,
    throughputMbps: 4911,
    maxThroughputMbps: 13947,
    connectionCount: 470468,
    connectionsPerSecond: 41492,

    // Edge Gateway Information
    defaultGateway: '192.168.122.1',
    routingProtocols: ['IS-IS', 'OSPF', 'Static'],
    staticRouteCount: 56,
    dynamicRouteCount: 727,

    // Change Management
    lastConfigChangeDate: '2025-03-13',
    lastFailoverDate: '2024-12-03',
    lastPatchDate: '2024-11-17',
    changeRiskScore: 90,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule during lowest traffic period', 'Create full configuration backup', 'Notify all application teams', 'Have vendor support on standby', 'Test in development environment first', 'Perform impact analysis on all services', 'Prepare detailed rollback plan'],

    // Business Impact
    businessCriticalityScore: 76,
    slaLevel: 'Gold',
    estimatedVmsImpacted: 364,
    estimatedUsersImpacted: 4732,
    estimatedApplicationsImpacted: 21,

    // Security and Compliance
    complianceStatus: 'unknown',
    securityStatus: 'warning',
    vulnerabilityCount: 5,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-03-13'
})

CREATE (edge_3843:NSXEdge {
    // Basic Identification
    id: 'edge-3843',
    name: 'edge-3843',
    uuid: 'e4012908-4e52-4f5b-bc98-8ee4b5933ced',

    // Edge Type and Version
    edgeType: 'NSX-T Edge',
    nodeType: 'Edge Node',
    version: '3.2.1',
    formFactor: 'VM',

    // Resource Allocation
    vcpus: 8,
    memoryGB: 128,
    diskGB: 800,

    // Network Configuration
    managementIP: '192.168.20.48',
    interfaceCount: 6,
    interfaceTypes: ['TRUNK', 'EXTERNAL', 'UPLINK', 'TRUNK'],
    bgpEnabled: true,
    localASN: 64512,
    bgpPeerCount: 4,
    routesAdvertised: 808,
    routesLearned: 53,

    // Services Enabled
    enabledServices: ['Routing', 'DHCP', 'Firewall', 'L2VPN', 'NAT', 'VPN'],
    firewallRuleCount: 708,
    firewallThroughputMbps: 2477,
    firewallConnectionsPerSecond: 38633,
    firewallConcurrentConnections: 1713968,
    natRuleCount: 479,
    vpnTunnelCount: 43,
    vpnThroughputMbps: 614,
    vpnConnectionCount: 919,
    dhcpPoolCount: 1,
    dhcpLeaseCount: 1887,

    // Performance and Status
    overallStatus: 'green',
    cpuUsagePercentage: 52,
    memoryUsagePercentage: 47,
    diskUsagePercentage: 27,
    packetLossPercentage: 0.488,
    throughputMbps: 9550,
    maxThroughputMbps: 10871,
    connectionCount: 361555,
    connectionsPerSecond: 1446,

    // Edge Gateway Information
    defaultGateway: '192.168.184.1',
    routingProtocols: ['BGP'],
    staticRouteCount: 40,
    dynamicRouteCount: 943,

    // Change Management
    lastConfigChangeDate: '2025-01-22',
    lastFailoverDate: 'None',
    lastPatchDate: '2025-03-13',
    changeRiskScore: 100,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule during lowest traffic period', 'Create full configuration backup', 'Notify all application teams', 'Have vendor support on standby', 'Test in development environment first', 'Perform impact analysis on all services', 'Prepare detailed rollback plan'],

    // Business Impact
    businessCriticalityScore: 96,
    slaLevel: 'Platinum',
    estimatedVmsImpacted: 2330,
    estimatedUsersImpacted: 18640,
    estimatedApplicationsImpacted: 20,

    // Security and Compliance
    complianceStatus: 'compliant',
    securityStatus: 'secure',
    vulnerabilityCount: 5,
    criticalVulnerabilityCount: 0,
    lastSecurityScanDate: '2025-02-28'
})

CREATE (edge_5305:NSXEdge {
    // Basic Identification
    id: 'edge-5305',
    name: 'edge-5305',
    uuid: '00ee83e3-42e5-47ee-b990-77842bdfddb3',

    // Edge Type and Version
    edgeType: 'NSX-T Edge',
    nodeType: 'Edge Node',
    version: '4.0.0',
    formFactor: 'VM',

    // Resource Allocation
    vcpus: 8,
    memoryGB: 128,
    diskGB: 800,

    // Network Configuration
    managementIP: '192.168.20.245',
    interfaceCount: 8,
    interfaceTypes: ['UPLINK', 'TRUNK', 'TRUNK', 'UPLINK'],
    bgpEnabled: false,

    // Services Enabled
    enabledServices: ['Routing', 'LoadBalancer', 'SSL-VPN', 'DNS', 'DHCP', 'IPSec'],
    lbPoolCount: 19,
    lbVirtualServerCount: 7,
    lbThroughputMbps: 6219,
    lbConnectionsPerSecond: 12642,
    lbConcurrentConnections: 149905,
    lbAlgorithm: 'LEAST_CONNECTION',
    vpnTunnelCount: 42,
    vpnThroughputMbps: 4668,
    vpnConnectionCount: 184,
    dhcpPoolCount: 5,
    dhcpLeaseCount: 2406,

    // Performance and Status
    overallStatus: 'green',
    cpuUsagePercentage: 53,
    memoryUsagePercentage: 89,
    diskUsagePercentage: 17,
    packetLossPercentage: 0.134,
    throughputMbps: 7393,
    maxThroughputMbps: 9764,
    connectionCount: 803522,
    connectionsPerSecond: 32920,

    // Edge Gateway Information
    defaultGateway: '192.168.165.1',
    routingProtocols: ['Static', 'OSPF', 'IS-IS'],
    staticRouteCount: 31,
    dynamicRouteCount: 509,

    // Change Management
    lastConfigChangeDate: '2025-02-14',
    lastFailoverDate: 'None',
    lastPatchDate: '2025-03-08',
    changeRiskScore: 67,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Schedule during off-hours', 'Backup configuration before change', 'Notify key stakeholders', 'Have basic rollback plan', 'Validate key services after change'],

    // Business Impact
    businessCriticalityScore: 89,
    slaLevel: 'Gold',
    estimatedVmsImpacted: 603,
    estimatedUsersImpacted: 11457,
    estimatedApplicationsImpacted: 19,

    // Security and Compliance
    complianceStatus: 'unknown',
    securityStatus: 'risk',
    vulnerabilityCount: 9,
    criticalVulnerabilityCount: 1,
    lastSecurityScanDate: '2025-03-04'
})

CREATE (edge_7277:NSXEdge {
    // Basic Identification
    id: 'edge-7277',
    name: 'edge-7277',
    uuid: 'b690a4be-fc6e-46bd-b4be-f9b4e25a2e1d',

    // Edge Type and Version
    edgeType: 'NSX-T Edge',
    nodeType: 'Edge Cluster',
    version: '3.1.3',
    clusterSize: 2,
    haEnabled: true,
    activeNodeCount: 2,

    // Resource Allocation
    totalVcpus: 16,
    totalMemoryGB: 128,
    totalDiskGB: 800,

    // Network Configuration
    managementIP: '192.168.20.193',
    interfaceCount: 3,
    interfaceTypes: ['INTERNAL', 'EXTERNAL', 'EXTERNAL'],
    bgpEnabled: true,
    localASN: 64565,
    bgpPeerCount: 1,
    routesAdvertised: 270,
    routesLearned: 580,

    // Services Enabled
    enabledServices: ['Routing'],

    // Performance and Status
    overallStatus: 'green',
    cpuUsagePercentage: 38,
    memoryUsagePercentage: 27,
    diskUsagePercentage: 58,
    packetLossPercentage: 0.052,
    throughputMbps: 3445,
    maxThroughputMbps: 4567,
    connectionCount: 49705,
    connectionsPerSecond: 1548,

    // Edge Gateway Information
    defaultGateway: '192.168.11.1',
    routingProtocols: ['BGP', 'OSPF', 'Static'],
    staticRouteCount: 45,
    dynamicRouteCount: 441,

    // Change Management
    lastConfigChangeDate: '2025-02-14',
    lastFailoverDate: '2024-10-08',
    lastPatchDate: '2024-12-19',
    changeRiskScore: 62,
    changeImpactCategory: 'Medium',
    recommendedPrecautions: ['Schedule during off-hours', 'Backup configuration before change', 'Notify key stakeholders', 'Have basic rollback plan', 'Validate key services after change'],

    // Business Impact
    businessCriticalityScore: 70,
    slaLevel: 'Platinum',
    estimatedVmsImpacted: 80,
    estimatedUsersImpacted: 960,
    estimatedApplicationsImpacted: 6,

    // Security and Compliance
    complianceStatus: 'compliant',
    securityStatus: 'secure',
    vulnerabilityCount: 6,
    criticalVulnerabilityCount: 3,
    lastSecurityScanDate: '2025-02-23'
})

// NSX Switches
CREATE (nsxs_8717:NSXSwitch {
    // Basic Identification
    id: 'nsxswitch-8717',
    name: 'nsxswitch-8717',
    uuid: '8b1095ae-427f-4040-9e3e-b97827d2a43a',

    // Switch Type and Version
    switchType: 'NSX-T Segment',
    version: '3.1.3',

    // Network Configuration
    adminState: 'UP',
    operationalState: 'UP',
    transportZoneType: 'OVERLAY',
    transportZone: 'TZ-Overlay-2',
    replicationMode: 'HEADEND',
    vni: 15255347,
    connectivityPath: '/infra/tier-1s/Tier-1-8',
    segmentType: 'Regular',
    ipAssignment: 'None',
    mtu: 9000,

    // Usage and Scale
    transportNodeCount: 23,
    connectedVmCount: 119,
    averageThroughputMbps: 4813,
    peakThroughputMbps: 5258,
    packetRatePps: 949801,
    macAddressCount: 166,
    arpEntryCount: 198,

    // Security Configuration
    micorsegmentationEnabled: false,
    associatedDfwRuleCount: 0,
    spoofguardEnabled: true,
    promiscuousModeEnabled: true,
    macLearningEnabled: true,
    forgedTransmitsEnabled: false,

    // Performance and Status
    overallStatus: 'green',
    rxPackets: 72384619,
    txPackets: 609610595,
    rxDroppedPackets: 822,
    txDroppedPackets: 7625,
    packetLossPercentage: 0.00124,

    // Change Management
    lastConfigChangeDate: '2025-01-30',
    lastTopologyChangeDate: '2024-09-28',
    changeRiskScore: 71,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule maintenance window during off-hours', 'Validate all workload connectivity requirements', 'Prepare detailed rollback plan', 'Test changes in development environment first', 'Notify all application teams', 'Validate security policy impact'],

    // Business Impact
    businessCriticalityScore: 96,
    slaLevel: 'Platinum',
    estimatedUsersImpacted: 2142,
    businessServicesImpacted: 5,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-02-23',
    complianceStatus: 'compliant'
})

CREATE (nsxs_9793:NSXSwitch {
    // Basic Identification
    id: 'nsxswitch-9793',
    name: 'nsxswitch-9793',
    uuid: 'd600327a-0cad-431b-9fb4-331b3a86cca1',

    // Switch Type and Version
    switchType: 'NSX-V Logical Switch',
    version: '6.4.10',

    // Network Configuration
    adminState: 'UP',
    operationalState: 'UP',
    transportZone: 'globalroot-2',
    controlPlaneMode: 'UNICAST_MODE',
    vxlanId: 5710172,
    ipAssignment: 'Static',
    subnet: '42.247.240.0/24',
    gatewayIP: '42.247.240.1',
    mtu: 1600,

    // Usage and Scale
    transportNodeCount: 52,
    connectedVmCount: 477,
    averageThroughputMbps: 2847,
    peakThroughputMbps: 3413,
    packetRatePps: 437678,
    macAddressCount: 585,
    arpEntryCount: 1276,

    // Security Configuration
    spoofguardEnabled: false,
    promiscuousModeEnabled: false,
    macLearningEnabled: true,
    forgedTransmitsEnabled: true,

    // Performance and Status
    overallStatus: 'yellow',
    rxPackets: 297917660,
    txPackets: 573939479,
    rxDroppedPackets: 3298,
    txDroppedPackets: 9181,
    packetLossPercentage: 0.00143,

    // Change Management
    lastConfigChangeDate: '2025-02-16',
    lastTopologyChangeDate: '2024-10-04',
    changeRiskScore: 93,
    changeImpactCategory: 'High',
    recommendedPrecautions: ['Schedule maintenance window during off-hours', 'Validate all workload connectivity requirements', 'Prepare detailed rollback plan', 'Test changes in development environment first', 'Notify all application teams', 'Validate security policy impact'],

    // Business Impact
    businessCriticalityScore: 82,
    slaLevel: 'Gold',
    estimatedUsersImpacted: 9540,
    businessServicesImpacted: 5,

    // Compliance and Audit
    lastComplianceCheckDate: '2025-03-12',
    complianceStatus: 'compliant'
})

// Virtual Machines
CREATE (vm_7673:VirtualMachine {
    // Basic Identification
    id: 'vm-7673',
    name: 'vm-7673',
    displayName: 'db-server-7673',
    uuid: '5f489a90-6dd3-476f-b294-58ed9fc1e8d0',
    instanceUuid: '445467f6-c586-4759-8e94-010b0862bc82',
    biosUuid: '42 bbe39e8b f784 47ea 997e 117bdd2e8241',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2022',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2022 (64-bit)',
    guestState: 'notRunning',
    guestHostname: 'db-server-7673.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '11870',

    // VM Configuration
    vcpus: 64,
    coresPerSocket: 4,
    memoryGB: 16,
    memoryReservationGB: 0,
    memoryLimitGB: 16,
    cpuReservationMhz: 31785,
    cpuLimitMhz: 0,
    numVirtualDisks: 2,
    totalStorageGB: 2100,
    diskSizes: ['100', '2000'],
    numVirtualNics: 1,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-17',
    firmware: 'bios',
    bootDelay: 10000,

    // Performance and Status
    powerState: 'poweredOff',
    connectionState: 'connected',
    cpuUsage: 0,
    memoryUsage: 0,
    uptimeDays: 0,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 5,
    consolidationNeeded: true,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Backup Server',
    environment: 'QA',
    owner: 'Development Team',
    costCenter: 'CC-550836',
    criticality: 'Medium',

    // Management
    creationDate: '2022-08-19T12:35:54Z',
    lastBackupDate: '2025-01-31T05:26:42Z',
    lastPatchDate: '2024-10-23',
    maintenanceWindow: 'Wednesday 02:00-05:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'risk',

    // Change Management
    lastChangeRequestID: 'CR-20241217-015',
    lastChangeRequestStatus: 'Completed',
    lastChangeType: 'Configuration Change',
    pendingChangeRequestID: 'CR-20250402-845',
    pendingChangeType: 'Hardware Upgrade',
    scheduledChangeDate: '2025-04-21',

    // Impact Assessment
    businessImpactScore: 36,
    estimatedUserCount: 49,
    dependencies: ['Queue', 'File Server', 'Load Balancer', 'Web Server', 'Cache', 'Authentication', 'API Gateway'],
    dependentSystemCount: 10
})

CREATE (vm_5110:VirtualMachine {
    // Basic Identification
    id: 'vm-5110',
    name: 'vm-5110',
    displayName: 'backup-server-5110',
    uuid: '1bec4289-a025-4ce9-a262-b4ec303fa128',
    instanceUuid: '154bd8b1-384d-4a8b-8f15-0b8f6f287b08',
    biosUuid: '42 ad195494 b82e 42ed a6f5 78a2935ee65e',

    // Guest OS Details
    guestOS: 'Red Hat Enterprise Linux 9',
    guestFamily: 'linuxGuest',
    guestFullName: 'Red Hat Enterprise Linux 9 (64-bit)',
    guestState: 'running',
    guestHostname: 'backup-server-5110.internal.local',
    guestToolsStatus: 'toolsOk',
    guestToolsVersion: '11067',

    // VM Configuration
    vcpus: 4,
    coresPerSocket: 8,
    memoryGB: 2,
    memoryReservationGB: 0,
    memoryLimitGB: 2,
    cpuReservationMhz: 1871,
    cpuLimitMhz: 0,
    numVirtualDisks: 6,
    totalStorageGB: 2428,
    diskSizes: ['128', '1000', '50', '1000', '200', '50'],
    numVirtualNics: 3,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-14',
    firmware: 'efi',
    bootDelay: 2000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 37,
    memoryUsage: 0,
    uptimeDays: 251,

    // Advanced Features
    vMotionEnabled: false,
    faultToleranceState: 'notConfigured',
    snapshots: 0,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'hostLocal',
    balloonedMemory: 0,

    // Business Context
    application: 'CI/CD Pipeline',
    environment: 'QA',
    owner: 'Security Team',
    costCenter: 'CC-560163',
    criticality: 'Medium',

    // Management
    creationDate: '2024-12-31T03:23:48Z',
    lastBackupDate: '2025-03-09T08:29:38Z',
    lastPatchDate: '2025-02-10',
    maintenanceWindow: 'Sunday 22:00-01:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'secure',

    // Change Management
    lastChangeRequestID: 'CR-20250117-693',
    lastChangeRequestStatus: 'Completed',
    lastChangeType: 'Resource Allocation',
    pendingChangeRequestID: 'CR-20250330-968',
    pendingChangeType: 'Configuration Change',
    scheduledChangeDate: '2025-05-09',

    // Impact Assessment
    businessImpactScore: 40,
    estimatedUserCount: 19,
    dependencies: ['Load Balancer', 'Authentication', 'Queue', 'Web Server', 'File Server', 'Database'],
    dependentSystemCount: 2
})

CREATE (vm_8284:VirtualMachine {
    // Basic Identification
    id: 'vm-8284',
    name: 'vm-8284',
    displayName: 'backup-server-8284',
    uuid: '157d7c43-e744-438d-a37d-3e2bd545c851',
    instanceUuid: 'ef9f56f5-54ba-45c3-bd5f-f00245fbb03e',
    biosUuid: '42 8ba9c6ea 885b 4a07 809d aacbbd44c27',

    // Guest OS Details
    guestOS: 'Oracle Linux 8',
    guestFamily: 'linuxGuest',
    guestFullName: 'Oracle Linux 8 (64-bit)',
    guestState: 'running',
    guestHostname: 'backup-server-8284.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '12932',

    // VM Configuration
    vcpus: 8,
    coresPerSocket: 8,
    memoryGB: 16,
    memoryReservationGB: 0,
    memoryLimitGB: 16,
    cpuReservationMhz: 3806,
    cpuLimitMhz: 0,
    numVirtualDisks: 3,
    totalStorageGB: 2560,
    diskSizes: ['60', '2000', '500'],
    numVirtualNics: 4,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-19',
    firmware: 'efi',
    bootDelay: 5000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 35,
    memoryUsage: 14,
    uptimeDays: 34,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'disabled',
    snapshots: 3,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Database Server',
    environment: 'Test',
    owner: 'Sales',
    costCenter: 'CC-982274',
    criticality: 'Low',

    // Management
    creationDate: '2024-09-25T14:33:15Z',
    lastBackupDate: '2025-03-14T17:11:13Z',
    lastPatchDate: '2024-11-11',
    maintenanceWindow: 'Saturday 12:00-14:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'risk',

    // Change Management
    lastChangeRequestID: 'CR-20250305-825',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'Software Installation',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 25,
    estimatedUserCount: 288,
    dependencies: [],
    dependentSystemCount: 9
})

CREATE (vm_1286:VirtualMachine {
    // Basic Identification
    id: 'vm-1286',
    name: 'vm-1286',
    displayName: 'auth-server-1286',
    uuid: 'c63d3989-0f0b-464c-84da-672f7347b9d5',
    instanceUuid: '6bf9d799-9ffe-485b-b0b9-b2247886d4c4',
    biosUuid: '42 4f099301 65e 4ed5 97ae 3a37b8ae80fe',

    // Guest OS Details
    guestOS: 'Oracle Linux 8',
    guestFamily: 'linuxGuest',
    guestFullName: 'Oracle Linux 8 (64-bit)',
    guestState: 'shuttingDown',
    guestHostname: 'auth-server-1286.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '12870',

    // VM Configuration
    vcpus: 8,
    coresPerSocket: 4,
    memoryGB: 4,
    memoryReservationGB: 2,
    memoryLimitGB: 4,
    cpuReservationMhz: 1951,
    cpuLimitMhz: 0,
    numVirtualDisks: 2,
    totalStorageGB: 140,
    diskSizes: ['40', '100'],
    numVirtualNics: 2,
    networkType: 'e1000',
    virtualHardwareVersion: 'vmx-19',
    firmware: 'bios',
    bootDelay: 10000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 21,
    memoryUsage: 0,
    uptimeDays: 328,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 2,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Email Server',
    environment: 'Production',
    owner: 'Finance',
    costCenter: 'CC-108038',
    criticality: 'High',

    // Management
    creationDate: '2024-05-04T07:40:23Z',
    lastBackupDate: '2025-03-07T06:53:25Z',
    lastPatchDate: '2025-01-20',
    maintenanceWindow: 'Sunday 01:00-05:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'warning',

    // Change Management
    lastChangeRequestID: 'CR-20241222-570',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'OS Patching',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 73,
    estimatedUserCount: 13,
    dependencies: ['Application Server', 'Load Balancer', 'Database', 'Web Server', 'Authentication', 'Queue'],
    dependentSystemCount: 5
})

CREATE (vm_6394:VirtualMachine {
    // Basic Identification
    id: 'vm-6394',
    name: 'vm-6394',
    displayName: 'backup-server-6394',
    uuid: '607beec4-f4b4-48dc-8ddf-6e3baf34ec74',
    instanceUuid: '0d8b8399-ef2e-4a92-af56-81b08117f1af',
    biosUuid: '42 58fa0a74 6281 429b bd7b 2b1f76677cf1',

    // Guest OS Details
    guestOS: 'Other 64-bit',
    guestFamily: 'otherGuest',
    guestFullName: 'Other 64-bit (64-bit)',
    guestState: 'notRunning',
    guestHostname: 'backup-server-6394.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '11457',

    // VM Configuration
    vcpus: 8,
    coresPerSocket: 1,
    memoryGB: 8,
    memoryReservationGB: 2,
    memoryLimitGB: 8,
    cpuReservationMhz: 2375,
    cpuLimitMhz: 0,
    numVirtualDisks: 4,
    totalStorageGB: 700,
    diskSizes: ['100', '300', '100', '200'],
    numVirtualNics: 1,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-14',
    firmware: 'bios',
    bootDelay: 10000,

    // Performance and Status
    powerState: 'poweredOff',
    connectionState: 'connected',
    cpuUsage: 0,
    memoryUsage: 0,
    uptimeDays: 0,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 2,
    consolidationNeeded: true,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Web Application',
    environment: 'Production',
    owner: 'HR',
    costCenter: 'CC-469478',
    criticality: 'Critical',

    // Management
    creationDate: '2023-10-21T03:31:20Z',
    lastBackupDate: '2025-02-10T12:46:36Z',
    lastPatchDate: '2024-12-09',
    maintenanceWindow: 'Sunday 22:00-03:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'risk',

    // Change Management
    lastChangeRequestID: 'CR-20250128-323',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'Configuration Change',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 97,
    estimatedUserCount: 163,
    dependencies: ['Queue'],
    dependentSystemCount: 5
})

CREATE (vm_2728:VirtualMachine {
    // Basic Identification
    id: 'vm-2728',
    name: 'vm-2728',
    displayName: 'file-server-2728',
    uuid: '19b8dd09-e45e-46bc-a3f1-339756b0242a',
    instanceUuid: 'd5448448-07c8-4cbe-a474-cd33d7f46d5c',
    biosUuid: '42 11063f85 c375 4815 9df4 4f38bb762f1e',

    // Guest OS Details
    guestOS: 'Microsoft Windows 11 (64-bit)',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows 11 (64-bit) (64-bit)',
    guestState: 'running',
    guestHostname: 'file-server-2728.internal.local',
    guestToolsStatus: 'toolsOld',
    guestToolsVersion: '11061',

    // VM Configuration
    vcpus: 2,
    coresPerSocket: 8,
    memoryGB: 256,
    memoryReservationGB: 57,
    memoryLimitGB: 256,
    cpuReservationMhz: 716,
    cpuLimitMhz: 0,
    numVirtualDisks: 5,
    totalStorageGB: 2160,
    diskSizes: ['60', '1000', '300', '300', '500'],
    numVirtualNics: 4,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-13',
    firmware: 'bios',
    bootDelay: 5000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 21,
    memoryUsage: 132,
    uptimeDays: 98,

    // Advanced Features
    vMotionEnabled: false,
    faultToleranceState: 'notConfigured',
    snapshots: 5,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'eagerzeroedthick',
    swapplacement: 'hostLocal',
    balloonedMemory: 0,

    // Business Context
    application: 'Development Environment',
    environment: 'DR',
    owner: 'Development Team',
    costCenter: 'CC-770381',
    criticality: 'High',

    // Management
    creationDate: '2024-07-27T21:59:54Z',
    lastBackupDate: '2025-03-05T17:08:10Z',
    lastPatchDate: '2024-11-22',
    maintenanceWindow: 'Monday 12:00-14:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'risk',

    // Change Management
    lastChangeRequestID: 'CR-20250305-143',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'Resource Allocation',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 74,
    estimatedUserCount: 61,
    dependencies: ['Load Balancer'],
    dependentSystemCount: 0
})

CREATE (vm_8069:VirtualMachine {
    // Basic Identification
    id: 'vm-8069',
    name: 'vm-8069',
    displayName: 'backup-server-8069',
    uuid: '1d169e76-7014-4b12-b34a-010b607d5153',
    instanceUuid: '55a138a8-335e-4bab-bb04-8277d13f4b66',
    biosUuid: '42 42801751 4971 4f7d 9778 debbd4376c3d',

    // Guest OS Details
    guestOS: 'CentOS 7',
    guestFamily: 'linuxGuest',
    guestFullName: 'CentOS 7 (64-bit)',
    guestState: 'running',
    guestHostname: 'backup-server-8069.internal.local',
    guestToolsStatus: 'toolsOk',
    guestToolsVersion: '10499',

    // VM Configuration
    vcpus: 4,
    coresPerSocket: 1,
    memoryGB: 16,
    memoryReservationGB: 4,
    memoryLimitGB: 16,
    cpuReservationMhz: 924,
    cpuLimitMhz: 0,
    numVirtualDisks: 3,
    totalStorageGB: 2100,
    diskSizes: ['100', '1000', '1000'],
    numVirtualNics: 3,
    networkType: 'e1000',
    virtualHardwareVersion: 'vmx-15',
    firmware: 'bios',
    bootDelay: 5000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 43,
    memoryUsage: 11,
    uptimeDays: 239,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'enabled',
    snapshots: 5,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'hostLocal',
    balloonedMemory: 0,

    // Business Context
    application: 'Database Server',
    environment: 'Development',
    owner: 'Security Team',
    costCenter: 'CC-638028',
    criticality: 'Medium',

    // Management
    creationDate: '2023-08-05T19:45:56Z',
    lastBackupDate: '2025-03-15T00:43:39Z',
    lastPatchDate: '2024-11-20',
    maintenanceWindow: 'Saturday 05:00-08:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'warning',

    // Change Management
    lastChangeRequestID: 'CR-20250208-829',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'Migration',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 40,
    estimatedUserCount: 76,
    dependencies: ['Application Server', 'File Server', 'API Gateway', 'Authentication', 'Cache', 'Load Balancer', 'Web Server'],
    dependentSystemCount: 1
})

CREATE (vm_8225:VirtualMachine {
    // Basic Identification
    id: 'vm-8225',
    name: 'vm-8225',
    displayName: 'auth-server-8225',
    uuid: 'efc98843-c401-4761-90f1-aeea3b0189a4',
    instanceUuid: 'a5617d1b-a0a1-438e-9e9b-d42fc0739a2f',
    biosUuid: '42 dadb5776 faa2 40bb 9edd c5b0386d1187',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2022',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2022 (64-bit)',
    guestState: 'running',
    guestHostname: 'auth-server-8225.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '12994',

    // VM Configuration
    vcpus: 4,
    coresPerSocket: 4,
    memoryGB: 4,
    memoryReservationGB: 1,
    memoryLimitGB: 4,
    cpuReservationMhz: 249,
    cpuLimitMhz: 0,
    numVirtualDisks: 3,
    totalStorageGB: 1300,
    diskSizes: ['100', '1000', '200'],
    numVirtualNics: 2,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-19',
    firmware: 'efi',
    bootDelay: 0,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 42,
    memoryUsage: 0,
    uptimeDays: 315,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 3,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Development Environment',
    environment: 'QA',
    owner: 'Finance',
    costCenter: 'CC-920950',
    criticality: 'Low',

    // Management
    creationDate: '2024-05-02T16:09:02Z',
    lastBackupDate: '2025-03-08T11:44:33Z',
    lastPatchDate: '2024-12-18',
    maintenanceWindow: 'Sunday 17:00-22:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'risk',

    // Change Management
    lastChangeRequestID: 'CR-20241126-974',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'Configuration Change',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 19,
    estimatedUserCount: 76,
    dependencies: ['Application Server', 'Cache', 'API Gateway', 'Queue'],
    dependentSystemCount: 10
})

CREATE (vm_5351:VirtualMachine {
    // Basic Identification
    id: 'vm-5351',
    name: 'vm-5351',
    displayName: 'app-server-5351',
    uuid: '8b7c02ae-3950-41a9-9cdc-01546e44d274',
    instanceUuid: '6244ac97-e3e9-48aa-8f0f-b496c6116287',
    biosUuid: '42 c34b993a 6eb6 4a71 b4a4 37a0d1072eca',

    // Guest OS Details
    guestOS: 'Red Hat Enterprise Linux 8',
    guestFamily: 'linuxGuest',
    guestFullName: 'Red Hat Enterprise Linux 8 (64-bit)',
    guestState: 'running',
    guestHostname: 'app-server-5351.internal.local',
    guestToolsStatus: 'toolsOk',
    guestToolsVersion: '11699',

    // VM Configuration
    vcpus: 8,
    coresPerSocket: 2,
    memoryGB: 128,
    memoryReservationGB: 0,
    memoryLimitGB: 128,
    cpuReservationMhz: 1880,
    cpuLimitMhz: 0,
    numVirtualDisks: 5,
    totalStorageGB: 3340,
    diskSizes: ['40', '2000', '500', '500', '300'],
    numVirtualNics: 3,
    networkType: 'e1000',
    virtualHardwareVersion: 'vmx-14',
    firmware: 'bios',
    bootDelay: 5000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 69,
    memoryUsage: 91,
    uptimeDays: 255,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 3,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'ERP System',
    environment: 'Production',
    owner: 'IT Operations',
    costCenter: 'CC-426996',
    criticality: 'Low',

    // Management
    creationDate: '2024-08-14T03:41:14Z',
    lastBackupDate: '2025-03-12T20:24:53Z',
    lastPatchDate: '2024-11-23',
    maintenanceWindow: 'Sunday 23:00-02:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'warning',

    // Change Management
    lastChangeRequestID: 'CR-20250120-956',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'New Deployment',
    pendingChangeRequestID: 'CR-20250430-133',
    pendingChangeType: 'OS Patching',
    scheduledChangeDate: '2025-03-30',

    // Impact Assessment
    businessImpactScore: 50,
    estimatedUserCount: 410,
    dependencies: ['File Server', 'Web Server', 'Cache', 'Application Server'],
    dependentSystemCount: 6
})

CREATE (vm_2923:VirtualMachine {
    // Basic Identification
    id: 'vm-2923',
    name: 'vm-2923',
    displayName: 'backup-server-2923',
    uuid: '5c9751c7-9a80-406c-9ed1-11f715e4c4ae',
    instanceUuid: '1abf32b2-982e-4e3a-aa76-d04926235c78',
    biosUuid: '42 462817b8 cc7c 41e4 bd5d 5eb89e58a950',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2022',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2022 (64-bit)',
    guestState: 'notRunning',
    guestHostname: 'backup-server-2923.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '12195',

    // VM Configuration
    vcpus: 16,
    coresPerSocket: 8,
    memoryGB: 4,
    memoryReservationGB: 1,
    memoryLimitGB: 4,
    cpuReservationMhz: 5417,
    cpuLimitMhz: 0,
    numVirtualDisks: 6,
    totalStorageGB: 1890,
    diskSizes: ['40', '1000', '200', '50', '500', '100'],
    numVirtualNics: 4,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-19',
    firmware: 'efi',
    bootDelay: 10000,

    // Performance and Status
    powerState: 'poweredOff',
    connectionState: 'inaccessible',
    cpuUsage: 0,
    memoryUsage: 0,
    uptimeDays: 0,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 1,
    consolidationNeeded: true,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'hostLocal',
    balloonedMemory: 0,

    // Business Context
    application: 'Web Application',
    environment: 'Production',
    owner: 'Security Team',
    costCenter: 'CC-522813',
    criticality: 'High',

    // Management
    creationDate: '2022-07-18T02:58:02Z',
    lastBackupDate: '2025-02-20T08:26:00Z',
    lastPatchDate: '2024-12-01',
    maintenanceWindow: 'Saturday 22:00-03:00',

    // Compliance and Security
    complianceStatus: 'unknown',
    securityStatus: 'warning',

    // Change Management
    lastChangeRequestID: 'CR-20250125-135',
    lastChangeRequestStatus: 'Failed',
    lastChangeType: 'Configuration Change',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 87,
    estimatedUserCount: 166,
    dependencies: ['Load Balancer', 'Database', 'Authentication'],
    dependentSystemCount: 8
})

CREATE (vm_9401:VirtualMachine {
    // Basic Identification
    id: 'vm-9401',
    name: 'vm-9401',
    displayName: 'util-server-9401',
    uuid: 'f4f686b1-ab76-49f8-807b-afa5dbbea8e5',
    instanceUuid: '32299c07-8052-4452-a3f9-9f990c24cf30',
    biosUuid: '42 2b450169 bbf2 44b4 82b1 91fa95ce39f8',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2019',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2019 (64-bit)',
    guestState: 'running',
    guestHostname: 'util-server-9401.internal.local',
    guestToolsStatus: 'toolsOk',
    guestToolsVersion: '11329',

    // VM Configuration
    vcpus: 4,
    coresPerSocket: 1,
    memoryGB: 128,
    memoryReservationGB: 56,
    memoryLimitGB: 128,
    cpuReservationMhz: 1615,
    cpuLimitMhz: 0,
    numVirtualDisks: 6,
    totalStorageGB: 3880,
    diskSizes: ['80', '1000', '200', '300', '2000', '300'],
    numVirtualNics: 1,
    networkType: 'e1000',
    virtualHardwareVersion: 'vmx-13',
    firmware: 'bios',
    bootDelay: 0,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 10,
    memoryUsage: 28,
    uptimeDays: 18,

    // Advanced Features
    vMotionEnabled: false,
    faultToleranceState: 'notConfigured',
    snapshots: 1,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Test Environment',
    environment: 'Production',
    owner: 'Network Team',
    costCenter: 'CC-125080',
    criticality: 'High',

    // Management
    creationDate: '2022-06-28T02:53:56Z',
    lastBackupDate: '2025-03-05T19:56:40Z',
    lastPatchDate: '2025-01-04',
    maintenanceWindow: 'Saturday 00:00-06:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'secure',

    // Change Management
    lastChangeRequestID: 'CR-20241010-095',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'Configuration Change',
    pendingChangeRequestID: 'CR-20250404-821',
    pendingChangeType: 'Resource Allocation',
    scheduledChangeDate: '2025-04-20',

    // Impact Assessment
    businessImpactScore: 89,
    estimatedUserCount: 14,
    dependencies: ['Queue', 'Load Balancer', 'Application Server'],
    dependentSystemCount: 2
})

CREATE (vm_1680:VirtualMachine {
    // Basic Identification
    id: 'vm-1680',
    name: 'vm-1680',
    displayName: 'backup-server-1680',
    uuid: '346f7037-78d0-449a-b075-049ae1752a04',
    instanceUuid: '2b12651c-f962-4206-9a1a-02c6a2f34053',
    biosUuid: '42 60318139 e0c 4631 bb39 9e80de79820b',

    // Guest OS Details
    guestOS: 'Ubuntu Linux 22.04',
    guestFamily: 'linuxGuest',
    guestFullName: 'Ubuntu Linux 22.04 (64-bit)',
    guestState: 'notRunning',
    guestHostname: 'backup-server-1680.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '12250',

    // VM Configuration
    vcpus: 4,
    coresPerSocket: 1,
    memoryGB: 2,
    memoryReservationGB: 0,
    memoryLimitGB: 2,
    cpuReservationMhz: 1667,
    cpuLimitMhz: 0,
    numVirtualDisks: 3,
    totalStorageGB: 230,
    diskSizes: ['80', '100', '50'],
    numVirtualNics: 4,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-15',
    firmware: 'bios',
    bootDelay: 2000,

    // Performance and Status
    powerState: 'poweredOff',
    connectionState: 'connected',
    cpuUsage: 0,
    memoryUsage: 0,
    uptimeDays: 0,

    // Advanced Features
    vMotionEnabled: false,
    faultToleranceState: 'notConfigured',
    snapshots: 5,
    consolidationNeeded: true,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Backup Server',
    environment: 'Production',
    owner: 'Database Team',
    costCenter: 'CC-538260',
    criticality: 'Critical',

    // Management
    creationDate: '2024-12-27T02:34:31Z',
    lastBackupDate: '2025-02-15T02:58:14Z',
    lastPatchDate: '2024-12-20',
    maintenanceWindow: 'Sunday 23:00-04:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'warning',

    // Change Management
    lastChangeRequestID: 'CR-20241223-246',
    lastChangeRequestStatus: 'Completed',
    lastChangeType: 'New Deployment',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 95,
    estimatedUserCount: 95,
    dependencies: ['File Server'],
    dependentSystemCount: 6
})

CREATE (vm_2209:VirtualMachine {
    // Basic Identification
    id: 'vm-2209',
    name: 'vm-2209',
    displayName: 'backup-server-2209',
    uuid: 'd10f6aa6-7da6-43ad-a560-6d9ea6b31f7b',
    instanceUuid: '99c7b2e1-ebcf-4e99-a60b-db3d158cb0cd',
    biosUuid: '42 8dc7fcdd 9f70 4596 8043 5fe7c6fa8547',

    // Guest OS Details
    guestOS: 'Red Hat Enterprise Linux 8',
    guestFamily: 'linuxGuest',
    guestFullName: 'Red Hat Enterprise Linux 8 (64-bit)',
    guestState: 'notRunning',
    guestHostname: 'backup-server-2209.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '12388',

    // VM Configuration
    vcpus: 8,
    coresPerSocket: 1,
    memoryGB: 32,
    memoryReservationGB: 1,
    memoryLimitGB: 32,
    cpuReservationMhz: 2664,
    cpuLimitMhz: 0,
    numVirtualDisks: 3,
    totalStorageGB: 1110,
    diskSizes: ['60', '1000', '50'],
    numVirtualNics: 1,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-19',
    firmware: 'bios',
    bootDelay: 2000,

    // Performance and Status
    powerState: 'poweredOff',
    connectionState: 'connected',
    cpuUsage: 0,
    memoryUsage: 0,
    uptimeDays: 0,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 5,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'hostLocal',
    balloonedMemory: 0,

    // Business Context
    application: 'Web Application',
    environment: 'Production',
    owner: 'Network Team',
    costCenter: 'CC-986838',
    criticality: 'High',

    // Management
    creationDate: '2024-01-24T22:15:45Z',
    lastBackupDate: '2025-01-08T07:20:08Z',
    lastPatchDate: '2025-01-23',
    maintenanceWindow: 'Sunday 01:00-03:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'secure',

    // Change Management
    lastChangeRequestID: 'CR-20241031-399',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'OS Patching',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 70,
    estimatedUserCount: 231,
    dependencies: ['Authentication', 'Database', 'Queue', 'API Gateway', 'Application Server'],
    dependentSystemCount: 9
})

CREATE (vm_9708:VirtualMachine {
    // Basic Identification
    id: 'vm-9708',
    name: 'vm-9708',
    displayName: 'app-server-9708',
    uuid: '1272cccc-c07f-4b02-9b4a-c54d415eb450',
    instanceUuid: 'd7c72f5a-9826-4786-b733-dc5e8e50318f',
    biosUuid: '42 2184d5d5 ed3b 428e a7a0 95f4654959e3',

    // Guest OS Details
    guestOS: 'Red Hat Enterprise Linux 9',
    guestFamily: 'linuxGuest',
    guestFullName: 'Red Hat Enterprise Linux 9 (64-bit)',
    guestState: 'running',
    guestHostname: 'app-server-9708.internal.local',
    guestToolsStatus: 'toolsOk',
    guestToolsVersion: '11134',

    // VM Configuration
    vcpus: 16,
    coresPerSocket: 4,
    memoryGB: 16,
    memoryReservationGB: 8,
    memoryLimitGB: 16,
    cpuReservationMhz: 3852,
    cpuLimitMhz: 0,
    numVirtualDisks: 1,
    totalStorageGB: 40,
    diskSizes: ['40'],
    numVirtualNics: 1,
    networkType: 'e1000',
    virtualHardwareVersion: 'vmx-19',
    firmware: 'bios',
    bootDelay: 5000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'inaccessible',
    cpuUsage: 33,
    memoryUsage: 3,
    uptimeDays: 316,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 3,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Development Environment',
    environment: 'Development',
    owner: 'Network Team',
    costCenter: 'CC-265685',
    criticality: 'Medium',

    // Management
    creationDate: '2022-09-20T01:41:39Z',
    lastBackupDate: '2025-03-16T03:07:05Z',
    lastPatchDate: '2025-01-24',
    maintenanceWindow: 'Friday 13:00-16:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'warning',

    // Change Management
    lastChangeRequestID: 'CR-20241018-861',
    lastChangeRequestStatus: 'Failed',
    lastChangeType: 'Configuration Change',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 49,
    estimatedUserCount: 49,
    dependencies: ['Authentication', 'File Server', 'API Gateway', 'Web Server'],
    dependentSystemCount: 6
})

CREATE (vm_4857:VirtualMachine {
    // Basic Identification
    id: 'vm-4857',
    name: 'vm-4857',
    displayName: 'web-server-4857',
    uuid: '9c84fbb9-0c43-4488-876c-0ea88cc129ef',
    instanceUuid: '1bb93893-62e0-40d2-9441-24cded65f703',
    biosUuid: '42 44cc4c7 2604 494a 878c 2825d11a5140',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2022',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2022 (64-bit)',
    guestState: 'running',
    guestHostname: 'web-server-4857.internal.local',
    guestToolsStatus: 'toolsOk',
    guestToolsVersion: '11862',

    // VM Configuration
    vcpus: 16,
    coresPerSocket: 8,
    memoryGB: 2,
    memoryReservationGB: 0,
    memoryLimitGB: 2,
    cpuReservationMhz: 6095,
    cpuLimitMhz: 0,
    numVirtualDisks: 1,
    totalStorageGB: 80,
    diskSizes: ['80'],
    numVirtualNics: 2,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-17',
    firmware: 'efi',
    bootDelay: 10000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 79,
    memoryUsage: 1,
    uptimeDays: 165,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 3,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Email Server',
    environment: 'Production',
    owner: 'Legal',
    costCenter: 'CC-242626',
    criticality: 'High',

    // Management
    creationDate: '2023-11-28T15:58:24Z',
    lastBackupDate: '2025-03-03T08:15:07Z',
    lastPatchDate: '2025-02-15',
    maintenanceWindow: 'Sunday 22:00-00:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'secure',

    // Change Management
    lastChangeRequestID: 'CR-20241207-627',
    lastChangeRequestStatus: 'Completed',
    lastChangeType: 'OS Patching',
    pendingChangeRequestID: 'CR-20250417-896',
    pendingChangeType: 'OS Patching',
    scheduledChangeDate: '2025-05-15',

    // Impact Assessment
    businessImpactScore: 81,
    estimatedUserCount: 41,
    dependencies: ['Load Balancer', 'Queue'],
    dependentSystemCount: 4
})

CREATE (vm_6734:VirtualMachine {
    // Basic Identification
    id: 'vm-6734',
    name: 'vm-6734',
    displayName: 'file-server-6734',
    uuid: 'bffa0975-24e5-4f1b-a272-ab2040d111b6',
    instanceUuid: 'cdecd251-94c3-491c-921d-836846486f29',
    biosUuid: '42 7204eb61 139e 4e07 ba1d d999ec666f42',

    // Guest OS Details
    guestOS: 'Ubuntu Linux 20.04',
    guestFamily: 'linuxGuest',
    guestFullName: 'Ubuntu Linux 20.04 (64-bit)',
    guestState: 'notRunning',
    guestHostname: 'file-server-6734.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '10019',

    // VM Configuration
    vcpus: 4,
    coresPerSocket: 1,
    memoryGB: 16,
    memoryReservationGB: 1,
    memoryLimitGB: 16,
    cpuReservationMhz: 1172,
    cpuLimitMhz: 0,
    numVirtualDisks: 4,
    totalStorageGB: 310,
    diskSizes: ['60', '50', '100', '100'],
    numVirtualNics: 3,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-13',
    firmware: 'efi',
    bootDelay: 0,

    // Performance and Status
    powerState: 'poweredOff',
    connectionState: 'connected',
    cpuUsage: 0,
    memoryUsage: 0,
    uptimeDays: 0,

    // Advanced Features
    vMotionEnabled: false,
    faultToleranceState: 'enabled',
    snapshots: 2,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thin',
    swapplacement: 'hostLocal',
    balloonedMemory: 0,

    // Business Context
    application: 'Development Environment',
    environment: 'Development',
    owner: 'HR',
    costCenter: 'CC-401564',
    criticality: 'Critical',

    // Management
    creationDate: '2023-12-16T13:47:05Z',
    lastBackupDate: '2024-12-28T01:24:30Z',
    lastPatchDate: '2024-10-02',
    maintenanceWindow: 'Friday 09:00-13:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'warning',

    // Change Management
    lastChangeRequestID: 'CR-20241122-938',
    lastChangeRequestStatus: 'Completed',
    lastChangeType: 'OS Patching',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 78,
    estimatedUserCount: 15,
    dependencies: ['Web Server', 'File Server', 'Load Balancer', 'Authentication'],
    dependentSystemCount: 7
})

CREATE (vm_1127:VirtualMachine {
    // Basic Identification
    id: 'vm-1127',
    name: 'vm-1127',
    displayName: 'util-server-1127',
    uuid: 'c15160c3-be02-4b79-ab42-a81caef95d32',
    instanceUuid: 'e7722786-9e54-44cf-b6d7-0de40c1ed0ed',
    biosUuid: '42 bd0d5350 dd2b 4113 9e70 16dcab80c5b6',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2016',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2016 (64-bit)',
    guestState: 'standby',
    guestHostname: 'util-server-1127.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '11886',

    // VM Configuration
    vcpus: 4,
    coresPerSocket: 2,
    memoryGB: 4,
    memoryReservationGB: 0,
    memoryLimitGB: 4,
    cpuReservationMhz: 93,
    cpuLimitMhz: 0,
    numVirtualDisks: 5,
    totalStorageGB: 3628,
    diskSizes: ['128', '1000', '1000', '500', '1000'],
    numVirtualNics: 3,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-17',
    firmware: 'efi',
    bootDelay: 5000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 16,
    memoryUsage: 0,
    uptimeDays: 81,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 4,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'hostLocal',
    balloonedMemory: 0,

    // Business Context
    application: 'Print Server',
    environment: 'Development',
    owner: 'Network Team',
    costCenter: 'CC-137205',
    criticality: 'Low',

    // Management
    creationDate: '2022-07-22T00:11:09Z',
    lastBackupDate: '2025-03-04T22:22:28Z',
    lastPatchDate: '2024-12-07',
    maintenanceWindow: 'Tuesday 22:00-01:00',

    // Compliance and Security
    complianceStatus: 'unknown',
    securityStatus: 'secure',

    // Change Management
    lastChangeRequestID: 'CR-20241229-452',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'Hardware Upgrade',
    pendingChangeRequestID: 'CR-20250408-394',
    pendingChangeType: 'OS Patching',
    scheduledChangeDate: '2025-04-09',

    // Impact Assessment
    businessImpactScore: 30,
    estimatedUserCount: 26,
    dependencies: ['API Gateway', 'Cache', 'Queue', 'Load Balancer', 'Application Server', 'Database', 'Authentication', 'Web Server'],
    dependentSystemCount: 7
})

CREATE (vm_7546:VirtualMachine {
    // Basic Identification
    id: 'vm-7546',
    name: 'vm-7546',
    displayName: 'test-server-7546',
    uuid: '98fd8c2e-5730-4a6e-8b67-7f05b07a536c',
    instanceUuid: 'c02dc4a9-0bf5-403f-9fa5-c71c7ca55d55',
    biosUuid: '42 47950343 3842 43d7 81d3 f745036193fb',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2022',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2022 (64-bit)',
    guestState: 'shuttingDown',
    guestHostname: 'test-server-7546.internal.local',
    guestToolsStatus: 'toolsNotRunning',
    guestToolsVersion: '12755',

    // VM Configuration
    vcpus: 4,
    coresPerSocket: 8,
    memoryGB: 16,
    memoryReservationGB: 0,
    memoryLimitGB: 16,
    cpuReservationMhz: 1557,
    cpuLimitMhz: 0,
    numVirtualDisks: 4,
    totalStorageGB: 530,
    diskSizes: ['80', '100', '50', '300'],
    numVirtualNics: 2,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-13',
    firmware: 'bios',
    bootDelay: 2000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 67,
    memoryUsage: 5,
    uptimeDays: 35,

    // Advanced Features
    vMotionEnabled: false,
    faultToleranceState: 'notConfigured',
    snapshots: 4,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Monitoring Tool',
    environment: 'Development',
    owner: 'Legal',
    costCenter: 'CC-414623',
    criticality: 'Low',

    // Management
    creationDate: '2024-11-02T23:38:01Z',
    lastBackupDate: '2025-03-14T05:59:09Z',
    lastPatchDate: '2024-11-23',
    maintenanceWindow: 'Monday 13:00-18:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'risk',

    // Change Management
    lastChangeRequestID: 'CR-20250118-094',
    lastChangeRequestStatus: 'Completed',
    lastChangeType: 'Software Installation',
    pendingChangeRequestID: 'CR-20250406-420',
    pendingChangeType: 'Migration',
    scheduledChangeDate: '2025-04-28',

    // Impact Assessment
    businessImpactScore: 27,
    estimatedUserCount: 59,
    dependencies: ['File Server', 'API Gateway', 'Queue', 'Cache', 'Database', 'Authentication'],
    dependentSystemCount: 3
})

CREATE (vm_4546:VirtualMachine {
    // Basic Identification
    id: 'vm-4546',
    name: 'vm-4546',
    displayName: 'db-server-4546',
    uuid: '6efd9663-39eb-46c4-8470-9863e2a696f9',
    instanceUuid: '5a26daf1-7dca-4f83-bce6-a3a95f8f9524',
    biosUuid: '42 cdba2dab 2957 4ce1 9b27 1dcc2a7eb02a',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2022',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2022 (64-bit)',
    guestState: 'running',
    guestHostname: 'db-server-4546.internal.local',
    guestToolsStatus: 'toolsOk',
    guestToolsVersion: '10095',

    // VM Configuration
    vcpus: 2,
    coresPerSocket: 8,
    memoryGB: 2,
    memoryReservationGB: 0,
    memoryLimitGB: 2,
    cpuReservationMhz: 531,
    cpuLimitMhz: 0,
    numVirtualDisks: 1,
    totalStorageGB: 60,
    diskSizes: ['60'],
    numVirtualNics: 2,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-13',
    firmware: 'efi',
    bootDelay: 5000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 46,
    memoryUsage: 0,
    uptimeDays: 188,

    // Advanced Features
    vMotionEnabled: false,
    faultToleranceState: 'notConfigured',
    snapshots: 2,
    consolidationNeeded: false,

    // Resource Allocation
    diskProvisionType: 'eagerzeroedthick',
    swapplacement: 'hostLocal',
    balloonedMemory: 0,

    // Business Context
    application: 'Print Server',
    environment: 'QA',
    owner: 'Marketing',
    costCenter: 'CC-150670',
    criticality: 'Low',

    // Management
    creationDate: '2022-07-13T22:16:08Z',
    lastBackupDate: '2025-03-11T04:18:59Z',
    lastPatchDate: '2024-11-09',
    maintenanceWindow: 'Monday 14:00-18:00',

    // Compliance and Security
    complianceStatus: 'nonCompliant',
    securityStatus: 'risk',

    // Change Management
    lastChangeRequestID: 'CR-20241029-679',
    lastChangeRequestStatus: 'Failed',
    lastChangeType: 'Migration',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 13,
    estimatedUserCount: 55,
    dependencies: ['Database', 'Application Server', 'Queue', 'File Server', 'Authentication', 'Web Server'],
    dependentSystemCount: 2
})

CREATE (vm_9762:VirtualMachine {
    // Basic Identification
    id: 'vm-9762',
    name: 'vm-9762',
    displayName: 'auth-server-9762',
    uuid: '81ef07f0-0fc5-4bfb-b1c2-57c301c9da87',
    instanceUuid: 'f161ca6e-f126-4aaa-ba96-780f6cb19e9e',
    biosUuid: '42 aa6f7062 cb19 4f12 96ec 906275c8d92a',

    // Guest OS Details
    guestOS: 'Microsoft Windows Server 2016',
    guestFamily: 'windowsGuest',
    guestFullName: 'Microsoft Windows Server 2016 (64-bit)',
    guestState: 'running',
    guestHostname: 'auth-server-9762.internal.local',
    guestToolsStatus: 'toolsOk',
    guestToolsVersion: '11138',

    // VM Configuration
    vcpus: 8,
    coresPerSocket: 8,
    memoryGB: 2,
    memoryReservationGB: 1,
    memoryLimitGB: 2,
    cpuReservationMhz: 3752,
    cpuLimitMhz: 0,
    numVirtualDisks: 3,
    totalStorageGB: 1360,
    diskSizes: ['60', '300', '1000'],
    numVirtualNics: 4,
    networkType: 'vmxnet3',
    virtualHardwareVersion: 'vmx-15',
    firmware: 'efi',
    bootDelay: 5000,

    // Performance and Status
    powerState: 'poweredOn',
    connectionState: 'connected',
    cpuUsage: 53,
    memoryUsage: 1,
    uptimeDays: 73,

    // Advanced Features
    vMotionEnabled: true,
    faultToleranceState: 'notConfigured',
    snapshots: 0,
    consolidationNeeded: true,

    // Resource Allocation
    diskProvisionType: 'thick',
    swapplacement: 'vmDirectory',
    balloonedMemory: 0,

    // Business Context
    application: 'Email Server',
    environment: 'Production',
    owner: 'Finance',
    costCenter: 'CC-152698',
    criticality: 'Medium',

    // Management
    creationDate: '2023-07-17T01:22:02Z',
    lastBackupDate: '2025-03-10T04:58:38Z',
    lastPatchDate: '2025-02-08',
    maintenanceWindow: 'Saturday 21:00-00:00',

    // Compliance and Security
    complianceStatus: 'compliant',
    securityStatus: 'secure',

    // Change Management
    lastChangeRequestID: 'CR-20250131-590',
    lastChangeRequestStatus: 'Canceled',
    lastChangeType: 'New Deployment',
    pendingChangeRequestID: 'None',
    pendingChangeType: 'None',
    scheduledChangeDate: 'None',

    // Impact Assessment
    businessImpactScore: 53,
    estimatedUserCount: 66,
    dependencies: ['Database', 'Cache', 'Load Balancer', 'Application Server', 'API Gateway', 'Authentication', 'File Server', 'Queue'],
    dependentSystemCount: 7
});


// RELATIONSHIPS
// Generated VMware Environment Relationships

// This script creates relationships between specific node instances
// for a realistic VMware infrastructure topology

// vCenter Management Relationships
MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2068'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9335'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5301'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5384'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-4993'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-6515'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9526'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2307'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2440'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5043'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9642'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-7451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-13T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-2856'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-15T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9708'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-13T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-8348'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-15T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2068'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9335'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5301'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5384'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-4993'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-6515'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9526'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2307'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2440'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5043'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9642'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-7451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-12T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-2856'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-12T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9708'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-13T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-3546'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-16T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2068'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9335'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5301'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5384'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-4993'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-6515'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9526'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2307'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2440'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5043'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9642'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-7451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-14T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-2856'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-12T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9708'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-16T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-6729'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-15T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2068'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9335'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5301'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5384'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-4993'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-6515'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9526'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2307'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2440'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5043'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9642'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-7451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-15T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-2856'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-14T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9708'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-16T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-5451'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-10T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2068'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9335'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5301'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5384'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-4993'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-6515'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9526'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2307'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-2440'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-5043'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-9642'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (host:ESXiHost {id: 'host-7451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages host configuration and lifecycle', managementLevel: 'Full'}]->(host);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-12T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (cluster:VSphereCluster {id: 'cluster-2856'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages cluster configuration', lastConfigChange: '2025-03-11T12:58:41'}]->(cluster);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: true}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages storage configuration', provisioningAccess: false}]->(ds);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Snapshot'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9708'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'EditSettings'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'Reconfigure'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'PowerOn'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
CREATE (vc)-[:MANAGES {cardinality: '1:N', description: 'Manages VM lifecycle and configuration', managementLevel: 'Full', lastAction: 'vMotion'}]->(vm);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-10T12:58:41'}]->(nsx);

MATCH (vc:VCenterServer {id: 'vc-5728'}) 
WITH vc 
MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
CREATE (vc)-[:INTEGRATES_WITH {cardinality: '1:1', description: 'Management integration', integrationType: 'Native', lastVerified: '2025-03-12T12:58:41'}]->(nsx);


// Cluster and Host Relationships
MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-7451'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2024-11-16T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-4993'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2025-02-25T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-5043'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2025-01-03T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-9335'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2024-07-03T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-9526'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2024-11-26T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-6515'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2024-04-27T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-5301'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2024-07-23T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-9642'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2025-03-09T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-2307'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2025-03-06T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-2440'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2025-01-16T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-2068'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2025-02-20T12:58:41', membershipStatus: 'Active'}]->(host);

MATCH (cluster:VSphereCluster {id: 'cluster-4581'}) 
WITH cluster 
MATCH (host:ESXiHost {id: 'host-5384'}) 
CREATE (cluster)-[:CONTAINS {cardinality: '1:N', description: 'Host membership in cluster', joinDate: '2024-07-16T12:58:41', membershipStatus: 'Active'}]->(host);


// VM and Host Relationships
MATCH (host:ESXiHost {id: 'host-2068'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 28, memoryReservation: 29, affinityType: 'Hard'}]->(vm);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 47, memoryReservation: 88, affinityType: 'Hard'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 95, memoryReservation: 96, affinityType: 'Soft'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2068'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 41, memoryReservation: 77, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 2, memoryReservation: 77, affinityType: 'Soft'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2068'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 69, memoryReservation: 21, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 96, memoryReservation: 37, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 52, memoryReservation: 11, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 9, memoryReservation: 50, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 68, memoryReservation: 19, affinityType: 'Hard'}]->(vm);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 17, memoryReservation: 43, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-9708'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 98, memoryReservation: 16, affinityType: 'Hard'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 62, memoryReservation: 7, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 50, memoryReservation: 53, affinityType: 'Soft'}]->(vm);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 57, memoryReservation: 18, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 53, memoryReservation: 71, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-5384'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 13, memoryReservation: 42, affinityType: 'None'}]->(vm);

MATCH (host:ESXiHost {id: 'host-2068'}) 
WITH host 
MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
CREATE (host)-[:HOSTS {cardinality: '1:N', description: 'Provides compute resources to VM', vCpuReservation: 45, memoryReservation: 8, affinityType: 'None'}]->(vm);


// Storage Relationships
// ESXi Host to Datastore connections
MATCH (host:ESXiHost {id: 'host-2068'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS5368', multipathing: 'MRU', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-9335'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/Local-6063', multipathing: 'MRU', activePaths: 4}]->(ds);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/NFS-Vol3998', multipathing: 'RoundRobin', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadOnly', mountPoint: '/vmfs/volumes/Local-6063', multipathing: 'Fixed', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/VMFS-3755', multipathing: 'Fixed', activePaths: 4}]->(ds);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS9054', multipathing: 'MRU', activePaths: 4}]->(ds);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/SAN-LUN6451', multipathing: 'RoundRobin', activePaths: 4}]->(ds);

MATCH (host:ESXiHost {id: 'host-5384'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/Local-6063', multipathing: 'MRU', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-5384'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS2550', multipathing: 'Fixed', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-5384'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS6123', multipathing: 'MRU', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/Local-6063', multipathing: 'Fixed', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadOnly', mountPoint: '/vmfs/volumes/vSAN-DS1656', multipathing: 'MRU', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS5368', multipathing: 'Fixed', activePaths: 3}]->(ds);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS9054', multipathing: 'Fixed', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS6123', multipathing: 'RoundRobin', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/VMFS-3755', multipathing: 'RoundRobin', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS5368', multipathing: 'MRU', activePaths: 4}]->(ds);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS9054', multipathing: 'Fixed', activePaths: 4}]->(ds);

MATCH (host:ESXiHost {id: 'host-9526'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS2550', multipathing: 'Fixed', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-9526'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/NFS-Vol3998', multipathing: 'Fixed', activePaths: 3}]->(ds);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadOnly', mountPoint: '/vmfs/volumes/vSAN-DS1656', multipathing: 'RoundRobin', activePaths: 3}]->(ds);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/SAN-LUN6451', multipathing: 'Fixed', activePaths: 4}]->(ds);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS9608', multipathing: 'Fixed', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS2550', multipathing: 'Fixed', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS2550', multipathing: 'Fixed', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/VMFS-3755', multipathing: 'Fixed', activePaths: 3}]->(ds);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS6123', multipathing: 'RoundRobin', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS9608', multipathing: 'Fixed', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/Local-6063', multipathing: 'Fixed', activePaths: 2}]->(ds);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/SAN-LUN6451', multipathing: 'RoundRobin', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-9642'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/VMFS-3755', multipathing: 'RoundRobin', activePaths: 1}]->(ds);

MATCH (host:ESXiHost {id: 'host-9642'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadWrite', mountPoint: '/vmfs/volumes/DS6123', multipathing: 'RoundRobin', activePaths: 3}]->(ds);

MATCH (host:ESXiHost {id: 'host-7451'}) 
WITH host 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (host)-[:ACCESSES {cardinality: 'N:M', description: 'Storage access', accessMode: 'ReadOnly', mountPoint: '/vmfs/volumes/VMFS-3755', multipathing: 'RoundRobin', activePaths: 3}]->(ds);

// VM to Datastore storage relationships
MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Silver',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 500, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Bronze',fileCount: 6}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Bronze',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Gold',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 500, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Silver',fileCount: 5}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 200, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Gold',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 4', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Bronze',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 5', sizeGB: 1000, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Gold',fileCount: 4}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Standard',fileCount: 3}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 200, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Silver',fileCount: 7}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 200, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Bronze',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Silver',fileCount: 5}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 100, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Gold',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Gold',fileCount: 5}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 100, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Standard',fileCount: 1}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 500, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Standard',fileCount: 7}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-6394'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 200, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Silver',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Gold',fileCount: 4}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 100, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Gold',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 200, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Silver',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 500, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Standard',fileCount: 1}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 4', sizeGB: 200, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Bronze',fileCount: 3}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Bronze',fileCount: 3}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Silver',fileCount: 1}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Standard',fileCount: 3}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Gold',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 500, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Silver',fileCount: 6}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 100, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Gold',fileCount: 8}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Gold',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 200, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Gold',fileCount: 1}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 500, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Standard',fileCount: 8}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 200, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Bronze',fileCount: 5}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 4', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Standard',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Bronze',fileCount: 3}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 500, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Silver',fileCount: 5}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 200, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Standard',fileCount: 8}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 200, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Silver',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 4', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Silver',fileCount: 7}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 5', sizeGB: 100, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Gold',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Gold',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 1000, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Bronze',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 200, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Silver',fileCount: 8}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 100, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Gold',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 4', sizeGB: 500, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Gold',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 5', sizeGB: 200, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Bronze',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Bronze',fileCount: 6}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 500, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Standard',fileCount: 7}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Gold',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Gold',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 1000, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Bronze',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Silver',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9708'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Standard',fileCount: 7}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Bronze',fileCount: 5}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Gold',fileCount: 3}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 100, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Gold',fileCount: 4}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Bronze',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 500, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Standard',fileCount: 5}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9054'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Gold',fileCount: 2}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 500, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Standard',fileCount: 4}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 500, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Silver',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 200, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Bronze',fileCount: 7}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 4', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thick', storagePolicy: 'Gold',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-9608'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Bronze',fileCount: 4}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 100, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Silver',fileCount: 1}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-1656'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 100, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Standard',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6451'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 3', sizeGB: 500, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Bronze',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-6063'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Standard',fileCount: 3}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-3998'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'System Disk', sizeGB: 40, format: 'vmdk', provisioningType: 'EagerZeroedThick', storagePolicy: 'Standard',fileCount: 10}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 1', sizeGB: 1000, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Silver',fileCount: 9}]->(ds);

MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
WITH vm 
MATCH (ds:Datastore {id: 'datastore-2550'}) 
CREATE (vm)-[:USES_STORAGE {cardinality: 'N:M', description: 'VM files stored on datastore', diskType: 'Data Disk 2', sizeGB: 500, format: 'vmdk', provisioningType: 'Thin', storagePolicy: 'Silver',fileCount: 4}]->(ds);

// vSAN to Datastore provisioning
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
WITH vsan 
MATCH (ds:Datastore {id: 'datastore-5368'}) 
CREATE (vsan)-[:PROVIDES {cardinality: '1:N', description: 'vSAN storage provisioning', policyName: 'Capacity Tier', failuresToTolerate: 2, stripeWidth: 9, forceProvisioning: true}]->(ds);

MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
WITH vsan 
MATCH (ds:Datastore {id: 'datastore-3755'}) 
CREATE (vsan)-[:PROVIDES {cardinality: '1:N', description: 'vSAN storage provisioning', policyName: 'vSAN Default Storage Policy', failuresToTolerate: 2, stripeWidth: 12, forceProvisioning: false}]->(ds);

MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
WITH vsan 
MATCH (ds:Datastore {id: 'datastore-6123'}) 
CREATE (vsan)-[:PROVIDES {cardinality: '1:N', description: 'vSAN storage provisioning', policyName: 'Capacity Tier', failuresToTolerate: 2, stripeWidth: 5, forceProvisioning: false}]->(ds);


// Network Relationships
// ESXi Host to Virtual Network relationships
MATCH (host:ESXiHost {id: 'host-2068'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Full', uplinkUtilization: 2}]->(vnet);

MATCH (host:ESXiHost {id: 'host-2068'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6003'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Partial', uplinkUtilization: 43}]->(vnet);

MATCH (host:ESXiHost {id: 'host-9335'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 4, redundancyStatus: 'Full', uplinkUtilization: 64}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'Full', uplinkUtilization: 61}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6003'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 4, redundancyStatus: 'None', uplinkUtilization: 42}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 4, redundancyStatus: 'None', uplinkUtilization: 79}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5301'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 4, redundancyStatus: 'None', uplinkUtilization: 5}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5384'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'None', uplinkUtilization: 59}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5384'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Partial', uplinkUtilization: 56}]->(vnet);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'Partial', uplinkUtilization: 17}]->(vnet);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'None', uplinkUtilization: 3}]->(vnet);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'Full', uplinkUtilization: 88}]->(vnet);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 3, redundancyStatus: 'None', uplinkUtilization: 47}]->(vnet);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Partial', uplinkUtilization: 54}]->(vnet);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 4, redundancyStatus: 'Full', uplinkUtilization: 34}]->(vnet);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'None', uplinkUtilization: 13}]->(vnet);

MATCH (host:ESXiHost {id: 'host-9526'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6003'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'Full', uplinkUtilization: 36}]->(vnet);

MATCH (host:ESXiHost {id: 'host-9526'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 4, redundancyStatus: 'None', uplinkUtilization: 60}]->(vnet);

MATCH (host:ESXiHost {id: 'host-9526'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'None', uplinkUtilization: 41}]->(vnet);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 4, redundancyStatus: 'Partial', uplinkUtilization: 47}]->(vnet);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'Full', uplinkUtilization: 26}]->(vnet);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'None', uplinkUtilization: 45}]->(vnet);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Full', uplinkUtilization: 71}]->(vnet);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Full', uplinkUtilization: 79}]->(vnet);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'Full', uplinkUtilization: 74}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 3, redundancyStatus: 'Partial', uplinkUtilization: 8}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6003'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Full', uplinkUtilization: 60}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 4, redundancyStatus: 'Full', uplinkUtilization: 27}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Full', uplinkUtilization: 9}]->(vnet);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 3, redundancyStatus: 'Full', uplinkUtilization: 23}]->(vnet);

MATCH (host:ESXiHost {id: 'host-9642'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Partial', uplinkUtilization: 44}]->(vnet);

MATCH (host:ESXiHost {id: 'host-9642'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Partial', uplinkUtilization: 65}]->(vnet);

MATCH (host:ESXiHost {id: 'host-7451'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'None', uplinkUtilization: 86}]->(vnet);

MATCH (host:ESXiHost {id: 'host-7451'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 1, redundancyStatus: 'Full', uplinkUtilization: 84}]->(vnet);

MATCH (host:ESXiHost {id: 'host-7451'}) 
WITH host 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (host)-[:PROVIDES_NETWORK {cardinality: '1:N', description: 'Network connectivity', uplinks: 2, redundancyStatus: 'None', uplinkUtilization: 37}]->(vnet);

// VM to Virtual Network connections
MATCH (vm:VirtualMachine {id: 'vm-7673'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '14.160.96.6', macAddress: '14:39:54:21:48:08'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: false, ipAddress: '168.200.38.164', macAddress: 'eb:0f:6b:08:04:ee'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '137.139.164.99', macAddress: '73:e0:d7:53:6c:8d'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-5110'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 2, connected: true, ipAddress: '121.5.138.84', macAddress: 'c1:0c:1f:8f:5f:41'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: false, ipAddress: '39.175.228.132', macAddress: '19:67:ee:f9:f1:a0'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '172.78.238.134', macAddress: '0c:bd:5a:b4:82:b9'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 2, connected: true, ipAddress: '151.221.199.145', macAddress: '5b:c0:3b:83:8d:91'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8284'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6463'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 3, connected: true, ipAddress: '119.135.33.251', macAddress: '1d:1b:bb:bf:2e:29'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 0, connected: true, ipAddress: '160.210.153.175', macAddress: 'fc:5d:e1:75:14:47'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1286'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 1, connected: true, ipAddress: '174.140.63.77', macAddress: '05:fb:ef:e0:8b:ce'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '128.98.158.216', macAddress: 'ae:d7:ac:6c:66:12'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: false, ipAddress: '85.53.200.38', macAddress: 'c6:58:2c:3e:74:a8'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6463'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 2, connected: false, ipAddress: '181.148.162.111', macAddress: 'ac:7a:b4:be:5d:3f'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2728'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 3, connected: true, ipAddress: '56.88.189.9', macAddress: '12:ce:23:5c:b7:69'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 0, connected: true, ipAddress: '190.150.146.45', macAddress: '71:eb:5a:39:96:14'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 1, connected: true, ipAddress: '19.116.57.62', macAddress: '4f:f6:87:5f:fa:04'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8069'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 2, connected: true, ipAddress: '27.166.116.6', macAddress: '13:fb:d3:15:8d:ef'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '182.212.107.17', macAddress: 'c7:10:ca:b6:1e:85'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-8225'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: false, ipAddress: '165.79.224.139', macAddress: 'c5:7b:4b:fd:83:88'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 0, connected: true, ipAddress: '109.148.103.215', macAddress: 'ce:b7:1f:38:19:d1'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6463'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 1, connected: true, ipAddress: '128.46.152.216', macAddress: '80:9c:a2:47:52:7c'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-5351'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 2, connected: true, ipAddress: '124.84.128.38', macAddress: '8b:ca:3b:31:23:97'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '96.166.190.45', macAddress: '8e:73:d0:01:4d:9f'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '19.226.46.112', macAddress: '6c:ce:0c:8f:96:27'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 2, connected: true, ipAddress: '92.190.200.66', macAddress: '0a:3d:55:63:79:95'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2923'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 3, connected: true, ipAddress: '150.64.71.197', macAddress: '50:6e:16:60:47:f4'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-9401'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 0, connected: true, ipAddress: '11.176.20.223', macAddress: '4b:16:10:af:76:3c'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '86.28.82.97', macAddress: 'ab:56:33:8e:3c:3b'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '46.244.28.17', macAddress: '3a:fb:e1:d3:b9:ff'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 2, connected: true, ipAddress: '67.97.224.188', macAddress: 'af:57:14:43:62:ce'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1680'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 3, connected: true, ipAddress: '142.148.51.138', macAddress: '54:39:05:27:3a:0f'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-2209'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '62.136.188.48', macAddress: '52:4d:6a:1c:92:a7'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-9708'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'e1000', adapterNumber: 0, connected: true, ipAddress: '57.217.129.76', macAddress: '72:f6:78:8b:9d:ec'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6463'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '24.10.172.226', macAddress: '52:a1:e2:dd:a8:0d'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-4857'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '88.115.137.237', macAddress: '8a:4e:81:25:7b:4c'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6931'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '104.21.163.102', macAddress: 'a1:58:b5:fb:29:84'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '76.96.255.131', macAddress: '5e:29:1e:ea:07:ef'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-6734'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-4912'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 2, connected: true, ipAddress: '86.146.163.59', macAddress: '58:e5:98:79:e1:29'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '185.216.193.160', macAddress: '26:b3:d0:49:8d:a0'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6003'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '35.124.85.128', macAddress: '56:3d:1f:dc:9a:63'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-1127'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 2, connected: true, ipAddress: '150.110.209.50', macAddress: 'ac:5c:fa:0f:c1:82'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: true, ipAddress: '11.50.233.223', macAddress: 'f2:2a:5d:cb:aa:e8'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-7546'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-1383'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '125.248.212.197', macAddress: '0d:ad:68:30:58:21'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: false, ipAddress: '109.102.131.44', macAddress: 'e1:f3:7f:e4:d7:9b'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-4546'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-3146'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: true, ipAddress: '105.160.93.150', macAddress: 'd1:0d:e9:6f:4a:35'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6196'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 0, connected: false, ipAddress: '21.215.71.63', macAddress: 'c8:ab:6a:4a:b0:3b'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-2170'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 1, connected: false, ipAddress: '94.253.175.7', macAddress: 'ba:e1:51:dc:9a:d9'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 2, connected: true, ipAddress: '120.162.111.242', macAddress: '57:28:f1:aa:6f:d0'}]->(vnet);

MATCH (vm:VirtualMachine {id: 'vm-9762'}) 
WITH vm 
MATCH (vnet:VirtualNetwork {id: 'vnet-6463'}) 
CREATE (vm)-[:CONNECTED_TO {cardinality: 'N:M', description: 'Network connectivity', adapterType: 'vmxnet3', adapterNumber: 3, connected: true, ipAddress: '134.57.137.253', macAddress: 'b7:97:6d:34:ef:2a'}]->(vnet);


// NSX Management Relationships
MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (edge:NSXEdge {id: 'edge-9768'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management', managementConnection: 'API', lastSynchronized: '2025-03-10T12:58:41', configurationState: 'ConfigurationPending'}]->(edge);

MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (edge:NSXEdge {id: 'edge-3843'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management', managementConnection: 'API', lastSynchronized: '2025-03-11T12:58:41', configurationState: 'ConfigurationPending'}]->(edge);

MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (edge:NSXEdge {id: 'edge-5305'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management', managementConnection: 'API', lastSynchronized: '2025-03-14T12:58:41', configurationState: 'OutOfSync'}]->(edge);

MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (edge:NSXEdge {id: 'edge-7277'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management', managementConnection: 'API', lastSynchronized: '2025-03-10T12:58:41', configurationState: 'Synchronized'}]->(edge);

MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (switch:NSXSwitch {id: 'nsxswitch-8717'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX logical switch management', managementType: 'API', lastUpdated: '2025-03-11T12:58:41'}]->(switch);

MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (switch:NSXSwitch {id: 'nsxswitch-9793'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX logical switch management', managementType: 'API', lastUpdated: '2025-03-14T12:58:41'}]->(switch);

MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX network management', transportZone: 'TZ-Overlay', logicalRouterConnection: true}]->(vnet);

MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (vnet:VirtualNetwork {id: 'vnet-6463'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX network management', transportZone: 'TZ-VLAN', logicalRouterConnection: true}]->(vnet);

MATCH (nsx:NSXManager {id: 'nsxmgr-2461'}) 
WITH nsx 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX network management', transportZone: 'TZ-Overlay', logicalRouterConnection: true}]->(vnet);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (edge:NSXEdge {id: 'edge-9768'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management', managementConnection: 'API', lastSynchronized: '2025-03-12T12:58:41', configurationState: 'ConfigurationPending'}]->(edge);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (edge:NSXEdge {id: 'edge-3843'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management', managementConnection: 'API', lastSynchronized: '2025-03-15T12:58:41', configurationState: 'ConfigurationPending'}]->(edge);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (edge:NSXEdge {id: 'edge-5305'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management', managementConnection: 'API', lastSynchronized: '2025-03-16T12:58:41', configurationState: 'OutOfSync'}]->(edge);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (edge:NSXEdge {id: 'edge-7277'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX edge management', managementConnection: 'API', lastSynchronized: '2025-03-13T12:58:41', configurationState: 'ConfigurationPending'}]->(edge);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (switch:NSXSwitch {id: 'nsxswitch-8717'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX logical switch management', managementType: 'API', lastUpdated: '2025-03-12T12:58:41'}]->(switch);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (switch:NSXSwitch {id: 'nsxswitch-9793'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX logical switch management', managementType: 'API', lastUpdated: '2025-03-16T12:58:41'}]->(switch);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX network management', transportZone: 'TZ-Overlay', logicalRouterConnection: true}]->(vnet);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (vnet:VirtualNetwork {id: 'vnet-6463'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX network management', transportZone: 'TZ-VLAN', logicalRouterConnection: false}]->(vnet);

MATCH (nsx:NSXManager {id: 'nsxmgr-8711'}) 
WITH nsx 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (nsx)-[:MANAGES {cardinality: '1:N', description: 'NSX network management', transportZone: 'TZ-Overlay', logicalRouterConnection: true}]->(vnet);

// NSX Component Relationships
MATCH (edge:NSXEdge {id: 'edge-9768'}) 
WITH edge 
MATCH (switch:NSXSwitch {id: 'nsxswitch-8717'}) 
CREATE (edge)-[:CONNECTS {cardinality: 'N:M', description: 'Network connectivity', interfaceType: 'Internal', bandwidthMbps: 10000}]->(switch);

MATCH (edge:NSXEdge {id: 'edge-3843'}) 
WITH edge 
MATCH (switch:NSXSwitch {id: 'nsxswitch-8717'}) 
CREATE (edge)-[:CONNECTS {cardinality: 'N:M', description: 'Network connectivity', interfaceType: 'Transit', bandwidthMbps: 10000}]->(switch);

MATCH (edge:NSXEdge {id: 'edge-5305'}) 
WITH edge 
MATCH (switch:NSXSwitch {id: 'nsxswitch-8717'}) 
CREATE (edge)-[:CONNECTS {cardinality: 'N:M', description: 'Network connectivity', interfaceType: 'Service', bandwidthMbps: 1000}]->(switch);

MATCH (edge:NSXEdge {id: 'edge-5305'}) 
WITH edge 
MATCH (switch:NSXSwitch {id: 'nsxswitch-9793'}) 
CREATE (edge)-[:CONNECTS {cardinality: 'N:M', description: 'Network connectivity', interfaceType: 'Transit', bandwidthMbps: 10000}]->(switch);

MATCH (edge:NSXEdge {id: 'edge-7277'}) 
WITH edge 
MATCH (switch:NSXSwitch {id: 'nsxswitch-8717'}) 
CREATE (edge)-[:CONNECTS {cardinality: 'N:M', description: 'Network connectivity', interfaceType: 'Transit', bandwidthMbps: 1000}]->(switch);

MATCH (edge:NSXEdge {id: 'edge-7277'}) 
WITH edge 
MATCH (switch:NSXSwitch {id: 'nsxswitch-9793'}) 
CREATE (edge)-[:CONNECTS {cardinality: 'N:M', description: 'Network connectivity', interfaceType: 'Internal', bandwidthMbps: 1000}]->(switch);

MATCH (switch:NSXSwitch {id: 'nsxswitch-8717'}) 
WITH switch 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (switch)-[:IMPLEMENTS {cardinality: '1:1', description: 'Switch implementation', implementationType: 'Gateway', adminState: 'Down'}]->(vnet);

MATCH (switch:NSXSwitch {id: 'nsxswitch-8717'}) 
WITH switch 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (switch)-[:IMPLEMENTS {cardinality: '1:1', description: 'Switch implementation', implementationType: 'Native', adminState: 'Down'}]->(vnet);

MATCH (switch:NSXSwitch {id: 'nsxswitch-9793'}) 
WITH switch 
MATCH (vnet:VirtualNetwork {id: 'vnet-6936'}) 
CREATE (switch)-[:IMPLEMENTS {cardinality: '1:1', description: 'Switch implementation', implementationType: 'Gateway', adminState: 'Down'}]->(vnet);

MATCH (switch:NSXSwitch {id: 'nsxswitch-9793'}) 
WITH switch 
MATCH (vnet:VirtualNetwork {id: 'vnet-6463'}) 
CREATE (switch)-[:IMPLEMENTS {cardinality: '1:1', description: 'Switch implementation', implementationType: 'Bridge', adminState: 'Up'}]->(vnet);

MATCH (switch:NSXSwitch {id: 'nsxswitch-9793'}) 
WITH switch 
MATCH (vnet:VirtualNetwork {id: 'vnet-7354'}) 
CREATE (switch)-[:IMPLEMENTS {cardinality: '1:1', description: 'Switch implementation', implementationType: 'Gateway', adminState: 'Up'}]->(vnet);


// vSAN Relationships
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
WITH vsan 
MATCH (cluster:VSphereCluster {id: 'cluster-2856'}) 
CREATE (vsan)-[:DEPLOYED_ON {cardinality: '1:1', description: 'vSAN deployment target', deploymentDate: '2025-02-21T12:58:41', configurationState: 'Warning'}]->(cluster);

MATCH (host:ESXiHost {id: 'host-2068'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 1, cacheTierGB: 200, capacityTierTB: 2, role: 'Data+Witness'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-9335'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 1, cacheTierGB: 400, capacityTierTB: 2, role: 'Witness'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-5384'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 3, cacheTierGB: 1200, capacityTierTB: 24, role: 'Data'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-4993'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 3, cacheTierGB: 1200, capacityTierTB: 24, role: 'Witness'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-6515'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 1, cacheTierGB: 200, capacityTierTB: 8, role: 'Witness'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-9526'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 1, cacheTierGB: 200, capacityTierTB: 12, role: 'Witness'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-2307'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 2, cacheTierGB: 800, capacityTierTB: 24, role: 'Data'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-2440'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 2, cacheTierGB: 400, capacityTierTB: 16, role: 'Data+Witness'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-5043'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 1, cacheTierGB: 400, capacityTierTB: 2, role: 'Data+Witness'}]->(vsan);

MATCH (host:ESXiHost {id: 'host-7451'}) 
WITH host 
MATCH (vsan:VSANCluster {id: 'vsan-6301'}) 
CREATE (host)-[:PARTICIPATES_IN {cardinality: 'N:1', description: 'vSAN membership', diskGroups: 1, cacheTierGB: 800, capacityTierTB: 4, role: 'Witness'}]->(vsan)