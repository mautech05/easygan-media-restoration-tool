[**EasyGAN Media Restoration Tool**](https://github.com/mautech05/easygan-media-restoration-tool) es una interfaz gráfica basada en [Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN) que permite restaurar y reescalar archivos multimedia (imágenes y video) de manera rápida y sencilla.

Si quieres ver cómo funciona y qué resultados puedes obtener, te invito a revisar la sección de [Demostración de funcionamiento](https://github.com/mautech05/easygan-media-restoration-tool/blob/main/demos.md) y el [GitHub de Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)

Este proyecto fue realizado mayoritariamente en scripting de [AutoHotKey v2](https://github.com/AutoHotkey/AutoHotkey). Te invito a que revises cada línea de código y que instales este programa sólo si estás de acuerdo con el contenido y las prácticas que realiza.

![GitHub All Releases](https://img.shields.io/badge/version-0.1.2-blue)
![GitHub All Releases](https://img.shields.io/github/downloads/mautech05/easygan-media-restoration-tool/total)

## Capturas de Pantalla
![Menú](https://github.com/mautech05/easygan-media-restoration-tool/blob/main/preview.png)

## Instalación
⚠️⚠️Es importante mencionar que este programa **requiere** del uso de **AutoHotKey v2** para funcionar. No obstante, también ofrecemos una versión ya compilada para aquellos que no desean o no pueden instalar AutoHotKey. Dicha versión compilada [no está firmada digitalmente](https://www.redeszone.net/2018/04/21/comprobar-firmas-digitales-programas-windows/) (la licencia cuesta casi 500 euros) por lo que Windows tratará de evitar su ejecución.
- Si **NO** planeas instalar AutoHotKey (**❌ NO RECOMENDADO**) avanza hasta [esta sección](#sin-autohotkey-instalado) de la guía de instalación.
- Si estás pensando en instalar este intérprete (**✅ RECOMENDADO**) de scripts sigue [este link](https://www.autohotkey.com/download/ahk-v2.exe) para descargarlo en tu computador y, posteriormente, avanza hasta [esta sección](#con-autohotkey-instalado).

### CON AutoHotKey instalado
Si tienes [GIT](https://git-scm.com/) instalado en tu ordenador:
```bash
  git clone https://github.com/mautech05/easygan-media-restoration-tool
```

En caso de que no tengas [GIT](https://git-scm.com/) instalado:
1. 📦 Haz clic sobre [este enlace](https://github.com/mautech05/easygan-media-restoration-tool/archive/refs/heads/main.zip) para comenzar la descarga. Una vez que se haya terminado, coloca el archivo comprimido *.zip* donde prefieras.
2. 🔓 Utilizando el software de tu preferencia, descomprime el contenido del ZIP, asegurándote de marcar la opción correspondiente para *extraer aquí*.
3. 📁 Esto te debió haber generado una carpeta con nombre **easygan-media-restoration-tool-main**. Si es así, entonces ya puedes eliminar el archivo comprimido *.zip* pues ya no lo necesitaremos más.
4. 📄 Abre la carpeta de  **easygan-media-restoration-tool-main** que extraíste previamente. Una vez allí, ubica el archivo llamado **INSTALADOR.ahk** y haz doble clic izquierdo sobre él para ejecutarlo.
5. ⚙️ Te mostrará una notificación que indica que se están descargando algunas [librerías](#reconocimientos) desde Internet para que el programa pueda funcionar. La duración de este paso dependerá en buena medida del ancho de banda (mbps) que tengas contratado en tu paquete de internet.
6. 📲 Cuando se haya terminado la descarga de estas librerías, el instalador te preguntará si deseas crear un acceso directo en el escritorio. De igual forma.
7. 🐍 Dentro de la misma pantalla te estará apareciendo un texto preguntándote si deseas instalar el [Intérprete de Python recomendado](https://www.python.org/downloads/release/python-31011/) y tres botones de acción. Selecciona el que prefieras.
8. 😁 ¡Todo Listo! El programa se reiniciará automáticamente y podrás comenzar a usarlo.

### SIN AutoHotKey instalado (**❌ NO RECOMENDADO**)
1. 🌐 Haz clic sobre [este enlace](https://github.com/mautech05/easygan-media-restoration-tool/releases) para dirigirte a la página de las *releases*.
2. 👀 Ubica el artículo/bloque/*release* que, a la derecha del título, tenga una etiqueta verde con el texto **latest**.
3. ⚙️ Haz clic izquierdo sobre el texto que dice *Assets* para desplegar el menú colapsable. Te mostrará tres enlaces a varios archivos, pero el que nos interesa es el que dice **easygan_release.zip**.
4. 📦 Presiona clic izquierdo sobre este para comenzar la descarga. Una vez que se haya terminado, coloca el archivo comprimido *.zip* donde prefieras.
5. 🔓 Utilizando el software de tu preferencia, descomprime el contenido del ZIP, asegurándote de marcar la opción correspondiente para *extraer aquí*.
6. 📁 Esto te debió haber generado una carpeta con nombre **easygan_release**. Si es así, entonces ya puedes eliminar el archivo comprimido *.zip* pues ya no lo necesitaremos más.
7. 📄 Abre la carpeta de  **easygan_release** que extraíste previamente. Una vez allí, ubica el archivo llamado **EasyGAN_release.exe** y haz doble clic izquierdo sobre él para ejecutarlo.
- Si te aparece la ventana azul de *[SmartScreen](https://www.adslzone.net/esenciales/windows/smartscreen-windows/)* es necesario que hagas clic izquierdo sobre el texto de "Más Información" y luego otro clic izquierdo sobre el texto de "Ejecutar de todos modos"
8. ⌛ Espera unos segundos. El programa creará tres carpetas y posteriormente abrirá la interfaz.
9. ✅ ¡Todo Listo! Ya puedes comenzar a utilizar el programa. 
Recuerda que la próxima ocasión que abras el **EasyGAN_release.exe** no tendrás que esperar pues ya cuentas con las tres carpetas esenciales para el funcionamiento de EasyGAN Media Restoration Tool.

## Sumas de Verificación
Puedes utilizar estos *checksum* para verificar que la descarga no ha sido alterada y/o infectada por un atacante. En caso de que no tengas una herramienta para esta tarea te recomendamos [Quick Checksum Tool](https://github.com/mautech05/quick-checksum-tool).

| NOMBRE DE ARCHIVO               | SHA256                                                           | MD5                              |
|---------------------------------|------------------------------------------------------------------|----------------------------------|
| [EasyGAN_MediaRestorationTool.ahk](https://github.com/mautech05/easygan-media-restoration-tool/blob/main/EasyGAN_MediaRestorationTool.ahk) | 3b3116541080ff2e40d5a2a903c67cabf69b6b27ffff94c609e256bc12fb6d29 | 71498a9bc0fb7aa849cbdcd0d477d82b |

## Reconocimientos
 - [GFPGAN](https://github.com/TencentARC/GFPGAN): utilizado para restaurar rostros de manera natural y con buena calidad.
 - [Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN): utilizado para restaurar y reescalar todo tipo de imágenes y videos.
 - [FFmpeg](https://github.com/BtbN/FFmpeg-Builds/releases/): utilizado para obtener detalles acerca de los videos, extraer sus fotogramas y volver a unirlos.