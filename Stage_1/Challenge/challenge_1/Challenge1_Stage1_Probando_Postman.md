Feature: Gestion de Usuarios en la API https://practice.expandtesting.com/notes/api

  Como tester de APIs,
  Quiero poder regisrar usuarios y realizar login en el sistema de prueba,
  Para asegurarme de que la API funcione correctamente y que los datos de usuario sean consistentes.

Scenario: CP01 - Registro de Usuarios

    Given la API está disponible en "https://practice.expandtesting.com/notes/api/users/register"
    When realizo una petición POST a "/api/users/register" con el body:
      """
      {
    "email": "claudia@reqres.com",
    "password": "pistol"
      }
      """
    Then el código de respuesta debe ser 201
    And el campo success es True.
    And los campos Nombre y email deben ser iguales a los enviados
    And debe existir el campo id

  Scenario: CP02 - Login de Usuario

    Given la API está disponible en "https://practice.expandtesting.com/notes/api/users/login"
    When realizo una petición GET a "/api/users"
    And el campo success es True.
    Then el código de respuesta debe ser 200
    And los campos Nombre y correo deben ser iguales a los enviados
    And debe desplegarse un tokenentregado por el sistema.

  