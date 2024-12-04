; *** Inno Setup version 5.5.3+ Portuguese (Portugal) messages ***
;
; Maintained by Nuno Silva (nars AT gmx.net)
; Modified by Rúben Fernandes (rubinho146)

[LangOptions]
LanguageName=Portugu<00EA>s
LanguageID=$0816
LanguageCodePage=1252

[Messages]

; *** Application titles
SetupAppTitle=Instalação
SetupWindowTitle=%1 - Instalação
UninstallAppTitle=Desinstalação
UninstallAppFullTitle=%1 - Desinstalação

; *** Misc. common
InformationTitle=Informação
ConfirmTitle=Confirmação
ErrorTitle=Erro

; *** SetupLdr messages
SetupLdrStartupMessage=Irá ser instalado o %1. Desejas continuar?
LdrCannotCreateTemp=Não foi possível criar um ficheiro temporário. Instalação cancelada.
LdrCannotExecTemp=Não foi possível executar um ficheiro no diretório temporário. Instalação cancelada.

; *** Startup error messages
LastErrorMessage=%1.%n%nErro %2: %3
SetupFileMissing=O ficheiro %1 não foi encontrado na pasta de instalação. Corrige o problema ou obtém uma nova cópia do programa.
SetupFileCorrupt=Os ficheiros de instalação estão corrompidos. Obtém uma nova cópia do programa.
SetupFileCorruptOrWrongVer=Os ficheiros de instalação estão corrompidos, ou são incompatíveis com esta versão do Assistente de Instalação. Corrige o problema ou obtém uma nova cópia do programa.
InvalidParameter=Foi especificado um parâmetro inválido na linha de comando:%n%n%1
SetupAlreadyRunning=A instalação já está em execução.
WindowsVersionNotSupported=Este programa não suporta a versão do Windows que estás a utilizar.
WindowsServicePackRequired=Este programa necessita de %1 Service Pack %2 ou mais recente.
NotOnThisPlatform=Este programa não pode ser executado no %1.
OnlyOnThisPlatform=Este programa deve ser executado no %1.
OnlyOnTheseArchitectures=Este programa só pode ser instalado em versões do Windows preparadas para as seguintes arquiteturas:%n%n%1
MissingWOW64APIs=A versão do Windows que estás a utilizar não dispõe das funcionalidades necessárias para o Assistente de Instalação poder realizar uma instalação de 64-bit's. Para corrigir este problema, instala o Service Pack %1.
WinVersionTooLowError=Este programa necessita do %1 versão %2 ou mais recente.
WinVersionTooHighError=Este programa não pode ser instalado no %1 versão %2 ou mais recente.
AdminPrivilegesRequired=Deve iniciar sessão como administrador para instalares este programa.
PowerUserPrivilegesRequired=Deves iniciar sessão como administrador ou membro do grupo de Super Utilizadores para instalar este programa.
SetupAppRunningError=O Assistente de Instalação detectou que o %1 está em execução. Fecha-o e de seguida clica em OK para continuar, ou clica em Cancelar para cancelar a instalação.
UninstallAppRunningError=O Assistente de Desinstalação detectou que o %1 está em execução. Fecha-o e de seguida clica em OK para continuar, ou clica em Cancelar para cancelar a desinstalação.

; *** Misc. errors
ErrorCreatingDir=O Assistente de Instalação não consegue criar o diretório "%1"
ErrorTooManyFilesInDir=Não é possível criar um ficheiro no diretório "%1" porque esta contém demasiados ficheiros

; *** Setup common messages
ExitSetupTitle=Terminar a instalação
ExitSetupMessage=A instalação não está completa. Se terminares agora, o programa não será instalado.%n%nMais tarde poderás executar novamente este Assistente de Instalação e concluir a instalação.%n%nDesejas terminar a instalação?
AboutSetupMenuItem=&Acerca de...
AboutSetupTitle=Acerca do Assistente de Instalação
AboutSetupMessage=%1 versão %2%n%3%n%n%1 home page:%n%4
AboutSetupNote=
TranslatorNote=Portuguese translation maintained by NARS (nars@gmx.net)

; *** Buttons
ButtonBack=< &Anterior
ButtonNext=&Seguinte >
ButtonInstall=&Instalar
ButtonOK=OK
ButtonCancel=Cancelar
ButtonYes=&Sim
ButtonYesToAll=Sim para &todos
ButtonNo=&Não
ButtonNoToAll=Nã&o para todos
ButtonFinish=&Concluir
ButtonBrowse=&Procurar...
ButtonWizardBrowse=P&rocurar...
ButtonNewFolder=&Criar Nova Pasta

; *** "Select Language" dialog messages
SelectLanguageTitle=Seleciona o Idioma do Assistente de Instalação
SelectLanguageLabel=Seleciona o idioma para usar durante a Instalação:

; *** Common wizard text
ClickNext=Clica em Seguinte para continuar ou em Cancelar para cancelares a instalação.
BeveledLabel=
BrowseDialogTitle=Procurar Pasta
BrowseDialogLabel=Seleciona uma pasta na lista abaixo e clica em OK.
NewFolderName=Nova Pasta

; *** "Welcome" wizard page
WelcomeLabel1=Bem-vindo ao Assistente de Instalação de [name]
WelcomeLabel2=O Assistente de Instalação irá instalar [name/ver] no teu computador.%n%nÉ recomendado que feches todas as outras aplicações antes de continuares.

; *** "Password" wizard page
WizardPassword=Palavra-passe
PasswordLabel1=Esta instalação está protegida por palavra-passe.
PasswordLabel3=Insere a palavra-passe e de seguida clica em Seguinte para continuar. Na palavra-passe existe diferença entre maiúsculas e minúsculas.
PasswordEditLabel=&Palavra-passe:
IncorrectPassword=A palavra-passe que introduziste não está correta. Tenta novamente.

; *** "License Agreement" wizard page
WizardLicense=Contrato de licença
LicenseLabel=É importante que leias as seguintes informações antes de continuares.
LicenseLabel3=Lê atentamente o seguinte contrato de licença. Deves aceitar os termos do contrato antes de continuares a instalação.
LicenseAccepted=A&ceito o contrato
LicenseNotAccepted=&Não aceito o contrato

; *** "Information" wizard pages
WizardInfoBefore=Informação
InfoBeforeLabel=É importante que leias as seguintes informações antes de continuares.
InfoBeforeClickLabel=Quando estiveres pronto para continuar, clica em Seguinte.
WizardInfoAfter=Informação
InfoAfterLabel=É importante que leias as seguintes informações antes de continuares.
InfoAfterClickLabel=Quando estiveres pronto para continuar, clica em Seguinte.

; *** "User Information" wizard page
WizardUserInfo=Informações do utilizador
UserInfoDesc=Introduz as tuas informações.
UserInfoName=Nome do &utilizador:
UserInfoOrg=&Organização:
UserInfoSerial=&Número de série:
UserInfoNameRequired=Deves introduzir um nome.

; *** "Select Destination Location" wizard page
WizardSelectDir=Seleciona a localização de destino
SelectDirDesc=Onde deverá ser instalado [name]?
SelectDirLabel3=[name] será instalado na seguinte pasta.
SelectDirBrowseLabel=Para continuar, clica em Seguinte. Se desejares selecionar uma pasta diferente, clica em Procurar.
DiskSpaceMBLabel=É necessário pelo menos [mb] MB de espaço livre no disco.
CannotInstallToNetworkDrive=O Assistente de Instalação não pode instalar numa unidade de rede.
CannotInstallToUNCPath=O Assistente de Instalação não pode instalar num caminho UNC.
InvalidPath=É necessário indicar o caminho completo com a letra de unidade; por exemplo:%n%nC:\APP%n%nou um caminho UNC no formato:%n%n\\servidor\partilha
InvalidDrive=A unidade ou partilha UNC selecionada não existe ou não está acessível. Seleciona outra.
DiskSpaceWarningTitle=Não há espaço suficiente no disco
DiskSpaceWarning=O Assistente de Instalação necessita de pelo menos %1 KB de espaço livre, mas a unidade selecionada tem apenas %2 KB disponíveis.%n%nDesejas continuar de qualquer forma?
DirNameTooLong=O nome ou caminho para a pasta é demasiado longo.
InvalidDirName=O nome da pasta não é válido.
BadDirName32=O nome da pasta não pode conter nenhum dos seguintes caracteres:%n%n%1
DirExistsTitle=A pasta já existe
DirExists=A pasta:%n%n%1%n%njá existe. Pretendes instalar nesta pasta?
DirDoesntExistTitle=A pasta não existe
DirDoesntExist=A pasta:%n%n%1%n%nnão existe. Pretendes que esta pasta seja criada?

; *** "Select Components" wizard page
WizardSelectComponents=Seleciona os componentes
SelectComponentsDesc=Que componentes deverão ser instalados?
SelectComponentsLabel2=Seleciona os componentes que queres instalar e desseleciona os componentes que não queres instalar. Clica em Seguinte quando estiveres pronto para continuar.
FullInstallation=Instalação Completa
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Instalação Compacta
CustomInstallation=Instalação Personalizada
NoUninstallWarningTitle=Componentes Encontrados
NoUninstallWarning=O Assistente de Instalação detectou que os seguintes componentes estão instalados no yeu computador:%n%n%1%n%nSe desselecionares estes componentes, eles não serão desinstalados.%n%nDesejas continuar?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=A seleção actual necessita de pelo menos [mb] MB de espaço no disco.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Seleciona tarefas adicionais
SelectTasksDesc=Que tarefas adicionais deverão ser executadas?
SelectTasksLabel2=Seleciona as tarefas adicionais que desejas que o Assistente de Instalação execute na instalação do [name] e em seguida clica em Seguinte.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Seleciona a pasta do Menu Iniciar
SelectStartMenuFolderDesc=Onde deverão ser colocados os ícones de atalho do programa?
SelectStartMenuFolderLabel3=Os ícones de atalho do programa serão criados na seguinte pasta do Menu Iniciar.
SelectStartMenuFolderBrowseLabel=Para continuar, clica em Seguinte. Se desejares selecionar uma pasta diferente, clica em Procurar.
MustEnterGroupName=É necessário introduzir um nome para a pasta.
GroupNameTooLong=O nome ou caminho para a pasta é demasiado longo.
InvalidGroupName=O nome da pasta não é válido.
BadGroupName=O nome da pasta não pode conter nenhum dos seguintes caracteres:%n%n%1
NoProgramGroupCheck2=&Não criar nenhuma pasta no Menu Iniciar

; *** "Ready to Install" wizard page
WizardReady=Pronto para Instalar
ReadyLabel1=O Assistente de Instalação está pronto para instalar [name] no teu computador.
ReadyLabel2a=Clica em Instalar para continuar a instalação, ou clica em Anterior se desejares rever ou alterar alguma das configurações.
ReadyLabel2b=Clica em Instalar para continuar a instalação.
ReadyMemoUserInfo=Informações do utilizador:
ReadyMemoDir=Localização de destino:
ReadyMemoType=Tipo de instalação:
ReadyMemoComponents=Componentes selecionados:
ReadyMemoGroup=Pasta do Menu Iniciar:
ReadyMemoTasks=Tarefas adicionais:

; *** "Preparing to Install" wizard page
WizardPreparing=A preparar para instalar
PreparingDesc=A preparar para instalar [name] no teu computador.
PreviousInstallNotCompleted=A instalação/remoção de um programa anterior não foi completada. Necessitarás de reiniciar o computador para completar essa instalação.%n%nDepois de reiniciares o computador, executa novamente este Assistente de Instalação para completar a instalação de [name].
CannotContinue=A instalação não pode continuar. Clica em Cancelar para sair.
ApplicationsFound=As seguintes aplicações estão a utilizar ficheiros que necessitam ser atualizados pelo Assistente de Instalação. É recomendado que permita que o Assistente de Instalação feche estas aplicações.
ApplicationsFound2=As seguintes aplicações estão a utilizar ficheiros que necessitam ser atualizados pelo Assistente de Instalação. É recomendado que permita que o Assistente de Instalação feche estas aplicações. Depois de completar a instalação, o Assistente de Instalação tentará reiniciar as aplicações.
CloseApplications=&Fechar as aplicações automaticamente
DontCloseApplications=&Não fechar as aplicações
ErrorCloseApplications=O Assistente de Instalação não conseguiu fechar todas as aplicações automaticamente. Antes de continuar, é recomendado que feches todas as aplicações que utilizem ficheiros que necessitem de ser atualizados pelo Assistente de Instalação.

; *** "Installing" wizard page
WizardInstalling=A instalar
InstallingLabel=Aguarda enquanto o Assistente de Instalação instala [name] no teu computador.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Instalação de [name] concluída
FinishedLabelNoIcons=O Assistente de Instalação concluiu a instalação de [name] no teu computador.
FinishedLabel=O Assistente de Instalação concluiu a instalação de [name] no teu computador. A aplicação pode ser iniciada através dos ícones instalados.
ClickFinish=Clica em Concluir para finalizar o Assistente de Instalação.
FinishedRestartLabel=Para completar a instalação de [name], o Assistente de Instalação deverá reiniciar o teu computador. Desejas reiniciar agora?
FinishedRestartMessage=Para completar a instalação de [name], o Assistente de Instalação deverá reiniciar o teu computador.%n%nDesejas reiniciar agora?
ShowReadmeCheck=Sim, desejo ver o ficheiro LEIAME
YesRadio=&Sim, desejo reiniciar o computador agora
NoRadio=&Não, desejo reiniciar o computador mais tarde
; used for example as 'Run MyProg.exe'
RunEntryExec=Executar %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Visualizar %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=O Assistente de Instalação precisa do disco seguinte
SelectDiskLabel2=Introduz o disco %1 e clica em OK.%n%nSe os ficheiros deste disco estiverem num local diferente do mostrado abaixo, indica o caminho correto ou clica em Procurar.
PathLabel=&Caminho:
FileNotInDir2=O ficheiro "%1" não foi encontrado em "%2". Introduz o disco correto ou selecione outra pasta.
SelectDirectoryLabel=Indica a localização do disco seguinte.

; *** Installation phase messages
SetupAborted=A instalação não está completa.%n%nCorrige o problema e executa o Assistente de Instalação novamente.
EntryAbortRetryIgnore=Clica em Repetir para tentar novamente, Ignorar para continuar de qualquer forma, ou Abortar para cancelar a instalação.

; *** Installation status messages
StatusClosingApplications=A fechar aplicações...
StatusCreateDirs=A criar diretórios...
StatusExtractFiles=A extrair ficheiros...
StatusCreateIcons=A criar atalhos...
StatusCreateIniEntries=A criar entradas em INI...
StatusCreateRegistryEntries=A criar entradas no registo...
StatusRegisterFiles=A registar ficheiros...
StatusSavingUninstall=A guardar informações para desinstalação...
StatusRunProgram=A concluir a instalação...
StatusRestartingApplications=A reiniciar aplicações...
StatusRollback=A anular as alterações...

; *** Misc. errors
ErrorInternal2=Erro interno: %1
ErrorFunctionFailedNoCode=%1 falhou
ErrorFunctionFailed=%1 falhou; código %2
ErrorFunctionFailedWithMessage=%1 falhou; código %2.%n%3
ErrorExecutingProgram=Não é possível executar o ficheiro:%n%1

; *** Registry errors
ErrorRegOpenKey=Erro ao abrir a chave de registo:%n%1\%2
ErrorRegCreateKey=Erro ao criar a chave de registo:%n%1\%2
ErrorRegWriteKey=Erro ao escrever na chave de registo:%n%1\%2

; *** INI errors
ErrorIniEntry=Erro ao criar entradas em INI no ficheiro "%1".

; *** File copying errors
FileAbortRetryIgnore=Clica em Repetir para tentar novamente, Ignorar para ignorar este ficheiro (não recomendado), ou Abortar para cancelar a instalação.
FileAbortRetryIgnore2=Clica em Repetir para tentar novamente, Ignorar para continuar de qualquer forma (não recomendado), ou Abortar para cancelar a instalação.
SourceIsCorrupted=O ficheiro de origem está corrompido
SourceDoesntExist=O ficheiro de origem "%1" não existe
ExistingFileReadOnly=O ficheiro existente tem o atributo "só de leitura".%n%nClica em Repetir para remover o atributo "só de leitura" e tentar novamente, Ignorar para ignorar este ficheiro, ou Abortar para cancelar a instalação.
ErrorReadingExistingDest=Ocorreu um erro ao tentar ler o ficheiro existente:
FileExists=O ficheiro já existe.%n%nDesejas substituí-lo?
ExistingFileNewer=O ficheiro existente é mais recente que o que está a ser instalado. É recomendado que mantenhas o ficheiro existente.%n%nDesejas manter o ficheiro existente?
ErrorChangingAttr=Ocorreu um erro ao tentar alterar os atributos do ficheiro existente:
ErrorCreatingTemp=Ocorreu um erro ao tentar criar um ficheiro no diretório de destino:
ErrorReadingSource=Ocorreu um erro ao tentar ler o ficheiro de origem:
ErrorCopying=Ocorreu um erro ao tentar copiar um ficheiro:
ErrorReplacingExistingFile=Ocorreu um erro ao tentar substituir o ficheiro existente:
ErrorRestartReplace=RestartReplace falhou:
ErrorRenamingTemp=Ocorreu um erro ao tentar mudar o nome de um ficheiro no directório de destino:
ErrorRegisterServer=Não é possível registar o DLL/OCX: %1
ErrorRegSvr32Failed=O RegSvr32 falhou com o código de saída %1
ErrorRegisterTypeLib=Não foi possível registar a livraria de tipos: %1

; *** Post-installation errors
ErrorOpeningReadme=Ocorreu um erro ao tentar abrir o ficheiro LEIAME.
ErrorRestartingComputer=O Assistente de Instalação não consegue reiniciar o computador. Por favor, reinicia manualmente.

; *** Uninstaller messages
UninstallNotFound=O ficheiro "%1" não existe. Não é possível desinstalar.
UninstallOpenError=Não foi possível abrir o ficheiro "%1". Não é possível desinstalar.
UninstallUnsupportedVer=O ficheiro log de desinstalação "%1" está num formato que não é reconhecido por esta versão do desinstalador. Não é possível desinstalar
UninstallUnknownEntry=Foi encontrada uma entrada desconhecida (%1) no ficheiro log de desinstalação
ConfirmUninstall=Tem a certeza que deseja remover completamente o %1 e todos os seus componentes?
UninstallOnlyOnWin64=Esta desinstalação só pode ser realizada na versão de 64-bit's do Windows.
OnlyAdminCanUninstall=Esta desinstalação só pode ser realizada por um utilizador com privilégios administrativos.
UninstallStatusLabel=Por favor aguarde enquanto o %1 está a ser removido do seu computador.
UninstalledAll=O %1 foi removido do seu computador com sucesso.
UninstalledMost=A desinstalação do %1 está concluída.%n%nAlguns elementos não puderam ser removidos. Estes elementos podem ser removidos manualmente.
UninstalledAndNeedsRestart=Para completar a desinstalação do %1, o computador deve ser reiniciado.%n%nDeseja reiniciar agora?
UninstallDataCorrupted=O ficheiro "%1" está corrompido. Não é possível desinstalar

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Remover ficheiro partilhado?
ConfirmDeleteSharedFile2=O sistema indica que o seguinte ficheiro partilhado já não está a ser utilizado por nenhum programa. Deseja removê-lo?%n%nSe algum programa ainda necessitar deste ficheiro, poderá não funcionar correctamente depois de o remover. Se não tiver a certeza, seleccione Não. Manter o ficheiro não causará nenhum problema.
SharedFileNameLabel=Nome do ficheiro:
SharedFileLocationLabel=Localização:
WizardUninstalling=Estado da desinstalação
StatusUninstalling=A desinstalar o %1...

; *** Shutdown block reasons
ShutdownBlockReasonInstallingApp=A instalar %1.
ShutdownBlockReasonUninstallingApp=A desinstalar %1.

; The custom messages below aren't used by Setup itself, but if you make
; use of them in your scripts, you'll want to translate them.

[CustomMessages]

NameAndVersion=%1 versão %2
AdditionalIcons=Ícones adicionais:
CreateDesktopIcon=Criar ícone no Ambiente de &Trabalho
CreateQuickLaunchIcon=&Criar ícone na barra de Iniciação Rápida
ProgramOnTheWeb=%1 na Web
UninstallProgram=Desinstalar o %1
LaunchProgram=Executar o %1
AssocFileExtension=Associa&r o %1 aos ficheiros com a extensão %2
AssocingFileExtension=A associar o %1 aos ficheiros com a extensão %2...
AutoStartProgramGroupDescription=Inicialização Automática:
AutoStartProgram=Iniciar %1 automaticamente
AddonHostProgramNotFound=Não foi possível localizar %1 na pasta selecionada.%n%nDesejas continuar de qualquer forma?
