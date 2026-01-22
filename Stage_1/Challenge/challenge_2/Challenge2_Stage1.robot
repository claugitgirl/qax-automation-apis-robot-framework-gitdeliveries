*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://practice.expandtesting.com/notes/api
${USER_LOGIN}  /users/login

*** Test Cases ***
CP01 - Registro de Usuarios
    [Documentation]    Verifica que se registra un usuario y devuelve 201 con datos correctos.
    ${payload}=    Create Dictionary   name : "Ana Mariasss" , email : "anamariasss@reqres.com",  password : "pistol"
    ${response}=    POST    ${BASE_URL}/users/register    json=${payload}    expected_status=201

    # Validaciones sobre el body
    Should Be Equal    ${response.json()}[message]    User account created successfully
    Should Be Equal    ${response.json()}[success]    true
    Should Be Equal    ${response.json()}[name]       Ana Mariasss
    Should Be Equal    ${response.json()}[email]      anamariasss@reqres.com
    Should Be Equal    ${response.json()}[password]   pistol


CP02 - Login de Usuario

    [Documentation]    Verifica que un POST a users/login develve datos usuario y token.
    ${response}=    POST    ${BASE_URL}${USER_LOGIN}   expected_status=200
    ${login}=    Set Variable    ${response.json()}
    # Validar campos mínimos del usuario
    Should Be Equal    ${login.json()}[message]    Login successfully
    Dictionary Should Contain Key    ${login[0]}    name
    Dictionary Should Contain Key    ${login[0]}    email
    Dictionary Should Contain Key    ${login[0]}    token




