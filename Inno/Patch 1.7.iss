#define AppName "Worms 2 Plus"
#define AppVersion "1.7.0.5"
#define AppProcess1 "frontend.exe"
#define AppProcess2 "worms2.exe"
#define Game "Worms 2 Plus 1.7"
#define RegPathCU1 "Software\Team17SoftwareLTD\Worms2"
#define RegPathCU2 "Software\Team17SoftwareLTD\frontend\Worms2"
#define RegPathLM1 "Software\GOG.com\GOGWORMS2"
#define RegPathLM2 "Software\Microsoft\DirectPlay\Applications\worms2"
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
OutputBaseFilename=Update_Worms2_Plus_{#AppVersion}
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
;Patch files
Source: "..\Patch\Base\devoptions.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
Source: "..\Patch\Base\dpwsockx.dll"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
Source: "..\Patch\Base\dsound.dll"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
Source: "..\Patch\Base\fkUpdate.dll"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
Source: "..\Patch\Base\fkWorm2NAT.dll"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
Source: "..\Patch\Base\volume.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
Source: "..\Patch\Base\Teams\Internet.dat"; DestDir: "{app}\Teams\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
Source: "..\Patch\ExtraContent\Data\LEVEL\KOREA\Level.Dir"; DestDir: "{app}\Data\LEVEL\KOREA\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;
;IPXWrapper DirectPlay setup
Source: "..\Redist\dplay-setup.exe"; DestDir: "{tmp}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly;

;For Windows - Settings app
;.NETF 4.6.2 for Windows 8+
Source: "..\Patch\Settings\settings.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.2;
;.NETF 3.0 for XP, Vista & 7
Source: "..\Patch\Settings\settings_netf3.exe"; DestDir: "{app}\"; DestName: "settings.exe"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; OnlyBelowVersion: 6.2;
;Require Windows Vista or newer: fkSettings
Source: "..\Patch\fkSettings\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.0
;Require Windows Vista or newer: fkMissions, not enabled for Speedrun
Source: "..\Patch\fkMissions\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; MinVersion: 6.0; Languages: not en_speedrun

;Languages
;Generate all frontends using FrontendGen\Generate.bat and Resource Hacker
Source: "..\Patch\Languages\Chinese (Simplified)\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: zh_Hans
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
Source: "..\Patch\Languages\wkDLang\wkDLang.dll"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs pt ru
; Languages powered by wkDLang (and S-Chinese) use the English version of worms2.exe
Source: "..\Patch\Languages\English\worms2.exe"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs pt ru zh_Hans
; Use the English "About" and Sound Bank translations (names.wdb) for custom languages
Source: "..\Patch\Languages\English\Data\About.rtf"; DestDir: "{app}\Data\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs pt ru zh_Hans
Source: "..\Patch\Languages\English\Data\Wav\names.wdb"; DestDir: "{app}\Data\Wav\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: cs pt ru zh_Hans
;Install the default GFX.dir file for languages that are not Czech, Polish or Russian (in case they were previously installed)
Source: "..\Patch\Languages\Default\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: not cs and not pl and not ru
;wkBackflip, not enabled for Speedrun
Source: "..\Patch\wkBackflip\wkBackflip.dll"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs overwritereadonly; Languages: not en_speedrun

[InstallDelete]
;Delete unneeded/conflicting files that may be present from previous installs after 1.7
Type: files; Name: "{app}\Teams\IPX.dat";
;Delete files (if present) not used by speedrun
Type: files; Name: "{app}\fkMissions.dll"; Languages: en_speedrun
Type: files; Name: "{app}\wkBackflip.dll"; Languages: en_speedrun
;Delete wkDLang for languages that do not require it
Type: files; Name: "{app}\wkDLang.dll"; Languages: not cs and not pt and not ru
Type: files; Name: "{app}\wkDLang.ini"; Languages: not cs and not pt and not ru
;Remove IPXWrapper ini override
Type: files; Name: "{app}\ipxwrapper.ini";
;libogg/libvorbis from GOG, no longer used since forking ogg-winmm
Type: files; Name: "{app}\libogg-0.dll";
Type: files; Name: "{app}\libvorbis-0.dll";
Type: files; Name: "{app}\libvorbisfile-3.dll";

[Languages]
Name: "zh_Hans"; MessagesFile: "Languages\ChineseSimplified.isl"
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

[Registry]
;Functionality
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "CD"; ValueData:  "."
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "W2PATH"; ValueData: "."
;Set graphics to maximum settings
Root: HKCU; Subkey: "{#RegPathCU2}"; ValueType: dword; ValueName: "VideoSetting"; ValueData: 5
;Set default connection to TCP
Root: HKCU; Subkey: "{#RegPathCU2}"; ValueType: dword; ValueName: "Connection"; ValueData: 1
;DirectPlay
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: none; ValueName: "CommandLine"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "CurrentDirectory"; ValueData: "{app}"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "File"; ValueData: "worms2.exe"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "Guid"; ValueData: "{{DF394860-E19E-11D0-805F-444553540000}"
Root: HKLM32; Subkey: "{#RegPathLM2}"; ValueType: string; ValueName: "Path"; ValueData: "{app}"
;Force IPXWrapper to disable logging
Root: HKCU; Subkey: "SOFTWARE\IPXWrapper"; ValueType: dword; ValueName: "log_level"; ValueData: 7
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

;Wine
;DLL Overrides - DirectPlay
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "dplayx"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "dpnet"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "dpnhpast"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\DllOverrides"; ValueType: string; ValueName: "dpwsockx"; ValueData: "native,builtin"; Check: IsWine();
;DLL Overrides - Worms2
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\frontend.exe\DllOverrides"; ValueType: string; ValueName: "winmm"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\frontend.exe\DllOverrides"; ValueType: string; ValueName: "wsock32"; ValueData: "native,builtin"; Check: IsWine();
Root: HKCU; Subkey: "{#RegPathWine}\AppDefaults\worms2.exe\DllOverrides"; ValueType: string; ValueName: "dsound"; ValueData: "native,builtin"; Check: IsWine();
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
      if (not FileExists(ExpandConstant('{app}\{#AppProcess1}')) or not FileExists(ExpandConstant('{app}\fkWorm2NAT.dll'))) then begin
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
zh_Hans.SelectLanguageTitle=选择语言
zh_Hans.SelectLanguageLabel=为{#AppName}选择语言
zh_Hans.SelectDirLabel3=安装程序将尝试检测{#Game}的安装位置。
zh_Hans.SelectDirBrowseLabel=如果未检测到安装位置，请点击"浏览"指定文件夹。
zh_Hans.FinishedHeadingLabel=补丁完成

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
zh_Hans.SetupAppRunningError=安装程序检测到游戏正在运行。 请先关闭游戏再安装补丁。

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
zh_Hans.AddonHostProgramNotFound=在您选择的文件夹中未找到{#Game}。如果这是正确的文件夹，请尝试重新安装游戏。

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
zh_Hans.Installing=正在安装%1
 
[Run]
;Enable DirectPlay (Windows 8+)
Filename: dism; Parameters: "/online /Enable-Feature /all /FeatureName:DirectPlay /Quiet /NoRestart"; MinVersion: 6.2; StatusMsg: "{cm:Installing,DirectPlay}..."; Flags: runhidden
;Add IPX registry entries
Filename: {tmp}\dplay-setup.exe; Parameters: "/q"; StatusMsg: "{cm:Installing,IPXWrapper}..."
;Discord link
Filename: "https://discord.gg/Tvs83972UD"; Description: "Worms 2 Discord"; MinVersion: 10.0; Flags: shellexec runasoriginaluser postinstall nowait unchecked