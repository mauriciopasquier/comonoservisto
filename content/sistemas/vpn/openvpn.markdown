---
titulo: OpenVPN
---

OpenVPN
=======

[OpenVPN] es un programa libre que permite crear conexiones seguras punto a punto en modo
cliente-servidor. O sea que, para la conexión entre dos máquinas, una debe estar corriendo el software en
modo servidor y otra en modo cliente.

Ejemplo de configuración del cliente
------------------------------------

Para demostrar cómo configurar una conexión con OpenVPN vamos a usar los servidores de [Rise Up], un
colectivo que provee diversas herramientas de comunicación para activistas. Para usarlos es necesario
sacar una cuenta detallando el tipo de uso que se le va a dar (aprobado por la gente de Rise Up) o
consiguiendo dos invitaciones de personas con cuenta. La VPN de Rise Up funciona en base a [donaciones].

A lo largo del ejemplo vamos a asumir un directorio `/etc/openvpn/riseup/` para guardar los archivos de
configuración. En cuanto al cliente, hay que configurar:

* Servidor VPN: elegimos uno entre `seattle.vpn.riseup.net` o `nyc.vpn.riseup.net`
* Nombre de usuario: el mismo que tenés en [Rise Up]. Por ejemplo, si tu cuenta es
  `juan-salvo@riseup.net`, el nombre de usuario sería `juan-salvo`
* Password: el password puede ser el mismo de la cuenta, pero se [recomienda] usar uno específico para la
  VPN
* Certificado de CA: Rise Up también funciona como [CA], por lo que tienen un [certificado] firmado por
  ellos mismos. Deberíamos obtener y [validar] un archivo llamado `RiseupCA.pem`

Todo esto se agrega a un archivo de configuración de OpenVPN, que vamos a llamar `vpn.conf`:

    remote seattle.vpn.riseup.net 1194
    auth-user-pass /etc/openvpn/riseup/credenciales
    ca /etc/openvpn/riseup/RiseupCA.pem

El archivo `/etc/openvpn/riseup/credenciales` contiene nuestro nombre de usuario y nuestro password, uno en
cada línea.

    nombre-de-usuario
    password

Además, necesitamos tener instalado [resolvconf], y un [script] que actualice los DNSs, para ser
llamado cuando OpenVPN levante o baje la interfaz virtual de la VPN, que vamos a llamar
`update-resolv-conf` y a guardar en `/etc/openvpn/` (no hay que olvidarse de hacer al script ejecutable).
Con `script-security 2` le permitimos a OpenVPN llamar scripts externos.

    script-security 2
    up /etc/openvpn/update-resolv-conf
    down /etc/openvpn/update-resolv-conf

Para levantar la conexión desde la consola (con permisos de root):

    openvpn --config /etc/openvpn/riseup/vpn.conf

y para darla de baja le enviamos la señal TERM de alguna forma:

    killall -TERM openvpn

Podemos crear scripts que corran estos comandos por nosotros con facilidad y llamarlos, por ejemplo,
[riseup] y [risedown].

### Archivos

* [vpn.conf]
* [credenciales]
* [riseup]
* [risedown]
* [update-resolv-conf][script]

[OpenVPN]: https://www.openvpn.net/
[Rise Up]: https://riseup.net
[donaciones]: https://help.riseup.net/en/vpn-donate
[resolvconf]: http://alioth.debian.org/projects/resolvconf/
[script]: /copyleft/fuentes/openvpn/update-resolv-conf
[recomienda]: https://help.riseup.net/en/vpn-secret
[CA]: https://es.wikipedia.org/wiki/Autoridad_de_certificación
[certificado]: https://help.riseup.net/assets/43052/RiseupCA.pem
[validar]: https://help.riseup.net/en/riseup-ca
[vpn.conf]: /copyleft/fuentes/openvpn/vpn.conf
[credenciales]: /copyleft/fuentes/openvpn/credenciales
[riseup]: /copyleft/fuentes/openvpn/riseup
[risedown]: /copyleft/fuentes/openvpn/risedown
