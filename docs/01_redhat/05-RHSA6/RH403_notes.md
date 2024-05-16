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
 