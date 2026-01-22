*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
CP01 - Crear un nuevo post
    [Documentation]    Verifica que un POST a /posts cree un recurso y devuelva 201 con datos correctos.
    ${payload}=    Create Dictionary    title=Mi primer post    body=Contenido de prueba    userId=1
    ${response}=    POST    ${BASE_URL}/posts    json=${payload}    expected_status=201
    # Validaciones sobre el body
    Dictionary Should Contain Key    ${response.json()}    id
    Should Be Equal    ${response.json()}[title]    Mi primer post
    Should Be Equal    ${response.json()}[body]     Contenido de prueba
    Should Be Equal As Integers    ${response.json()}[userId]    1

CP02 - Listar usuarios
    [Documentation]    Verifica que un GET a /users devuelva lista no vacía con campos esperados.
    ${response}=    GET    ${BASE_URL}/users    expected_status=200
    ${users}=    Set Variable    ${response.json()}
    # Validar campos mínimos del primer usuario (se asume que la estructura es homogénea)
    Dictionary Should Contain Key    ${users[0]}    id
    Dictionary Should Contain Key    ${users[0]}    name
    Dictionary Should Contain Key    ${users[0]}    username
    Dictionary Should Contain Key    ${users[0]}    email

CP03 - Listar comentarios de un post
    [Documentation]    Verifica que un GET a /comments?postId=1 devuelva comentarios con campos esperados.
    ${response}=    GET    ${BASE_URL}/comments    params=postId=1    expected_status=200
    ${comments}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${comments[0]}    id
    Dictionary Should Contain Key    ${comments[0]}    name
    Dictionary Should Contain Key    ${comments[0]}    email
    Dictionary Should Contain Key    ${comments[0]}    body