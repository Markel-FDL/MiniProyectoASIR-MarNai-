#!/bin/bash
		apt-get update
		apt-get install -y apache2

# crear archibo .html para el error 404
sudo touch /var/www/html/marnai/error404.html 
# escribir en el archibo
echo "<html>
  <head>
    <body>
	  <h1>Error 404. No existe el recurso solicitado</h1>
	</body>
  </head>
</html>" >> /var/www/html/marnai/error404.html
# ir a 000-default.conf y poner el error404.html
sudo sed -i '12a\ ErrorDocument 404 /error404.html' /etc/apache2/sites-available/000-default.conf

# ahora crearemos los achibos de ErrorLog y CustomLog en marnai
sudo mkdir /var/www/html/marnai/logs
sudo touch /var/www/html/marnai/logs/ErrorLog.log
sudo touch /var/www/html/marnai/logs/CustomLog.log
# en 000-default.conf pondremos la ruta
sudo sed -i 's|${APACHE_LOG_DIR}/error.log|/var/www/html/marnai/ErrorLog.log' /etc/apache2/sites-available/000-default.conf
sudo sed -i 's|${APACHE_LOG_DIR}/access.log|/var/www/html/marnai/CustomLog.log' /etc/apache2/sites-available/000-default.conf

