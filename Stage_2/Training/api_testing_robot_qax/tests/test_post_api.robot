*** Settings ***
Documentation  Pruebas para el endpoint /posts de la API JSONPlaceholder
Resource    ../resource/keywords/doPost.resource

*** Test Cases ***
Validar creación exitosa de un nuevo post
    [Tags]  test
    [Documentation]  Este caso de prueba verifica que, al crear un nuevo post,
                ...  se recibe una respuesta con código 201, que contiene un campo "id" generado
                ...  y que los campos "title", "body" y "userId" coinciden con la información enviada.
    When El usuario crea un nuevo post
    Then El código de respuesta debe ser 201
        And La respuesta debe contener un campo "id"
        And Los campos "title", "body" y "userId" deben coincidir con lo enviado

