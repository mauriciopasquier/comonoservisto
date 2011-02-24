---
titulo: Modelo de despliegue
---

Modelo de despliegue
====================

Acá hemos visto la [tecnología] de Tor para la creación de circuitos, las [propiedades] principales de la red y las diferentes
[aplicaciones] que le dan forman. ¿Pero cómo funciona todo en conjunto?

El componente principal del modelo es Tor en sí. Como ya se ha visto, cada instalación de Tor puede funcionar tanto en forma de
cliente (Onion Proxy) como de retransmisor (Onion Router). Es sólo cuestión de una pequeña [configuración]. Nada impide a un usuario que quiera acceder
a la red Tor como cliente administrar su propio Retransmisor, y de hecho, puede [beneficiar] su anonimato. El perjuicio es que se
comparte el ancho de banda con los demás usuarios de la red, pero como ya se ha probado, un mejor servicio aumenta la seguridad
para todos, al aumentar el conjunto de anonimato.

Otra parte fundamental del modelo es algo que anonimizar. Cualquier aplicación que use flujos TCP es plausible de conectarse a
Tor, mediante [SOCKS]. Si una aplicación no utiliza SOCKS o no lo utiliza [correctamente], puede interponerse un proxy entre Tor y la
aplicación que traduzca dicho protocolo.

Cuando una aplicación necesita a conectarse a la red Tor, primero busca un retransmisor de salida con las políticas adecuadas a la
conexión que desea realizar. Esto lo hace mediante las Autoridades de Directorio, que guardan dicha y otra información referida a
los Retransmisores. No cualquiera puede convertirse en Autoridad de Directorio; se determina si es posible, para cada
administrador de Retransmisor, en base al mérito obtenido en el sistema. Actualmente hay seis de estas Autoridades, que replican
la información que manejan en los demás Retransmisores para evitar cuellos de botella en el sistema. Si hay diferencias entre las
decisiones de las Autoridades, el cliente decide por la opinión mayoritaria.

El siguiente paso es [crear el circuito][tecnologa]. Una vez hecho esto, se transmiten los datos encriptados simétricamente, y el nodo de
salida puede empezar a transmitir el flujo TCP al destinatario. Esta misma conexión sirve para las respuestas del mismo. Tor
permite multiplexar varios flujos TCP por un mismo circuito, para minimizar el impacto del tiempo de creación en el retardo de la
conexión.


[tecnologa]: /tecnologias/circuitos-telescopicos/
[propiedades]: ../propiedades/
[aplicaciones]: ../ecosistema/
[configuracin]: https://trac.torproject.org/projects/tor/wiki/TheOnionRouter/TorFAQ#SoIcanjustconfigureanicknameandORPortandjointhenetwork
[beneficiar]: https://trac.torproject.org/projects/tor/wiki/TheOnionRouter/TorFAQ#DoIgetbetteranonymityifIrunarelay
[SOCKS]: http://es.wikipedia.org/wiki/SOCKS
[correctamente]: ../problemas/#solicitudes-dns-por-fuera-de-tor
