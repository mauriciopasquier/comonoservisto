---
titulo: Propiedades
---

Propiedades
===========

Esta es una lista parcial de las propiedades más importantes de Tor:

* [Es una red superpuesta sobre Internet][1]
* [Protege contra ataques de análisis de tráfico][2]
* [Promueve activamente la facilidad de uso][3]
* [Tiene alta visibilidad][4]
* [Vive en el espacio del usuario][5]
* [Es multiplataforma][6]
* [Está ampliamente documentado][7]
* [Es software libre][8]
* [Tiene una gran base de usuarios][9]

Es una red superpuesta sobre Internet
-------------------------------------

La topología de Tor consiste en una cantidad de Retransmisores Tor (también llamados Enrutadores de cebollas, nodos u OR),
administrados por voluntarios, que mantienen conexiones TSL (sobre TCP/IP) permanentemente entre sí, para formar esta red. Los
Clientes Tor (proxies de cebollas u OP) los ubican mediante una base de datos semidistribuida, para solicitarles que retransmitan
sus flujos TCP y así lograr anonimato.

Los Retransmisores se dividen en varios tipos, relativos al uso circunstancial que le de un cliente (i.e. de entrada, medios, de
salida). Primeros en orden de importancia están los nodos de salida (exit nodes), que son los que comunican la red Tor con el
exterior. Dado que son la cara visible de todos los usuarios de la red, es frecuente que sean [bloqueados] [por] [abuso] en diferentes
sitios. Para reducir el riesgo, Tor permite fijar [políticas de salida][politicas] (e.g. bloquear el puerto 25 para anular el spam, limitar el
ancho de banda cedido).

Protege contra ataques de análisis de tráfico
---------------------------------------------

El objetivo de Tor, determinado por su Modelo de amenazas, es proteger contra el análisis de tráfico. Básicamente, Tor dificulta
que un atacante actuando como cliente descubra el destino de una conexión, que un atacante actuando como servidor descubra el
orígen de una conexión, y que un grupo de Retransmisores vinculen al cliente con los destinatarios de sus conexiones.

Promueve activamente la facilidad de uso
----------------------------------------

Los desarrolladores de Tor enfatizan la facilidad de uso del sistema como medida de aumentar el conjunto de anonimato, es decir,
la base de usuario. Con este fin han creado el controlador visual Vidalia, y los paquetes de aplicaciones preconfiguradas que
incluyen en un mismo instalador [Tor], [Vidalia], [Torbutton], [Polipo], [Firefox], y [Pidgin].

Tiene alta visibilidad
----------------------

Tor tiene un gran apoyo de las comunidades de académicos (que repercute, por ejemplo, en papers y estudios formales sobre su
funcionamiento) y hackers (que colaboran, entre otras cosas, en correcciones de bugs, aplicaciones relacionadas, usabilidad).
Periódicamente obtiene fondos de organizaciones no gubernamentales (e.g. la [EFF]), del gobierno, de universidades y de individuos,
lo que le permite tener desarrolladores pagos tiempo completo. Esta visibilidad ayuda a aumentar la cantidad de usuarios.

Vive en el espacio del usuario
------------------------------

El software de Tor puede instalarse sin privilegios de administrador, no requiere cambios al kernel (en contraposición a otros
enfoques) e incluso existen versiones [portables] para ser ejecutadas sin instalación.

Es multiplataforma
------------------

Existen versiones tanto para los sistemas operativos GNU/Linux, los derivados de BSD, Mac OS X, y Windows (2000, XP, Vista, 7 y
las Server Editions). Esta variedad de plataformas soportadas ayuda a que crezca la base de usuarios.

Está ampliamente documentado
----------------------------

Tiene muy buena [documentación][doc], actualizada y variada y en diversos idiomas. Los protocoles intervinientes están completamente
[detallados], y los encargados del proyecto Tor mantienen una [biblioteca] actualizada de papers sobre anonimato y seguridad.

Es software libre
-----------------

Tor, y todo el software relacionado con el proyecto, está distribuido bajo [licencias libres]. Además de la [importancia] general que
tiene el desarrollo de software libre, es específicamente importante en el caso de las redes de anonimato. Que sea libre permite
la auditoría por parte del cliente y de los interesados en general, así como la subsistencia al actual grupo de desarrolladores.
El hecho de que el funcionamiento interno del programa sea conocido por todos, incluso por los atacantes, no le quita seguridad al
mismo, de acuerdo al [Principio de Kerckhoff] (“Un sistema criptográfico debe ser seguro incluso si todo, excepto la clave, es
conocido públicamente”) y a la [máxima de Shannon][Shannon] (“El enemigo conoce el sistema”).

Tiene una gran base de usuarios
-------------------------------

Esto se debe a que los desarrolladores han [entendido] que el número de usuarios participantes en un sistema de anonimato es tanto o
más importante que las características técnicas que protegen la privacidad. Activamente buscan facilitar el ingreso, bajando
barreras técnicas, promoviendo a Tor, investigando, haciéndolo portable a distintas plataformas, mejorando su interfaz, etc.

[1]: #es-una-red-superpuesta-sobre-internet
[2]: #protege-contra-ataques-de-anlisis-de-trfico
[3]: #promueve-activamente-la-facilidad-de-uso
[4]: #tiene-alta-visibilidad
[5]: #vive-en-el-espacio-del-usuario
[6]: #es-multiplataforma
[7]: #est-ampliamente-documentado
[8]: #es-software-libre
[9]: #tiene-una-gran-base-de-usuarios
[bloqueados]: http://en.wikipedia.org/wiki/User_talk:85.214.68.153
[por]: http://en.wikipedia.org/wiki/User_talk:81.175.61.4
[abuso]: http://en.wikipedia.org/wiki/User_talk:212.42.236.140
[politicas]: https://www.torproject.org/faq#ExitPolicies
[Tor]: ../ecosistema/#tor
[Vidalia]: ../ecosistema/#vidalia
[Torbutton]: ../ecosistema/#torbutton
[Polipo]: ../ecosistema/#polipo
[Pidgin]: http://www.pidgin.im/
[Firefox]: http://www.mozilla-europe.org/es/firefox/
[EFF]: http://www.eff.org/
[portables]: http://portabletor.sourceforge.net/
[doc]: http://www.torproject.org/documentation.html.es
[detallados]: http://gitweb.torproject.org/tor.git?a=blob_plain;hb=HEAD;f=doc/spec/tor-spec.txt
[biblioteca]: http://freehaven.net/anonbib/
[licencias libres]: http://www.torproject.org/eff/tor-legal-faq.html#License
[importancia]: http://www.cignux.org.ar/saravia.htm
[Principio de Kerckhoff]: http://en.wikipedia.org/wiki/Kerckhoffs%27_principle
[Shannon]: http://en.wikipedia.org/wiki/Claude_Shannon#Shannon.27s_maxim
[entendido]: http://freehaven.net/doc/fc03/econymics.pdf
