# Creacion de collections

## Selecionando el namespaces

EL namespaces es el primer nombre del collection, ejemplo amazon.aws.

Para escoger el nombre del collection tener en cuenta:

* Si planea publicar sus colecciones en Ansible Galaxy, utilice el nombre de usuario de Ansible Galaxy como namespaces.
* Si publica sus colecciones en un hub privado. Tenga en cuenta que puede crear un namespace debe tiener los permisos necesarios.
* Si es un partner de Red Hat y publica sus colecciones en automation hub, utilice el namespaces que Red Hat ha asignado.

## Crear estructura de un collection

Se debe especificar el namespace y el nombre de la collection

```shell
[user@host ~]$ ansible-galaxy collection init mynamespace.mycollection
- Collection mynamespace.mycollection was created successfully

[user@host ~]$ tree mynamespace/
mynamespace/
└── mycollection
    ├── docs       (1)
    ├── galaxy.yml (2)
    ├── plugins    (3)
    │   └── README.md
    ├── README.md  (4)
    └── roles      (5)

4 directories, 3 files
```

1. **docs/** almacena documentación adicional. Puede utilizarlo para proporcionar documentación detallada sobre sus módulos y plug-ins.
2. **galaxy**.yml contiene la información necesaria para construir y publicar su colección.
3. **plugins/** almacena los módulos, plug-ins y filtros que proporciona la colección. Estos artefactos se desarrollan en Python.
4. **README.md** describe su colección. Normalmente proporciona algunas instrucciones de instalación y enumera las dependencias necesarias. Las plataformas de distribución como Ansible Galaxy o private automation hub utilizan ese archivo como portada de su colección.
5. **roles/** almacena los roles.

## Agregar contenido al collection

plugins/ Organiza los módulos, plug-ins y filtros desarrollodados en subdirectorios.

* Modulos:  **plugins/modules/**
* Plugins:  **plugins/inventory/**
* Roles: **roles/**

Para inicializar un role.

```shell
[user@host ~]$ cd mynamespace/mycollection/roles/
[user@host roles]$ ansible-galaxy role init myrole
- Role myrole was created successfully
[user@host roles]$ ls myrole/
defaults  files  handlers  meta  README.md  tasks  templates  tests  vars
```

## Actualizar la metadata de un collection

El fichero **galaxy.yml** en la raíz del directorio de la colección proporciona información para que Ansible construya y publique la colección.
El archivo incluye comentarios que describen cada parámetro. El siguiente archivo galaxy.yml es un ejemplo completo:

```yaml
---
namespace: mynamespace
name: mycollection
version: 1.0.0
readme: README.md
authors:
  - your name <example@domain.com>
description: Ansible modules to manage my company's custom software
license:
  - GPL-3.0-or-later

repository: https://git.example.com/training/my-collection

# The URL to any online docs
documentation: https://git.example.com/training/my-collection/tree/main/docs

# The URL to the homepage of the collection/project
homepage: https://git.example.com/training/my-collection

# The URL to the collection issue tracker
issues: https://git.example.com/training/my-collection/issues

dependencies:
  community.general: '>=1.0.0'
  ansible.posix: '>=1.0.0'
```

Si se necesita incluir otras collections como dependencias usar este fichero en el apartado dependencies el cual es un diccionario de colecciones.
Para cada entrada, la clave es el FQCN de la colección, y el valor es la versión de la colección (**utilice >=1.0.0** cuando no necesite una versión específica).

Para dependencias de python es necesario crear el fichero .**/requirements.txt**, en la raiz del collection.

Ejemplo:

```shell
botocore>=1.18.0
boto3>=1.15.0
boto>=2.49.0
```

En algunos casos se requiere instalar paquetes a nivel de SO en el EE. para esto se crea el fichero **bindep.txt** en la raiz de la collection

Diferentes distribuciones pueden tener otros nombres de paquetes para el mismo software. En el archivo anterior, la directiva **[platform:centos-8 platform:rhel-8]** proporciona el nombre de las distribuciones de Linux.
Otra directiva estándar es [platform:rpm], que apunta a todas las distribuciones de Linux que utilizan el sistema de empaquetado RPM.

Un ejemplo de bindep.txt

```shell
rsync [platform:rpm  platform:centos-8 platform:rhel-8]
```

Otro fichero importante es **meta/runtime.yml**, en el cual se define la version de ansible requerida por el collection.

Ejemplo del fichero:

```yaml
---
requires_ansible: '>=2.10.9'
```

> IMPORTANTE: El fichero meta/runtime.ym es requerido al publicar el automation hub tanto privado como publico.

## Construir un collection

Una vez creado el collection ejecutar el comando `ansible-galaxy collection build` para preparar la collection.

Puede utilizar el archivo **.tar.gz** resultante para instalar y probar la colección localmente, para compartir la colección con miembros del equipo o para publicarla en Ansible Galaxy o un Hub privado.

## Validaciones y testing al collection

El Hub privado utiliza la herramienta **ansible-lint** para verificar que su colección se ajusta a las normas y buenas prácticas que establece el equipo de Ansible.

al publicar un collection se aprecia el siguiente log:

```shell
Importing with galaxy-importer 0.4.4
Getting doc strings via ansible-doc
Finding content inside collection
Loading role myrole
Linting role myrole via ansible-lint...
roles/myrole/tasks/main.yml:3: fqcn-builtins Use FQCN for builtin actions.
roles/myrole/tasks/main.yml:3: risky-file-permissions File permissions unset or incorrect.
CHANGELOG.rst file not found at top level of collection.
Collection loading complete

Done
```

## Publicar un collection al hub privado

### Via Web UI

Ir a: **Collections** → **Namespaces**  (Select Namespace) → **Upload collection** y cargar el .tar.gz generado.

Para que el collection este disponible para los usuarios es necesario aprobarla.

![Approval](images/approval.png)

Cada vez que se modifique la colección, Es necesario editar el archivo **galaxy.yml** y actualizar la versión. De lo contrario, la plataforma de distribución rechazará tu colección.

```shell
[user@host mycollection]$ cat galaxy.yml
---
namespace: mynamespace
name: **mycollection**
version: 2.0.0
readme: README.md
authors:
  - your name <example@domain.com>
...output omitted...
[user@host mycollection]$ ansible-galaxy collection build
Created collection for mynamespace.mycollection at /home/user/mynamespace/mycollection/mynamespace-mycollection-2.0.0.tar.gz
```

### Via CLI

1. Garantizar la autenticacion al hub.

   ```shell
   [galaxy]
   server_list = inbound_mynamespace
   
   [galaxy_server.inbound_mynamespace]
   url=https://hub.lab.example.com/api/galaxy/content/inbound-mynamespace/
   token=<put your token here>
   ```

   La interfaz web del hub privado muestra la URL de entrada del namespaces, para esto ir a:  **Collections** → **Namespaces** → **View collections**  (Seleccionar el namespaces) → **CLI configuration**.

   Para recuperar el token. ir a  Collections → **API token management** → **Load token**. Actualizar la línea token del la section [galaxy_server.namespace ]  en ansible.cfg

2. Cargar la collection

   ```shell
   [user@host mycollection]$ ansible-galaxy collection publish mynamespace-mycollection-2.0.0.tar.gz
   ```

## Documentacion

* [Developing Collections](https://docs.ansible.com/ansible/6/dev_guide/developing_collections.html)
* [Collection Galaxy Metadata Structure](https://docs.ansible.com/ansible/6/dev_guide/collections_galaxy_meta.html)
* [Python Packages Requirements File Format](https://pip.pypa.io/en/stable/cli/pip_install/#requirements-file-format)
* [Introduction to bindep](https://docs.opendev.org/opendev/bindep/latest/readme.html)
* [Generating Changelogs and Porting Guide Entries in a Collection](https://docs.ansible.com/ansible/6/dev_guide/developing_collections_changelogs.html)