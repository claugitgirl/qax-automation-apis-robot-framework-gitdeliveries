*** Settings ***
Documentation  Acciones para realizar una petición tipo POST
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../variables/setup.resource

*** Variables ***
${ENDPOINT_POST}   ${BASE_URL} ${POST}
${DATA_PATH}       ${EXECDIR}${/}data
${payload_filename}  post.json

*** Keywords ***
El usuario crea un nuevo post
    [Documentation]  El usuario crea un nuevo post en el endpoint /posts utilizando
            ...  el método POST y un cuerpo JSON por defecto.
    ${payload_path}=    Set Variable    ${DATA_PATH}${/}${payload_filename}
    ${payload}=    Load JSON From File    ${payload_path}
    ${response}=   POST    url=${ENDPOINT_POST}    json=${payload}   headers=${HEADERS}
    Set Global Variable    ${response}
    Set Global Variable    ${payload}

El código de respuesta debe ser 201
    [Documentation]   Valida el estado de la respuesta
    Status Should Be    201    ${response}

La respuesta debe contener un campo "id"
    [Documentation]  Valida que la respuesta contenga la llave id
    Dictionary Should Contain Key    ${response.json()}    id

Los campos "title", "body" y "userId" deben coincidir con lo enviado
    [Documentation]  Valida que los valores del response corresponde el payload incial
    Should Be Equal    ${response.json()}[title]    ${payload}[title]
    Should Be Equal    ${response.json()}[body]     ${payload}[body]
    Should Be Equal As Integers    ${response.json()}[userId]     ${payload}[userId]