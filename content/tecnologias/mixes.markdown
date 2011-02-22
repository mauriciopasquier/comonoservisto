---
titulo: Mixes o mix networks
---

Mixes o mix networks
====================

Los mixes o redes de mezcla se retrotraen a los inicios de la década del ’80. Inventados por [David Chaum], usan una cadena de
servidores proxy para crear una instancia de comunicación difícil de rastrear.

Básicamente, funcionan de la siguiente manera: el mensaje a enviar (A) es encriptado por el cliente con la clave pública de cada
uno de los servidores proxy a recorrer. Luego es enviado al primer proxy de la cadena, el cual remueve su capa de encriptación, lo
demora en espera de más mensajes (B, C y D), y los reenvía al siguiente proxy de la cadena en un orden distinto al de llegada,
hasta que el último proxy obtiene el mensaje original y lo envía a destino.

Gracias a la encriptación en capas entre proxies y a la demora y reordenamiento los ataques de confirmación de tráfico, un
observador no puede determinar qué mensaje de salida corresponde a qué mensaje de entrada (específicamente, se evitan los ataques
de [análisis de tráfico][analisis] y de [confirmación de tráfico][confirmacion]). Se utiliza una cadena de proxies para disminuir
la probabilidad de que el servidor esté controlado por un atacante (si al menos uno de los servidores de la cadena es honesto, se
preserva algo de anonimato).

El problema que acarrea este enfoque es la altísima latencia que tiene la red, dado que se utiliza encriptación de clave pública
en cada salto, además de las demoras voluntarias. Es útil para aplicaciones como el email, que no requieren respuestas en tiempo
real.

Las mejoras sobre el trabajo de Chaum se orientaron en dos direcciones: reducir la latencia para poder anonimizar tráfico
interactivo, o aumentar y hacer variable la latencia para maximizar el anonimato contra atacantes globales. [Mixminion] es una de
las últimas versiones de este segundo enfoque: un protocolo anónimo de reenvío basado en mensajes.

[David Chaum]: http://en.wikipedia.org/wiki/David_Chaum
[analisis]: /ataques/analisis-de-trafico/
[confirmacion]: /ataques/confirmacion-de-trafico/
[Mixminion]: http://mixminion.net/
