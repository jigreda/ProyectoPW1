INTEGRANTE:JAIME DANIEL IGREDA ALVARADO
ESTE PROYECTO PERMITE CREAR CUENTAS , INICIAR SESION Y COMO FUNCION PRINCIPAL TIENE EL PODER 
AGREGAR PAGINAS Y/O ARTICULOS
EL INDEX.HTML TIENE COMO OPCIONES EL INCIO , IDENTIFICAR Y CREAR CUENTA
EN CREAR CUENTA: PODEMOS REGISTRARNOS EN ESA PARTE ES DONDE USE LAS VARIABLES DE SESION
EN IDENTIFICARSE: PODEMOS INICAR SESION CON NUESTRA CUENTA CREADA, AQUI TAMBIEN USE LAS VARIABLES DE SESION
LUEGO DE IDENTIFICARNOS PODEMOS HACER USO PLENO DE LA PAGINA, ES DECIR PODEMOS AGREGAR LA CANTIDAD DE PAGINAS QUE QUERAMOS Y ESTAS SE GUARDARAN EN UNA BASE DE DATOS
LAS OPCIONES AL CREAR NUESTRAS PAGINAS SON: CREAR PAGINA, EDITAR Y ELIMINAR
CREAR PAGINA: NOS MUESTRA UN FORMULARIO PARA INGRESAR EL TITULO Y CONTENIDO, TENEMOS 2 BOTONES ENVIAR Y CANCELAR
SI LA PAGINA SE GUARDO CORRECTAMENTE TENDREMOS LAS OPCIONES
EDITAR[E]: NOS PERMITE EDITAR EL CONTENIDO DE NUESTRA PAGINA
ELIMINAR[X]: NOS PERMITE ELIMINAR LA PAGINA DE LA BASE DE DATOS Y YA NO ESTARA DISPONIBLE(NO SE MOSTRARA)
CREATE DATABASE ToyStoreApp;
DIAGRAMA DE LA BASE DE DATOS
Tablas:
users:
id (INT, PRIMARY KEY, AUTO_INCREMENT)
usuario (VARCHAR(50), UNIQUE, NOT NULL)
password (VARCHAR(255), NOT NULL)
first_name (VARCHAR(50), NOT NULL)
last_name (VARCHAR(50), NOT NULL)
articles:
id (INT, PRIMARY KEY, AUTO_INCREMENT)
usuario_id (INT, NOT NULL, FOREIGN KEY: referencia users(id))
titulo (VARCHAR(100), NOT NULL)
cuerpo (TEXT, NOT NULL)
UNIQUE(usuario_id, titulo)