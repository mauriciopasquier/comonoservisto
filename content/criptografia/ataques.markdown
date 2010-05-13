---
titulo: Ataques comunes
---

Ataques comunes
===============

Análisis de tráfico
-----------------------------

El análisis de tráfico consiste en observar el comportamiento y las características del tráfico, en vez del contenido del mismo.
La encriptación no ayuda, ya que los métodos comunmente usados no tratan de ofuscar la cantidad de datos transmitidos, por lo que
el atacante puede determinar, además de quiénes son el remitente y destinatario, cuál es el tamaño de los mensajes intercambiados.

Confirmación de tráfico
---------------------------------

Es un ataque pasivo en el que el adversario confirma que los dos extremos de una comunicación (i.e. Alice y Bob) al observarlos y
correlacionar las características (e.g. tamaño, frecuencia) del tráfico saliente de Alice con las del tráfico entrante de Bob.

Intersección
----------------------

Este ataque es realizado a largo plazo, y consiste en la determinación, con una buena probabilidad, del comportamiento o perfil de
los distintos usuarios y las relaciones entre ellos, mediante el estudio de los patrones de uso a lo largo del tiempo. Por
ejemplo, el hecho de que no todo el mundo está mandando mensajes todo el tiempo es una fuga de información para un atacante
dispuesto a esperar.

Predecesor
--------------------

Este ataque permite descubrir quién es el cliente en base al proceso de creación de circuitos. El atacante contabiliza las veces
en que cada nodo aparece en un circuito, con la consecuencia de que el nodo que más veces aparezca es probablemente un cliente de
la red.

Maleabilidad
----------------------

Cuando la integridad del flujo de datos no es confirmada debidamente, surge la posibilidad de este ataque. Consiste en que, aunque
el atacante no puede descifrar las celdas, cualquier cambio a los datos encriptados crea cambios correspondientes en los datos que
dejan la red. Esto permite, por ejemplo, que el atacante cambie la dirección de destino de una celda, o cambie un comando FTP de
`dir` a `rm *`.

Ataque de Sybil
---------------

El [ataque de Sybil], llamado así por la protagonista de un libro sobre una [mujer] con desórden de personalidades múltiples, consiste
en corromper un sistema distribuido o de reputación creando una gran cantidad de usuarios falsos, todos controlados por el mismo
atacante, con el fin de corromper el sistema e influir en las decisiones tomadas en forma distribuida.

[ataque de Sybil]: http://www.cs.rice.edu/Conferences/IPTPS02/101.pdf
[mujer]: http://es.wikipedia.org/wiki/Sybil
