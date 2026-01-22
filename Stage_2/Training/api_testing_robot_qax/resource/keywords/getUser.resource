*** Settings ***
[Documentation]  Acciones para realizar una petición tipo GET
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../variables/setup.resource


*** Variables ***
${ENDPOINT_USER}   ${BASE_URL}${USER}



*** Keywords ***
Saludar Usuario
    [Arguments]    ${nombre}
    Log    Hola ${nombre}

El usuario ejecuta un GET
    [Documentation]   Verifica que un GET a /users devuelva lista no vacía con campos esperados.

    ${response}=    GET    ${ENDPOINT_USER}    expected_status=200
    ${users}=    Set Variable    ${response.json()}
    # Validar campos mínimos del primer usuario (se asume que la estructura es homogénea)
    ${users1}=    Set Variable    ${users[0]}

    Dictionary Should Contain Key    ${users[0]}    id
    Dictionary Should Contain Key    ${users[0]}    name
    Dictionary Should Contain Key    ${users[0]}    username
    Dictionary Should Contain Key    ${users[0]}    email