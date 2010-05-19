---
titulo: Servicios ocultos
---

Servicios ocultos
=================

Ya vimos cómo [logra] un usuario conectado a Tor (Alice) ser anónimo para el servicio (Bob) al que accede. Pero, ¿qué pasa si es Bob el que
desea permanecer anónimo? Para esto existen los **servicios ocultos** o de ubicación oculta (location-hidden services). Mediante un
servicio oculto, es posible ofrecer un servidor en la red Tor sin una IP que lo identifique, con la concesión de accederlo a través de Tor.

Cómo funcionan, paso a paso
---------------------------

Supongamos que Bob quiere ofrecer un servidor web anónimo. Después de [configurar] el servicio, Tor genera una par de claves
pública/privada que lo identifican. Con la clave pública, genera un digest, que forma parte de la dirección del servicio
(e.g. `l73fuoioj5hzznxc`), junto con el pseudo dominio de nivel superior (pseudo TDL) `.onion`, dando como resultado la dirección por
la que se accede al servicio: `http://l73fuoioj5hzznxc.onion`.

![Paso 0](/imagenes/servicio0.png "Una red Tor, con clientes y relays")

Para lograr la alcanzabilidad del servicio en la red Tor, el **primer paso** es elegir, aleatoriamente, un grupo de Routers de
Cebollas (Onion Routers) para que sirvan de **Puntos de Presentación** (Introduction Points) y generar circuitos Tor (o sea, de 3
saltos, encriptados) a cada uno de ellos.

![Paso 1](/imagenes/servicio1.png "Bob agrega amigos a su perfil")

El **segundo paso** es crear un **Descriptor del servicio**, que incluye: la dirección `.onion`, el/los puertos por los que se accede al
servicio, una descripción textual opcional y la dirección de los Puntos de Presentación, y firmado con la clave privada. Después
es enviado a una [tabla hash distribuida], una base de datos de donde cualquier nodo o cliente puede obtener el Descriptor.

![Paso 2](/imagenes/servicio2.png "Bob actualiza su perfil con sus amigos y sus actividades, pero no su ubicación")

Ahora un cliente (Alice) desea conectarse al servicio. Asumimos que ya conoce la dirección, tal vez porque la vió en un [índice de
servicios ocultos][indice] o Bob se la dijo. Como **tercer paso**, Alice descarga el Descriptor del servicio de la base de datos distribuida y
obtiene la dirección de los Puntos de Presentación.

![Paso 3](/imagenes/servicio3.png "Alice ve el perfil de Bob")

Para el **cuarto paso** Alice ha creado un circuito Tor hasta un nodo cualquiera, pidiendole que actúe como Punto de Encuentro. Para
esto, le comunica un secreto de un sólo uso, generado para este encuentro.

![Paso 4](/imagenes/servicio4.png "Alice va al Punto de Encuentro")

**Quinto paso**: ahora Alice crea un mensaje de Presentación, encriptado con la clave pública del servicio oculto, que incluye la
dirección del Punto de Encuentro y el secreto de un sólo uso, y le pide a alguno de los Puntos de Presentación que se lo envíe al
servicio oculto.

![Paso 5](/imagenes/servicio5.png "Alice le pide a algún amigo de Bob que le envíe un mensaje")

En el **sexto paso** el servicio oculto desencripta el mensaje y obtiene la dirección del Punto de Encuentro y el secreto. Crea un
circuito Tor hacia dicho Punto de Encuentro y le envía el secreto.

![Paso 6](/imagenes/servicio6.png "Bob va al Punto de Encuentro")

En el **séptimo y último paso**, el Punto de Encuentro notifica a Alice de la conexión establecida, y ambos pueden empezar a
comunicarse a través de sus circuitos Tor de manera normal. El Punto de Encuentro simplemente reenvía los paquetes que le llegan,
que están encriptados de punta a punta.

![Paso 7](/imagenes/servicio7.png "Se ha forrrrrmado una pareja!")

Es importante aclarar que los Puntos de Presentación no son usados en la comunicación final para evitar que un sólo retransmisor
sea completamente responsable del servicio oculto.


Configuración de Servicios Ocultos
----------------------------------

Esta es la configuración paso a paso de un servicio oculto de ejemplo. Es prerequisito tener Tor funcionando. En este ejemplo vamos a proveer
un servicio web con el servidor web [thttpd], en linux. Se sugiere este servidor web por ser bastante localizado y pequeño, deja
poca huella y es liviano. Además, es recomendable usar un servidor web dedicado para el servicio oculto, por razones de seguridad.

### Pasos

1. Instalar e iniciar el servidor web
   1. Descargar la última versión (al momento de escribir esto es la [2.25b].)
   2. Descomprimir el archivo

          tar -xzvf thttpd-2.25b.tar.gZ

   3. Ir al directorio creado (`thttpd-2.25b`) y compilar

          ./configure && make

   4. Crear el document-root del servicio

          mkdir servicio; cd servicio

   5. En este directorio ponemos los archivos a servir
   6. Arrancar el servidor web escuchando un puerto cualquiera

          ../thttpd -p puerto -h localhost

2. Configurar el servicio oculto
   1. Abrir el archivo `torrc` y buscar la parte de los servicios ocultos
   2. Agregar
 
          HiddenServiceDir /home/usuario/servicio/

      siendo `usuario` el que ejecutará Tor, y
 
          HiddenServicePort 80 127.0.0.1:puerto/

      siendo `puerto` el que se eligió anteriormente
   3. Guardar el archivo de configuración y reiniciar Tor

En este momento Tor crea, en el `HiddenServiceDir` elegido el par de claves pública/privada y el archivo `hostname`, que es donde se
ubica la dirección `.onion` del servicio.

Es posible configurar muchos servicios ocultos en una misma máquina, y para cada servicio oculto es posible configurar varios
puertos virtuales (como el puerto `80` en el ejemplo) donde Tor interceptará las llamadas y redigirá al puerto real configurado.


[logra]: /tecnologias/circuitos-telescopicos/
[configurar]: #configuracin-de-servicios-ocultos
[tabla hash distribuida]: http://es.wikipedia.org/wiki/Tabla_de_Hash_Distribuido
[indice]: http://anegvjpd77xuxo45.onion/services/
[thttpd]: http://www.acme.com/software/thttpd/
[2.25b]: http://www.acme.com/software/thttpd/thttpd-2.25b.tar.gz
