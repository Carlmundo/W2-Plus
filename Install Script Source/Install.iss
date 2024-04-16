#define AppName "Worms 2 Plus"
#define AppVersion "1.6 WIP"
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
DisableReadyPage=yes
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
ShowLanguageDialog=yes
RestartIfNeededByRun=no

[Components]
Name: "optional_windowed_alt"; Description: "Optional: Windowed mode for high resolutions"; Check: not IsWine();
    
[Files]
;Redistributables
;C++ 2015 used by some modules
Source: "..\Redist\vc_redist.x86.exe"; DestDir: "{tmp}\"; Flags: ignoreversion overwritereadonly deleteafterinstall;
;.NET Framework 3.0 for Windows XP only (already included in Vista and later) - used by start.exe launcher 
Source: "..\Redist\dotnetfx3.exe"; DestDir: "{tmp}\"; Flags: ignoreversion overwritereadonly deleteafterinstall; OnlyBelowVersion: 5.2; Check: NETFramework3NotInstalled
;.NET Framework 4.6.2 for VLC Launcher
Source: "..\Redist\ndp462-kb3151800-x86-x64-allos-enu.exe"; DestDir: "{tmp}\"; Flags: ignoreversion overwritereadonly deleteafterinstall; OnlyBelowVersion: 10.0.14393; Check: NETFramework46NotInstalled

;Patch files for All Installs - Place LEVEL and MISSION folders in the \Patch\All Installs\Data folder
Source: "..\Patch\All Installs\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
;ReSolution configs
Source: "..\Patch\ReSolution Configs\Windows\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: not IsWine(); Components: not optional_windowed_alt
Source: "..\Patch\ReSolution Configs\Wine\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: IsWine();
;Windows XP only: original FrontendKitWS
Source: "..\Patch\FrontendKitWS\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; OnlyBelowVersion: 6.0
;Require Windows Vista or newer: modified IPXWrapper/FrontendKitWS
Source: "..\Patch\IPXWrapper-W2\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.0
;Require Windows 7 or newer: fkDRP, Videos (Upscaled)
Source: "..\Patch\fkDRP\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.1
;Upscaled videos and VLC launcher
Source: "..\Patch\Videos\Upscaled\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.1.7601
;or for lower than Windows 7, use the (improved) original videos
Source: "..\Patch\Videos\Original\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; OnlyBelowVersion: 6.1.7601
;DirectPlay EXE/DLL files obtained from http://www.thehandofagony.com/alex/dll/dplaydlls-win98se.tar.bz2
Source: "..\System Files for Wine\*"; DestDir: "{sys}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: IsWine();

;Languages
; Most European versions use the same frontend
Source: "..\Patch\Languages\Europe\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: nl fr it es sv pl
Source: "..\Patch\Languages\Dutch\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: nl
; English uses the North America frontend instead of Europe in order to force the language
Source: "..\Patch\Languages\English\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: en
Source: "..\Patch\Languages\English\frontend.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: en_speedrun
; English (Speedrun) uses it's own worms2.exe with rope fixes 1-4
Source: "..\Patch\Languages\English (Speedrun)\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: en_speedrun
Source: "..\Patch\Languages\French\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: fr
Source: "..\Patch\Languages\German\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: de
Source: "..\Patch\Languages\Italian\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: it
Source: "..\Patch\Languages\Polish\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: pl
; Portuguese (Brazil) uses the Brazil frontend instead of Europe in order to force the language
Source: "..\Patch\Languages\Portuguese (Brazil)\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: pt_br
Source: "..\Patch\Languages\Russian\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: ru
; Russian uses the English version of worms2.exe until someone can translate it
Source: "..\Patch\Languages\English\worms2.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: ru
; Sound Bank translations (names.wdb) used for English (Speedrun) and Russian
Source: "..\Patch\Languages\English\Data\Wav\names.wdb"; DestDir: "{app}\Data\Wav\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: en_speedrun ru
Source: "..\Patch\Languages\Spanish\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: es
Source: "..\Patch\Languages\Spanish (Latin America)\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: es_419
Source: "..\Patch\Languages\Swedish\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: sv
;Install the default GFX.dir file for non-Polish (in case it is missing or if Polish was previously installed)
Source: "..\Patch\Languages\Default\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: not pl

;Optional tweaks
Source: "..\Patch\ReSolution Configs\Windows via cnc-ddraw\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Components: optional_windowed_alt;

[InstallDelete]
Type: files; Name: "{app}\wkWndMode.dll"; Components: optional_windowed_alt
Type: files; Name: "{app}\wndmode.dll"; Components: optional_windowed_alt
Type: files; Name: "{app}\wndmode.ini"; Components: optional_windowed_alt

[Languages]
Name: "nl"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "en_speedrun"; MessagesFile: "Languages\EnglishSpeedrun.isl"
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"
Name: "it"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "pt_br"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "es"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "es_419"; MessagesFile: "Languages\SpanishLA.isl"
Name: "sv"; MessagesFile: "Languages\Swedish.isl"

[Tasks]
Name: "shortcut_start"; Description: "{cm:CreateDesktopIcon}: Worms 2 Plus Launcher (+Videos)"; GroupDescription: "{cm:AdditionalIcons}"; Check: not IsWine()
Name: "shortcut_frontend"; Description: "{cm:CreateDesktopIcon}: Worms 2 Plus Frontend (-Videos)"; GroupDescription: "{cm:AdditionalIcons}"; Check: not IsWine()

[Icons]
Name: "{userdesktop}\{#AppName}"; Filename: "{app}\start.exe"; Tasks: shortcut_start
Name: "{userdesktop}\{#AppName} Frontend"; Filename: "{app}\frontend.exe"; Tasks: shortcut_frontend

[Registry]
;Functionality
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "DXPATCHED"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "VNDX"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: dword; ValueName: "W2ALLOWVID"; ValueData: 1
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "CD"; ValueData:  "."
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "W2PATH"; ValueData: "."
;Set graphics to maximum settings
Root: HKCU; Subkey: "{#RegPathCU2}"; ValueType: dword; ValueName: "VideoSetting"; ValueData: 5
;Set default connection to TCP so that the server isn't greyed out
Root: HKCU; Subkey: "{#RegPathCU2}"; ValueType: dword; ValueName: "Connection"; ValueData: 1
;Functionality
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: none; ValueName: "CommandLine"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "CurrentDirectory"; ValueData: "{app}"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "File"; ValueData: "worms2.exe"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "Guid"; ValueData: "{{DF394860-E19E-11D0-805F-444553540000}"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "Path"; ValueData: "{app}"
;Force Frontend DPI Scaling to be performed by System
Root: HKCU; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\frontend.exe"; ValueData: "DPIUNAWARE ";
;Force Game DPI Scaling to be performed by Application, not Windows
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
var InstalledDir : string;
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
var  LibHandle : THandle;
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
                          
function NETFramework3NotInstalled: Boolean;
begin
  Result :=
    not RegKeyExists(
      HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\.NETFramework\v3.0');
end;

function NETFramework46NotInstalled: Boolean;
var net4version: String;
begin
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full',
     'Version', net4version) then
  begin
  //4.6.2 reg version == 4.6.01590
    if net4version < '4.6.01590' then
    begin
      Result := True;
    end;
  end
  else
  begin
    Result := True;
  end
end;

function nonUnicode(const langInput: string): boolean;
var langValue: String;
begin
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Nls\Language',
     'Default', langValue) then
  begin
    if langInput <> langValue then
    begin
      Result := True;
    end;
  end;
end;
function nonUnicodePolish(const legacy:integer): boolean;
var msgNonUnicode : string;
begin
  if nonUnicode('0415') then
  begin
    {msgNonUnicode := 'In order for text to display correctly in the game menu, you need to change a system setting. \
    "Language for non-Unicode programs" must be set to "Polski (Polska)". \
    This setting will apply to all non-Unicode programs.';}
    msgNonUnicode := 'Uwaga: Menu gry wymaga, aby "Język dla programów nieobsługujących kodu Unicode" był ustawiony na "Polski (Polska)". \
    W przeciwnym wypadku tekst może być wyświetlany nieprawidłowo. \
    To ustawienie będzie miało zastosowanie do wszystkich programów nieobsługujących Unicode.';
    if legacy = 0 then
    begin
      if MsgBox(msgNonUnicode + ' Czy instalator ma nanieść zmiany automatycznie?', \
        mbConfirmation, MB_YESNO) = IDYES then
      begin
        Result := True;
      end;
    end
    else if legacy = 1 then
    begin
      MsgBox(msgNonUnicode, mbConfirmation, MB_OK);
      {MsgBox('When the settings window appears: \
      click the "Administrative" tab, \
      find the "Language for non-Unicode programs" section \
      and change the setting to "Polski (Polska)". \
      A restart of your computer will be required.', \
      mbConfirmation, MB_OK);}
      MsgBox('Gdy pojawi się okno ustawień: \
      Kliknij zakładkę "Administracyjne", \
      następnie znajdź sekcję "Język dla programów nieobsługujących kodu Unicode". \
      Zmień ustawienie na "Polski (Polska)". \
      Uruchom ponownie komputer, aby zastosować zmiany.', \
      mbConfirmation, MB_OK);
      Result := True;
    end;
  end;
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

[Messages]
SelectLanguageTitle=Select Language
SelectLanguageLabel=Select the language for {#AppName}
SetupAppTitle={#AppName} {#AppVersion}
SetupWindowTitle={#AppName} {#AppVersion} 
WelcomeLabel1={#AppName} {#AppVersion} 
en.SelectDirLabel3=Setup will try to detect where {#Game} is installed.
en.SelectDirBrowseLabel=If it has not been detected, click Browse to specify the folder.
en.FinishedHeadingLabel=Patch Complete

[Run] 
;Install C++ 2015 Redist
Filename: {tmp}\vc_redist.x86.exe; Parameters: "/quiet /norestart"; StatusMsg: "Installing C++ 2015 Redist..."
;Install .NET Framework 3.0 (Windows XP only)
Filename: {tmp}\dotnetfx3.exe; Parameters: "/quiet /norestart"; OnlyBelowVersion: 5.2; Check: NETFramework3NotInstalled; StatusMsg: "Installing .NET Framework 3.0... (this may take some time)"
;Install .NET Framework 4.6.2 (if VLC launcher is installed)
Filename: {tmp}\ndp462-kb3151800-x86-x64-allos-enu.exe; OnlyBelowVersion: 10.0.14393; StatusMsg: "Installing .NET Framework 4.6.2... (this may take some time)"; Check: NETFramework46NotInstalled;

;Set non-Unicode Language to Polish
Filename: powershell; Parameters: "-command Set-WinSystemLocale pl-PL"; MinVersion: 6.2; Languages: pl; Check: nonUnicodePolish(0); StatusMsg: "Setting language for non-Unicode applications..."
Filename: control; Parameters: "intl.cpl"; OnlyBelowVersion: 6.2; Languages: pl; Check: nonUnicodePolish(1); StatusMsg: "Setting language for non-Unicode applications..."