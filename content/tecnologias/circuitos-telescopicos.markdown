---
titulo: Circuitos telescópicos 
---

Circuitos telescópicos
======================

Los circuitos telescópicos son el nucleo de la segunda generación del Enrutamiento de [cebollas]: [Tor] reemplaza la creación de
circuitos en un sólo paso de su antecesor por la creación en etapas, extendiendo el circuito un salto a la vez y negociando con
cada uno una clave de sesión temporal, a través del túnel creado con su anterior. Este esquema supera varias desventajas del
anterior, como la posibilidad de que el cliente sepa cuando un nodo que ha seleccionado no responde, o la vulnerabilidad a ataques
de [predecesor].

Creación de circuitos
---------------------

1. El proceso de creación de circuitos es el siguiente: [Alice][nombres] elige un nodo de entrada a la red (también llamados entry guards) y
   crea una conexión [TLS] a la misma. Una vez realizada la conexión, ambos determinan un secreto compartido usando el algoritmo
   [Diffie-Hellman]. Este secreto es la clave de sesión efímera usada por ambos para encriptar y desencriptar las celdas transmitidas
   de uno a otro, formando un túnel.

2. Ahora Alice tiene un túnel que llega al nodo de entrada. A través del mismo, realiza una conexión TLS con el siguiente nodo del
   circuito, y nuevamente negocia un secreto compartido que servirá de clave de sesión mientras dure el circuito. Ahora Alice tiene
   un túnel al segundo nodo que atraviesa el túnel ya creado al primer nodo (se empieza a ver por qué el diseño se llama de circuitos
   telescópicos).

3. La sucesiva extensión del circuito y creación de túneles continúa mientras el cliente lo desee. En la actual implementación de
   Tor, la extensión de los circuitos está [fijada] en 3 saltos.

4. Una vez creados todos los túneles,  Alice envía un mensaje al último nodo del circuito (nodo de salida o exit node) pidiéndole que
   acceda al servicio de [Bob][nombres]. Como cada nodo sólo sabe de su antecesor y su posterior, este nodo no conoce la identidad de quien
   solicita la conexión, o sea, no sabe para quién está creándola.


Ahora Alice puede empezar a enviar datos, cifrados con cada clave de sesión en el orden inverso al que van a ser recorridos los
nodos, a través de estos mismos. Al llegar a cada nodo, la capa de encriptación correspondiente es removida, tal como ocurría con
las cebollas, hasta el nodo de salida, que envía el flujo hacia Bob. Hay que aclarar que los datos entre el nodo de salida y Bob
no están cifrados por Tor. Si dicha propiedad es importante (y debería serlo para alguien que está usando Tor para obtener
anonimato) es necesario usar otras herramientas como [Privoxy] junto con Tor.

[cebollas]: cebollas/
[Tor]: http://www.torproject.org/
[predecesor]: /criptografia/ataques/
[nombres]: /criptografia/nombres/
[TLS]: http://es.wikipedia.org/wiki/Transport_Layer_Security
[Diffie-Hellman]: http://es.wikipedia.org/wiki/Diffie-Hellman
[nombres]: /criptografia/nombres/
[Privoxy]: http://www.privoxy.org/
