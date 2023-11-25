#define AppName "Worms 2 Plus Hotfix: Frontend Water Palette"
#define AppVersion "1.0"
#define AppProcess1 "frontend.exe"
#define AppProcess2 "worms2.exe"
#define Game "Worms 2"
#define RegPathCU1 "Software\Team17SoftwareLTD\Worms2"
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
OutputBaseFilename=Hotfix - FWP
SetupIconFile=image-icon-hotfix.ico
WizardImageFile=image-large.bmp
WizardImageStretch=no
WizardSmallImageFile=image-small.bmp
Compression=none
Uninstallable=no
PrivilegesRequired=admin
ShowLanguageDialog=yes
RestartIfNeededByRun=no

[Languages]
Name: "nl"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"
Name: "it"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "pt"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "es"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "es_la"; MessagesFile: "Languages\SpanishLA.isl"
Name: "sv"; MessagesFile: "Languages\Swedish.isl"

[Registry]
Root: HKCU; Subkey: "{#RegPathCU1}"; ValueType: string; ValueName: "W2PATH"; ValueData: {code:setPath} 

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

function setPath(def: string): string;
var path8dot3: string;
var pathReg: string;
begin 
    path8dot3 := GetShortName(InstalledDir);
    if Pos(' ', path8dot3) = 0 then begin
      pathReg := path8dot3;
    end
    else begin
      pathReg := '.';
    end;
    Result := pathReg;  
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
SelectLanguageLabel=Select the language for setup
SetupAppTitle={#AppName}
SetupWindowTitle={#AppName} 
WelcomeLabel1={#AppName} 
en.SelectDirLabel3=Setup will try to detect where {#Game} is installed.
en.SelectDirBrowseLabel=If it has not been detected, click Browse to specify the folder.
en.FinishedHeadingLabel=Hotfix Applied