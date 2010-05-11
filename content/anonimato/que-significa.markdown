---
title: ¿Qué significa el anonimato?
---

¿Qué significa el anonimato?
===============

La comunicación entre clientes y servidores en internet funciona principalmente mediante la pila de protocolos TCP/IP. En este
modelo, cada host (cada equipo conectado a la red, funcione tanto de cliente como de servidor) necesita una dirección IP,
prácticamente única. Esta dirección es un identificador global en internet, lo que significa que, mientras dure nuestra conexión,
todas nuestras acciones están relacionadas por esa dirección IP. No es posible conectarse a internet sin una.

La asignación de direcciones se realiza a través de entes reguladores (e.g. [LACNIC][]), que habilitan a distintas organizaciones o
empresas, en especial a los Proveedores de Servicio de Internet (ISP), a administrar un rango de IPs. A su vez, los ISPs
distribuyen estas direcciones entre sus clientes, ya sea asignando permanentemente una misma IP a un mismo cliente (IP estática) o
asignando una IP tomada al azar entre las disponibles en el momento (IP dinámica). Es así como a través de una IP se puede obtener
gran variedad de información sobre el host, como por ejemplo una localización geográfica bastante aproximada o el historial de
navegación desde dicha dirección. Son datos como estos los que ponen de manifiesto que no somos anónimos al conectarnos a
internet. Aunque es ampliamente utilizado el uso de pseudónimos (e.g. nicknames, cuentas de usuario), que permiten mantener una
comunicación periódica con anonimato, para esto debe ser imposible vincular el pseudónimo con el usuario real.

Un atacante podría fácilmente averiguar información privada interceptando las conexiones TCP que se realizan desde nuestra máquina
a internet, o desde internet hasta un servidor, y en ambos casos recorrer la ruta inversa de los paquetes de datos hasta llegar al
otro extremo de la conexión, descubriendo así que [Alice][] se conecta con [Bob][], o que Bob recibe conexiones de Alice. Por otro lado,
puede no existir un atacante, sino que simplemente nosotros deseamos permanecer anónimos a un determinado servicio. En términos
simples, ser anónimo en internet quiere decir que no se puede determinar que uno es el origen y/o el destino de cierta conexión
que ha interceptado. Esto se logra ocultando la información que proveen los paquetes IP.

[LACNIC]: http://lacnic.net/
[Alice]: http://es.wikipedia.org/wiki/Alice_y_Bob
[Bob]: http://es.wikipedia.org/wiki/Alice_y_Bob
