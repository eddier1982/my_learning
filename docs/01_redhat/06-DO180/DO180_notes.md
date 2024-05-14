# Notas Administración OCP 4

## Guías de documentación
 - [Product Documentation for OpenShift Container Platform 4.X y 3X](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15)
  
### Getting Started v.4.15
 - [Getting Started](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/getting_started)
 - [Release Notes](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/release_notes)
 - [Architecture](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/architecture)

### Install v.4.15
 - [Installing](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/installing)
 - [Installing OpenShift Container Platform with the Assisted Installer](https://access.redhat.com/documentation/en-us/assisted_installer_for_openshift_container_platform/2024/html/installing_openshift_container_platform_with_the_assisted_installer) 

### Configure v.4.15
 - [Authentication and authorization](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/authentication_and_authorization)
 - [Networking](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/networking)
 - [Registry](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/registry)
 - [Postinstallation configuration](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/postinstallation_configuration)
 - [Storage](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/storage)

### Manage v.4.15
 - [Backup and restore](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/backup_and_restore)
 - [Web console](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/web_console)

### Reference v.4.15
 - [CLI tools](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.15/html/cli_tools)


## Comandos

 Conectarse a la granja:

        oc login -u <usuario> -p <password>  https://api.ocp4.example.com:6443

 Mostrar la URL de la consola:

        oc whoami --show-console

 Descargar kubectl e instalarla en uno de los nodos master:

       curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

 Crear un nuevo proyecto:

       oc new-project myapp

 Otras validaciones:

       oc cluster-info
       oc api-versions
       oc get clusteroperator

 Operaciones 

       oc get pod
       oc get all
       oc describe mysql-openshift-1-xxxxx
       oc create -f pod.yaml
       oc status
       oc delete pod quotes-ui
       oc get pods -n openshift-apiserver

 