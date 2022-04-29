# Sofkau
El programa es muy sencillo lo codifique en perl, en ambiente linux, consta de:

1.-El archivo PreguntasRespuestas.pl que es el ejecutable (desde consola).

2.-El esquema de la base de datos juegodb, que contiene las preguntas y respuestas, y el usuario que se conecta a la base de datos.

3.-Y la clase (paquete) Basedatos.pm con la que trabaje.

4.-Colocar los archivos PreguntasRespuestas.pl  y  Basedatos.pm en cualquier carpeta por ejemplo
/home/juego/ 

 5.-Dar permisos chmod -R 755 /home/juego/

6.- Luego entramos al archivo  PreguntasRespuestas.pl y editamos la linea:

use lib '/ruta donde colocamos los archivos/';#ruta donde se encuenta nuestro programa, que en este ejemplo seria /home/juego/

7.-Para ejecutarlo vamos a la consola nos ubicamos en la carpeta donde esta el archivo  PreguntasRespuestas.pl y con el comando ./ PreguntasRespuestas.pl o perl PreguntasRespuestas.pl ejecutamos el programa.

Se requiere de la instalación de:

1.-Postgres
	*Desde consola (con usuario root) instalamos postgres => aptitude install postgresql-12
	*También se requiere =>aptitude install  libdbi-perl libdbd-pg-perl

2.-Para cargar la base de datos:
	*Desde consola  (con usuario root) nos pasamos a usuario postgres=>  su postgres
	*Nos conectamos a template1 => psql template1
	*Creamos la base de datos juegodb =>create database juegodb;
	*Luego nos cambiamos a  juegodb con =>\c  juegodb
	*Cargamos el esquema  =>\i /home/jsandova/JOEL/SofkaU/juegodb.sql
	*Y listo ya tenemos nuestra base de datos creada y configurada.
