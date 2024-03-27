# Manage Files from the Command Line

## Describe Linux File System Hierarchy Concepts

La forma es como almacena los archivos en el sistema de manera organizada y con un único árbol de jerarquía

## Make Links Between Files
 
 | Comando | Acción | Tipo de Link |
 |:------- | :----- | :----------- |
 | **ln** file.txt /path_target/file-hl2.txt | crea el hard link | Hard Link |
 | **ln -il** file.txt /path_target/file-hl2.txt | muestra el # de inodo | Hard Link |
 | **ln -s** ~/newfile-l2.txt /tmp/newfile-symlink.txt | Crea el link simbólico | Symbolic Link |

### Limitaciones

 - Hard link Solo funciona con archivos regulares, no se puede usar con directorios
 - Se pueden utilizar si ambos pertenecen al mismo sistema de archivos en hard link
 - Un hard link dirige un nombre a los datos de un dispositivo de almacenamiento.
 - Un link simbólico apunta un nombre a otro nombre, que apunta a datos en un dispositivo de almacenamiento.

## Match File Names with Shell Expansions 

 | Comando | Acción | 
 |:------- | :----- |
 | mkdir glob **;** cd glob | **;** puede unir varias lineas |
 | **touch** alfa bravo charlie delta | en el ejemplo, el comando *touch* crea tanto archivos como la lista separada por *espacio* |
 | ls a* | lista el contenido que inicia con letra **a** |
 | ls *a* | Lista todo lo que contenga la letra **a** |
 | ls [ac]* | Todo lo contenga las letras **a** o **c**|
 | ls ???? | muestra el contenido que por nombre temga 4 caracteres |
 | echo {Sunday,Monday,Tuesday,Wednesday}.log | en el ejemplo *echo* imprime cada archivo nombrado entre los corchetes |
 | echo file{1..3}.txt | imprime los archivos del 1 al 3 |
 | echo file{a..c}.txt | muestra los archivos de la a la c |
 | echo file{a,b}{1,2}.txt | muestra concatenando las agrupaciones de cada contenido de corchetes |
 | echo file{a{1,2},b,c}.txt | concatena de interno a externo |




