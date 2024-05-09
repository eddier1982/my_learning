# Notas de estudio

## Guías de referencia

 - [Red Hat Ansible Automation Platform Planning Guide](https://access.redhat.com/documentation/es-es/red_hat_ansible_automation_platform/2.4/html/red_hat_ansible_automation_platform_planning_guide/index)
 - [Automation Controller Administration Guide](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.4/html/automation_controller_administration_guide/index?extIdCarryOver=true&sc_cid=701f2000001OH7YAAW)


## Pasos generales

1. Instalación de SO
2. Registro de subscripción RHEL
3. Crear Allocation un CDN
4. Crear usuario en registry.io
5. Validación de Pre-requisitos (este paso se puede automatizar)
   1. Evaluar el mecanismo de salida a internet
   2. Puertos de Firewall
   3. update de SO
   4. Validar salida a puertos específicos
   5. Validar la salida a URL
   6. Validar capacidades de disco.
   7. Validar capacidades de CPU, RAM y Swap
   8. Validar ping por IP y por fqdn completo
6. Instalación (Desde el *controller1* ejecutar)
   1. Instalar paquetes base *ansible-core* y *podman*
   2. Crear carpeta AAP/ansible
   3. 
   
 Todo lo anterior con buenas prácticas aplicadas

## Pre-instalación





3. Desde el controller 1 realizar todas las validaciones iniciales
  
 **Instalación de paquetes base**
  
       [root@controller1 ~]# dnf install ansible-core
       [root@controller1 ~]# dnf install podman

 **Crear carpeta para repositorio de fuentes**

        [root@controller1 ~]# mkdir -p AAP/playbooks
        [root@controller1 ~]# touch AAP/inventory

 **Generar inventario y realizar prueba de acceso**

        [root@controller1 ~]# cat << 'EOF' > AAP/inventory
        controller1.lab
        controller2.lab
        db.lab
        ah.lab
        ed.lab
        EOF
        [root@controller1 ~]# ansible all  -i AAP/inventory -m ansible.builtin.ping  -u root -k

 **Crear usuario con full permisos en todas las máquinas**

        ---
        name: Make users
        hosts: all
        gather_facts: false
        become: true
        vars: 
          useradd: ansible

        tasks:
          - name: Create user
            ansible.builtin.user:
              name: '{{ useradd }}'
              comment=: 'Ansible Service User Account'
              state: present
              password: $1$mysecretpass$1
              update_password: on_create

          - name: Permisions sudoers
            ansible.builtin.copy:
              dest: /etc/sudoers.d/ansible-service-account
              content: '{{ useradd }} ALL=(ALL) NOPASSWD:ALL'
              mode: u=rw,g=r,o=r
              owner: root
 
 **Generar la relación de confianza con todas las máquinas de la solución**

    [root@controller1 ~]#  su - ansible
    [ansible@controller1 ~]# ssh-keygen -t rsa
    [ansible@controller1 ~]# sudo cp /root/inventory .
    [ansible@controller1 ~]#  for host in $(cat inventory); do ssh-copy-id ansible@$host;done
    [ansible@controller1 ~]# ansible all  -i inventory -m ansible.builtin.ping

 Ejecución 

ANSIBLE_BECOME_METHOD='sudo' ANSIBLE_BECOME=True ANSIBLE_HOST_KEY_CHECKING=False ./setup.sh -e @credentials.yml -- --ask-vault-pass
 

## Administración de usuarios

ANSIBLE_BECOME_METHOD='sudo' ANSIBLE_BECOME=True ANSIBLE_HOST_KEY_CHECKING=False ./setup.sh -e @credentials.yml -- --ask-vault-pass
ansible-automation-platform-setup-bundle-2.4-1-x86_64/collections/ansible_collections
collections/ansible_collections/ansible/automation_platform_installer/roles/preflight/tasks/main.yml


openssl req -new -newkey rsa:2048 -nodes -keyout xxxx.key -out xxxx.com.csr