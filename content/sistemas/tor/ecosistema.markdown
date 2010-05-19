---
titulo: El ecosistema de Tor
---

El ecosistema de Tor
====================

Hay una variedad de aplicaciones que trabajan en conjunto para que la red Tor sea funcional, segura y usable. Estas son algunas de ellas:

* [Tor][1]
* [Vidalia][2]
* [Polipo][3]
* [Torbutton][4]
* [TorDNS][5]

Tor
---

[Tor], el llamado Proxy de cebollas (OP) es la puerta de entrada a la red. Maneja conexiones entrantes y salientes a través de esta
aplicación, y recibe las solicitudes de otras aplicaciones (mediante SOCKS). Cada OP puede ser configurado como Retransmisor (OR),
lo que lo convierte en parte de la columna vertebral de red Tor, donde usa parte de su ancho de banda disponible para retransmitir
datos de los demás.

Vidalia
-------

[Vidalia] es una GUI para controlar el servicio Tor, escrita con el framework Qt y multiplataforma (GNU/Linux, Unix, Mac, Windows).

Polipo
------

[Polipo] es un proxy HTTP de caché, que maneja SOCKS4a, lo que evita que Firefox envíe las solicitudes de DNS por fuera de la red
Tor, poniendo en peligro el anonimato.

Torbutton
---------

[Torbutton] es una extensión de [Firefox] que permite habilitar el uso de Tor en el navegador con un simple click. Además, mientras
está activado realiza cambios en la configuración para mejorar la seguridad (e.g. desactiva Flash y javascript).

TorDNS
------

[TorDNS] es un servidor DNS local, lo que permite que las aplicaciones realicen solicitudes de IPs a través de un nombre de host
usando la red Tor.

[1]: #tor
[2]: #vidalia
[3]: #polipo
[4]: #torbutton
[5]: #tordns
[Tor]: https://www.torproject.org/
[Vidalia]: http://www.torproject.org/vidalia/
[Polipo]: http://www.pps.jussieu.fr/~jch/software/polipo/
[Torbutton]: http://www.torproject.org/torbutton/
[Firefox]: http://www.mozilla-europe.org/es/firefox/
[TorDNS]: http://sandos.ath.cx/~badger/tordns.html
