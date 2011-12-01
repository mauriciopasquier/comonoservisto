---
titulo: Proxy de un salto
---

Proxy de un salto
=================

Cuando el esfuerzo por anonimizar se concentró en flujos interactivos que requieren baja latencia (i.e.
la navegación web), surgieron los proxies de un salto. Son servidores proxy que concentran una gran
cantidad de flujo entrante, aumentando el conjunto de anonimato (la cantidad de personas entre las que un
usuario determinado está escondiendo su identidad) al tiempo que remueven la información que indica el
origen de los datos y retransmiten. Una buena forma de acceder a los mismos es a través de una conexión
por [VPN], de manera que la conexión inicial esté encriptada.

![3 clientes detrás de un servidor proxy](/imagenes/proxy.png "El servidor proxy oculta a los clientes detrás de una única fachada")

Presentan algunos problemas, como ser un punto único de falla, ser vulnerables a un observador global que
pueda [correlacionar] el tráfico entrante y el saliente, y además, es necesario confiar en que el
servidor proxy sea [honesto].

[VPN]: /sistemas/vpn/
[correlacionar]: /ataques/confirmacion-de-trafico/
[honesto]: https://help.riseup.net/en/vpn
