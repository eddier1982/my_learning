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

#### yq tool 
 - [yq tool ](https://mikefarah.gitbook.io/yq/)
 - [yqlang](https://jqlang.github.io/jq/)

## Algunos conceptos:

 - **Pods (pod)** Represent a collection of containers that share resources, such as IP addresses and persistent storage volumes. It is the primary unit of work for Kubernetes.
 - **Services (svc)** Define a single IP/port combination that provides access to a pool of pods. By default, services connect clients to pods in a round-robin fashion.
 - **ReplicaSet (rs)** Ensure that a specified number of pod replicas are running at any given time.
 - **Persistent Volumes (pv)** Define storage areas for Kubernetes pods to use.
 - **Persistent Volume Claims (pvc)** Represent a request for storage by a pod. PVCs link a PV to a pod so that its containers can use the provisioned storage, usually by mounting the storage into the container's file system.
 - **ConfigMaps (cm) and Secrets** Contain a set of keys and values that other resources can use. ConfigMaps and Secrets centralize configuration values that several resources use. Secrets differ from ConfigMaps in that the values of Secrets are always encoded (not encrypted), and their access is restricted to fewer authorized users.
 - **Deployment (deploy)** A representation of a set of containers that are included in a pod, and the deployment strategies to use. A deployment object contains the configuration to apply to all containers of each pod replica, such as the base image, tags, storage definitions, and the commands to execute when the containers start. Although Kubernetes replicas can be created stand-alone in OpenShift, they are usually created by higher-level resources such as deployment controllers.

      Red Hat OpenShift Container Platform (RHOCP) adds the following main resource types to Kubernetes:

 - **BuildConfig (bc)** Defines a process to execute in the OpenShift project. The OpenShift Source-to-Image (S2I) feature uses a BuildConfig to build a container image from application source code that is stored in a Git repository. A bc works together with a dc to provide an extensible continuous integration and continuous delivery workflows.
 - **DeploymentConfig (dc)** OpenShift 4.5 introduced the Deployment resource concept to replace the DeploymentConfig default configuration for pods. Both concepts represent a set of containers that are included in a pod, and the deployment strategies to use.

    The Deployment object serves as the improved version of the DeploymentConfig object. Some functional replacements between both objects are as follows:

      - Deployment objects no longer support automatic rollback or lifecyle hooks.

      - Every change in the pod template that Deployment objects use triggers a new rollout automatically.

      - The deployment process of a Deployment object can be paused at any time without affecting the deployer process.

      - A Deployment object can have as many active replica sets as the user wants, and can scale down previous replicas. In contrast, the DeploymentConfig object can have only two active replication sets at a time.

      Although Deployment objects are the default replacement of the deprecated DeploymentConfig objects in OpenShift 4.12 and later versions, you can still use DeploymentConfig objects if you need a specific feature that they provide, but they are not recommended for new installations. In this case, you must specify the type of object when creating a new application by including the --as-deployment-config flag.

## Comandos

 Conectarse a la granja:

        oc login -u <usuario> -p <password>  https://api.ocp4.example.com:6443
        oc login -u admin -p redhatocp

 Mostrar la URL de la consola:

        oc whoami --show-console

 Descargar kubectl e instalarla en uno de los nodos master incluso en la máquina desktop si hay conexión

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

Operaciones con pods:

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

Operaciones con api's
      
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

      oc logs pod-name -c container-name

      oc adm must-gather --dest-dir /home/student/must-gather
      tar cvaf mustgather.tar must-gather/
      
      oc adm inspect clusteroperator/openshift-apiserver \
      clusteroperator/kube-apiserver

      oc adm inspect clusteroperator/openshift-apiserver --since 10m
      

Examinando en el nodo:

      sh-4.4# chroot /host
      sh-4.4# for SERVICES in kubelet crio; do echo ---- $SERVICES ---- ;systemctl is-active $SERVICES ; done
      systemctl status kubelet

