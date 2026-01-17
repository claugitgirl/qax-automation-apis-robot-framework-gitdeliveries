*** Settings ***
Documentation
Library    RequestsLibrary
Library    Collections
Library  String

*** Variables ***
${BASE_URL}    https://practice.expandtesting.com/notes/api
#${email}  ${EMPTY}


*** Test Cases ***
CP01 - Registro de un Usuario
    [Documentation]    Verifica que se registra un usuario nuevo y devuelva 201 con datos correctos.

    ${random_id}=  Generate Random String  6  [NUMBERS]
    ${email}=  Set Variable  clau_${random_id}@gmail.com
    ${payload}=    Create Dictionary   name=Claudia  email=${email}     password=Control123
    ${response}=    POST    ${BASE_URL}/users/register    json=${payload}    expected_status= 201

    # Validaciones sobre el body

   Should Be Equal    ${response.json()}[message]    User account created successfully
   Should Be True    ${response.json()}[success]
   Should Not Be Empty    ${response.json()}[data][id]
   Should Be Equal    ${response.json()}[data][name]     Claudia
   Should Be Equal    ${response.json()}[data][email]    ${email}



CP02 - User Login
    [Documentation]    Verifica que un POST a /users/login devuelve datos usuario y token.
    ${payload}=    Create Dictionary   email=clau_980518@gmail.com    password=Control123
    ${response}=    POST    ${BASE_URL}/users/login  json=${payload}     expected_status=200

    # Validar campos mínimos del primer usuario (se asume que la estructura es homogénea)
   Should Be Equal    ${response.json()}[message]    Login successful
   Should Be True    ${response.json()}[success]
   Should Not Be Empty    ${response.json()}[data][id]
   Should Be Equal    ${response.json()}[data][name]     Claudia
   Should Be Equal    ${response.json()}[data][email]    clau_980518@gmail.com
   Should Not Be Empty    ${response.json()}[data][token]


CP03 - User Login2
    [Documentation]    Verifica que un POST a /users/login devuelve datos usuario y token.
    ${random_id}=  Generate Random String  6  [NUMBERS]
    ${email}=  Set Variable  clau_${random_id}@gmail.com
    ${payload}=    Create Dictionary   name=Claudia  email=${email}     password=Control123
    ${response}=    POST    ${BASE_URL}/users/register    json=${payload}    expected_status= 201
    ${payload}=    Create Dictionary   email=${email}   password=Control123
    ${response}=    POST    ${BASE_URL}/users/login  json=${payload}     expected_status=200

    # Validar campos mínimos del primer usuario (se asume que la estructura es homogénea)
   Should Be Equal    ${response.json()}[message]    Login successful
   Should Be True    ${response.json()}[success]
   Should Not Be Empty    ${response.json()}[data][id]
   Should Be Equal    ${response.json()}[data][name]     Claudia
   Should Be Equal    ${response.json()}[data][email]    ${email}
   Should Not Be Empty    ${response.json()}[data][token]