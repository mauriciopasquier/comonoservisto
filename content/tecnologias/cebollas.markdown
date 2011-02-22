---
titulo: Enrutamiento de cebollas 
---

Enrutamiento de cebollas
========================

Algo más complejos que los [proxies de un salto][proxy] son los sistemas de confianza distribuida orientados a la conexión. Con estos
sistemas el usuario establece una conexión encriptada punto a punto bidireccional, y envía a través de la misma los datos en forma
de celdas de tamaño fijo.

Establecer los circuitos es caro computacionalmente y suele requerir criptografía de clave pública, mientras que retransmitir las
celdas es comparativamente gratis y normalmente sólo requiere encriptación simétrica. Dado que un circuito atraviesa varios
servidores y cada servidor sólo conoce a los adyacentes en el circuito, ningún servidor puede vincular a las partes ([Alice y
Bob][nombres])
de la comunicación.

El [Enrutamiento de cebollas][cebollas] pertenece a este tipo de estos sistemas. La creación de un circuito en este diseño involucra la
propagación de un mensaje inicial que tiene la forma de una estructura de datos especial ([patentada] en Estados Unidos), la
cebolla, que consiste en una capa de encriptación por cada nodo que vaya a formar parte del circuito (predeterminados por el
creador del circuito). Una vez removida su capa correspondiente, el Router de cebollas descubre la dirección del siguiente nodo y
una clave de sesión que será usada para la encriptación simétrica con el cliente. Entonces reenvía la estructura de datos al
siguiente salto. Una vez formado el circuito, el cliente puede enviar celdas de datos mediante encriptación simétrica con las
claves de sesión.

![Un circuito de cebollas](/imagenes/cebolla.png "Cada intermediario remueve una capa de la cebolla")

[proxy]: /tecnologias/proxy/
[nombres]: /criptografia/nombres/
[cebollas]: http://www.onion-router.net/
[patentada]: http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=6266704.PN.&OS=PN/6266704&RS=PN/6266704
