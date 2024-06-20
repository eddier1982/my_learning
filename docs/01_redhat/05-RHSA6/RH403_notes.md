# Notas Red Hat Satellite 6.X

## Gúias de documentación
 - [Dpcumentación de producto 6.15](https://access.redhat.com/documentation/en-us/red_hat_satellite/)

## Deployment
- [Instalación Satellite Server conectado](https://access.redhat.com/documentation/en-us/red_hat_satellite/6.15/html/installing_satellite_server_in_a_connected_network_environment)
- [Instalación de Capsula](https://access.redhat.com/documentation/en-us/red_hat_satellite/6.15/html/installing_capsule_server)


## Comandos de validación

 Apertura de puertos para clientes en RHS

        firewall-cmd \
        --add-port="5647/tcp" \
        --add-port="8000/tcp" \
        --add-port="9090/tcp"

 Apertura de servicios en RHS:

        firewall-cmd \
        --add-service=dns \
        --add-service=dhcp \
        --add-service=tftp \
        --add-service=http \
        --add-service=https \
        --add-service=puppetmaster

 Creando persitencia en las reglas del FW:

        firewall-cmd --runtime-to-permanent

 Validando el estado del FW:

        firewall-cmd --list-all

 Validación de resolución de ping localmente

        ping -c1 localhost
        ping -c1 `hostname -f`

Validación de acceso a URL's

    cat << 'EOF' > SITES
subscription.rhn.redhat.com
cdn.redhat.com
console.redhat.com
api.access.redhat.com
cert-api.access.redhat.com
e29511.dscb.akamaiedge.net
a184-87-197-90.deploy.static.akamaitechnologies.com
EOF
[root@localhost ~]# for URL in $(cat SITES); do  timeout 3 bash -c "</dev/tcp/$URL/443 && echo Port is open for $URL || echo Port is closed" for $URL || echo Connection timeout for $URL; done


## Configuraciones

| Config | Var |
|:------ | :-- |
| email  |
| user remote execution | 


1. Configurar el dominio /infraestructura/dominios
2. Definir los repositorios a descargar /Contenido/Red Hat Repositorios
   1. extras
   2. optionales
   3. RPM's
   4. BaseOS
   5. AppSteam
   6. Elegir los x_86 versión 8 y 9
3. Syncronizar /contenido/Sync Status
4. Config básica /Adminisytrar/usuario
   1. Usuario, email, zona horaria, idioma
   2. Modificar contraseña
5. Prueba de sincronización de manifiesto /content/subcription/manage manifest/refresh
6. Crear el Sync Plan con el nombre de los productos basado en las selección de descargas /contect/products
   1. De finir el horario de descarga (diario)
7.  Definir el lifecycle
    1. Definir enviroment
 8. Configurar Content View de acuerdo a lso reposotorios selecionados
    1. Publicar la versión y promoverlo
    2. Bases RHEL 8
    3. Global (HA, resilent storage)
 9. Crear los AK, 
    1.  Limite de hosts 5
    2.  En Detalles, cambiarle:
        1.  Service Level x premium
        2.  Usage Type Production
        3.  Role RHELS 
        4.  Release x 8
    3.  En Repository Sets
        1.  Limitar por enviroment
    4.  Asociar el CV
    5.  Crear uno global
8.  En general, modificar la opción de recnocer IP
9.  Habilitar Cloud connector configure/inventory upload
10. Configurar llave root local 
    1.  crear el usuario satellite local, copiarle las credenciales y subirle los previlegios de sudo
    2.  actualizar las configuraciones de execute enviroment, user y pass
    3.  ssh-copy-id -i ~foreman-proxy/.ssh/id_rsa_foreman_proxy.pub satellite@rhs
    4.  configure/RHCloud/insights
    5.  por cada intento fallodo, eliminar el usuario cloud connector que se ha creado
11. Habilitar SCAP
    1.  satellite-installer --enable-foreman-plugin-openscap
    2.  hammer scap-content bulk-upload --type default
    3. Validar en  Administer/politicas SCAP
    4. Descargar los paquetes manualmente de SCAP
    5. copiar por scp y luego cargarlos
 12. Hbilitar plugin de anisble
     1.  satellite-installer --enable-foreman-plugin-ansible --enable-foreman-proxy-plugin-ansible
     2.  satellite-maintain packages install rhel-system-roles
     3.  satellite-installer --foreman-proxy-bmc "true" -- foreman-proxy-bmc-default-provider "freeipmi"
 13. Configurar LDAP
     1.  Instalar openldap-clients 
         1.  satellite-maintain packages install openldap-clients
     2.  Buscar en el LDAP
         1.  ldapsearch -x -b "DC=bb,DC=com,DC=mx" -h IP -D usuarioldap

Resilient storage u high availability