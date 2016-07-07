#!/bin/bash
ocpath=$1
htuser=$2

### Copiar el tema hispacloud

cp themes/hispacloud ${ocpath}/themes
chown -R ${htuser}:${htuser} ${ocpath}/themes/hispacloud

### Integrar la documentación en español en el portal

cp settings/templates/help.php ${ocpath}/settings/templates/help.php
chown ${htuser}:${htuser} ${ocpath}/settings/templates/help.php
cp core/doc/user/index.html ${ocpath}/core/doc/user/index.html
chown ${htuser}:${htuser} ${ocpath}/core/doc/user/index.html

### En la sección Personal ocultar las apps ppara móviles y las opciones para compartir

cp settings/templates/personal.php ${ocpath}/settings/templates/personal.php
chown ${htuser}:${htuser} ${ocpath}/settings/templates/personal.php
cp themes/hispacloud/apps/files_sharing/templates/settings-personal.php ${ocpath}/themes/hispacloud/apps/files_sharing/templates/settings-personal.php
chown ${htuser}:${htuser} ${ocpath}/themes/hispacloud/apps/files_sharing/templates/settings-personal.php
cp core/img/desktopapp.svg ${ocpath}/core/img/desktopapp.svg
chown ${htuser}:${htuser} ${ocpath}/core/img/desktopapp.svg

### Traducir al español el nombre de los archivos y carpetas iniciales
### /var/www/owncloud/core/skeleton/

mv ${ocpath}/core/skeleton/Documents/Example.odt ${ocpath}/core/skeleton/Documents/Ejemplo.odt
mv ${ocpath}/core/skeleton/Documents ${ocpath}/core/skeleton/Documentos
mv ${ocpath}/core/skeleton/Photos ${ocpath}/core/skeleton/Fotos

### Eliminar la cabecera que sugiere descargar la app de iOS

sed -i 's/<meta name="apple-itunes-app" content="app-id=<?php p($theme->getiTunesAppId()); ?>">//g' ${ocpath}/core/templates/layout.guest.php
sed -i 's/<meta name="apple-itunes-app" content="app-id=<?php p($theme->getiTunesAppId()); ?>">//g' ${ocpath}/core/templates/layout.user.php
