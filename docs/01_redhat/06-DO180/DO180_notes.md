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

#### CRI-O documentation
 - [CRI-O Container Engine](https://github.com/kubernetes/cri-api.)

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

Creando Kubernetes y pods

      oc run RESOURCE/NAME --image IMAGE --command -- cmd arg1 ... argN

      oc run -it my-app \
      --image registry.access.redhat.com/ubi9/ubi \
      --restart Never --command -- date

Creando containers y Pods

      oc run RESOURCE/NAME --image IMAGE [options]
      kubectl run web-server --image registry.access.redhat.com/ubi8/httpd-24
      oc run RESOURCE/NAME --image IMAGE --command -- cmd arg1 ... argN
      oc run -it my-app --image registry.access.redhat.com/ubi9/ubi --command -- /bin/bash

      
Con opción de restart [Always/OnFailure/Never]

      oc run -it my-app --image registry.access.redhat.com/ubi9/ubi --restart Never --command -- date

Con opción de delete

      kubectl run -it my-app --rm --image registry.access.redhat.com/ubi9/ubi --restart Never --command -- date

Asignación de ID a usuarios y grupos

      oc describe project my-app

Ejecutando comandos en pods en ejecución

      oc exec my-app -- date
      kubectl exec my-app -c ruby-container -- date
      oc exec my-app -c ruby-container -it -- bash -il
      kubectl exec my-app -c ruby-container -it -- bash -il

Logs de contenedores

opciones:

      -l or --selector=''
      --tail=
      -c or --container=
      -f or --follow
      -p or --previous=true

      oc logs postgresql-1-jw89j --tail=10
      oc attach my-app -it

Comandos de borrado

      kubectl delete pod -l app=my-app
      oc delete pod -f ~/php-app.json
      cat ~/php-app.json | kubectl delete -f -
      oc delete pod php-app --grace-period=10
      kubectl delete pod php-app --force
      kubectl delete pods --all
      oc delete project my-app

CRI-O Engine commands

      crictl pods
      crictl image
      crictl inspect    
      crictl exec    
      crictl logs   
      crictl ps 

      kubectl get pods -o wide
      oc get pod postgresql-1-8lzf2 -o jsonpath='{.spec.nodeName}{"\n"}'
      oc debug node/master01
      crictl ps --name postgresql
      crictl ps --name postgresql -o json | jq .containers[0].id
      
      crictl inspect -o json 27943ae4f3024 | jq .info.pid #Show $id
      lsns -p $id
      nsenter -t $id -p -r ps -ef
      nsenter -t $id -a ps -ef

[Red Hat Ecosystem Catalog](https://catalog.redhat.com/software/containers/explore)

Inspecting and Managing Container Images

      sudo dnf -y install skopeo
      skopeo login quay.io
      skopeo list-tags docker://registry.access.redhat.com/ubi9/httpd-24
      skopeo inspect --config docker://registry.access.redhat.com/ubi9/httpd-24

      skopeo copy docker://quay.io/skopeo/stable:latest docker://registry.example.com/skopeo:latest
      skopeo delete docker://registry.example.com/skopeo:latest
      skopeo sync --src docker --dest docker registry.access.redhat.com/ubi8/httpd-24 registry.example.com/httpd-24

      skopeo inspect docker://registry.redhat.io/rhel8/httpd-24
      skopeo inspect docker://registry.access.redhat.com/ubi8:latest

      skopeo login registry.redhat.io

      oc image info registry.access.redhat.com/ubi9/httpd-24:1-233 --filter-by-os amd64

images command

      oc image append
      oc image extract
      oc image mirror 

Troubleshooting kb

 - **kubectl describe**: Display the details of a resource.
 - **kubectl edit**: Edit a resource configuration by using the system editor.
 - **kubectl patch**: Update a specific attribute or field for a resource.
 - **kubectl replace**: Deploy a new instance of the resource.
 - **kubectl cp**: Copy files and directories to and from containers.
 - **kubectl exec**: Execute a command within a specified container.
 - **kubectl explain**: Display documentation for a specified resource.
 - **kubectl port**-forward: Configure a port forwarder for a specified container.
 - **kubectl logs**: Retrieve the logs for a specified container.

Troubleshooting oc

 - **oc status**: Display the status of the containers in the selected namespace.
 - **oc rsync**: Synchronize files and directories to and from containers.
 - **oc rsh**: Start a remote shell within a specified container.

Editing

      oc describe pod dns-default-lt13h
      oc edit pod mongo-app-sw88b
      oc patch pod valid-pod --type='json' -p='[{"op": "replace", "path": "/spec/containers/0/image", "value":"http://registry.access.redhat.com/ubi8/httpd-24"}]'

Copy

      oc cp apache-app-kc82c:/var/www/html/index.html /tmp/index.bak
      oc cp /tmp/index.html apache-app-kc82c:/var/www/html/
      oc exec -it apache-app-kc82c -- ls /var/www/html
      oc rsync apache-app-kc82c:/var/www/ /tmp/web_files

Remote container access

      oc port-forward nginx-app-cc78k 8080:80
      oc rsh tomcat-app-jw53r

Execute command in a Container

      oc exec POD | TYPE/NAME [-c container_name] -- COMMAND [arg1 ... argN]
      oc exec -it mariadb-lc78h -- ls /
      oc exec mariadb-lc78h -- ls /

Events & logs

      oc logs BIND9-app-rw43j
      oc get events

Templates

      oc process -f mysql-template.yaml -o yaml
      oc process -f mysql-template.yaml --parameters
      oc new-app --template mysql-persistent

Jobs

      oc create job date-job --image registry.access.redhat.com/ubi8/ubi -- /bin/bash -c "date"
      oc create cronjob date-cronjob --image registry.access.redhat.com/ubi8/ubi --schedule "*/1 * * * *" -- date 4

Deployments

      oc create deployment my-deployment --image registry.access.redhat.com/ubi8/ubi --replicas 3

      oc delete pod -l environment=testing

Creating Secrets

      oc create secret generic secret_name --from-literal key1=secret1 --from-literal key2=secret2
      kubectl create secret generic ssh-keys --from-file id_rsa=/path-to/id_rsa --from-file id_rsa.pub=/path-to/id_rsa.pub
      oc create secret tls secret-tls --cert /path-to-certificate --key /path-to-key

Creating Configuration Maps

      kubectl create configmap my-config --from-literal key1=config1 --from-literal key2=config2
      oc create cm my-config --from-literal key1=config1 --from-literal key2=config2

Using Secrets and Configuration Maps as Volumes

      oc create secret generic demo-secret --from-literal user=demo-user --from-literal root_password=zT1KTgk
      oc create secret generic demo-secret --from-file user=/tmp/demo/user --from-file root_password=/tmp/demo/root_password
      oc set volume deployment/demo --add --type secret --secret-name demo-secret --mount-path /app-secrets

      oc create configmap demo-map --from-file=config-files/httpd.conf
      oc set volume deployment/demo --add --type configmap --configmap-name demo-map --mount-path /app-secrets
      oc set volume deployment/demo
      oc set env deployment/demo --from secret/demo-secret --prefix MYSQL_

Updating Secrets and Configuration Maps

      oc extract secret/demo-secrets -n demo --to /tmp/demo --confirm
      oc set data secret/demo-secrets -n demo --from-file /tmp/demo/root_password

Persistent Volumes

**configMap** The configMap volume externalizes the application configuration data. This use of the configMap resource ensures that the application configuration is portable across environments and can be version-controlled.
      
**emptyDir** An emptyDir volume provides a per-pod directory for scratch data. The directory is usually empty after provisioning. emptyDir volumes are often required for ephemeral storage.

**hostPath** A hostPath volume mounts a file or directory from the host node into your pod. To use a hostPath volume, the cluster administrator must configure pods to run as privileged. This configuration grants access to other pods in the same node.

Red Hat does not recommend the use of hostPath volumes in production. Instead, Red Hat supports hostPath mounting for development and testing on a single-node cluster. Although most pods do not need a hostPath volume, it does offer a quick option for testing if an application requires it.

**iSCSI** Internet Small Computer System Interface (iSCSI) is an IP-based standard that provides block-level access to storage devices. With iSCSI volumes, Kubernetes workloads can consume persistent storage from iSCSI targets.

**local** You can use Local persistent volumes to access local storage devices, such as a disk or partition, by using the standard PVC interface. Local volumes are subject to the availability of the underlying node, and are not suitable for all applications.

**NFS** An NFS (Network File System) volume can be accessed from multiple pods at the same time, and thus provides shared data between pods. The NFS volume type is commonly used because of its ability to share data safely. Red Hat recommends to use NFS only for non-production systems.

|Access mode| Abbreviation | Description |
|:----------|:-------------|:------------|
|ReadWriteOnce| RWO | A single node mounts the volume as read/write |
|ReadOnlyMany| ROX | Many nodes mount the volume as read-only |
|ReadWriteMany| RWX | Many nodes mount the volume as read/write |


|Volume type|RWO|ROX|RWX|
|:----------|:--|:--|:--|
|configMap  |Yes|No|No|
|emptyDir   |Yes|No|No|
|hostPath   |Yes|No|No|
|iSCSI      |Yes|Yes|No|
|local      |Yes|No|No|
|NFS  |Yes|Yes|Yes|