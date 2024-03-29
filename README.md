# API-node-con-mysql

## Objetivo

**Utilizando una base de datos MySQL, se crea una API donde se puede crear, modificar, consultar y eliminar libros y autores de una tabla "books" y "authors".**

## Los endpoints de la API son los siguientes:

* GET "/books": Obtiene un listado de toda la tabla "books".
* GET "/authors": Obtiene un listado de toda la tabla "authors".
* GET "/books/:id": Obtiene la información de un libro en particular según su ID, por ejemplo "/books/5"
* GET "/authors/:id": Obtiene la información de un author en particular según su ID, por ejemplo "/authors/5"
* POST "/books": Crea un nuevo libro según la información suministrada por el usuario.
* POST "/authors": Crea un nuevo author según la información suministrada por el usuario.
* PUT "/books/:id": Modifica los datos de un libro en particular según su ID.
* PUT "/authors/:id": Modifica los datos de un author en particular según su ID.
* DELETE "/books/:id": Elimina un libro de la vista. (Se cambia el status a 0)


## Instalación
* Clonar el proyecto con **git clone https://github.com/gsuruguay/API-node-con-mysql.git**
* Importar la DB contenida en la carpeta "Database"
* Modificar los datos de acceso a la DB local.
* Ejecutar por consola desde la carpeta raiz del proyecto **npm install** para instalar las dependencias usadas (express, mysql, express-myconnection).
* Se accede por **http://localhost:3333/**


