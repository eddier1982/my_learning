
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