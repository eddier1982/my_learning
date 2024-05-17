## Comandos

```
dnf install ansible-core
ansible --version

dnf install ansible-navigator
ansible-navigator --version

podman login registry.redhat.io
podman pull registry.redhat.io/ansible-automation-platform-22/ee-supported-rhel8:latest

ansible-navigator images

ansible-navigator inventory
ansible-navigator inventory -m stdout --host fqdn_host
ansible-navigator inventory -m stdout --list
ansible-navigator inventory -m stdout --graph group_name

ansible-navigator run  -m stdout name.yml
ansible-navigator run  -m stdout name.yml --syntax-check
ansible-navigator run  -m stdout name.yml --check

ansible-navigator doc -l

```

## Archivos de configuración base de proyecto

 - ansible.cfg
 - ansible-navigator.yml

 Se configuran 2 tipos de variables en ansible.cfg
 
 
| [defaults] | [privilege_escalation] |
|:---------- |:---------------------- |
| inventory = ./inventory | become = true |
| remote_user = user | become_method = sudo |
| ask_pass = false | become_user = root |
|               | become_ask_pass = false |

## Modulos

| Categoría | Modulo |
|:----------|:-------|
| Files | ansible.builtin.copy: Copy a local file to the managed host. |
| | ansible.builtin.file: Set permissions and other properties of files. |
| | ansible.builtin.lineinfile: Ensure a particular line is or is not in a file. |
| | ansible.posix.synchronize: Synchronize content using rsync. |
| Software | ansible.builtin.package: Manage packages using the automatically detected package manager native to the operating system. |
| | ansible.builtin.dnf: Manage packages using the DNF package manager. |
| | ansible.builtin.apt: Manage packages using the APT package manager. |
| | ansible.builtin.pip: Manage Python packages from PyPI. |
| System | ansible.posix.firewalld: Manage arbitrary ports and services using firewalld. |
| | ansible.builtin.reboot: Reboot a machine. |
| | ansible.builtin.service: Manage services. |
| | ansible.builtin.user: Add, remove, and manage user accounts. |
| Net Tools | ansible.builtin.get_url: Download files over HTTP, HTTPS, or FTP. |
| | ansible.builtin.uri: Interact with web services. |
| run command arbitrary | ansible.builtin.command |
| | ansible.builtin.shell | ansible.builtin.raw |
| | 



