*** Settings ***
Documentation  Acciones y validaciones en el endpoint User
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    String
Resource  ../variables/setupBookStore.resource

*** Variables ***
${ENDPOINT_USER}    ${BASE_URL}${CONTEXT_ACCOUNT}${USER}

*** Keywords ***
que el usuario desea crear un nuevo usuario
    [Documentation]   Crear un JSON dinamico con un username unico y un password valido con el formato correcto
    # Generar userName único
    ${random}=   Generate Random String    5    [LETTERS][NUMBERS]
    ${userName}=  Set Variable    ninja_for_testing_${random}
    ${password}=  Set Variable    Test@1234
    # Preparar el payload
    &{payload}=   Create Dictionary    userName=${userName}    password=${password}
    Set Global Variable    &{payload}
    Set Global Variable    ${userName}

el usuario envia la peticion para la creación del usuario
    [Documentation]  El usuario crea un nuevo post en el endpoint /posts utilizando
            ...  el método POST y un cuerpo JSON por defecto.
    ${response}=   POST    url=${ENDPOINT_USER}    json=${payload}   headers=${HEADERS}
    Set Global Variable    ${response}

la API responde el userId
    [Documentation]   Valida el estado de la respuesta, valia que responda el userId y lo guardamos en una variable global
    Status Should Be    201    ${response}
    Validar el userId

Validar el userId
    [Documentation]    valia que responda el userId y que tenga el formato valido y almacenada en una variable global
    ${userId}    Set Variable    ${response.json()}[userID]
    # Validar que userId tenga formato UUID
    ${pattern}=    Set Variable    ^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$
    Should Match Regexp    ${userId}    ${pattern}   msg=userId no tiene formato UUID válido
    Set Global Variable    ${userId}

