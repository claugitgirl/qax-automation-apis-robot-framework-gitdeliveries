
Feature: Validar funcionalidades principales de la API de Usuarios
  Como tester de APIs
  Quiero poder listar usuarios, registrar nuevos usuarios y realizar login en el sistema de prueba
  Para asegurarme de que la API funcione correctamente y que los datos de usuario sean consistentes.

Scenario 1: Listar usuarios correctamente
  Given la API está disponible en el endpoint "GET /api/users"
  When realizo una solicitud GET a "/api/users"
  Then la respuesta debe tener el código de estado 200
  And la respuesta debe contener una lista de usuarios no vacía
  And cada usuario debe incluir los campos "id", "first_name", "last_name" y "email"

Scenario 2: Registrar un nuevo usuario exitosamente
  Given la API está disponible en el endpoint "POST /api/register"
  And tengo un payload válido con los datos:
    | email               | password   |
    | testuser@mail.com   | 12345      |
  When envío la solicitud POST a "/api/register" con el payload anterior
  Then la respuesta debe tener el código de estado 200
  And la respuesta debe contener los campos "id" y "token"


Scenario 3: Iniciar sesión con credenciales válidas
  Given la API está disponible en el endpoint "POST /api/login"
  And tengo un payload válido con las credenciales:
    | email               | password   |
    | testuser@mail.com   | 12345      |
  When envío la solicitud POST a "/api/login" con el payload anterior
  Then la respuesta debe tener el código de estado 200
  And la respuesta debe contener un campo "token" válido



