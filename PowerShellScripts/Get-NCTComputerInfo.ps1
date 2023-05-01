<#
PowerShell is a powerful scripting language and automation framework 
that can be used to perform various tasks to check the health and 
safety of a Windows machine. Some examples include:
#>

<#
Check system information: 
Use the Get-ComputerInfo cmdlet to retrieve system information, 
such as OS version, installed updates, hardware details, and more.

In PowerShell, you can store the results of the Get-ComputerInfo 
cmdlet into an array and then print the contents of that array. 
Here's an example of how to do that:
#>

# Get the computer info and store it in a variable
$computerInfo = Get-ComputerInfo

# Convert the properties of the computer info object into an array
$computerInfoArray = $computerInfo.PSObject.Properties | `
ForEach-Object { $_.Name, $_.Value }

# Print the array
# This variable has associated parts, 2 parts per find
# Ex: [0] = name, [1] = computer find for that name
$count = 1
for ($i = 0; $i -lt $computerInfoArray.Length; $i += 2) {
    Write-Host "$count) $($computerInfoArray[$i]): $($computerInfoArray[$i+1])"
    $count++
}

<# Examples of what was found on a basic desktop
1) WindowsBuildLabEx: 22621.1.amd64fre.ni_release.220506-1250
2) WindowsCurrentVersion: 6.3
3) WindowsEditionId: Professional
4) WindowsInstallationType: Client
5) WindowsInstallDateFromRegistry: 10/21/2022 13:14:21
6) WindowsProductId: 00455-60468-99424-ABOEM   (NCT changed - fake)
7) WindowsProductName: Windows 10 Pro
8) WindowsRegisteredOrganization: 
9) WindowsRegisteredOwner: ncchar@gmail.com    (NCT changed - fake)
10) WindowsSystemRoot: C:\WINDOWS
11) WindowsVersion: 2009
12) OSDisplayVersion: 22H2
13) BiosCharacteristics: 7 9 11 12 15 16 19 23 24 25 26 27 28 29 32 33 40 41 42 43
14) BiosBIOSVersion: DELL   - 1072009 2.10.0 American Megatrends - 50011
15) BiosBuildNumber: 
16) BiosCaption: 2.10.0
17) BiosCodeSet: 
18) BiosCurrentLanguage: en|US|iso8859-1
19) BiosDescription: 2.10.0
20) BiosEmbeddedControllerMajorVersion: 255
21) BiosEmbeddedControllerMinorVersion: 255
22) BiosFirmwareType: Uefi
23) BiosIdentificationCode: 
24) BiosInstallableLanguages: 2
25) BiosInstallDate: 
26) BiosLanguageEdition: 
27) BiosListOfLanguages: en|US|iso8859-1 
28) BiosManufacturer: Dell Inc.
29) BiosName: 2.10.0
30) BiosOtherTargetOS: 
31) BiosPrimaryBIOS: True
32) BiosReleaseDate: 09/13/2022 20:00:00
33) BiosSeralNumber: 3GKHJE3 (NCT changed - fake)
34) BiosSMBIOSBIOSVersion: 2.10.0
35) BiosSMBIOSMajorVersion: 3
36) BiosSMBIOSMinorVersion: 2
37) BiosSMBIOSPresent: True
38) BiosSoftwareElementState: Running
39) BiosStatus: OK
40) BiosSystemBiosMajorVersion: 2
41) BiosSystemBiosMinorVersion: 10
42) BiosTargetOperatingSystem: 0
43) BiosVersion: DELL   - 1072009
44) CsAdminPasswordStatus: Unknown
45) CsAutomaticManagedPagefile: True
46) CsAutomaticResetBootOption: True
47) CsAutomaticResetCapability: True
48) CsBootOptionOnLimit: 
49) CsBootOptionOnWatchDog: 
50) CsBootROMSupported: True
51) CsBootStatus: 0 0 0 0 0 0 0 0 0 0
52) CsBootupState: Normal boot
53) CsCaption: NCTD   (NCT changed - fake)
54) CsChassisBootupState: Safe
55) CsChassisSKUNumber: Desktop
56) CsCurrentTimeZone: -240
57) CsDaylightInEffect: True
58) CsDescription: AT/AT COMPATIBLE
59) CsDNSHostName: NCTD     (NCT changed - fake)
60) CsDomain: WORKGROUP
61) CsDomainRole: StandaloneWorkstation
62) CsEnableDaylightSavingsTime: True
63) CsFrontPanelResetStatus: Unknown
64) CsHypervisorPresent: True
65) CsInfraredSupported: False
66) CsInitialLoadInfo: 
67) CsInstallDate: 
68) CsKeyboardPasswordStatus: Unknown
69) CsLastLoadInfo: 
70) CsManufacturer: Dell Inc.
71) CsModel: XPS 8940
72) CsName: NCTD    (NCT changed - fake)
73) CsNetworkAdapters: Microsoft.PowerShell.Commands.NetworkAdapter Microsoft.PowerShell.C
ommands.NetworkAdapter Microsoft.PowerShell.Commands.NetworkAdapter Microsoft.PowerShell.C
ommands.NetworkAdapter
74) CsNetworkServerModeEnabled: True
75) CsNumberOfLogicalProcessors: 16
76) CsNumberOfProcessors: 1
77) CsProcessors: Microsoft.PowerShell.Commands.Processor
78) CsOEMStringArray: Dell System 1[09C5] 3[1.0] 12[www.dell.com] 14[1] 15[3] 27[869097409
5] 28[3]
79) CsPartOfDomain: False
80) CsPauseAfterReset: -1
81) CsPCSystemType: Desktop
82) CsPCSystemTypeEx: Desktop
83) CsPowerManagementCapabilities: 
84) CsPowerManagementSupported: 
85) CsPowerOnPasswordStatus: Unknown
86) CsPowerState: Unknown
87) CsPowerSupplyState: Safe
88) CsPrimaryOwnerContact: 
89) CsPrimaryOwnerName: ncchar@gmail.com  (NCT changed - fake)
90) CsResetCapability: Other
91) CsResetCount: -1
92) CsResetLimit: -1
93) CsRoles: LM_Workstation LM_Server NT
94) CsStatus: OK
95) CsSupportContactDescription: 
96) CsSystemFamily: XPS
97) CsSystemSKUNumber: 09C5
98) CsSystemType: x64-based PC
99) CsThermalState: Safe
100) CsTotalPhysicalMemory: 33941618688
101) CsPhyicallyInstalledMemory: 33554432
102) CsUserName: NCTD\ncchar   (NCT changed - fake)
103) CsWakeUpType: PowerSwitch
104) CsWorkgroup: WORKGROUP
105) OsName: Microsoft Windows 11 Pro
106) OsType: WINNT
107) OsOperatingSystemSKU: 48
108) OsVersion: 10.0.22621
109) OsCSDVersion: 
110) OsBuildNumber: 22621
111) OsHotFixes: Microsoft.PowerShell.Commands.HotFix Microsoft.PowerShell.Commands.HotFix
 Microsoft.PowerShell.Commands.HotFix Microsoft.PowerShell.Commands.HotFix
112) OsBootDevice: \Device\HarddiskVolume3
113) OsSystemDevice: \Device\HarddiskVolume5
114) OsSystemDirectory: C:\WINDOWS\system32
115) OsSystemDrive: C:
116) OsWindowsDirectory: C:\WINDOWS
117) OsCountryCode: 1
118) OsCurrentTimeZone: -240
119) OsLocaleID: 0409
120) OsLocale: en-US
121) OsLocalDateTime: 04/30/2023 19:13:33
122) OsLastBootUpTime: 04/12/2023 01:01:27
123) OsUptime: 18.18:12:05.7796766
124) OsBuildType: Multiprocessor Free
125) OsCodeSet: 1252
126) OsDataExecutionPreventionAvailable: True
127) OsDataExecutionPrevention32BitApplications: True
128) OsDataExecutionPreventionDrivers: True
129) OsDataExecutionPreventionSupportPolicy: OptIn
130) OsDebug: False
131) OsDistributed: False
132) OsEncryptionLevel: 256
133) OsForegroundApplicationBoost: Maximum
134) OsTotalVisibleMemorySize: 33146112
135) OsFreePhysicalMemory: 22286448
136) OsTotalVirtualMemorySize: 35243264
137) OsFreeVirtualMemory: 23467760
138) OsInUseVirtualMemory: 11775504
139) OsTotalSwapSpaceSize: 
140) OsSizeStoredInPagingFiles: 2097152
141) OsFreeSpaceInPagingFiles: 2089796
142) OsPagingFiles: C:\pagefile.sys
143) OsHardwareAbstractionLayer: 10.0.22621.1413
144) OsInstallDate: 10/21/2022 09:14:21
145) OsManufacturer: Microsoft Corporation
146) OsMaxNumberOfProcesses: 4294967295
147) OsMaxProcessMemorySize: 137438953344
148) OsMuiLanguages: en-US
149) OsNumberOfLicensedUsers: 0
150) OsNumberOfProcesses: 243
151) OsNumberOfUsers: 2
152) OsOrganization: 
153) OsArchitecture: 64-bit
154) OsLanguage: en-US
155) OsProductSuites: TerminalServicesSingleSession
156) OsOtherTypeDescription: 
157) OsPAEEnabled: 
158) OsPortableOperatingSystem: False
159) OsPrimary: True
160) OsProductType: WorkStation
161) OsRegisteredUser: ncchar@gmail.com      (NCT changed - fake)
162) OsSerialNumber: 10355-10668-19924-AAOEM (NCT changed - fake)
163) OsServicePackMajorVersion: 0
164) OsServicePackMinorVersion: 0
165) OsStatus: OK
166) OsSuites: TerminalServices TerminalServicesSingleSession
167) OsServerLevel: 
168) KeyboardLayout: en-US
169) TimeZone: (UTC-05:00) Eastern Time (US & Canada)
170) LogonServer: \\NCT (NCT changed - fake)
171) PowerPlatformRole: Desktop
172) HyperVisorPresent: True
173) HyperVRequirementDataExecutionPreventionAvailable: 
174) HyperVRequirementSecondLevelAddressTranslation: 
175) HyperVRequirementVirtualizationFirmwareEnabled: 
176) HyperVRequirementVMMonitorModeExtensions: 
177) DeviceGuardSmartStatus: Off
178) DeviceGuardRequiredSecurityProperties: 0
179) DeviceGuardAvailableSecurityProperties: BaseVirtualizationSupport SecureBoot DMAProte
ction SecureMemoryOverwrite 5 6 7 8
180) DeviceGuardSecurityServicesConfigured: 0
181) DeviceGuardSecurityServicesRunning: CredentialGuard
182) DeviceGuardCodeIntegrityPolicyEnforcementStatus: EnforcementMode
183) DeviceGuardUserModeCodeIntegrityPolicyEnforcementStatus: 

#>