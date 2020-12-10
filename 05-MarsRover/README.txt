Observaciones:

Nuestra primera solucion fue quitar los ifs del proceso de comandos mediante polimorfismo.
Esto nos llevo a crear una jerarquia con un total de 6 clases para reemplazar cuatro ifs,
donde cada clase solo respondia uno o dos mensajes, lo que en vez de simplifcar, complico
la resolucion.

Decidimos volver a resolver los comandos como antes, y los ifs relacionados al manejo de 
los puntos cardinales con mensajes y variables de clase. Fue pensado asi porque modelamos
el MarsRover como un objeto que no solo tiene una posicion y un punto cardinal, si no tambien
una direccion. Basado en esta direccion modelamos un offset para el desplazamiento y un offset
para la rotacion, con variables y mensajes de clase, ya que son independientes de las instancias.
