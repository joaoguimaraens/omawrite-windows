#define PackageDir GetEnv("OMAWRITE_PACKAGE_DIR")
#define ReleaseVersion GetEnv("OMAWRITE_RELEASE_VERSION")

#if PackageDir == ""
  #error OMAWRITE_PACKAGE_DIR is not set
#endif

#if ReleaseVersion == ""
  #error OMAWRITE_RELEASE_VERSION is not set
#endif

[Setup]
AppId={{AE6883F4-1FC1-44FE-BE70-362A97A57B86}
AppName=Omawrite for Windows
AppVersion={#ReleaseVersion}
AppVerName=Omawrite for Windows {#ReleaseVersion}
AppPublisher=Omawrite contributors
AppPublisherURL=https://github.com/joaoguimaraens/omawrite-windows
AppSupportURL=https://github.com/joaoguimaraens/omawrite-windows/issues
AppUpdatesURL=https://github.com/joaoguimaraens/omawrite-windows/releases/latest
DefaultDirName={localappdata}\Programs\Omawrite
DefaultGroupName=Omawrite for Windows
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
SetupArchitecture=x64
ChangesAssociations=yes
CloseApplications=yes
RestartApplications=no
WizardStyle=modern
Compression=lzma2/ultra64
SolidCompression=yes
SetupIconFile=omawrite.ico
UninstallDisplayIcon={app}\omawrite.exe
LicenseFile=..\LICENSE
OutputBaseFilename=Omawrite-Windows-Setup-x64
VersionInfoVersion=0.7.2.0
VersionInfoDescription=Omawrite for Windows Setup
VersionInfoCompany=Omawrite contributors
VersionInfoCopyright=Copyright (c) Omawrite contributors

[Files]
Source: "{#PackageDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Omawrite for Windows"; Filename: "{app}\omawrite.exe"; WorkingDir: "{app}"

[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\OmawriteWindows"; Flags: deletekey
Root: HKCU; Subkey: "Software\Classes\Omawrite.Markdown"; ValueType: string; ValueName: ""; ValueData: "Markdown Document"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Classes\Omawrite.Markdown\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\omawrite.exe,0"
Root: HKCU; Subkey: "Software\Classes\Omawrite.Markdown\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\omawrite.exe"" ""%1"""
Root: HKCU; Subkey: "Software\Classes\Applications\omawrite.exe"; ValueType: string; ValueName: "FriendlyAppName"; ValueData: "Omawrite for Windows"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Classes\Applications\omawrite.exe\SupportedTypes"; ValueType: string; ValueName: ".md"; ValueData: ""
Root: HKCU; Subkey: "Software\Classes\Applications\omawrite.exe\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\omawrite.exe"" ""%1"""
Root: HKCU; Subkey: "Software\Classes\.md\OpenWithProgids"; ValueType: string; ValueName: "Omawrite.Markdown"; ValueData: ""; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\OmawriteWindows\Capabilities"; ValueType: string; ValueName: "ApplicationName"; ValueData: "Omawrite for Windows"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\OmawriteWindows\Capabilities"; ValueType: string; ValueName: "ApplicationDescription"; ValueData: "A focused native Markdown writing app."
Root: HKCU; Subkey: "Software\OmawriteWindows\Capabilities\FileAssociations"; ValueType: string; ValueName: ".md"; ValueData: "Omawrite.Markdown"
Root: HKCU; Subkey: "Software\RegisteredApplications"; ValueType: string; ValueName: "Omawrite for Windows"; ValueData: "Software\OmawriteWindows\Capabilities"; Flags: uninsdeletevalue
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.md\OpenWithProgids"; ValueType: string; ValueName: "Omawrite.Markdown"; ValueData: ""; Flags: uninsdeletevalue uninsdeletekeyifempty

[Run]
Filename: "{app}\vc_redist.x64.exe"; Parameters: "/install /passive /norestart"; StatusMsg: "Installing the Microsoft Visual C++ runtime..."; Check: VCRuntimeNeeded; Flags: waituntilterminated
Filename: "{app}\omawrite.exe"; Description: "Launch Omawrite"; Flags: nowait postinstall skipifsilent
Filename: "ms-settings:defaultapps?registeredAppUser=Omawrite%20for%20Windows"; Description: "Choose Omawrite for Markdown files"; Flags: shellexec nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[Code]
function VCRuntimeNeeded: Boolean;
begin
  Result := not FileExists(ExpandConstant('{sys}\vcruntime140_1.dll'));
end;
