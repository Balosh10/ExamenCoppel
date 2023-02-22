Examen técnico
Lee atentamente las instrucciones, y si tienes alguna duda contacta a la persona que lleva tu seguimiento para que pueda apoyarte.
Objetivo:
- Crear una aplicación móvil que cumpla con las vistas y funcionalidades listadas a continuación; así como con los requerimientos técnicos indicados.
Recursos técnicos:
- Documentación de API: https://developers.themoviedb.org/3/authentication 1. VistaLogin
Se requiere implementar un servicio para consultar usuario y contraseña; Y llevar a cabo la autenticación del usuario para poder entrar.
Copyright © 2021 Coppel Todos los derechos reservados
Información privilegiada o confidencial puede ser contenida en este documento y estar sujeta a propiedad intelectual. El acceso a este documento por cualquier persona que no sea el previsto no está autorizado. Ninguna parte de esta publicación se puede reproducir, almacenar o distribuir sin el permiso previo por escrito de Coppel.
  
   Se debe mostrar un modal “cargando”, para informar al usuario que se está realizando la conexión y autenticación del usuario.
En caso de error, deberá mostrar el mensaje de error debajo del botón Log In.
 COPPEL | DIVISIÓN OMNICANAL - Examen Técnico Pág. 1 Todos los derechos reservados.

   2. VistaMovies
Una vez que se realice la autenticación del usuario de forma satisfactoria, se debe dirigir al usuario a la vista “Movies” en donde se mostrará el siguiente diseño:
Se debe considerar:
- Mostrar categorías de las películas
- Mostrar las películas de acuerdo a la categoría seleccionada
● Mostrar en forma de grid y scroll vetical - Mostrar:
● Imágen, título, fecha, calificación y descripción de cada película.
COPPEL | DIVISIÓN OMNICANAL - Examen Técnico
Todos los derechos reservados.
 Pág. 2

   3. VistaDetalledePelícula
Al seleccionar una película, se debe dirigir al usuario a una vista donde se muestre el detalle de la misma.
Se debe considerar:
● Mostrar al menos 6 datos de la película seleccionada.
● Agregar un collection con las imágenes de las compañías productoras.
Para esta vista, Tú decides el diseño.
4. Navigationbar
Debe contar con la opción en navigation bar, para ver el perfil del usuario o cerrar la sesión en la app de la siguiente manera.
COPPEL | DIVISIÓN OMNICANAL - Examen Técnico Pág. 3 Todos los derechos reservados.
  
   5. Perfil
Al abrir la pantalla de Perfil se debe mostrar al usuario su información básica.
En caso que aplique, debajo se debe mostrar un carrusel con el listado de películas del usuario como se muestra a continuación.
 COPPEL | DIVISIÓN OMNICANAL - Examen Técnico Pág. 4 Todos los derechos reservados.

  Requerimientos técnicos obligatorios:
● El lenguaje de programación utilizado debe ser swift.
● Seguir la estructura y componentes de la vista propuesta.
● Implementar alguna arquitectura diferente a mvc.
● Reutilizar componentes.
● No utilizar Alamofire.
● No utilizar Swift UI.
● No tener texto hardcodeado.
Requerimientos técnicos opcionales (Agregan Plus):
● Realizar el diseño de la aplicación utilizando puro código, sin utilizar .xib y/o
storyboard.
● La vista “Detalle de Película” podrá contar con un botón de Favoritos para
marcar algunas películas como favoritas y almacenarlas de manera local (CoreData, sqlite, etc.). Se deja a consideración lo que se quiera utilizar, y mostrarlos en un tabBar o con un botón en el navigationBar.
● Adaptar el diseño para que sea posible agregar películas a favoritos desde el listado de películas.
● Si la película tiene videos, mostrarlos en un collectionview de manera que se puedan reproducir.
Envío y entrega del exámen:
● Subir el proyecto al sistema de control de versiones personal (github, gitlab).
● Enviar por correo: URL del repositorio, Fecha de Inicio y Fecha de terminación
del exámen.
● Compartir las credenciales para acceder a la app (usuario, contraseña).
  COPPEL | DIVISIÓN OMNICANAL - Examen Técnico Pág. 5 Todos los derechos reservados.
