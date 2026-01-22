Challenge 1: Mi primera Automatizacion de Apis en Request Library.

En este reto vamos a practicar la automatización y prueba de APIs usando la plataforma ReqRes, una API pública para pruebas de usuarios y autenticación.

El objetivo es que los estudiantes construyan sus propios casos de prueba en Postman, explorando tanto operaciones de lectura (GET) como de escritura (POST) y validando respuestas de manera práctica.

Historia de Usuario

Como tester de APIs,
Quiero poder listar usuarios, registrar nuevos usuarios y realizar login en el sistema de prueba,
Para asegurarme de que la API funcione correctamente y que los datos de usuario sean consistentes.

Criterios de Aceptación
Listar usuarios:

GET /api/users debe devolver HTTP 200.
La lista de usuarios no debe estar vacía y cada usuario debe contener id, first_name, last_name y email.
Registro de usuario:

POST /api/register con payload válido devuelve HTTP 200.
La respuesta debe incluir un id y un token.
Login de usuario:

POST /api/login con credenciales válidas devuelve HTTP 200.
La respuesta debe contener un token para autenticación.