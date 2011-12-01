---
titulo: Tor
---

Tor
===

Específicamente, [Tor] es una red superpuesta orientada a la conexión que usa [circuitos telescópicos][circuitos] para proveer de
anonimato a cualquier aplicación que utilice flujos TCP  para la comunicación. Tor se propone anonimizar el canal de comunicación,
no los datos que lleva (normalmente es usado con otras aplicaciones para aumentar el anonimato). Logra esto creando circuitos que
pasan a través de varios nodos, con la característica de que un nodo n conoce sólo la identidad del nodo `n-1` y del nodo `n+1`, o
sea, el anterior y el posterior en el circuito. El tráfico fluye en forma de celdas  de longitud fija, que viajan envueltas
mediante encriptación simétrica y son “peladas”, como las capas de una cebolla, de nodo a nodo (de ahí el nombre de este tipo de
redes). Acá vemos en detalle cómo es la red, el proceso de conexión y las decisiones de diseño tomadas durante su desarrollo.

Índice
------

* [Propiedades]
* [Modelo de despliegue]
* [Ecosistema]
* [Servicios ocultos en Tor]
* [Problemas conocidos]

[Tor]: http://www.torproject.org/
[circuitos]: /tecnologias/circuitos-telescopicos/
[Propiedades]: propiedades/
[Modelo de despliegue]: modelo-de-despliegue/
[Ecosistema]: ecosistema/
[Servicios ocultos en Tor]: servicios-ocultos/
[Problemas conocidos]: problemas/
