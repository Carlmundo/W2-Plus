#define AppName "Worms 2 Plus"
#define AppVersion "1.0"
#define AppProcess1 "frontend.exe"
#define AppProcess2 "worms2.exe"
#define Game "Worms 2"
#define RegPathCU1 "Software\Team17SoftwareLTD\Worms2"
#define RegPathCU2 "Software\Team17SoftwareLTD\frontend\Worms2"
#define RegPathLM1 "Software\GOG.com\GOGWORMS2"
#define RegPathLM2 "Software\Microsoft\DirectPlay\Applications\worms2"
#define MsgRunning 'Worms 2 is running. Please close the game before installing the patch.'

[Setup]
AppId={{B90927CD-E317-466C-8B6B-BC9042E2F1D2}
AppName={#AppName}
AppVersion={#AppVersion}
DefaultDirName={code:GetDefaultDir}
DisableProgramGroupPage=yes
DirExistsWarning=no
DisableDirPage=no
AppendDefaultDirName=no
DisableReadyPage=no
AlwaysShowDirOnReadyPage=yes
CloseApplications=yes
OutputBaseFilename={#AppName} {#AppVersion}
SetupIconFile=image-icon.ico
WizardImageFile=image-large.bmp
WizardImageStretch=no
WizardSmallImageFile=image-small.bmp
Compression=none
Uninstallable=no
PrivilegesRequired=admin
UsedUserAreasWarning=no

[Files]
;Patch files
Source: "..\Patch\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Registry]
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "DXPATCHED"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "VNDX"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "W2ALLOWVID"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "CD"; ValueData:  "."
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "W2PATH"; ValueData:  "."
Root: HKCU; Subkey: "{#RegPathCU2}"; ValueType: dword; ValueName: "VideoSetting"; ValueData: 5

[Code]
function IsAppRunning(const FileName: string): Boolean;
var
  FWMIService: Variant;
  FSWbemLocator: Variant;
  FWbemObjectSet: Variant;
begin
  Result := false;
  FSWbemLocator := CreateOleObject('WBEMScripting.SWBEMLocator');
  FWMIService := FSWbemLocator.ConnectServer('', 'root\CIMV2', '', '');
  FWbemObjectSet := FWMIService.ExecQuery(Format('SELECT Name FROM Win32_Process Where Name="%s"',[FileName]));
  Result := (FWbemObjectSet.Count > 0);
  FWbemObjectSet := Unassigned;
  FWMIService := Unassigned;
  FSWbemLocator := Unassigned;
end;

function InitializeSetup: boolean;
begin
  Result := not IsAppRunning('{#AppProcess1}');
  if not Result then
  MsgBox('{#MsgRunning}', mbError, MB_OK);

  Result := not IsAppRunning('{#AppProcess2}');
  if not Result then
  MsgBox('{#MsgRunning}', mbError, MB_OK);
end;

function GetDefaultDir(def: string): string;
var InstalledDir : string;
begin
  if RegQueryStringValue(HKLM32, '{#RegPathLM1}', 'PATH', InstalledDir) then
  begin
  end 
  else if RegQueryStringValue(HKLM32, '{#RegPathLM2}', 'Path', InstalledDir) then
  begin
  end;     
  Result := InstalledDir;    
end;

function NextButtonClick(PageId: Integer): Boolean;
begin
    Result := True;
    if (PageId = wpSelectDir) and (
    not FileExists(ExpandConstant('{app}\{#AppProcess2}'))
    ) then
    begin
        MsgBox('{#Game} could not be found in that folder. If it is the correct folder, please try reinstalling the game.', mbError, MB_OK);
        Result := False;
        exit;
    end
end;

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
SetupAppTitle={#AppName} {#AppVersion}
SetupWindowTitle={#AppName} {#AppVersion} 
WelcomeLabel1={#AppName} {#AppVersion} 
SelectDirLabel3=Setup will try to detect where {#Game} is installed.
SelectDirBrowseLabel=If it has not been detected, click Browse to specify the folder.
FinishedHeadingLabel=Patch Complete