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
       oc get nodes
       oc get clusteroperator
       oc get clusteroperators dns -o yaml
       oc get pods -n openshift-apiserver
       
       oc describe mysql-openshift-1-xxxxx
       oc create -f pod.yaml
       oc status
       oc delete pod quotes-ui
       
       oc api-versions
       oc api-resources
       oc api-resources --namespaced=true --api-group apps --sort-by name


Ayuda

      oc help
      oc create --help
      oc version
      oc explain services

Login

      oc login -u admin -p redhatocp


      oc get pod --selector group=developers

      oc get pods -o yaml
      oc get pods -o yaml | yq r - 'items[0].status.podIP'

      oc get pods -o json
      oc get pods -o json | jq '.items[0].status.podIP'
      oc get pods \
      -o custom-columns=PodName:".metadata.name",\
      ContainerName:"spec.containers[].name",\
      Phase:"status.phase",\
      IP:"status.podIP",\
      Ports:"spec.containers[].ports[].containerPort"

      oc get pods  \
      -o jsonpath='{range .items[]}{"Pod Name: "}{.metadata.name}
      {"IP: "}{.status.podIP}
      {"Ports: "}{.spec.containers[].ports[].containerPort}{"\n"}{end}'

      oc api-resources --namespaced=false -o name | wc -l
      oc api-resources --api-group ''

      

Examinando:

      oc adm top pods -A --sum
      oc adm top pods etcd-master01 -n openshift-etcd --containers
      oc get events -n openshift-kube-controller-manager
      oc get all -n openshift-monitoring --show-kind
      oc logs alertmanager-main-0 -n openshift-monitoring
      oc cluster-info
      oc get node master01 -o jsonpath=\
      *'{"Allocatable:\n"}{.status.allocatable}{"\n\n"}{"Capacity:\n"}{.status.capacity}{"\n"}'
      oc get node master01 -o json | jq '.status.conditions'
      oc adm node-logs master01 -u crio --tail 1
      oc debug 
      oc debug node/node-name
      oc debug job/test --as-user=1000000
      oc debug node/master01
      oc get node master01 -o jsonpath='{.status.allocatable.pods}{"\n"}'


      sh-4.4# chroot /host
      sh-4.4# for SERVICES in kubelet crio; do echo ---- $SERVICES ---- ;systemctl is-active $SERVICES ;  echo ""; done
      systemctl status kubelet

      oc logs pod-name -c container-name

      oc adm must-gather --dest-dir /home/student/must-gather
      tar cvaf mustgather.tar must-gather/
      
      oc adm inspect clusteroperator/openshift-apiserver \
      clusteroperator/kube-apiserver

      oc adm inspect clusteroperator/openshift-apiserver --since 10m