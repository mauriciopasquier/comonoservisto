---
titulo: Problemas conocidos
---

Problemas conocidos
===================

Como todo software, Tor no está libre de problemas. Algunos ataques caen fuera de su modelo de amenaza, por lo que no protege bien
contra ellos. Otros son iniciativas de censores para limitar el uso de Tor. Algunos son problemas inherentes de escalabilidad del
diseño actual (aunque no afectarían al sistema en mucho tiempo, y ya se está trabajando para solucionarlos) o por el tipo de uso
que se le está dando. Y los más frecuentes, son malas configuraciones o aplicaciones defectuosas en el lado del cliente.

Vulnerabilidad a diversos ataques
---------------------------------

Tor es vulnerable si el atacante puede ver los dos extremos de la comunicación. Es posible que un observador que pueda analizar el
tráfico de entrada de un usuario y observe algunos (a menos que sea un observador global) destinatarios que estime probables,
correlacione el tiempo de entrada y de salida si acertó en el destinatario. De esta manera confirma una sospecha previa.

Bloqueo de las Autoridades de Directorio
----------------------------------------

En algunos países, se intenta disuadir el uso de Tor, mediante bloqueos a gran escala. Estos ataques son posibles porque las IP de
los Retransmisores son conocidas, así como también las Autoridades de Directorio. Para evitar la imposibilidad de conectarse a la
red sin acceso a las Autoridades, los desarrolladores de Tor crearon los Retransmisores de Puente, que simplemente son
Retransmisores no listados en los Directorios. La manera de descubrir la dirección de un Retransmisor de Puente es visitar la
página `https://bridges.torproject.org/` o enviar un mail a `bridges@torproject.org` con la línea `get bridges` en el cuerpo. Vale la
pena aclarar que no es posible bloquear estos Retransmisores como los publicados, porque estos servicios sólo devuelven un muy
reducido número de Retransmisores, normalmente los más cercanos al cliente que los solicita.

Problemas de escalabilidad
--------------------------

Actualmente, Tor requiere que cada nodo Retransmisor esté conectado con todos los demás. Es evidente que este diseño no es
[escalable]. Se está trabajando para que Tor soporte topologías restringidas, en las que cada nodo se conecta sólo a unos pocos.

Aumento de la relación clientes/retransmisores
----------------------------------------------

Si bien la cantidad de usuarios aumenta permanentemente, la mayor parte de los usuarios elige no ser un Retransmisor. A medida
que, comparativamente, más usuarios acceden a la red sólo para usar ancho de banda, y menos ofrecen su ancho de banda, el
rendimiento de la red para todos decae. Actualmente se están [investigando] formas de incorporar incentivos no monetarios en Tor,
para que aumente la cantidad de Retransmisores.

Mala configuración local
------------------------

Se han comprobado [ataques] basados en abusos de funcionalidades del navegador (e.g. javascript) o plugins externos (e.g. Flash) en
donde se ha violado el anonimato del cliente aún cuando usa Tor. Esto es porque los elementos activos insertados en una página web
por un servidor malicioso (o comprometido) no son controlados por el usuario. Este tipo de ataques es la razón de ser de
[Torbutton].

Solicitudes DNS por fuera de Tor
--------------------------------

Algunas aplicaciones, como [Firefox], realizan conexiones DNS para averiguar la IP del destino y recién entonces se conectan a SOCKS
(por lo tanto a Tor). Estas solicitudes, ajenas a Tor, muestran la verdadera identidad del cliente a los adversarios. Se puede
usar un servidor DNS local que resuelva las solicitudes por la red Tor (como [TorDNS]), o, para HTTP, se puede configurar el
navegador para que use un proxy que soporte SOCKS4a (usa hostnames en vez de IPs) o para que resuelva búsquedas de DNS
remotamente.

[1]: #vulnerabilidad-a-diversos-ataques
[2]: #bloqueo-de-las-autoridades-de-directorio
[3]: #problemas-de-escalabilidad
[4]: #aumento-de-la-relacin-clientesretransmisores
[5]: #mala-configuracin-local
[6]: #solicitudes-dns-por-fuera-de-tor
[escalable]: http://freehaven.net/anonbib/cache/ccs09-torsk.pdf
[investigando]: http://freehaven.net/anonbib/papers/incentives-fc10.pdf
[ataques]: http://www.packetstormsecurity.org/0610-advisories/Practical_Onion_Hacking.pdf
[Torbutton]: ../ecosistema/#torbutton
[Firefox]: http://www.mozilla-europe.org/es/firefox/
[TorDNS]: ../ecosistema/#tordns

