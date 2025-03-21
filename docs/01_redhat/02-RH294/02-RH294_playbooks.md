
## Configurar la llave en todos los hosts gestionados

```bash
ansible-navigator run playbook.yml -m stdout --ask-pass`
```


```yaml
- name: Public key is deployed to managed hosts for Ansible
hosts: all
tasks:
- name: Ensure key is in root's ~/.ssh/authorized_hosts
ansible.posix.authorized_key:
user: root
state: present
key: '{{ item }}'
with_file:
- ~/.ssh/id_rsa.pub
```


```yaml
---
- name: Instalar y configurar servidor Web con Apache Server
  hosts: webserver
  vars:
    firewall_pkg: firewalld
    firewall_svc:	firewalld
    web_pkg: httpd
    web_svc: httpd
    ssl_pkg: mod_ssl
    httpdconf_src: files/httpd.conf
    httpdconf_dest: /etc/httpd/conf/httpd.conf
    htaccess_src: files/.htaccess
    secrets_dir: /etc/httpd/secrets
    secrets_src: files/htpasswd
    secrets_dest: "{{ secrets_dir }}/htpasswd"
    web_root: /var/www/html
  tasks:
    - name: T1 - Asegurar que los paquetes estan instalados
      ansible.builtin.dnf:
        name:
          - "{{ firewall_pkg }}"
          - "{{ web_pkg }}"
          - "{{ ssl_pkg }}"
        state: latest

    - name: T2 - Copiar el archivo de configuracion de httpdconf
      ansible.builtin.copy:
        src: "{{ httpdconf_src }}"
        dest: "{{ httpdconf_dest }}"
        owner: root
        mode: 0644

    - name: T3 - Crear el directorio especificado
      ansible.builtin.file:
        path: "{{ secrets_dir }}"
        state: directory
        owner: apache
        mode: 0500

    - name: T4 - Copiar archivo de autenticacion
      ansible.builtin.copy:
        src: "{{ secrets_src }}"
        dest: "{{ secrets_dest }}"
        owner: apache
        group: apache
        mode: 0400

    - name: T5 - Copiar archivo de acceso
      ansible.builtin.copy:
        src: "{{ htaccess_src }}"
        dest: "{{ web_root }}/htaccess"
        owner: apache
        group: apache
        mode: 0400

    - name: T6 - Copiar contenido web
      ansible.builtin.copy:
        dest: "{{ web_root }}/index.html"
        content: >
          {{ ansible_facts['fqdn'] }} 
          ({{ ansible_facts['default_ipv4']['address'] }})
          has been customized by Ansible\n

    - name: T7 - Habilitar servicio de Firewall
      ansible.builtin.service:
        name: "{{ firewall_svc }}"
        state: started
        enabled: yes

    - name: T8 - Habilitar servicio https en el Firewall
      ansible.posix.firewalld :
        service: https
        state: enabled
        permanent: true
        immediate: true

    - name: T9 - Habilitar el servicio Web
      ansible.builtin.service:
        name: "{{ web_svc }}"
        state: started

- name: Segundo playboo pruba de conexión
  hosts: workstation
  become: false
  vars:
    web_user: guest
  vars_files:
    - vars/secret.yml
  tasks:
    - name: T1 - Validando conexion a la URL
      ansible.builtin.uri:
        url: https://serverb.lab.example.com
        user: "{{ web_user }}"
        password: "{{ web_pass }}"
        status_code: 200
        validate_certs: false
        force_basic_auth: true
        return_content: true
      register: auth_test

    - name: T2 - Imprimir resultado de la variable auth_test
      ansible.builtin.debug:
        var: auth_test['content']

```

```yaml
---
- name: Enable internet services
  hosts: serverb.lab.example.com
  become: true
  tasks:
    - name: Installs the latest versions of packages
      ansible.builtin.dnf:
        name:
          - firewalld
          - httpd
          - mariadb-server
          - php
          - php-mysqlnd
        state: present

    - name: Enable and start Firewall services
      ansible.builtin.service:
        name: firewalld
        state: started
        enabled: yes

    - name: Access is allowed to the http service
      ansible.posix.firewalld:
        service: http
        state: enabled
        permanent: true
        immediate: true

    - name: Ensure the httpd services are enabled and running
      ansible.builtin.service:                                           
        name: httpd
        state: started                                                   
        enabled: true

    - name: Ensure the mariadb services are enabled and running
      ansible.builtin.service:
        name: mariadb
        state: started                                                                                
        enabled: true

    - name: Copy Files
      ansible.builtin.copy:
        src: index.php
        dest: /var/www/html/index.php
        mode: 0644

- name: Tests access to the web server
  hosts: workstation.lab.example.com
  become: false
  tasks:
    - name: Test Web on serverb.lab.example.com
      ansible.builtin.uri:
        url: http://serverb.lab.example.com
        return_content: true
        status_code: 200

```


## lab task control

```yaml
---
- name: Playbook Control Lab
  hosts: webservers
  vars_files: vars.yml
  tasks:
    #Fail fast message
    - name: Validar sistema
      ansible.builtin.fail:
        msg: "El sistema {{ ansible_hostname }} no cumple con los prerequisitos"
      when: >
        ansible_facts['memtotal_mb'] < min_ram_mb or
        ansible_facts['distribution'] != "RedHat"

    #Install all packages
    - name: Ensure required packages are present
      ansible.builtin.dnf:
        name: "{{ packages }}"
        state: latest

    #Enable and start services
    - name: Habilitar e iniciar servicios
      ansible.builtin.service:
        name: "{{ item }}"
        state: started
        enabled: yes
      loop: "{{ services }}"

    #Block of config tasks
    - name: Bloque de tareas
      block:
        - name: Validar que la carpeta exista
          ansible.builtin.file:
            path: "{{ ssl_cert_dir }}"
            state: directory

        - name: Copiar archivos
          ansible.builtin.copy:
            src: "{{ item['src'] }}"
            dest: "{{ item['dest'] }}"
          loop: "{{ web_config_files }}"
          notify: Restart web service

      rescue:
        - name: Imprimir estado
          ansible.builtin.debug:
            msg: >
              One or more of the configuration 
              changes failed, but the web service 
              is still active.
            
    #Configure the firewall
    - name: Configurando el Firewall
      ansible.posix.firewalld:
        service: "{{ item }}"
        state: enabled
        permanent: true
        immediate: true
      loop:
        - http
        - https

#Add handlers
  handlers:  
    - name: Restart web service
      ansible.builtin.service:
        name: "{{ web_service }}"
        state: restarted

```

# File manage

```yaml
---
- name: Ejercicio de gestion de archivos
  hosts: servers
  vars:
    path_log: /var/log/secure
    nombre_directorio: files
    nombre_archivo: users.txt
  tasks:
    - name: Obtener la informacion de {{ path_log }}
      ansible.builtin.fetch:
        src: "{{ path_log }}"
        dest: secure-backups
      register:

    - name: Crear directorio {{ nombre_directorio }}
      ansible.builtin.file:
        path: "/home/devops/{{ nombre_directorio }}"
        state: directory
        owner: devops
        group: devops
        mode: 0755
        setype: _default

    - name: Agregar linea en /home/devops/{{ nombre_directorio }}/{{ nombre_archivo }}
      ansible.builtin.lineinfile:
        path: "/home/devops/{{ nombre_directorio }}/{{ nombre_archivo }}"
        line: This line was added by the lineinfile module 
        state: present
        create: yes
        owner: devops
        group: devops
        mode: 0644
    
    - name: Copiar archivo system en /home/devops/{{ nombre_directorio }}
      ansible.builtin.copy:
        src: system
        dest: /home/devops/{{ nombre_directorio }}
        owner: devops
        group: devops
        mode: 0664

    - name: Agregar bloque de lineas en /home/devops/{{ nombre_directorio }}/{{ nombre_archivo }}
      ansible.builtin.blockinfile:
        path: "/home/devops/{{ nombre_directorio }}/{{ nombre_archivo }}"
        block: |
          This block of text consists of two lines.
          They have been added by the blockinfile module.
        state: present
...
```

## Remove directory

```yaml
---
- name: Ejercicio de eliminar directorio
  hosts: servers
  vars:
    nombre_directorio: files
  tasks:
    - name: Eliminar directorio {{ nombre_directorio }}
      ansible.builtin.file:
        path: "/home/devops/{{ nombre_directorio }}"
        state: absent
...
```

# Template templates/motd.j2
```jinja
Este es el sistema {{ ansible_facts['fqdn'] }}
Es un {{ ansible_facts['distribution'] }} con la version {{ ansible_facts['distribution_version'] }} de sistema

{% if ansible_facts['fqdn'] in groups['workstations'] %}
Es un usuario de workstation, usted requiere crear ticket para recibir ayuda con el problema
{% elif ansible_facts['fqdn'] in groups['webservers'] %}
Reporte este incidente a {{ system_owner }}.
{% endif %}
```

## playbook de aplicación

```yaml
---
- name: Ejercicio de template
  hosts: all
  remote_user: devops
  become: true
  vars:
    system_owner: eocampo@redhat.com

  tasks:
    - name: Configurar mensaje del dia
      ansible.builtin.template:
        src: templates/motd.j2
        dest: /etc/motd
        owner: root
        group: root
        mode: 0644
...
```

# Review template
```j2
{{ ansible_managed }}

Memoria total del sistema {{ ansible_facts['memtotal_mb'] }}
CPU total del sistema {{ ansible_facts['processor_count'] }}
```

## Playbook
```yaml
---
- name: Laboratorio de Templates
  hosts: all
  remote_user: devops
  become: true
  vars:
    path_destino: /etc/motd

  tasks:
    - name: Copiar template
      ansible.builtin.template:
        src: templates/motd.j2
        dest: "{{ path_destino }}"
        owner: root
        group: root
        mode: 0644

    - name: Verificar si el archivo {{ path_destino }} existe 
      ansible.builtin.stat:
        path: "{{ path_destino }}"
      register: validar_archivo

    - name: Imprimir consulta estado archivo {{ path_destino }}
      ansible.builtin.debug:
        var: validar_archivo

    - name: Copiar archivos en /etc/issue
      ansible.builtin.copy:
        src: files/issue
        dest: /etc/issue
        owner: root
        group: root
        mode: 0644

    - name: Copiar archivos en /etc/issue como link simbolico
      ansible.builtin.file:
        src: files/issue
        dest: /etc/issue.net
        state: link
        owner: root
        group: root
        force: yes

```

# Ejercicio de import & include tasks/playbook

```yaml
---
- name: Configure web server
  hosts: servera.lab.example.com
  tasks:
    - ansible.builtin.include_tasks: tasks/environment.yml
      vars:
        package: httpd
        service: httpd

    - ansible.builtin.import_tasks: tasks/firewall.yml
      vars:
        firewall_pkg: firewalld
        firewall_svc: firewalld
        rule: 
          - http
          - https

    - ansible.builtin.import_tasks: tasks/placeholder.yml
      vars:
        file: /var/www/html/index.html

- name: Import content
  ansible.builtin.import_playbook: plays/test.yml
  vars:
    url: 'http://servera.lab.example.com'
```
# Ejercicio de usuarios

```yaml
---
- name: Lab gestion de usuarios
  hosts: webservers
  vars_files:
    - vars/users_vars.yml

  tasks:
    - name: Crear grupo {{ grupo_nuevo }}
      ansible.builtin.group:
        name: "{{ grupo_nuevo }}"
        state: present

    - name: Crear usuarios
      ansible.builtin.user:
        name: "{{ item['username'] }}"
        group: "{{ item['groups'] }}"
      loop: "{{ users }}"

    - name: Agregar las llaves ssh
      ansible.posix.authorized_key:
        user: "{{ item['username'] }}"
        key: "{{ lookup('file','files/'+ item['username'] + '.key.pub') }}"
      loop: "{{ users }}"

    - name: Agregar sudo a los usuarios
      ansible.builtin.lineinfile:
        path: /etc/sudoers.d/webadmin
        line: "%webadmin ALL=(ALL) NOPASSWD: ALL"
        state: present
        create: yes
        mode: 0440
        validate: /usr/sbin/visudo -cf %s

    - name: Deshabilitar el acceso por root en SSH
      ansible.builtin.lineinfile:
        path: /etc/ssh/sshd_config
        regexp: "^PermitRootLogin"
        line: "PermitRootLogin no"
      notify: reiniciar servicio SSH 

  handlers:
    - name: reiniciar servicio SSH
      ansible.builtin.service:
        name: sshd
        state: restarted

```

# Ejercicio con programación de procesos

## Ejercicio de Cron Services

```yaml
---
- name: Ejercicio de Cron Services
  hosts: webservers
  become: true

  tasks:
    - name: Configurar Tarea en Cron
      ansible.builtin.cron:
        name: Agregar fecha y tiempo al archivo
        job: date >> /home/devops/my_date_time_cron_job
        minute: "*/2"
        hour: 9-16
        weekday: 1-5
        user: devops
        cron_file: add-date-time
        state: present
```
## Ejercicio elliminar progamación Cron

```yaml
---
- name: Ejercicio elliminar progamación Cron
  hosts: webservers
  become: true

  tasks:
    - name: Cron job eliminado
      ansible.builtin.cron:
        name: Agregar fecha y tiempo al archivo
        user: devops
        cron_file: add-date-time
        state: absent
```

## Ejercicio programando tarea con at

```yaml
---
- name: Ejercicio programando tarea con at
  hosts: webservers
  become: true
  become_user: devops

  tasks:
    - name: Agregar fecha y tiempo al archivo 
      ansible.posix.at:
        command: date > ~/my_at_date_time
        count: 1
        units: minutes
        unique: true
        state: present

```

## Ejercicio mdificando boot

```yaml
---
- name: Ejercicio mdificando boot
  hosts: webservers
  become: true
  gather_facts: false
  vars:
    default_target: "graphical.target"

  tasks:
    - name: Obteniendo el actual boot
      ansible.builtin.command:
        cmd: systemctl get-default
      changed_when: false
      register: target

    - name: Asignando {{ default_target }} al boot
      ansible.builtin.command:
        cmd: systemctl set-default {{ default_target }}
      when: default_target not in target['stdout']

```
# Ejercicios de Storage

## Ejercicio de LVM

```yaml
---
- name: Ejercicio de LVM
  hosts: webservers

  roles:
    - name: redhat.rhel_system_roles.storage
      storage_pools:
        - name: apache-vg
          type: lvm
          disks:
            - /dev/vdb
          volumes:
            - name: content-lv
              size: 64m
              mount_point: "/var/www"
              fs_type: xfs
              state: present
            - name: logs-lv
              size: 128m
              mount_point: "/var/log/httpd"
              fs_type: xfs
              state: present

```

# Ejercicios de Network

## Configurando Red

### Variables en group_vars/webservers/network.yml

```yaml
---
network_connections:
  - name: eth1
    type: ethernet
    ip:
      address:
        - 172.25.250.30/24

```
### Configuración de NIC

```yaml
---
- name: Configuracion NIC 
  hosts: webservers

  roles:
    - redhat.rhel_system_roles.network

```
### Obteniendo info de eth1

```yaml
---
- name: Obtain network info for webservers
  hosts: webservers

  tasks:

    - name: Display eth1 info
      ansible.builtin.debug:
        var: ansible_facts['eth1']['ipv4']

```
