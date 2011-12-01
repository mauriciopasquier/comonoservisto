---
titulo: Circuitos telescópicos 
---

Circuitos telescópicos
======================

Los circuitos telescópicos son el nucleo de la segunda generación del Enrutador de [cebollas]: [Tor].
Tor reemplaza la creación de circuitos en un sólo paso de su antecesor por la creación en etapas,
extendiendo el circuito un salto a la vez y negociando con cada uno una clave de sesión temporal, a
través del túnel creado con su anterior. Este esquema mejora varios aspectos del anterior, como la
posibilidad de que el cliente ahora sepa cuando un nodo que ha seleccionado no responde, o la resistencia
a ataques de [predecesor].

Creación de circuitos
---------------------

1.  El proceso de creación de circuitos es el siguiente: [Alice][nombres] elige un nodo de entrada a la red (también llamados entry guards) y
    crea una conexión [TLS] a la misma. Una vez realizada la conexión, ambos determinan un secreto compartido usando el algoritmo
    [Diffie-Hellman]. Este secreto es la clave de sesión efímera usada por ambos para encriptar y desencriptar las celdas transmitidas
    de uno a otro, formando un túnel.
    ![Primer paso de la creación de circuitos](/imagenes/circuito0.png "Se crea un circuito hasta el primer nodo")

2.  Ahora Alice tiene un túnel que llega al nodo de entrada. A través del mismo, realiza una conexión TLS con el siguiente nodo del
    circuito, y nuevamente negocia un secreto compartido que servirá de clave de sesión mientras dure el circuito. Ahora Alice tiene
    un túnel al segundo nodo que atraviesa el túnel ya creado al primer nodo (se empieza a ver por qué el diseño se llama de circuitos
    telescópicos). 
    ![Segundo paso de la creación de circuitos](/imagenes/circuito1.png "Se crea un circuito hasta el segundo nodo, por dentro del primer circuito")

3.  La sucesiva extensión del circuito y creación de túneles continúa mientras el cliente lo desee. En la actual implementación de
    Tor, la extensión de los circuitos está [fijada] en 3 saltos.
    ![Tercer paso de la creación de circuitos](/imagenes/circuito2.png "Se crea un circuito hasta el último nodo por dentro del segundo circuito")

4.  Una vez creados todos los túneles,  Alice envía un mensaje al último nodo del circuito (nodo de salida o exit node) pidiéndole que
    acceda al servicio de [Bob][nombres]. Como cada nodo sólo sabe de su antecesor y su posterior, este nodo no conoce la identidad de quien
    solicita la conexión, o sea, no sabe para quién está creándola.
    ![Circuito completo](/imagenes/circuito3.png "Ahora la comunicación puede tener lugar a través de los circuitos telescópicos")

Ahora Alice puede empezar a enviar datos, cifrados con cada clave de sesión en el orden inverso al que van a ser recorridos los
nodos, a través de estos mismos. Al llegar a cada nodo, la capa de encriptación correspondiente es removida, tal como ocurría con
las [cebollas], hasta el nodo de salida, que envía el flujo hacia Bob. Hay que aclarar que los datos entre el nodo de salida y Bob
no están cifrados. Si dicha propiedad es importante (y debería serlo para alguien que está buscando
permanecer anónimo) es necesario usar otras herramientas que realicen la encriptación, o pedirle a Bob
que tenga una versión encriptada (e.g. con [HTTPS]) de su servicio.

[Tor]: /sistemas/tor/
[cebollas]: /tecnologias/cebollas/
[predecesor]: /ataques/predecesor/
[nombres]: /criptografia/nombres/
[fijada]: https://trac.torproject.org/projects/tor/wiki/TheOnionRouter/TorFAQ#Youshouldletpeoplechoosetheirpathlength.
[TLS]: http://es.wikipedia.org/wiki/Transport_Layer_Security
[Diffie-Hellman]: http://es.wikipedia.org/wiki/Diffie-Hellman
[HTTPS]: https://en.wikipedia.org/wiki/HTTP_Secure
