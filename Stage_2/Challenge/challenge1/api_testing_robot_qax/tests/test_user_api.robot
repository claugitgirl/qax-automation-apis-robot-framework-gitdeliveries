*** Settings ***
Documentation  Pruebas para el endpoint/user de la API JSONPlaceholder
Resource    ../resource/keywords/getUser.resource

*** Test Cases ***
Validar Get user
    [Documentation]  Este caso de prueba verifica que, al ejecutar un Get user,
                ...  se recibe una respuesta con código 200 y retorna una lista de usuarios.
    When El usuario ejecuta un GET
    Then El código de respuesta debe ser 200
        And La respuesta debe contener una lista de usuarios
        And deben desplegarse los campos "id" , "name", "username", "email" deben coincidir con lo enviado