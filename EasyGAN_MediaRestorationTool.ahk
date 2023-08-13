;====== GLOBAL SCRIPT SETTINGS ======
#SingleInstance Force
#Warn All, Off
Persistent

;Change this on every new compilation/update
global compilation := "0.1.1"
global compilation_version := 002513082023 ;it indicates to the program if it was updated (WHETHER OR NOT THE LIBRARIES WHERE UPDATED) ;syntax recommendation: 24HHHHddMMyyyy ; example: 143809042023 (14:38, 09/April/2023)
global libraries_updated := "no" ;it indicates to the program if one of the libraries (FFmpeg, GFPGAN, RealESRGAN) was updated (MUST BE CHANGED IF THE VALUE OF compilation_version DID SO)
;@Ahk2Exe-SetVersion 0.1.1
;@Ahk2Exe-SetName EasyGAN Media Restoration Tool
;@Ahk2Exe-SetDescription Restaurador de medios basado en GAN
;@Ahk2Exe-SetCompanyName MauTech05
;@Ahk2Exe-SetCopyright MauTech05
;@Ahk2Exe-SetLanguage 0x080a
;@Ahk2Exe-ExeName EasyGAN_release.exe
;@Ahk2Exe-SetMainIcon Configuraciones\restore-hobby-flaticons.com-flat.ico
;@Ahk2Exe-Base C:\Program Files\AutoHotkey\v2\AutoHotkey32.exe
;@Ahk2Exe-AddResource Configuraciones\restore-hobby-flaticons.com-flat.ico
;@Ahk2Exe-AddResource Configuraciones\botones\dark\button.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\button_descargar-e-instalar-ahora.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\button_instalacion-de-easygan.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\button_medios-restaurados.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\button_restaurar.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\button_x.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\button_ya-tengo-python-instalado.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\maintab_acerca.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\maintab_funciones.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\maintab_inicio.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\tab_acerca.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\tab_funciones.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\tab_inicio.png
;@Ahk2Exe-AddResource Configuraciones\botones\dark\tabs_border.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\button.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\button_descargar-e-instalar-ahora.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\button_instalacion-de-easygan.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\button_medios-restaurados.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\button_restaurar.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\button_x.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\button_ya-tengo-python-instalado.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\maintab_acerca.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\maintab_funciones.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\maintab_inicio.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\tab_acerca.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\tab_funciones.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\tab_inicio.png
;@Ahk2Exe-AddResource Configuraciones\botones\light\tabs_border.png

;Program resources
global installation_base_dir := A_ScriptDir
global settings_dir := installation_base_dir "\Configuraciones"
global restored_media_dir := installation_base_dir "\Medios Restaurados"
global libraries_dir := installation_base_dir "\Librerias"
global light_buttons := settings_dir "\botones\light"
global dark_buttons := settings_dir "\botones\dark"
global compilation_installed := settings_dir "\compilation.txt"
global guitheme_set := settings_dir "\guitheme.txt" ; it indicates to the program which color mode to show
global python_installed := settings_dir "\python.txt"

;Download links of Third-Party tools
if A_Is64bitOS == 1 {
	global downloadFFmpeg := "https://github.com/yt-dlp/FFmpeg-Builds/releases/download/autobuild-2023-06-30-14-08/ffmpeg-n6.0-26-g3f345ebf21-win64-gpl-shared-6.0.zip"
	global downloadPython := "https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip"
} else {
	global downloadFFmpeg := "https://github.com/yt-dlp/FFmpeg-Builds/releases/download/autobuild-2023-06-30-14-08/ffmpeg-n6.0-26-g3f345ebf21-win32-gpl-shared-6.0.zip"
	global downloadPython := "https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-win32.zip"
}
global downloadGFPGAN := "https://github.com/TencentARC/GFPGAN/archive/refs/tags/v1.3.8.zip"
global dlmodelsGFPGAN := "https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.4.pth"
global dlESRGANvulkan := "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesrgan-ncnn-vulkan-20220424-windows.zip"
global dlESRGANpython := "https://github.com/xinntao/Real-ESRGAN/archive/refs/tags/v0.3.0.zip"
global dlVideo3ESRGAN := "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-animevideov3.pth"
global dlX4pa6BESRGAN := "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth"
global dlX4plusESRGAN := "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth"

;Versions of Third-Party tools
if A_Is64bitOS == 1
	global ffmpeg_version := "ffmpeg-n6.0-26-g3f345ebf21-win64-gpl-shared-6.0"
else
	global ffmpeg_version := "ffmpeg-n6.0-26-g3f345ebf21-win32-gpl-shared-6.0"
global gfpgan_version := "GFPGAN-1.3.8"
global esrgan_vulkan_version := "realesrgan-ncnn-vulkan-20220424-windows"
global esrgan_python_version := "Real-ESRGAN-0.3.0"
global python_version := "Python-3.10.11"

;Paths to Third-Party tools
global ffmpeg_tool_path := libraries_dir "\" ffmpeg_version "\bin\"
global gfpgan_tool_path := libraries_dir "\" gfpgan_version
global esrgan_python_path := libraries_dir "\" esrgan_python_version
global esrgan_vulkan_path := libraries_dir "\" esrgan_vulkan_version
global python_tool_path := libraries_dir "\" python_version

;Paths to output folders and temporal files
global script_icon := settings_dir "\restore-hobby-flaticons.com-flat.ico"
global patched_folder_path := settings_dir "\tmp"
global esrgan_video_log := esrgan_vulkan_path "\video_frames.txt"
global input_frames_path := esrgan_vulkan_path "\tmp_frames"
global output_frames_path := esrgan_vulkan_path "\out_frames"


;====== RELEASE ======
if A_IsCompiled && !FileExist(dark_buttons "\tabs_border.png") && !FileExist(light_buttons "\tabs_border.png") {
	DirCreate settings_dir
	DirCreate light_buttons
	DirCreate dark_buttons
	DirCreate libraries_dir
	DirCreate restored_media_dir
	FileInstall "Configuraciones\restore-hobby-flaticons.com-flat.ico", settings_dir "\restore-hobby-flaticons.com-flat.ico"
	FileInstall "Configuraciones\botones\dark\button.png", dark_buttons "\button.png"
	FileInstall "Configuraciones\botones\dark\button_descargar-e-instalar-ahora.png", dark_buttons "\button_descargar-e-instalar-ahora.png"
	FileInstall "Configuraciones\botones\dark\button_instalacion-de-easygan.png", dark_buttons "\button_instalacion-de-easygan.png"
	FileInstall "Configuraciones\botones\dark\button_medios-restaurados.png", dark_buttons "\button_medios-restaurados.png"
	FileInstall "Configuraciones\botones\dark\button_restaurar.png", dark_buttons "\button_restaurar.png"
	FileInstall "Configuraciones\botones\dark\button_x.png", dark_buttons "\button_x.png"
	FileInstall "Configuraciones\botones\dark\button_ya-tengo-python-instalado.png", dark_buttons "\button_ya-tengo-python-instalado.png"
	FileInstall "Configuraciones\botones\dark\maintab_acerca.png", dark_buttons "\maintab_acerca.png"
	FileInstall "Configuraciones\botones\dark\maintab_funciones.png", dark_buttons "\maintab_funciones.png"
	FileInstall "Configuraciones\botones\dark\maintab_inicio.png", dark_buttons "\maintab_inicio.png"
	FileInstall "Configuraciones\botones\dark\tab_acerca.png", dark_buttons "\tab_acerca.png"
	FileInstall "Configuraciones\botones\dark\tab_funciones.png", dark_buttons "\tab_funciones.png"
	FileInstall "Configuraciones\botones\dark\tab_inicio.png", dark_buttons "\tab_inicio.png"
	FileInstall "Configuraciones\botones\dark\tabs_border.png", dark_buttons "\tabs_border.png"

	FileInstall "Configuraciones\botones\light\button.png", light_buttons "\button.png"
	FileInstall "Configuraciones\botones\light\button_descargar-e-instalar-ahora.png", light_buttons "\button_descargar-e-instalar-ahora.png"
	FileInstall "Configuraciones\botones\light\button_instalacion-de-easygan.png", light_buttons "\button_instalacion-de-easygan.png"
	FileInstall "Configuraciones\botones\light\button_medios-restaurados.png", light_buttons "\button_medios-restaurados.png"
	FileInstall "Configuraciones\botones\light\button_restaurar.png", light_buttons "\button_restaurar.png"
	FileInstall "Configuraciones\botones\light\button_x.png", light_buttons "\button_x.png"
	FileInstall "Configuraciones\botones\light\button_ya-tengo-python-instalado.png", light_buttons "\button_ya-tengo-python-instalado.png"
	FileInstall "Configuraciones\botones\light\maintab_acerca.png", light_buttons "\maintab_acerca.png"
	FileInstall "Configuraciones\botones\light\maintab_funciones.png", light_buttons "\maintab_funciones.png"
	FileInstall "Configuraciones\botones\light\maintab_inicio.png", light_buttons "\maintab_inicio.png"
	FileInstall "Configuraciones\botones\light\tab_acerca.png", light_buttons "\tab_acerca.png"
	FileInstall "Configuraciones\botones\light\tab_funciones.png", light_buttons "\tab_funciones.png"
	FileInstall "Configuraciones\botones\light\tab_inicio.png", light_buttons "\tab_inicio.png"
	FileInstall "Configuraciones\botones\light\tabs_border.png", light_buttons "\tabs_border.png"
}


;====== CHECK PYTHON INSTALLATION ======
try {
	global python := FileRead(python_installed)
} catch {
	try
		FileDelete python_installed
	FileAppend "Not Installed", python_installed
	global python := FileRead(python_installed)
}
if FileExist(python_tool_path "\python.exe") { ;The file says Python was NOT installed or does not even exist, but Python is INSTALLED
	try
		FileDelete python_installed
	FileAppend "Installed", python_installed
	global python := FileRead(python_installed)
}
if Python = "Installed" && !FileExist(python_tool_path "\python.exe") { ;The file says Python was INSTALLED from here but Python is MISSING
	try
		FileDelete python_installed
	FileAppend "Not Installed", python_installed
	global python := FileRead(python_installed)
}


;====== INSTALLER ======
if FileExist(compilation_installed)
	cur_compilation_ver := FileRead(compilation_installed)
else
	cur_compilation_ver := compilation_version

if !FileExist(compilation_installed) || (compilation_version > cur_compilation_ver) || !FileExist(ffmpeg_tool_path "\ffmpeg.exe") || !FileExist(gfpgan_tool_path "\inference_gfpgan.py") || !FileExist(esrgan_vulkan_path "\realesrgan-ncnn-vulkan.exe") || !FileExist(esrgan_python_path "\inference_realesrgan.py") { ;Launch installer in case that: 1)This is the first run. 2)There is a newer compilation. 3)Some libraries are missing
	if !A_IsAdmin {
		try {
			Run("*RunAs " (A_IsCompiled ? "" : A_AhkPath " ") Chr(34) A_ScriptFullPath Chr(34))
			return
		} catch {
			MsgBox "No se han podido obtener permisos de administrador para este programa, por lo que no podemos continuar con la instalación y se cerrará el programa.", "Permisos Requeridos - EasyGAN Media Restoration Tool", "Iconx"
			ExitApp
		}
	}

	DirCreate libraries_dir ;here will be storaged the third-party algorithms such as FFmpeg, GFPGAN, RealESRGAN.
	DirCreate restored_media_dir ;this is the default folder for the output files (user can select another folder in GUI menu)

	A_IconTip := "Instalador de EasyGAN Media Restoration Tool"
	TraySetIcon(script_icon)
	Tray := A_TrayMenu
	Tray.delete
	Tray.Add("Mostrar Instalador", showInstaller)
	Tray.Add("Cerrar Instalador", GuiEscape)

	installerGUI := Gui("+MinSize390x310", "Instalador de EasyGAN Media Restoration Tool")
	installerGUI.OnEvent("Close", hideInstaller)
	installerGUI.SetFont("s12 w600 c000000", "Consolas")
	installerGUI.Add("Text", , "EasyGAN Media Restoration Tool")

	installerGUI.SetFont("s9 w400 c000000", "Segoe UI")
	WelcomeTab := installerGUI.Add("Tab3", "x10 y40 w500", ["Bienvenidos"])
		installerGUI.Add("Text", "x20 y70 w480", "Gracias por descargar este programa. Te invito a leer atentamente todas las secciones de este instalador y que disfrutes al máximo del programa una vez instalado.")
		installerGUI.Add("GroupBox", "x15 y115 h65 w475 section", "Funcionamiento")
			installerGUI.Add("Text", "xs+5 ys+20 w465", "De manera resumida, este programa accede a tres principales librerías, gracias a las cuales consigue mejorar la resolución y calidad de los archivos ingresados.")
		installerGUI.Add("GroupBox", "x15 y195 h80 w475 section", "Propósito")
			installerGUI.Add("Text", "xs+5 ys+20 w465", "Difundir y promover el uso y conocimiento de este tipo de innovaciones entre la población, especialmente aquellos que tienen dificultades para usar programas sin una interfaz gráfica (desde la línea de comandos).")
		requirementsButton := installerGUI.Add("Button", "x330 y400 w160", "Siguiente")
		requirementsButton.OnEvent("Click", goToRequirements)

	RequirementsTab := installerGUI.Add("Tab3", "x10 y40 w500", ["Requisitos"])
		installerGUI.Add("Text", "x20 y70 w480 section", "- Sistema operativo Windows© versión 8.1 en adelante.")
			installerGUI.Add("Text", "xs+20 ys+20 w470", "La edición (Home,Pro,LTSC) no importa.")
			installerGUI.Add("Link", "xs+20 ys+40 w470", 'La versión mínima puede cambiar con el tiempo, pues algunos requisitos posteriores dependen de la Tienda de Microsoft y ésta, en el caso de Windows 8, terminó con su soporte el 10 de enero de 2023. Más información en el <a href="https://answers.microsoft.com/es-es/windows/forum/all/windows-81-la-tienda-de-windows-81-aun-funciona/50e16793-7d9a-42f4-859c-d3be180abbda">foro de Microsoft</a>')
		installerGUI.Add("Text", "x20 ys+100 w480 section", "- Tarjeta gráfica compatible con Vulkan.")
			installerGUI.Add("Link", "xs+20 ys+20 w470", 'En el caso de NVIDIA aplican todos sus productos GeForce© y Quadro© de las arquitecturas Ada Lovelace, Ampere, Turing, Volta, Pascal y Maxwell. En otras palabras, cualquiera que haya salido después de 2014. Más detalles en la <a href="https://developer.nvidia.com/vulkan-driver">web de NVIDIA</a>')
			installerGUI.Add("Link", "xs+20 ys+75 w470", 'En el caso de AMD aplican las tarjetas gráficas integradas (APU) y las tarjetas gráficas dedicadas (GPU) Radeon© basadas en la arquitectura Graphics Core Next. Más detalles en la <a href="https://www.amd.com/es/technologies/vulkan">web de AMD</a>')
		installerGUI.Add("Text", "x20 ys+135 w480 section", "- Intérprete de Python para Windows© (Opcional)")
			installerGUI.Add("Link", "xs+20 ys+20 w470", 'Algunas funciones de este programa como el restaurador de Rostros necesitan de Python para poder utilizarse. Casi al finalizar el proceso de instalación de este programa habrá un apartado para poder instalar el intérprete de Python recomendado y/o para indicar si ya cuentas con uno.')
		InstallationButton := installerGUI.Add("Button", "x330 y400 w160", "Siguiente")
		InstallationButton.OnEvent("Click", goToInstallation)

	InstallationTab := installerGUI.Add("Tab3", "x10 y40 w500", ["Instalación"])
		installerGUI.Add("Text", "x30 y70 w470", "Antes de poder utilizar este programa es necesario descargar e instalar algunas librerías externas. El tiempo de espera dependerá 60% del ancho de banda de tu conexión a internet (mbps contratados), 20% del servidor de descarga y 20% de las capacidades de tu computadora.")
		installerGUI.Add("Text", "x30 y150 w330 section", "FFmpeg (peso aproximado: 39~59 MB)")
			installerGUI.SetFont("s9 w600 c000000", "Consolas")
			LTdownloadFFMPEG := installerGUI.Add("Progress", "xs ys+20 w620 h20 cTeal", 50)
			RTdownloadFFMPEG := installerGUI.Add("Text", "xs+320 ys+22 w160 h20 cTeal", "...Descargando...")
			LTreadyFFMPEG := installerGUI.Add("Progress", "xs ys+20 w850 h20 cGreen", 50)
			RTreadyFFMPEG := installerGUI.Add("Text", "xs+430 ys+22 w140 h20 cGreen", "Listo")
				LTreadyFFMPEG.Visible := false
				RTreadyFFMPEG.Visible := false
		installerGUI.SetFont("s9 w400 c000000", "Segoe UI")
		installerGUI.Add("Text", "x30 y210 w330 section", "GFPGAN (peso aproximado: 338 MB)")
			waitingGFPGAN := installerGUI.Add("Text", "xs ys+20 w330", "... Esperando a que se descomprima la librería anterior ...")
			installerGUI.SetFont("s9 w600 c000000", "Consolas")
			LTdownloadGFPGAN := installerGUI.Add("Progress", "xs ys+20 w620 h20 cTeal", 50)
			RTdownloadGFPGAN := installerGUI.Add("Text", "xs+320 ys+22 w160 h20 cTeal", "...Descargando...")
			LTreadyGFPGAN := installerGUI.Add("Progress", "xs ys+20 w850 h20 cGreen", 50)
			RTreadyGFPGAN := installerGUI.Add("Text", "xs+430 ys+22 w140 h20 cGreen", "Listo")
				LTdownloadGFPGAN.Visible := false
				RTdownloadGFPGAN.Visible := false
				LTreadyGFPGAN.Visible := false
				RTreadyGFPGAN.Visible := false
		installerGUI.SetFont("s9 w400 c000000", "Segoe UI")
		installerGUI.Add("Text", "x30 y270 w330 section", "RealESRGAN (peso aproximado: 62 MB)")
			waitingESRGAN := installerGUI.Add("Text", "xs ys+20 w330", "... Esperando a que se descomprima la librería anterior ...")
			installerGUI.SetFont("s9 w600 c000000", "Consolas")
			LTdownloadESRGAN := installerGUI.Add("Progress", "xs ys+20 w620 h20 cTeal", 50)
			RTdownloadESRGAN := installerGUI.Add("Text", "xs+320 ys+22 w160 h20 cTeal", "...Descargando...")
			LTreadyESRGAN := installerGUI.Add("Progress", "xs ys+20 w850 h20 cGreen", 50)
			RTreadyESRGAN := installerGUI.Add("Text", "xs+430 ys+22 w140 h20 cGreen", "Listo")
				LTdownloadESRGAN.Visible := false
				RTdownloadESRGAN.Visible := false
				LTreadyESRGAN.Visible := false
				RTreadyESRGAN.Visible := false
		installerGUI.SetFont("s9 w400 c000000", "Segoe UI")
		DetailsButton := installerGUI.Add("Button", "x330 y400 w160", "Siguiente")
			DetailsButton.OnEvent("Click", goToDetails)

	DetailsTab := installerGUI.Add("Tab3", "x10 y40 w500", ["Últimos detalles"])
		winShortcut := installerGUI.Add("CheckBox", "checked", "Crear acceso directo en el menú de inicio")
			winShortcut.Enabled := false
		desktopShortcut := installerGUI.Add("CheckBox", "checked", "Crear acceso directo en el Escritorio")
		finishButton := installerGUI.Add("Button", "x330 y400 w160", "Finalizar")
			finishButton.OnEvent("Click", finishInstallation)
		if !FileExist(python_tool_path "\python.exe") {
		   if Python = "Not Installed" {
			installerGUI.Add("Text", "x20 y140 h48 w480 section", "Aún no se ha instalado el intérprete de Python para Windows©. Te recordamos que algunas funciones de este programa, como el restaurador de Rostros, dependen de Python para poder utilizarse.")
			dlPythonButton := installerGUI.Add("Button", "xs ys+50 w150", "Descargar e Instalar Ahora")
				dlPythonButton.OnEvent("Click", getPython)
			rdPythonButton := installerGUI.Add("Button", "xs+160 ys+50 w160", "Ya tengo Python instalado")
				rdPythonButton.OnEvent("Click", gotPythonInstaller)
			ltPythonButton := installerGUI.Add("Button", "xs+330 ys+50 w140", "Lo instalaré más tarde")
				ltPythonButton.OnEvent("Click", laterPython)
			installerGUI.SetFont("s9 w400 cff0000", "Segoe UI")
			installerGUI.Add("Text", "xs ys+80 h48 w480 section", "*Debes seleccionar una opción para poder terminar el proceso de Instalación.")
			installerGUI.SetFont("s9 w400 c000000", "Segoe UI")
			finishButton.Visible := false
		  }
		}


	RequirementsTab.Visible := false
	InstallationTab.Visible := false
	DetailsTab.Visible := false
	DetailsButton.Visible := false
	installerGUI.Show()
	return
}
hideInstaller(*) {
	installerGUI.Show()
}
showInstaller(*) {
	installerGUI.Show()
}
goToRequirements(*) {
	WelcomeTab.Visible := false
	RequirementsTab.Visible := true
}
goToInstallation(*) {
	RequirementsTab.Visible := false
	InstallationTab.Visible := true

	if (compilation_version > cur_compilation_ver) { ;The program was updated
		if libraries_updated = "yes" { ;The libraries were also updated
			DirDelete libraries_dir, 1
			DirCreate libraries_dir
		}
	}

	if !FileExist(ffmpeg_tool_path "\ffmpeg.exe") { ;Check for previous FFmpeg installations (just in case this installer failed previously)
		try {
			RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " downloadFFmpeg " -O " libraries_dir "\ffmpeg.zip", , "Hide"
				RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Expand-Archive -LiteralPath " libraries_dir "\ffmpeg.zip -DestinationPath " libraries_dir, , "Hide" ;unzip ffmpeg
				FileDelete libraries_dir "\ffmpeg.zip"
		} catch {
			MsgBox "Intentamos descargar la librería de FFmpeg desde " downloadFFmpeg "pero es posible que el servidor de descarga haya sido eliminado o movido.`n`nFavor de tomar una captura de pantalla de este mensaje y contactar al desarrollador de EasyGAN Media Restoration Tool (MauTech05 en GitHub)", "Ha ocurrido un error - EasyGAN Media Restoration Tool", "Iconx"
			ExitApp
		}
			LTdownloadFFMPEG.Visible := false
			RTdownloadFFMPEG.Visible := false
	}
			LTreadyFFMPEG.Visible := true
			RTreadyFFMPEG.Visible := true
			waitingGFPGAN.Visible := false
			LTdownloadGFPGAN.Visible := true
			RTdownloadGFPGAN.Visible := true
	if !FileExist(gfpgan_tool_path "\inference_gfpgan.py") { ;Check for previous GFPGAN installations (just in case this installer failed previously)
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " downloadGFPGAN " -O " libraries_dir "\gfpgan.zip", , "Hide" ;download gfpgan (python)
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Expand-Archive -LiteralPath " libraries_dir "\gfpgan.zip -DestinationPath " libraries_dir, , "Hide" ;unzip gfpgan
		FileDelete libraries_dir "\gfpgan.zip"
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " dlmodelsGFPGAN " -O " gfpgan_tool_path "\gfpgan\weights\GFPGANv1.4.pth", , "Hide" ;download v1.4 model
			LTdownloadGFPGAN.Visible := false
			RTdownloadGFPGAN.Visible := false
	}
			LTreadyGFPGAN.Visible := true
			RTreadyGFPGAN.Visible := true
			waitingESRGAN.Visible := false
			LTdownloadESRGAN.Visible := true
			RTdownloadESRGAN.Visible := true
	if !FileExist(esrgan_vulkan_path "\realesrgan-ncnn-vulkan.exe") { ;Check for previous Real-ESRGAN vulkan installations (just in case this installer failed previously)
		DirCreate esrgan_vulkan_path
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " dlESRGANvulkan " -O " esrgan_vulkan_path "\esrgan-vulkan.zip", , "Hide" ;download real-esrgan (vulkan)
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Expand-Archive -LiteralPath " esrgan_vulkan_path "\esrgan-vulkan.zip -DestinationPath " esrgan_vulkan_path, , "Hide" ;unzip real-esrgan (vulkan)
			FileDelete esrgan_vulkan_path "\esrgan-vulkan.zip"
		DirCreate input_frames_path
		DirCreate output_frames_path
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " dlVideo3ESRGAN " -O " esrgan_vulkan_path "\models\realesr-animevideov3.pth", , "Hide" ;download RealESRGAN-animevideov3 model (vulkan)
	}
	if !FileExist(esrgan_python_path "\inference_realesrgan.py") { ;Check for previous Real-ESRGAN python installations (just in case this installer failed previously)
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " dlESRGANpython " -O " libraries_dir "\esrgan-python.zip", , "Hide" ;download real-esrgan (python)
			RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Expand-Archive -LiteralPath " libraries_dir "\esrgan-python.zip -DestinationPath " libraries_dir, , "Hide" ;unzip real-esrgan
			FileDelete libraries_dir "\esrgan-python.zip"
		FileAppend "__version__ = '0.3.0'`n__gitsha__ = 'unknown'`nversion_info = (0, 3, 0)", esrgan_python_path "\realesrgan\version.py" ; RealESRGAN will not work if it does not have this file
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " dlX4pa6BESRGAN " -O " esrgan_python_path "\experiments\pretrained_models\RealESRGAN_x4plus_anime_6B.pth", , "Hide" ;download RealESRGAN_x4plus_anime_6B model
			FileCopy esrgan_python_path "\experiments\pretrained_models\RealESRGAN_x4plus_anime_6B.pth", esrgan_python_path "\weights" ;copy RealESRGAN_x4plus_anime_6B model
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " dlX4plusESRGAN " -O " esrgan_python_path "\weights\RealESRGAN_x4plus.pth", , "Hide" ;download RealESRGAN_x4plus model
	}
		LTdownloadESRGAN.Visible := false
		RTdownloadESRGAN.Visible := false
		LTreadyESRGAN.Visible := true
		RTreadyESRGAN.Visible := true
		DetailsButton.Visible := true
	HideTrayTip()
	TrayTip "Hemos terminado con la descarga e instalación de las librerías. Vuelve al instalador para finalizar el proceso.", "EasyGAN Media Restoration Tool", "Iconi"
}
goToDetails(*) {
	InstallationTab.Visible := false
	DetailsTab.Visible := true
}
getPython(*){
  if !FileExist(python_tool_path "\python.exe") {
	;Check if the installer was run by an administrator
	if !A_IsAdmin {
		try {
			restart4Python := MsgBox("Vamos a reiniciar este programa en Modo de Administrador. Una vez reiniciado, dirígete a la pestaña de 'Más Funciones' y vuelve a darle clic al botón de [Descargar e Instalar ahora].`n`nPara continuar haz clic en el botón de [SI].`nPara cerrar esta alerta haz clic en [NO]", "Permisos Requeridos - Asistente de Instalación de Python", 68)
			if restart4Python = "Yes"
				Run("*RunAs " (A_IsCompiled ? "" : A_AhkPath " ") Chr(34) A_ScriptFullPath Chr(34))
			else
				return
		} catch {
			MsgBox "No se han podido obtener permisos de administrador para este programa, por lo que no podemos continuar con la instalación y se cerrará el programa.", "Permisos Requeridos - Asistente de Instalación de Python", "Iconx"
			ExitApp
		}
	}

	;Try to download Python from the internet
	if !DirExist python_tool_path
		DirCreate python_tool_path
	HideTrayTip()
	TrayTip "Descargando requisito 1/3 (Descargando 8 MiB desde python.org)", "Asistente de Instalación de Python - EasyGAN M.R.T", "Iconi"
	try {
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl " downloadPython " -O " python_tool_path "\python.zip", , "Hide"
		RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Expand-Archive -LiteralPath " python_tool_path "\python.zip -DestinationPath " python_tool_path, , "Hide" ;unzip python
		FileDelete python_tool_path "\python.zip"
	} catch {
		MsgBox "Intentamos descargar la librería de Python desde " downloadPython "pero es posible que el servidor de descarga haya sido eliminado o movido.`n`nFavor de tomar una captura de pantalla de este mensaje y contactar al desarrollador de EasyGAN Media Restoration Tool (MauTech05 en GitHub)", "Ha ocurrido un error - EasyGAN Media Restoration Tool", "Iconx"
		ExitApp
	}

	;Add Python to the system PATH
	pythonScripts:= StrReplace(python_tool_path, "\Roaming", "")
	system_path := RegRead("HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment", "PATH") ;Read current values of PATH
	system_path .= ";" pythonScripts ";" pythonScripts "\Scripts\;"
	RegWrite(system_path, "REG_EXPAND_SZ", "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment", "PATH") ;Write edited values to PATH
	SendMessage(0x1A, 0, StrPtr("Environment"), , "ahk_id 0xFFFF")

	;Install Pip package manager (it will be used to install RealESRGAN's and GFPGAN's requirements)
	RunWait "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py", , "Hide"
	RunWait A_ComSpec " /c python get-pip.py", python_tool_path, "Hide"

	;Install GFPGAN and RealESRGAN requirements
	HideTrayTip()
	TrayTip "Descargando requisito 2/3 (Descargando adicionales de GFPGAN desde github.com)", "Asistente de Instalación de Python - EasyGAN M.R.T", "Iconi"
	RunWait A_ComSpec " /c pip install -r requirements.txt", gfpgan_tool_path, "Hide"
	HideTrayTip()
	TrayTip "Descargando requisito 3/3 (Descargando adicionales de RealESRGAN desde github.com)", "Asistente de Instalación de Python - EasyGAN M.R.T", "Iconi"
	RunWait A_ComSpec " /c pip install -r requirements.txt", esrgan_python_path, "Hide"

	;Mark requirement as fulfilled
	if !FileExist(compilation_installed) {
		HideTrayTip() ;Python was installed along with the program
		TrayTip "Hemos terminado con la instalación del intérprete de Python. Vuelve al programa para finalizar el proceso.", "EasyGAN Media Restoration Tool", "Iconi"
	} else {
		reload ;Python was installed from the "Más funciones" tab
	}
	try
		FileDelete python_installed
	FileAppend "Installed", python_installed
	try
		finishButton.Visible := true
  } else {
	MsgBox "Hemos detectado que ya habías instalado el intérprete de Python utilizando este programa (EasyGAN M.R.T).`n`nHaremos las correcciones necesarias y podrás seguir utilizando este programa.", "EasyGAN Media Restoration Tool", 64
	try
		FileDelete python_installed
	FileAppend "Installed", python_installed
	if FileExist(compilation_installed)
		reload
  }
}
gotPythonInstaller(*) {
	gotPythonAlready := MsgBox("Si eres un usuario más avanzado y ya cuentas con un intérprete de Python asegúrate de que la ruta a este se encuentre dentro del PATH en las variables de entorno del sistema.`n`nSi ya lo hiciste haz clic en el botón de [SI].`nPara cerrar esta alerta haz clic en [NO]", "Asistente de Instalación de Python - EasyGAN M.R.T", 68)
	if gotPythonAlready = "Yes" {
		;Install GFPGAN and RealESRGAN requirements
		HideTrayTip()
		TrayTip "Descargando requisito 1/2 (Descargando adicionales de GFPGAN desde github.com)", "Asistente de Instalación de Python - EasyGAN M.R.T", "Iconi"
		RunWait A_ComSpec " /c pip install -r requirements.txt", gfpgan_tool_path, "Hide"
		HideTrayTip()
		TrayTip "Descargando requisito 2/2 (Descargando adicionales de RealESRGAN desde github.com)", "Asistente de Instalación de Python - EasyGAN M.R.T", "Iconi"
		RunWait A_ComSpec " /c pip install -r requirements.txt", esrgan_python_path, "Hide"

		try
			FileDelete python_installed
		FileAppend "Externally Installed", python_installed
	}
	finishButton.Visible := true
}
gotPythonMain(*) {
	gotPythonAlready := MsgBox("Si eres un usuario más avanzado y ya cuentas con un intérprete de Python asegúrate de que la ruta a este se encuentre dentro del PATH en las variables de entorno del sistema.`n`nSi ya lo hiciste haz clic en el botón de [SI].`nPara cerrar esta alerta haz clic en [NO]", "Asistente de Instalación de Python - EasyGAN M.R.T", 68)
	if gotPythonAlready = "Yes" {
		;Install GFPGAN and RealESRGAN requirements
		HideTrayTip()
		TrayTip "Descargando requisito 1/2 (Descargando adicionales de GFPGAN desde github.com)", "Asistente de Instalación de Python - EasyGAN M.R.T", "Iconi"
		RunWait A_ComSpec " /c pip install -r requirements.txt", gfpgan_tool_path, "Hide"
		HideTrayTip()
		TrayTip "Descargando requisito 2/2 (Descargando adicionales de RealESRGAN desde github.com)", "Asistente de Instalación de Python - EasyGAN M.R.T", "Iconi"
		RunWait A_ComSpec " /c pip install -r requirements.txt", esrgan_python_path, "Hide"

		try
			FileDelete python_installed
		FileAppend "Externally Installed", python_installed
		reload
	}
}
laterPython(*) {
	try
		FileDelete python_installed
	FileAppend "Not Installed", python_installed
	finishButton.Visible := true
}
finishInstallation(*) {
	if !FileExist(compilation_installed) ;The program did not find a previous self installation
		FileAppend compilation_version, compilation_installed
		FileAppend "Dark", guitheme_set
	if (compilation_version > cur_compilation_ver) { ;The program was updated
		FileDelete compilation_installed
		FileAppend compilation_version, compilation_installed
	}

	if A_IsCompiled
		shortcutSource := "EasyGAN_release.exe"
	else
		shortcutSource := "EasyGAN_MediaRestorationTool.ahk"
	FileCreateShortcut installation_base_dir "\" shortcutSource, A_ProgramsCommon "\EasyGAN Media Restoration Tool.lnk", , , "Restaurador de medios basado en GAN", script_icon
	if desktopShortcut.Value = 1
		FileCreateShortcut installation_base_dir "\" shortcutSource, A_Desktop "\EasyGAN Media Restoration Tool.lnk", , , "Restaurador de medios basado en GAN", script_icon
	Reload
}


;====== GRAPHICAL USER INTERFACE ======
A_IconTip := "EasyGAN Media Restoration Tool - " compilation
TraySetIcon(script_icon)
Tray := A_TrayMenu
Tray.delete
Tray.Add("Cerrar", GuiEscape)

try {
	global GUI_Theme := FileRead(guitheme_set) ;Set theme and fix it in case that file does not exist
} catch {
	try
		FileDelete guitheme_set
	FileAppend "Dark", guitheme_set
	global GUI_Theme := FileRead(guitheme_set)
}
ganRestorerMenu()

ganRestorerMenu() {
	global mediaType := ""
	global results_folder := ""
	global nextTask := ""
	global restorerGUI := Gui()
	restorerGUI.Title := "EasyGAN Media Restoration Tool by MauTech05"
	restorerGUI.Opt("-Caption +Border")
	restorerGUI.OnEvent("Close", GuiEscape)
	restorerGUI.OnEvent("Escape", GuiEscape)
	OnMessage(0x0201, WM_LBUTTONDOWN)
	if GUI_Theme = "Light" {
		global buttons_dir := light_buttons
		restorerGUI.BackColor := "f0f2f5"
		textColor := "000000"
	} else {
		global buttons_dir := dark_buttons
		restorerGUI.BackColor := "191919"
		textColor := "ffffff"
	}
	restorerGUI.Add("Picture", "x15 y6 w30 h-1", script_icon)
	restorerGUI.SetFont("s16 w900 c" textColor, "Roboto")
	restorerGUI.Add("Text", "x60 y7", "EasyGAN M.R.T")
	restorerGUI.SetFont("s12 w900 c5f656d", "Roboto")
	restorerGUI.Add("Text", "x240 y11", "v" compilation)
	botonMinimizarGUI := restorerGUI.Add("Picture", "x350 y10 w15 h-1", buttons_dir "\button.png")
		botonMinimizarGUI.OnEvent("Click", GuiMinimize)
	botonCerrarGUI := restorerGUI.Add("Picture", "x380 y10 w15 h-1", buttons_dir "\button_x.png")
		botonCerrarGUI.OnEvent("Click", GuiEscape)
	restorerGUI.SetFont("s9 w400 c" textColor, "Open Sans")

	global guiTabs := restorerGUI.Add("Tab3", "x15 y50 w420 h350 section 0x182", ["Inicio","Más Funciones","Acerca de"])
	;========== INICIO ==========
		restorerGUI.Add("Picture", "x15 y75 h325 w380", buttons_dir "\tabs_border.png")
		mainTab:= restorerGUI.Add("Picture", "xs ys w-1 h25", buttons_dir "\maintab_inicio.png")
		functionsTab:= restorerGUI.Add("Picture", "xs+62 ys+5 w-1 h20", buttons_dir "\tab_funciones.png")
			functionsTab.OnEvent("Click", goToFunctions)
		aboutTab:= restorerGUI.Add("Picture", "xs+204 ys+5 w-1 h20", buttons_dir "\tab_acerca.png")
			aboutTab.OnEvent("Click", goToAbout)

		;Tipo de archivo a restaurar
		restorerGUI.SetFont("s11 w600 c33c481", "Roboto")
		restorerGUI.Add("Text", "x25 y90 h60 w340 section", "📄")
		restorerGUI.SetFont("s11 w600 c" textColor, "Roboto")
		restorerGUI.Add("Text", "xs+22 ys h60 w340", "Tipo de archivo a restaurar")
		restorerGUI.SetFont("s9 w400 c" textColor, "Open Sans")
		facesRadio := restorerGUI.Add("Radio", "xs+10 ys+25", "Imágenes (Rostros)")
			facesRadio.OnEvent("Click", Faces)
		generalRadio :=restorerGUI.Add("Radio", "xs+145 ys+25", "Imágenes (General)")
			generalRadio.OnEvent("Click", General)
		videosRadio :=restorerGUI.Add("Radio", "xs+10 ys+45", "Videos (Anime, Caricaturas)")
			videosRadio.OnEvent("Click", Videos)

		;Modificadores
		restorerGUI.SetFont("s11 w600 cca64ea", "Roboto")
		restorerGUI.Add("Text", "x25 ys+80 h48 w340 section", "⚙️")
		restorerGUI.SetFont("s11 w600 c" textColor, "Roboto")
		restorerGUI.Add("Text", "xs+22 ys h48 w340", "Modificadores")
		restorerGUI.SetFont("s9 w400 c" textColor, "Open Sans")
		global modsPlaceholder := restorerGUI.Add("Text", "xs+10 ys+22 h20 w320", "Primero selecciona un tipo de archivo a restaurar")
		global videosOutscaleTip := restorerGUI.Add("Text", "xs+10 ys+22 h20", "Multiplicador de resolución:") ;For videos
			videosOutscaleTip.Visible := false
		global videosOutscale := restorerGUI.Add("DropDownList", "xs+160 ys+20 w50", ["2","3","4"])
			videosOutscale.Choose(1)
			videosOutscale.Visible := false
		global facesModelsTip := restorerGUI.Add("Text", "xs+10 ys+22 h20", "Versión del Modelo:") ;For faces
			facesModelsTip.Visible := false
		global facesModels := restorerGUI.Add("DropDownList", "xs+125 ys+20 w50", ["1","1.2","1.3","1.4"])
			facesModels.OnEvent("Change", facesModelselector)
			facesModels.Choose(4)
			facesModels.Visible := false
		global generalFaceEnhancement := restorerGUI.Add("CheckBox", "xs+10 ys+22", "Mejorar rasgos faciales") ;For general
			generalFaceEnhancement.Visible := false

		;Guardar archivos restaurados en
		restorerGUI.SetFont("s11 w600 cfcd53f", "Roboto")
		restorerGUI.Add("Text", "x25 ys+60 h40 w340 section", "📁")
		restorerGUI.SetFont("s11 w600 c" textColor, "Roboto")
		restorerGUI.Add("Text", "xs+22 ys h40 w340", "Guardar archivos restaurados en")
		restorerGUI.SetFont("s9 w400 c" textColor, "Open Sans")
		defaultDirRadio := restorerGUI.Add("Radio", "xs+10 ys+20", "Medios Restaurados")
			defaultDirRadio.OnEvent("Click", OutputEasyGAN)
		desktopDirRadio := restorerGUI.Add("Radio", "xs+145 ys+20", "Escritorio")
			desktopDirRadio.OnEvent("Click", OutputDesktop)
		customDirRadio := restorerGUI.Add("Radio", "xs+225 ys+20", "Otro (seleccionar)")
			customDirRadio.OnEvent("Click", OutputCustom)

		;Al terminar hacer
		restorerGUI.SetFont("s11 w600 c26c9fc", "Roboto")
		restorerGUI.Add("Text", "x25 ys+60 h48 w340 section", "💻")
		restorerGUI.SetFont("s11 w600 c" textColor, "Roboto")
		restorerGUI.Add("Text", "xs+22 ys h48 w340", "Al terminar de restaurar los archivos")
		restorerGUI.SetFont("s9 w400 c" textColor, "Open Sans")
		global guiDropdown := restorerGUI.Add("DropDownList", "xs+10 ys+25 w170", [" Volver al menú principal","Cerrar y ver resultados","Cerrar el programa","Suspender la computadora","Apagar la computadora"])
			guiDropdown.Choose(2)
			guiDropdown.OnEvent("Change", nextTaskSelector)

		restoreButton := restorerGUI.Add("Picture", "xs ys+65 w360 h-1", buttons_dir "\button_restaurar.png")
			restoreButton.OnEvent("Click", startButton)


	;========== MAS FUNCIONES ==========
	guiTabs.UseTab(2)
		restorerGUI.Add("Text", "x15 y50 w420 h400 section")
		restorerGUI.Add("Picture", "x15 y75 h325 w380", buttons_dir "\tabs_border.png")
		mainTab:= restorerGUI.Add("Picture", "xs ys+5 w-1 h20", buttons_dir "\tab_inicio.png")
			mainTab.OnEvent("Click", goToMain)
		functionsTab:= restorerGUI.Add("Picture", "xs+62 ys w-1 h25", buttons_dir "\maintab_funciones.png")
		aboutTab:= restorerGUI.Add("Picture", "xs+204 ys+5 w-1 h20", buttons_dir "\tab_acerca.png")
			aboutTab.OnEvent("Click", goToAbout)

		restorerGUI.SetFont("s11 w600 c" textColor, "Roboto")
		restorerGUI.Add("Text", "x25 y90 h40 w340 section", "Color de la Interfaz")
		restorerGUI.SetFont("s9 w400 c" textColor, "Open Sans")
			lightModeRadio := restorerGUI.Add("Radio", "xs+10 ys+20", "Claro")
				lightModeRadio.OnEvent("Click", lightMode)
			darkModeRadio :=restorerGUI.Add("Radio", "xs+140 ys+20", "Oscuro")
				darkModeRadio.OnEvent("Click", darkMode)

		restorerGUI.SetFont("s11 w600 c" textColor, "Roboto")
		restorerGUI.Add("Text", "x25 ys+50 h55 w340 section", "Abrir Carpetas/Ubicaciones frecuentes")
			installationDirButton := restorerGUI.Add("Picture", "xs+10 ys+20 w-1 h21", buttons_dir "\button_instalacion-de-easygan.png")
				installationDirButton.OnEvent("Click", openInstallationDir)
			restoredDirButton := restorerGUI.Add("Picture", "xs+200 ys+20 w-1 h21", buttons_dir "\button_medios-restaurados.png")
				restoredDirButton.OnEvent("Click", openRestoredMediaDir)

		if Python = "Not Installed" && !FileExist(python_tool_path "\python.exe") {
			restorerGUI.Add("Text", "x25 ys+65 h48 w340 section", "Python")
			restorerGUI.SetFont("s9 w400 c" textColor, "Open Sans")
			restorerGUI.Add("Text", "xs+15 ys+20 h48 w340 ", "Aún no se ha instalado el intérprete de Python para Windows©. Algunas características de este programa podrían verse limitadas.")
			dlPythonButton := restorerGUI.Add("Picture", "xs+15 ys+70 w-1 h21", buttons_dir "\button_descargar-e-instalar-ahora.png")
				dlPythonButton.OnEvent("Click", getPython)
			rdPythonButton := restorerGUI.Add("Picture", "xs+15 ys+100 w-1 h21", buttons_dir "\button_ya-tengo-python-instalado.png")
				rdPythonButton.OnEvent("Click", gotPythonMain)
		}

	;========== ACERCA DE ==========
	guiTabs.UseTab(3)
		restorerGUI.Add("Text", "x15 y50 w420 h340 section")
		restorerGUI.Add("Picture", "x15 y75 h325 w380", buttons_dir "\tabs_border.png")
		mainTab:= restorerGUI.Add("Picture", "xs ys+5 w-1 h20", buttons_dir "\tab_inicio.png")
			mainTab.OnEvent("Click", goToMain)
		functionsTab:= restorerGUI.Add("Picture", "xs+62 ys+5 w-1 h20", buttons_dir "\tab_funciones.png")
			functionsTab.OnEvent("Click", goToFunctions)
		aboutTab:= restorerGUI.Add("Picture", "xs+204 ys w-1 h25", buttons_dir "\maintab_acerca.png")

		restorerGUI.SetFont("s9 w400 c" textColor, "Open Sans")
		restorerGUI.Add("Link", "xs+15 ys+40 w350 section", 'La interfaz gráfica fue realizada por <a href="https://github.com/mautech05">MauTech05</a>')
		restorerGUI.Add("Text", "xs w350", "Los algoritmos, modelos, versiones o cualquier otro recurso ajeno a la Interfaz Gráfica (GUI) son propiedad intelectual de sus creadores.")
		restorerGUI.Add("Link", "xs w350", 'El ícono <a href="https://www.flaticon.com/free-icons/restore">Restore</a> utilizado en este programa fue creado por el usuario "Flat-icons-com" y subido a la plataforma de Flaticon.')
		restorerGUI.Add("Link", "xs w350", 'GFPGAN (utilizado en Rostros) se encuentra publicado bajo la licencia "Apache License Version 2.0". Consulta más información en el <a href="https://github.com/TencentARC/GFPGAN">Github de GFPGAN</a>')
		restorerGUI.Add("Link", "xs w350", 'RealESRGAN (utilizado en General y Videos) se encuentra publicado bajo la licencia "BSD 3-Clause License". Consulta más información en el <a href="https://github.com/xinntao/Real-ESRGAN">Github de RealESRGAN</a>')
		restorerGUI.Add("Link", "xs w350", 'Los archivos binarios para Windows© de FFmpeg® (utilizado en Videos) se encuentran publicados bajo la licencia "MIT License | Copyright 2020-2021 BtbN". Se utilizaron las builds de yt-dlp por su compatibilidad con sistemas x86 (32 bits). Consulta más información en el <a href="https://github.com/yt-dlp/FFmpeg-Builds">Github de yt-dlp FFmpeg-builds</a> y el <a href="https://github.com/BtbN/FFmpeg-Builds">Github de BtbN FFmpeg-Builds</a>')

	restorerGUI.Show("w410 h420")
	return
}

WM_LBUTTONDOWN(*) {
	Try PostMessage(0xA1, 2, , , "A")
}
GuiEscape(*) {
	GuiClose:
		ExitApp()
}
GuiMinimize(*) {
	restorerGUI.Minimize()
}
HideTrayTip(*) {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        A_IconHidden := true
        Sleep 200  ; It may be necessary to adjust this sleep.
        A_IconHidden := false
    }
}
goToMain(*) {
	guiTabs.Choose(1)
}
goToFunctions(*) {
	guiTabs.Choose(2)
}
goToAbout(*) {
	guiTabs.Choose(3)
}

Faces(*) {
	global mediaType := "Faces"
	global files := FileSelect("M3", , "Selecciona los archivos de medios a restaurar", "Rostros (*.jpg; *.jpeg; *.png; *.bmp; *.tiff; *.tif; *.gif; *.webp)")
	modsPlaceholder.Visible := false
	facesModelsTip.Visible := true
	facesModels.Visible := true
	generalFaceEnhancement.Visible := false
	videosOutscaleTip.Visible := false
	videosOutscale.Visible := false
}

General(*) {
	global mediaType := "General"
	global files := FileSelect("M3", , "Selecciona los archivos de medios a restaurar", "Imágenes (*.jpg; *.jpeg; *.png; *.bmp; *.tiff; *.tif; *.gif; *.webp)")
	modsPlaceholder.Visible := false
	facesModelsTip.Visible := false
	facesModels.Visible := false
	generalFaceEnhancement.Visible := true
	videosOutscaleTip.Visible := false
	videosOutscale.Visible := false
}

Videos(*) {
	global mediaType := "Videos"
	global files := FileSelect("M3", , "Selecciona los archivos de medios a restaurar", "Videos (*.mp4; *.webp;)")
	modsPlaceholder.Visible := false
	facesModelsTip.Visible := false
	facesModels.Visible := false
	generalFaceEnhancement.Visible := false
	videosOutscaleTip.Visible := true
	videosOutscale.Visible := true
}

facesModelselector(*) {
	MsgBox "Este programa viene con el modelo v1.4 instalado por defecto. Toma en cuenta que si es la primera vez que seleccionas otra versión del modelo deberás esperar a que ésta se descargue automáticamente y luego se procesará tu imagen.", "Rostros - EasyGAN Media Restoration Tool", "Iconi"
}

OutputEasyGAN(*) {
	global results_folder := restored_media_dir
}

OutputDesktop(*) {
	global results_folder := A_Desktop
}

OutputCustom(*) {
	global results_folder := DirSelect(, 3, "Seleccione una carpeta donde se guardarán los medios Restaurados")
}

nextTaskSelector(*) {
	global nextTask := guiDropdown.Value
}

onFinishDo() {
	HideTrayTip()
	TrayTip "Tus archivos están listos :D", "EasyGAN Media Restoration Tool", "Iconi"
	Sleep 1000
	Switch nextTask {
		case "1": ganRestorerMenu()
		case "2":
			Run results_folder
			ExitApp
		case "3": ExitApp
		case "4": DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 1, "Int", 0)
		case "5": Shutdown 5 ; 1 = Shutdown + 4 = Force
		default:
			Run results_folder
			ExitApp
	}
}

startButton(*) {
	if mediaType = "" && results_folder = "" {
		MsgBox "Es necesario elegir un tipo de archivo a restaurar y la carpeta en la que se guardarán.", "Ha ocurrido un error - EasyGAN Media Restoration Tool", "Iconx"
		return
	}
	if mediaType = "" {
		MsgBox "Es necesario elegir un tipo de archivo a restaurar.", "Ha ocurrido un error - EasyGAN Media Restoration Tool", "Iconx"
		return
	}
	if results_folder = "" {
		MsgBox "Es necesario elegir una carpeta donde se guardarán los medios Restaurados.", "Ha ocurrido un error - EasyGAN Media Restoration Tool", "Iconx"
		return
	}

	if files.Length = 0 {
		MsgBox "Es necesario elegir al menos un archivo para restaurar. Para seleccionarlo vuelve a presionar sobre la casilla del tipo de archivo y se abrirá el menú de selección.", "Ha ocurrido un error - EasyGAN Media Restoration Tool", "Iconx"
		return
	} else {
		restorerGUI.Hide()
		Switch mediaType {
			case "Faces": facesRestoration()
			case "General": generalRestoration()
			case "Videos": videoRestoration()
		}
	}
}

lightMode(*) {
	FileDelete guitheme_set
	FileAppend "Light", guitheme_set
	Reload
}
darkMode(*) {
	FileDelete guitheme_set
	FileAppend "Dark", guitheme_set
	Reload
}
openInstallationDir(*) {
	Run installation_base_dir
}
openRestoredMediaDir(*) {
	Run restored_media_dir
}


;====== Backend Functions ======
;Using GFP-GAN for Images (Faces)
facesRestoration() {
	if Python = "Not Installed" {
		getPythonNow := MsgBox("Para utilizar esta función es necesario descargar algún intérprete de Python para Windows©.`n¿Quieres descargarlo ahora mismo?", "Python requerido - EasyGAN Media Restoration Tool", "52")
		if getPythonNow = "Yes"
			getPython()
		else
			ganRestorerMenu()

	} else {
		for FileName in files
		{
			HideTrayTip()
			TrayTip "Procesando archivo de Rostros " A_Index " de " files.Length, "EasyGAN Media Restoration Tool", "Iconi"
			SplitPath FileName, &name, &dir, &ext, &file_name_noext, &drive
			original_file_name := FileName
			if HasSpecialChars(FileName, "patch") {
				FileName := patched_file_path
				file_name_noext := patched_file_name
			}

			gfpgan_beginning_path := results_folder "\GFPGAN_" A_NowUTC
			cmd_command := Format("python inference_gfpgan.py -i {1}{3}{2} -o {1}{4}{2} -v {5} -s 2 --ext png --bg_upsampler realesrgan", '"', '"', FileName, gfpgan_beginning_path, facesModels.Text)
			RunWait A_ComSpec " /c " cmd_command, gfpgan_tool_path, "Hide"

			FileMove gfpgan_beginning_path "\restored_imgs\" file_name_noext ".png", results_folder "\Faces_" A_NowUTC ".png" ;Move restored file from tool's default output folder to custom results folder
			DirDelete gfpgan_beginning_path, 1
			if HasSpecialChars(original_file_name, "verify")
				DirDelete patched_folder_path, 1
		}
		onFinishDo()
	}
}


;Using Real-ESRGAN for Images (General)
generalRestoration() {
	Switch generalFaceEnhancement.Value {
		case "0": generalFaceEH := ""
		case "1": generalFaceEH := " --face_enhance"
	}
	for FileName in files
	{
		HideTrayTip()
		TrayTip "Procesando archivo de Imágenes en General " A_Index " de " files.Length, "EasyGAN Media Restoration Tool", "Iconi"
		SplitPath FileName, &name, &dir, &ext, &file_name_noext, &drive
		original_file_name := FileName
		if HasSpecialChars(FileName, "patch") {
			FileName := patched_file_path
			file_name_noext := patched_file_name
		}

		if Python = "Not Installed" {
			cmd_command := Format("realesrgan-ncnn-vulkan.exe -i {1}{3}{2} -o {1}{4}\General_{5}.png{2} -n realesrgan-x4plus-anime -f png -s 4", '"', '"', FileName, results_folder, A_NowUTC)
			RunWait A_ComSpec " /c " cmd_command, esrgan_vulkan_path, "Hide"
		} else {
			cmd_command := Format("python inference_realesrgan.py --input {1}{3}{2} --output {1}{4}{2} --model_name RealESRGAN_x4plus_anime_6B --ext png --outscale 4 --fp32 --alpha_upsampler realesrgan{5}", '"', '"', FileName, results_folder, generalFaceEH)
			RunWait A_ComSpec " /c " cmd_command, esrgan_python_path, "Hide"
			FileMove results_folder "\" file_name_noext "_out.png", results_folder "\General_" A_NowUTC ".png" ;Rename upscaled file to include mediaType and export timestamp
		}
		if HasSpecialChars(original_file_name, "verify")
			DirDelete patched_folder_path, 1
	}
	onFinishDo()
}


;Using Real-ESRGAN for Videos (Anime)
videoRestoration() {
	for FileName in files
	{
		framerate_command := Format("cd /d {1}{3}{2} && ffmpeg -i {1}{4}{2} 2> {1}{5}{2}", '"', '"', ffmpeg_tool_path, FileName, esrgan_video_log) ;Use ffmpeg to get the most details out of the media file
		RunWait A_ComSpec " /c " framerate_command, , "Hide"
		video_log := StrReplace(FileRead(esrgan_video_log), " ", "")
		RegExMatch(video_log, "\d+(?:\.\d+)?(?=fps)", &framerate) ;get framerate
		RegExMatch(video_log, "\b\d{3,4}x\d{3,4}\b", &resolution) ;get resolution
			res_width := RegExReplace(resolution[], "(\d+)x\d+" , "$1")
			res_height := RegExReplace(resolution[], "\d+x(\d+)" , "$1")
		RegExMatch(video_log, "(\d+:\d+:\d+\.\d+)", &duration) ;get duration
		upscaling_factor := videosOutscale.Text

		ConfirmVideoUpscaling := MsgBox("Estás apunto de reescalar un video con:`nResolución: " resolution[] "`nCuadros por segundo (fps): " framerate[0] "`nDuración (hh:mm:ss.ms): " duration[0] "`n`nEl archivo resultante tendrá una resolución de " res_width*upscaling_factor "x" res_height*upscaling_factor " (" upscaling_factor " veces más grande) y podría tomar mucho tiempo para procesarse (esto depende enteramente de tu Tarjeta Gráfica GPU).`n`nSi tu video ya tiene una buena calidad y resolución (720p en adelante) es probable que no veas mejoría. ¿ESTAS SEGURO DE QUE QUIERES REESCALAR ESTE VIDEO?", "¿Deseas continuar? - EasyGAN Media Restoration Tool", 289)
		if ConfirmVideoUpscaling = "Ok" {
			HideTrayTip()
			TrayTip "Procesando archivo de Video " A_Index " de " files.Length, "EasyGAN Media Restoration Tool", "Iconi"
			extframes_command := Format("ffmpeg -i {1}{3}{2} -qscale:v 1 -qmin 1 -qmax 1 -vsync 0 {1}{4}\frame%08d.png{2}", '"', '"', FileName, input_frames_path) ;Use ffmpeg to extract frames from video (saved as png)
			RunWait A_ComSpec " /c " extframes_command, ffmpeg_tool_path, "Hide"

			cmd_command := Format("realesrgan-ncnn-vulkan.exe -i {1}{3}{2} -o {1}{4}{2} -n realesr-animevideov3 -s {5} -f jpg", '"', '"', input_frames_path, output_frames_path, upscaling_factor) ;Inference with Real-ESRGAN executable file
			;python inference_realesrgan_video.py --input "D:\Videos\bakugan-masquerade-se-revela.mp4" --output "D:\Tools\Archivos Salida\Medios Restaurados\prueba" --ffmpeg_bin "D:\Program Files\MPV Player\" --fps 15 --ext png --model_name realesr-animevideov3 --outscale 4 --face_enhance --fp32 --extract_frame_first --num_process_per_gpu 2
			RunWait A_ComSpec " /c " cmd_command, esrgan_vulkan_path, "Hide"

			video_output_path := results_folder "\Video_" A_NowUTC ".mp4"
			merge_command := Format("ffmpeg -r {1}{3}{2} -i {1}{4}\frame%08d.jpg{2} -i {1}{5}{2} -map 0:v:0 -map 1:a:0 -c:a copy -c:v libx264 -r {1}{3}{2} -pix_fmt yuv420p {1}{6}{2}", '"', '"', framerate[0], output_frames_path, FileName, video_output_path)
			RunWait A_ComSpec " /c " merge_command, ffmpeg_tool_path, "Hide" ;Merge improved frames with audio from original file
			FileDelete input_frames_path "\*" ;Delete temporary frames images
			FileDelete output_frames_path "\*" ;Delete temporary frames images
		} else {
			ganRestorerMenu()
			return
		}
	}
	onFinishDo()
}


;THERE IS A PROBLEM WHERE PYTHON CANNOT OPEN NOR READ A FILE WHOSE PATH CONTAINS SPECIAL CHARS
HasSpecialChars(input_string, do) {
    for i, char in StrSplit(input_string, "") {
        if (Ord(char) > 127) {
			if do = "patch" {
				DirCreate patched_folder_path
				global patched_file_name := A_NowUTC
				global patched_file_path := patched_folder_path "\" patched_file_name ".png"
				FileCopy input_string, patched_file_path
			}
            return true
        }
    }
    return false
}