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

## Instalación de AAP 2.5 contenerizado

mkdir AAP
mv ansible-automation-platform-containerized-setup-bundle-2.5-1-x86_64.tar.gz AAP/

tar -xzvf ansible-automation-platform-containerized-setup-bundle-2.5-1-x86_64.tar.gz 

hostnamectl 
hostname

sudo subscription-manager register
sudo dnf repolist
sudo dnf install -y ansible-core
sudo dnf install -y wget git-core rsync vim
hostname

visudo /etc/sudoers.d/eocampo
%eocampo	ALL=(ALL)	NOPASSWD:ALL

Firewall

```bash
sudo firewall-cmd --list-services
sudo firewall-cmd --get-services
sudo firewall-cmd  --add-service=postgresql
sudo firewall-cmd --list-services
sudo firewall-cmd --permanent --add-port=5432/tcp
systemctl status firewalld
sudo firewall-cmd --reload
sudo firewall-cmd --check-config
```

sudo loginctl enable-linger eocampo
loginctl enable-linger eocampo

cd AAP/ansible-automation-platform-containerized-setup-bundle-2.5-1-x86_64
ansible-playbook -i inventory ansible.containerized_installer.install


``` bash
# This is the AAP enterprise installer inventory file
# Please consult the docs if you're unsure what to add
# For all optional variables please consult the included README.md
# or the Red Hat documentation:
# https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.5/html/containerized_installation

# This section is for your AAP Gateway host(s)
# -----------------------------------------------------
[automationgateway]
rhel95aap25cont.eocampo.lab

# This section is for your AAP Controller host(s)
# -----------------------------------------------------
[automationcontroller]
rhel95aap25cont.eocampo.lab

# This section is for your AAP Execution host(s)
# -----------------------------------------------------
[execution_nodes]

# This section is for your AAP Automation Hub host(s)
# -----------------------------------------------------
[automationhub]
rhel95aap25cont.eocampo.lab

# This section is for your AAP EDA Controller host(s)
# -----------------------------------------------------
[automationeda]
rhel95aap25cont.eocampo.lab

[database]
rhel95aap25cont.eocampo.lab

[all:vars]
ansible_connection=local

# Common variables
# https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.5/html/containerized_installation/appendix-inventory-files-vars#ref-general-inventory-variables
# -----------------------------------------------------
bundle_install=true
# The bundle directory must include /bundle in the path
bundle_dir=/home/eocampo/AAP/ansible-automation-platform-containerized-setup-bundle-2.5-1-x86_64/bundle

registry_username=11009103|testansibleeom
registry_password=eyJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIyYjg3NmY3Njg4Yjg0ODUyOWI0MjZkNzM5MjkwMjMzMyJ9.KnuseySYDcQEv75S3vXlL5JvDXglN6ZPSJ_v_Zb37gfK-hDUv7UyhrI5XvjIGev15mAM3yWrg3xdBHn71K-sCIHc56MEQuwfDbll9U3jQheWkX4ZCe7wScQd61CxZgk9Gk883xQKQy7h3eIxdgcHweXm2K-hhhWgirxR0ohEya8S-EkDW95zUCJyvH9v8RUorEhIXp74EqZw4UtksG3yojXfWEPtCB9ZRDtKePxLULf71GRhJ5cxKDB2s7iSxDu3p7wGYQukGadhev5OUvQIxP_S8f-6MWRi6aWiSsSfTsZ1ZAzQ4b9RmznKgWROWI7dI61CNYa0XvKQtR1a2uPcLb2PMqQc1zcLJ8jvPlDx8_yXa343Dexm6_FxoGoueO2T5kciDILwfYDv3BoJZogZpU0K6hY3ZWPcLLw3cv4_ZSr6LpUMakR_vaZCLTuqxKgMiqjXxxktuj0qbB_o7dX-LqdPHL-2iArUNnrc39hIUPeOVQpppbAuUBozLxsN2LT3gYavo8xJ59GjIT0klaede1VOhL2B2cVJRIkFoFlRprAP2BMUa8TCUG1qQoB7C5C63oLtTlZOtheE2er1MECKSezzJs2XXq9vb-uH0R0cwa6fG4qWPxTQpdUD8DU4sYcQeEYJ44NUDttrmhaKvfwhq6YYEOufJ8BlhZ-12bwv-mk

postgresql_admin_username=postgres
postgresql_admin_password=R3dH4t2025

redis_mode=standalone

# AAP Gateway
# https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.5/html/containerized_installation/appendix-inventory-files-vars#ref-gateway-variables
# -----------------------------------------------------
gateway_admin_password=R3dH4t2025
gateway_pg_host=rhel95aap25cont.eocampo.lab
gateway_pg_password=R3dH4t2025

# AAP Controller
# https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.5/html/containerized_installation/appendix-inventory-files-vars#ref-controller-variables
# -----------------------------------------------------
controller_admin_password=R3dH4t2025
controller_pg_host=rhel95aap25cont.eocampo.lab
controller_pg_password=R3dH4t2025

# AAP Automation Hub
# https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.5/html/containerized_installation/appendix-inventory-files-vars#ref-hub-variables
# -----------------------------------------------------
hub_admin_password=R3dH4t2025
hub_pg_host=rhel95aap25cont.eocampo.lab
hub_pg_database=rhel95aap25cont.eocampo.lab
hub_pg_host=rhel95aap25cont.eocampo.lab
hub_pg_password=R3dH4t2025

# AAP EDA Controller
# https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.5/html/containerized_installation/appendix-inventory-files-vars#event-driven-ansible-controller
# -----------------------------------------------------
eda_admin_password=R3dH4t2025
eda_pg_host=rhel95aap25cont.eocampo.lab
eda_pg_password=R3dH4t2025

```