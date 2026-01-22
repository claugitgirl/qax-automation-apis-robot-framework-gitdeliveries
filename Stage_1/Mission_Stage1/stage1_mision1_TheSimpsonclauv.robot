*** Settings ***
Documentation
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${BASE_URL}    https://thesimpsonsapi.com/api
${ENDPOINT_CHARACTERS}    /characters


*** Keywords ***
Create Simpsons Session
    Create Session    simpsons    ${BASE_URL}

Validate Character Structure
    [Arguments]    ${char}
    Should Be True    ${char["id"]} > 0
    Should Not Be Empty    ${char["name"]}
    Should Not Be Empty    ${char["gender"]}
    Should Not Be Empty    ${char["occupation"]}
    Should Match Regexp    ${char["birthdate"]}    ^\d{4}-\d{2}-\d{2}$
    Should Match Regexp    ${char["portrait_path"]}    ^/character/\d+.webp$
    Should Be True    isinstance(${char["phrases"]}, list)
    Should Not Be Equal    ${char["phrases"]}    None

*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot
Suite Setup    Create Simpsons Session

*** Test Cases ***

TC01 Status 200 contrato base
    ${resp}=    Get Request    ${BASE_URL} / ${ENDPOINT_CHARACTERS}
    Should Be Equal As Integers    ${resp.status_code}    200
    Should Contain    ${resp.headers["Content-Type"]}    application/json
    ${json}=    To JSON    ${resp.content}
    Dictionary Should Contain Key    ${json}    count
    Dictionary Should Contain Key    ${json}    next
    Dictionary Should Contain Key    ${json}    prev
    Dictionary Should Contain Key    ${json}    pages
    Dictionary Should Contain Key    ${json}    results

TC02 Validar tipos de datos del contrato base
    ${resp}=    Get Request    simpsons    ${ENDPOINT_CHARACTERS}
    ${json}=    To JSON    ${resp.content}
    Should Be True    isinstance(${json["count"]}, int)
    Should Be True    ${json["next"]} == None or isinstance(${json["next"]}, str)
    Should Be True    ${json["prev"]} == None or isinstance(${json["prev"]}, str)
    Should Be True    isinstance(${json["pages"]}, int)
    Should Be True    isinstance(${json["results"]}, list)

TC03 Validar estructura mínima de los personajes
    ${resp}=    Get Request    simpsons    ${ENDPOINT_CHARACTERS}
    ${json}=    To JSON    ${resp.content}
    FOR    ${char}    IN    @{json["results"]}
        Validate Character Structure    ${char}
    END

TC04 Validar orden estable por ID asc
    ${resp}=    Get Request    simpsons    ${ENDPOINT_CHARACTERS}
    ${json}=    To JSON    ${resp.content}
    ${results}=    Set Variable    ${json["results"]}
    :FOR    ${i}    IN RANGE    0    ${len(${results})-1}
    \    ${id1}=    Set Variable    ${results[${i}]["id"]}
    \    ${id2}=    Set Variable    ${results[${i}+1}]["id"]}
    \    Should Be True    ${id1} < ${id2}

TC05 Validar paginación page=2
    ${resp}=    Get Request    simpsons    ${ENDPOINT_CHARACTERS}?page=2
    Should Be Equal As Integers    ${resp.status_code}    200
    ${json}=    To JSON    ${resp.content}
    Should Not Be Empty    ${json["results"]}

TC06 Validar page por defecto es page=1
    ${resp1}=    Get Request    simpsons    ${ENDPOINT_CHARACTERS}
    ${resp2}=    Get Request    simpsons    ${ENDPOINT_CHARACTERS}?page=1
    Should Be Equal    ${resp1.content}    ${resp2.content}

TC07 Validar next y prev URLs
    ${resp}=    Get Request    simpsons    ${ENDPOINT_CHARACTERS}?page=2
    ${json}=    To JSON    ${resp.content}
    Should Match Regexp    ${json["next"]}    ^https?://.+/api/characters\?page=\d+$
    Should Match Regexp    ${json["prev"]}    ^https?://.+/api/characters\?page=\d+$




