#define AppName "Worms 2 Plus"
#define AppVersion "1.6.3"
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
;Requires Windows XP SP3 or later. Vista and 7 without Service Packs are also blocked later in the code.
MinVersion=0,5.1sp3

[Files]
;Redistributables
;C++ 2015 (and up to 2022) used by modules (Windows 7+)
Source: "..\Redist\vc_redist.x86.exe"; DestDir: "{tmp}\"; Flags: ignoreversion overwritereadonly deleteafterinstall; MinVersion: 6.1;
;C++ 2015 last supported version for XP/Vista
Source: "..\Redist\vc_redist.x86_legacy.exe"; DestDir: "{tmp}\"; DestName: "vc_redist.x86.exe"; Flags: ignoreversion overwritereadonly deleteafterinstall; OnlyBelowVersion: 6.1;
;.NET Framework 3.0 for Windows XP only (already included in Vista and later) - used by start.exe launcher 
Source: "..\Redist\dotnetfx3.exe"; DestDir: "{tmp}\"; Flags: ignoreversion overwritereadonly deleteafterinstall; OnlyBelowVersion: 5.2; Check: NETFramework3NotInstalled
;.NET Framework 4.6.2 for VLC Launcher & Settings app (Windows 8 to before Windows 10 Anniversary update)
Source: "..\Redist\ndp462-kb3151800-x86-x64-allos-enu.exe"; DestDir: "{tmp}\"; Flags: ignoreversion overwritereadonly deleteafterinstall; MinVersion: 6.2; OnlyBelowVersion: 10.0.14393; Check: NETFramework46NotInstalled

;Patch files for All Installs - Place LEVEL and MISSION folders in the \Patch\Base\Data folder
Source: "..\Patch\Base\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
;Extra Content
Source: "..\Patch\ExtraContent\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
;For Windows - Settings app
;.NETF 4.6.2 for Windows 8+
Source: "..\Patch\Settings\settings.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.2;
;.NETF 3.0 for XP, Vista & 7
Source: "..\Patch\Settings\settings_netf3.exe"; DestDir: "{app}\"; DestName: "settings.exe"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; OnlyBelowVersion: 6.2;

;Require Windows Vista or newer: fkMissions, not enabled for Speedrun
Source: "..\Patch\fkMissions\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.0; Languages: not en_speedrun
;Require Windows Vista or newer: fkSettings
Source: "..\Patch\fkSettings\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.0
;Require Windows Vista or newer: fkWaterFix
Source: "..\Patch\fkWaterFix\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.0
;Require Windows 7 or newer: Upscaled videos and VLC launcher. Also overwrite the GOGLauncher if it exists.
Source: "..\Patch\Videos\Upscaled\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.1; Check: not IsWine();
Source: "..\Patch\Videos\Upscaled\start.exe"; DestDir: "{app}\"; DestName: "GOGLauncher.exe"; Flags: onlyifdestfileexists ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.1; Check: not IsWine();
;or for lower than Windows 7, use the original videos (with improved quality). Also overwrite the GOGLauncher if it exists.
Source: "..\Patch\Videos\Original\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; OnlyBelowVersion: 6.1; Check: not IsWine();
Source: "..\Patch\Videos\Original\start.exe"; DestDir: "{app}\"; DestName: "GOGLauncher.exe"; Flags: onlyifdestfileexists ignoreversion recursesubdirs createallsubdirs overwritereadonly; OnlyBelowVersion: 6.1; Check: not IsWine();
;Wine: just copy over the simple redirecting launchers
Source: "..\Patch\Launcher-Simple\start.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: IsWine();
Source: "..\Patch\Launcher-Simple\start.exe"; DestDir: "{app}\"; DestName: "GOGLauncher.exe"; Flags: onlyifdestfileexists ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: IsWine();

;Require Windows 10 or newer: fkDRP
Source: "..\Patch\fkDRP\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 10.0
;For Wine - DirectPlay EXE/DLL files obtained from http://www.thehandofagony.com/alex/dll/dplaydlls-win98se.tar.bz2
Source: "..\Patch\WineSystem\*"; DestDir: "{sys}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Check: IsWine();

;Languages
;Generate all frontends using FrontendGen\Generate.bat and Resource Hacker
Source: "..\Patch\Languages\Czech\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs
Source: "..\Patch\Languages\Dutch\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: nl
; English is the frontend which all other languages have their frontend based on
Source: "..\Patch\Languages\English\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: en en_us en_speedrun
Source: "..\Patch\Languages\French\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: fr
Source: "..\Patch\Languages\German\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: de
Source: "..\Patch\Languages\Italian\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: it
Source: "..\Patch\Languages\Polish\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: pl
Source: "..\Patch\Languages\Portuguese\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: pt
Source: "..\Patch\Languages\Portuguese (Brazil)\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: pt_br
Source: "..\Patch\Languages\Russian\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: ru
Source: "..\Patch\Languages\Spanish\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: es
Source: "..\Patch\Languages\Spanish (Latin America)\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: es_419
Source: "..\Patch\Languages\Swedish\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: sv
; Languages powered by wkDLang uses the English version of worms2.exe
Source: "..\Patch\Languages\wkDLang\wkDLang.dll"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs pt ru
Source: "..\Patch\Languages\English\worms2.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs pt ru
; Use the English "About" and Sound Bank translations (names.wdb) for custom languages
Source: "..\Patch\Languages\English\Data\About.rtf"; DestDir: "{app}\Data\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs pt ru
Source: "..\Patch\Languages\English\Data\Wav\names.wdb"; DestDir: "{app}\Data\Wav\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs pt ru
;Install the default GFX.dir file for languages that are not Czech, Polish or Russian (in case they were previously installed)
Source: "..\Patch\Languages\Default\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: not cs and not pl and not ru
;Install "Default" soundbank that is native to the language
Source: "..\Patch\ExtraContent\Data\Wav\Speech\Czech\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion overwritereadonly; Languages: cs
Source: "..\Patch\Base\Data\Wav\Speech\Dutch\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion overwritereadonly; Languages: nl
Source: "..\Patch\Base\Data\Wav\Speech\English\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: en en_speedrun
Source: "..\Patch\Base\Data\Wav\Speech\American\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: en_us
Source: "..\Patch\Base\Data\Wav\Speech\French\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion overwritereadonly; Languages: fr
Source: "..\Patch\Base\Data\Wav\Speech\German\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: de
Source: "..\Patch\Base\Data\Wav\Speech\Italian\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: it
Source: "..\Patch\Base\Data\Wav\Speech\Polish-2\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: pl
Source: "..\Patch\ExtraContent\Data\Wav\Speech\Portuguese\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: pt
Source: "..\Patch\Base\Data\Wav\Speech\BrazilPortugal\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: pt_br
Source: "..\Patch\Base\Data\Wav\Speech\Russian\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: ru
Source: "..\Patch\Base\Data\Wav\Speech\Spanish\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: es
Source: "..\Patch\Base\Data\Wav\Speech\Hispanic\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: es_419
Source: "..\Patch\Base\Data\Wav\Speech\Swedish\*"; DestDir: "{app}\Data\Wav\Speech\"; Flags: ignoreversion  overwritereadonly; Languages: sv
;wkBackflip, not enabled for Speedrun
Source: "..\Patch\wkBackflip\wkBackflip.dll"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: not en_speedrun

[InstallDelete]
;Delete unneeded/conflicting files that may be present from previous installs
;Delete wndmode (if present) so that it is no longer the default/active renderer
Type: files; Name: "{app}\wkWndMode.dll";
;Delete files (if present) not used by speedrun
Type: files; Name: "{app}\fkMissions.dll"; Languages: en_speedrun
Type: files; Name: "{app}\wkBackflip.dll"; Languages: en_speedrun
;Delete wkDLang for languages that do not require it
Type: files; Name: "{app}\wkDLang.dll"; Languages: not cs and not pt and not ru
Type: files; Name: "{app}\wkDLang.ini"; Languages: not cs and not pt and not ru
;Windows XP - Delete old FrontendKit Loader from previous installs to avoid conflict
Type: files; Name: "{app}\wsock32.dll"; OnlyBelowVersion: 6.0; Check: CheckSha1Match('{app}\wsock32.dll', 'fd60ae836941e0f706b2245c32ce11a1d87a3aea');
;Delete Misc reg files from the root of the game folder 
Type: files; Name: "{app}\Enable IPX Logging.reg";
Type: files; Name: "{app}\Reset IPX Config.reg";
;Remove old Misc files
Type: files; Name: "{app}\Misc\Enable IPX Logging.reg";                                                     
Type: files; Name: "{app}\Misc\Hotfix - FWP.exe";
Type: files; Name: "{app}\Misc\Readme.txt";
Type: files; Name: "{app}\Misc\Remove Hotfix - FWP.reg";
Type: files; Name: "{app}\Misc\Reset IPX Config.reg";
Type: dirifempty; Name: "{app}\Misc";
;Incorrect soundbank files
Type: files; Name: "{app}\Data\Wav\Speech\Brummie\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Brummie\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Brummie\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Brummie\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Cad\oh dear.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Cad\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Cad\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Cad\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Cad\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Drill Sergeant\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Drill Sergeant\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Drill Sergeant\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Drill Sergeant\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Dutch-2\dragonpunch .wav";
Type: files; Name: "{app}\Data\Wav\Speech\Formula One\oh dear.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Formula One\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Formula One\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Formula One\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Formula One\perfection.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Formula One\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Geezer\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Geezer\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Geezer\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Geezer\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Rasta\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Rasta\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Rasta\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Rasta\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Redneck\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Redneck\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Redneck\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Redneck\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Rushki\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Rushki\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Rushki\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Rushki\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Russian\ohdeer.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Russian\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Russian\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Russian\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Russian\takeover.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Russian\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Thespian\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Thespian\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Thespian\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\Thespian\uhoh.wav";
Type: files; Name: "{app}\Data\Wav\Speech\US Sports\oof1.wav";
Type: files; Name: "{app}\Data\Wav\Speech\US Sports\oof2.wav";
Type: files; Name: "{app}\Data\Wav\Speech\US Sports\oof3.wav";
Type: files; Name: "{app}\Data\Wav\Speech\US Sports\uhoh.wav";

[Languages]
Name: "cs"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "nl"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "en_us"; MessagesFile: "Languages\EnglishUS.isl"
Name: "en_speedrun"; MessagesFile: "Languages\EnglishSpeedrun.isl"
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"
Name: "it"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "pt"; MessagesFile: "Languages\Portuguese.isl"
Name: "pt_br"; MessagesFile: "Languages\BrazilianPortuguese.isl"
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
Name: "{group}\{#AppName}"; Filename: "{app}\frontend.exe";

[Registry]
;Functionality
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "CD"; ValueData:  "."
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "W2PATH"; ValueData: "."
;Set graphics to maximum settings
Root: HKCU; Subkey: "{#RegPathCU2}"; ValueType: dword; ValueName: "VideoSetting"; ValueData: 5
;Set default connection to IPX
Root: HKCU; Subkey: "{#RegPathCU2}"; ValueType: dword; ValueName: "Connection"; ValueData: 0
;Functionality
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: none; ValueName: "CommandLine"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "CurrentDirectory"; ValueData: "{app}"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "File"; ValueData: "worms2.exe"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "Guid"; ValueData: "{{DF394860-E19E-11D0-805F-444553540000}"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "Path"; ValueData: "{app}"
;Force Game DPI Scaling to be performed by Application, not Windows
Root: HKCU; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\frontend.exe"; ValueData: "HIGHDPIAWARE "; MinVersion: 6.0
Root: HKLM64; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\frontend.exe"; ValueData: "HIGHDPIAWARE "; MinVersion: 6.0; Check: IsWin64
Root: HKLM32; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\frontend.exe"; ValueData: "HIGHDPIAWARE "; MinVersion: 6.0; Check: not IsWin64
Root: HKCU; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\worms2.exe"; ValueData: "HIGHDPIAWARE "; MinVersion: 6.0
;Add DEP Exception
Root: HKLM64; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\worms2.exe"; ValueData: "HIGHDPIAWARE DisableNXShowUI "; MinVersion: 6.0; Check: IsWin64
Root: HKLM32; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\worms2.exe"; ValueData: "HIGHDPIAWARE DisableNXShowUI "; MinVersion: 6.0; Check: not IsWin64
Root: HKLM64; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\worms2.exe"; ValueData: "DisableNXShowUI "; OnlyBelowVersion: 6.0; Check: IsWin64
Root: HKLM32; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\worms2.exe"; ValueData: "DisableNXShowUI "; OnlyBelowVersion: 6.0; Check: not IsWin64

;IPX
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
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\frontend.exe\DllOverrides"; ValueType: string; ValueName: "winmm"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\frontend.exe\DllOverrides"; ValueType: string; ValueName: "dpwsockx"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\frontend.exe\DllOverrides"; ValueType: string; ValueName: "wsock32"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dplayx"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dpnet"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dpnhpast"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dsound"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dpwsockx"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "wsock32"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "ddraw"; ValueData: "native,builtin"; Check: IsWine();

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

function CheckSha1Match(const filePath, hash: string): Boolean;
var sha: String;
begin
  if (FileExists(ExpandConstant(filePath))) then begin 
    sha := GetSHA1OfFile(ExpandConstant(filePath));
    if sha = hash then begin
      Result := True;
    end
    else begin
      Result := false;
    end;
   end;
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

function nonUnicodeCzech(const legacy:integer): boolean;
var msgNonUnicode : string;
begin
  if nonUnicode('0405') then
  begin
    {msgNonUnicode := 'In order for text to display correctly in the game menu, you need to change a system setting. \
    "Language for non-Unicode programs" must be set to "Czech (Czech Republic)". \
    This setting will apply to all non-Unicode programs.';}
    msgNonUnicode := 'Aby se text zobrazoval v herním menu správně, bude potřeba změnit systémové nastavení. \
"Jazyk pro programy nepodporující kód Unicode" musí být nastaven na "Čeština (Česko)". \
Toto nastavení se projeví u všech programů nepodporujících Unicode.';
    if legacy = 0 then
    begin
      {if MsgBox(msgNonUnicode + ' Should the installer make the changes automatically?', \}
      if MsgBox(msgNonUnicode + ' Má instalátor provést tyto změny automaticky?', \
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
      and change the setting to "Czech (Czech Republic)". \
      A restart of your computer will be required.', \
      mbConfirmation, MB_OK);}
      MsgBox('Až se objeví okno nastavení: \
      klikněte na záložku "Správa", \
      vyhledejte sekci "Jazyk pro programy nepodporující kód Unicode" \
      a změňte nastavení na "Čeština (Česko)". \
      Bude vyžadován restart počítače.', \
      mbConfirmation, MB_OK);
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
      {if MsgBox(msgNonUnicode + ' Should the installer make the changes automatically?', \}
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
var Version: TWindowsVersion;
var msgRequiredSP: string;
begin
  Result := not IsAppRunning('{#AppProcess1}');
  if Result then begin
    Result := not IsAppRunning('{#AppProcess2}');
  end;
  if not Result then
  begin
    MsgBox(SetupMessage(msgSetupAppRunningError), mbError, MB_OK);
  end
  else
  begin
    //Check other Windows version that don't work without Service Packs
    GetWindowsVersionEx(Version);
    if Version.Major = 6 then begin
      if (Version.Minor = 0) and (Version.Build < 6002) then begin
        //Vista requires Service Pack 2
        msgRequiredSP := SetupMessage(msgWindowsServicePackRequired);
        StringChangeEx(msgRequiredSP, '%1', 'Windows Vista', true);
        StringChangeEx(msgRequiredSP, '%2', '2', true);
        MsgBox(msgRequiredSP, mbError, MB_OK);
        Result := false;
      end
      else if (Version.Minor = 1) and (Version.Build < 7601) then begin
        //7 requires Service Pack 1
        msgRequiredSP := SetupMessage(msgWindowsServicePackRequired);
        StringChangeEx(msgRequiredSP, '%1', 'Windows 7', true);
        StringChangeEx(msgRequiredSP, '%2', '1', true);
        MsgBox(msgRequiredSP, mbError, MB_OK);
        Result := false;
      end;
    end;
  end;
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
        MsgBox(ExpandConstant('{cm:AddonHostProgramNotFound}'), mbError, MB_OK);
        Result := False;
      end
    end;
end;

[Messages]
SetupAppTitle={#AppName} {#AppVersion}
SetupWindowTitle={#AppName} {#AppVersion} 
WelcomeLabel1={#AppName} {#AppVersion} 
en.SelectLanguageTitle=Select Language
en.SelectLanguageLabel=Select the language for {#AppName}
en.SelectDirLabel3=Setup will try to detect where {#Game} is installed.
en.SelectDirBrowseLabel=If it has not been detected, click Browse to specify the folder.
en.FinishedHeadingLabel=Patch Complete
en_us.SelectLanguageTitle=Select Language
en_us.SelectLanguageLabel=Select the language for {#AppName}
en_us.SelectDirLabel3=Setup will try to detect where {#Game} is installed.
en_us.SelectDirBrowseLabel=If it has not been detected, click Browse to specify the folder.
en_us.FinishedHeadingLabel=Patch Complete
en_speedrun.SelectLanguageTitle=Select Language
en_speedrun.SelectLanguageLabel=Select the language for {#AppName}
en_speedrun.SelectDirLabel3=Setup will try to detect where {#Game} is installed.
en_speedrun.SelectDirBrowseLabel=If it has not been detected, click Browse to specify the folder.
en_speedrun.FinishedHeadingLabel=Patch Complete
cs.SetupAppRunningError=Instalátor detekoval, že hra {#Game} je momentálně spuštěna. Prosím ukončete hru před instalací patche.
nl.SetupAppRunningError=Setup heeft vastgesteld dat {#Game} op dit moment actief is. Sluit alle vensters hiervan.
en.SetupAppRunningError=Setup has detected that {#Game} is currently running. Please close the game before installing the patch.
en_us.SetupAppRunningError=Setup has detected that {#Game} is currently running. Please close the game before installing the patch.
en_speedrun.SetupAppRunningError=Setup has detected that {#Game} is currently running. Please close the game before installing the patch.
fr.SetupAppRunningError=L'assistant d'installation a détecté que {#Game} est actuellement en cours d'exécution. Veuillez fermer toutes les instances de cette application.
de.SetupAppRunningError=Das Setup hat entdeckt, dass {#Game} zur Zeit ausgeführt wird. Bitte schließen Sie jetzt alle laufenden Instanzen.
it.SetupAppRunningError={#Game} è attualmente in esecuzione. Chiudi adesso tutte le istanze del programma.
pl.SetupAppRunningError=Instalator wykrył, że aplikacja {#Game} jest aktualnie uruchomiona. Zamknij wszystkie procesy aplikacji.
pt.SetupAppRunningError=O instalador detectou que {#Game} já está em execução. Fecha o jogo antes de instalar este patch.
pt_br.SetupAppRunningError=O Instalador detectou que o {#Game} está atualmente em execução. Por favor feche todas as instâncias dele agora.
ru.SetupAppRunningError=Обнаружен запущенный экземпляр {#Game}. Пожалуйста, закройте все экземпляры приложения. 
es.SetupAppRunningError=El programa de instalación ha detectado que {#Game} está ejecutándose. Por favor, ciérrelo ahora.
es_419.SetupAppRunningError=El programa de instalación ha detectado que {#Game} está ejecutándose. Por favor, ciérrelo ahora. 
sv.SetupAppRunningError=Installationsprogrammet har upptäckt att {#Game} är igång. Avsluta det angivna programmet nu.

[CustomMessages]
cs.AddonHostProgramNotFound=Hru {#Game} se nepodařilo nalézt ve složce, kterou jste vybral. Pokud je to správná složka, prosím zkuste přeinstalovat hru.
nl.AddonHostProgramNotFound={#Game} kon niet worden gevonden in de geselecteerde map.
en.AddonHostProgramNotFound={#Game} could not be located in the folder you selected. If it is the correct folder, please try reinstalling the game.
en_us.AddonHostProgramNotFound={#Game} could not be located in the folder you selected. If it is the correct folder, please try reinstalling the game.
en_speedrun.AddonHostProgramNotFound={#Game} could not be located in the folder you selected. If it is the correct folder, please try reinstalling the game.
fr.AddonHostProgramNotFound={#Game} n'a pas été trouvé dans le dossier que vous avez choisi.
de.AddonHostProgramNotFound={#Game} konnte im ausgewählten Ordner nicht gefunden werden.
it.AddonHostProgramNotFound=Impossibile individuare {#Game} nella cartella selezionata.
pl.AddonHostProgramNotFound=Aplikacja {#Game} nie została znaleziona we wskazanym przez Ciebie folderze. Jeżeli jest to właściwy folder, spróbuj ponownie zainstalować grę.
pt.AddonHostProgramNotFound={#Game} não foi encontrado na pasta que selecionaste. Se é a pasta correta, experimenta reinstalar o jogo.
pt_br.AddonHostProgramNotFound={#Game} não foi encontrado na pasta que você selecionou. Se é a pasta correta, experimente reinstalar o jogo.
ru.AddonHostProgramNotFound={#Game} не найден в указанной вами папке.
es.AddonHostProgramNotFound={#Game} no pudo ser localizado en la carpeta seleccionada.
es_419.AddonHostProgramNotFound={#Game} no pudo ser localizado en la carpeta seleccionada.
sv.AddonHostProgramNotFound={#Game} kunde inte hittas i katalogen du valde.

cs.Installing=Instaluji %1
nl.Installing=Installeren van %1
en.Installing=Installing %1
en_us.Installing=Installing %1
en_speedrun.Installing=Installing %1
fr.Installing=Installe %1
de.Installing=Installation von %1
it.Installing=Installazione di %1
pl.Installing=Instalacja aplikacji %1
pt.Installing=A instalar %1
pt_br.Installing=Instalando %1
ru.Installing=Установка %1
es.Installing=Instalando %1
es_419.Installing=Instalando %1
sv.Installing=Installerar %1
 
[Run] 
;Install C++ 2015 Redist
Filename: {tmp}\vc_redist.x86.exe; Parameters: "/quiet /norestart"; StatusMsg: "{cm:Installing,C++ 2015 Redist}..."
;Install .NET Framework 3.0 (Windows XP only)
Filename: {tmp}\dotnetfx3.exe; Parameters: "/quiet /norestart"; OnlyBelowVersion: 5.2; Check: NETFramework3NotInstalled; StatusMsg: "{cm:Installing,.NET Framework 3}..."
;Install .NET Framework 4.6.2 (Windows 8 to before Windows 10 Anniversary update)
Filename: {tmp}\ndp462-kb3151800-x86-x64-allos-enu.exe; MinVersion: 6.2; OnlyBelowVersion: 10.0.14393; StatusMsg: "{cm:Installing,.NET Framework 4.6.2}..."; Check: NETFramework46NotInstalled;
;Discord link
Filename: "https://discord.gg/Tvs83972UD"; Description: "Worms 2 Discord"; MinVersion: 10.0; Flags: shellexec runasoriginaluser postinstall nowait unchecked

;Set non-Unicode Language to Czech
Filename: powershell; Parameters: "-command Set-WinSystemLocale -SystemLocale cs-CZ"; MinVersion: 6.2; Languages: cs; Check: nonUnicodeCzech(0); StatusMsg: "Setting language for non-Unicode applications..."
Filename: control; Parameters: "intl.cpl"; OnlyBelowVersion: 6.2; Languages: cs; Check: nonUnicodeCzech(1); StatusMsg: "Setting language for non-Unicode applications..."
;Set non-Unicode Language to Polish
Filename: powershell; Parameters: "-command Set-WinSystemLocale -SystemLocale pl-PL"; MinVersion: 6.2; Languages: pl; Check: nonUnicodePolish(0); StatusMsg: "Setting language for non-Unicode applications..."
Filename: control; Parameters: "intl.cpl"; OnlyBelowVersion: 6.2; Languages: pl; Check: nonUnicodePolish(1); StatusMsg: "Setting language for non-Unicode applications..."