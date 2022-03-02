#define AppName "Worms 2 Plus"
#define AppVersion "1.5.1"
#define AppProcess1 "frontend.exe"
#define AppProcess2 "worms2.exe"
#define Game "Worms 2"
#define RegPathCU1 "Software\Team17SoftwareLTD\Worms2"
#define RegPathCU2 "Software\Team17SoftwareLTD\frontend\Worms2"
#define RegPathLM1 "Software\GOG.com\GOGWORMS2"
#define RegPathLM2 "Software\Microsoft\DirectPlay\Applications\worms2"
#define RegPathIPX1 "SOFTWARE\Microsoft\DirectPlay\Service Providers\IPX Connection For DirectPlay"
#define RegPathIPX2 "SOFTWARE\Microsoft\DirectPlay\Services\{{5146ab8cb6b1ce11920c00aa006c4972}"
#define RegPathWine "SOFTWARE\Wine"
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
OutputBaseFilename=Worms2_Plus_{#AppVersion}
SetupIconFile=image-icon.ico
WizardImageFile=image-large.bmp
WizardImageStretch=no
WizardSmallImageFile=image-small.bmp
Compression=none
Uninstallable=no
PrivilegesRequired=admin

[Files]
;Patch files
Source: "..\Patch\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
Source: "..\Patch - Windows\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: not IsWine();
Source: "..\Patch - Wine\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: IsWine();
;DirectPlay EXE/DLL files obtained from http://www.thehandofagony.com/alex/dll/dplaydlls-win98se.tar.bz2
Source: "..\System Files for Wine\*"; DestDir: "{sys}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: IsWine();
;Place LEVEL and MISSION folders in the Patch folder

[Tasks]
Name: "shortcut"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Check: not IsWine()

[Icons]
Name: "{userdesktop}\{#AppName}"; Filename: "{app}\frontend.exe"; Tasks: shortcut

[Registry]
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "DXPATCHED"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "VNDX"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "W2ALLOWVID"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "CD"; ValueData:  "."
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "W2PATH"; ValueData:  "."
Root: HKCU; Subkey: "{#RegPathCU2}"; ValueType: dword; ValueName: "VideoSetting"; ValueData: 5
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: none; ValueName: "CommandLine"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "CurrentDirectory"; ValueData: "{app}"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "File"; ValueData: "worms2.exe"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "Guid"; ValueData: "{{DF394860-E19E-11D0-805F-444553540000}"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "Path"; ValueData: "{app}"
Root: HKCU; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\worms2.exe"; ValueData: "HIGHDPIAWARE ";

;LAN
Root: HKLM32; Subkey: "{#RegPathIPX1}"; ValueType: dword; ValueName: "dwReserved1"; ValueData: 32;
Root: HKLM32; Subkey: "{#RegPathIPX1}"; ValueType: dword; ValueName: "dwReserved2"; ValueData: 0;
Root: HKLM32; Subkey: "{#RegPathIPX1}"; ValueType: string; ValueName: "Guid"; ValueData: "{{685BC400-9D2C-11cf-A9CD-00AA006886E3}";
Root: HKLM32; Subkey: "{#RegPathIPX1}"; ValueType: string; ValueName: "Path"; ValueData: "dpwsockx.dll";
Root: HKLM32; Subkey: "{#RegPathIPX1}"; ValueType: string; ValueName: "DescriptionA"; ValueData: "IPX Connection For DirectPlay";
Root: HKLM32; Subkey: "{#RegPathIPX1}"; ValueType: string; ValueName: "DescriptionW"; ValueData: "IPX Connection For DirectPlay";
Root: HKLM32; Subkey: "{#RegPathIPX2}"; ValueType: string; ValueName: "Description"; ValueData: "WinSock IPX Connection For DirectPlay";
Root: HKLM32; Subkey: "{#RegPathIPX2}"; ValueType: expandsz; ValueName: "Path"; ValueData: "dpwsockx.dll";
Root: HKLM32; Subkey: "{#RegPathIPX2}\Players";
Root: HKLM32; Subkey: "{#RegPathIPX2}\Sessions";

;Wine
;DLL Overrides - DirectPlay
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "*dplaysvr.exe"; ValueData: "native"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "*dplayx"; ValueData: "native"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "*dpmodemx"; ValueData: "native"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "*dpnet"; ValueData: "native"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "*dpnhpast"; ValueData: "native"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "*dpnhupnp"; ValueData: "native"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "*dpnsvr.exe"; ValueData: "native"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "*dpwsockx"; ValueData: "native"; Check: IsWine();
;DLL Overrides - Worms2
Root: HKCU; Subkey: "{#RegPathWine}\Explorer\Desktops"; ValueType: string; ValueName: "frontend.exe"; ValueData: {code:GetResolution}; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\Explorer\Desktops"; ValueType: string; ValueName: "worms2.exe"; ValueData: {code:GetResolution}; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\frontend.exe\DllOverrides"; ValueType: string; ValueName: "wsock32"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\frontend.exe\Explorer"; ValueType: string; ValueName: "Desktop"; ValueData: "frontend.exe"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dplayx"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dpnet"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dpnhpast"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dpwsockx"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dsound"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\Explorer"; ValueType: string; ValueName: "Desktop"; ValueData: "worms2.exe"; Check: IsWine();

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

//Detect Wine
function LoadLibraryA(lpLibFileName: PAnsiChar): THandle;
external 'LoadLibraryA@kernel32.dll stdcall';
function GetProcAddress(Module: THandle; ProcName: PAnsiChar): Longword;
external 'GetProcAddress@kernel32.dll stdcall';

function IsWine: boolean;
var  LibHandle  : THandle;
begin
  LibHandle := LoadLibraryA('ntdll.dll');
  Result:= GetProcAddress(LibHandle, 'wine_get_version')<> 0;
end;

//Use SystemMetrics to get resolution
function GetSystemMetrics (nIndex: Integer): Integer;
external 'GetSystemMetrics@User32.dll stdcall setuponly';

function GetResolution(Value: string): string;
begin
    Result := IntToStr(GetSystemMetrics(0)) + 'x' + IntToStr(GetSystemMetrics(1));
end;


function InitializeSetup: boolean;
begin
  Result := not IsAppRunning('{#AppProcess1}');
  if Result then begin
    Result := not IsAppRunning('{#AppProcess2}');
  end;
  if not Result then
    MsgBox('{#MsgRunning}', mbError, MB_OK);
end;

function GetDefaultDir(def: string): string;
var InstalledDir : string;
begin
  if RegQueryStringValue(HKLM32, '{#RegPathLM1}', 'PATH', InstalledDir) then begin
  end 
  else if RegQueryStringValue(HKLM32, '{#RegPathLM2}', 'Path', InstalledDir) then begin
  end;     
  Result := InstalledDir;    
end;

function NextButtonClick(PageId: Integer): Boolean;
begin
    Result := True;
    if (PageId = wpSelectDir) then begin
      if (not FileExists(ExpandConstant('{app}\{#AppProcess2}'))) then begin
        MsgBox('{#Game} could not be found in that folder. If it is the correct folder, please try reinstalling the game.', mbError, MB_OK);
        Result := False;
      end
    end;
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