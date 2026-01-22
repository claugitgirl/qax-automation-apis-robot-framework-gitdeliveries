*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    https://thesimpsonsapi.com/api
${ENDPOINT_CHARACTERS}    /characters

*** Test Cases ***
TC01 Status 200 contrato base
    [Documentation]  Verifica que un GET despliega la lista de personajes con campos especificos.
    ${response}=    GET    ${BASE_URL}${ENDPOINT_CHARACTERS}   expected_status=200
    ${obj}=    Set Variable    ${response.json()}
    ${count}=    Get From Dictionary    ${obj}    count
    Log To Console    este es conteo: ${count}

    # Verificar que existen los campos principales
    Dictionary Should Contain Key    ${json}    count
    Dictionary Should Contain Key    ${json}    next
    Dictionary Should Contain Key    ${json}    prev
    Dictionary Should Contain Key    ${json}    pages
    Dictionary Should Contain Key    ${json}    results

    # Verificar tipos de datos
    Should Be Integer    ${json['count']}
    Should Be Integer    ${json['pages']}
    Should Be True    ${json['results']}    msg=results debe ser array

    # Content-Type
    Dictionary Should Contain Key    ${resp.headers}    Content-Type
    Should Contain    ${resp.headers["Content-Type"]}    application/json
     ${json}=    To JSON    ${resp.content}

     # ESTRUCTURA DE CADA PERSONAJE EN RESULTS
# Validar Estructura De Personajes
    Create Session    api    ${BASE_URL}

    ${resp}=    GET On Session    api    /characters?page=1
    ${json}=    To JSON    ${resp.content}

    FOR    ${c}    IN    @{json["results"]}
        Dictionary Should Contain Key    ${c}    id
        Dictionary Should Contain Key    ${c}    age
        Dictionary Should Contain Key    ${c}    birthdate
        Dictionary Should Contain Key    ${c}    gender
        Dictionary Should Contain Key    ${c}    name
        Dictionary Should Contain Key    ${c}    occupation
        Dictionary Should Contain Key    ${c}    portrait_path
        Dictionary Should Contain Key    ${c}    phrases
        Dictionary Should Contain Key    ${c}    status

        # Tipos básicos
        Should Be Integer    ${c["id"]}
        Should Be Integer    ${c["age"]}
        Should Be String     ${c["name"]}

        # Formatos
        Should Match Regexp    ${c["birthdate"]}        ^\\d{4}-\\d{2}-\\d{2}$
        Should Match Regexp    ${c["portrait_path"]}    ^/character/\\d+\\.webp$

        # phrases es array y no null
        Should Not Be Equal    ${c["phrases"]}    ${None}
        Should Be True         ${c["phrases"]}

    END

    # Validar que un valor es entero en una linea
    Should Be True    isinstance(${count}, int)    msg=El valor ${count} NO es un entero.
    # Crear una variable y aplicarle la validacion.
    ${is_string} =    Evaluate    isinstance(${count}, str)
    ${is_int} =       Evaluate    isinstance(${count}, int)
    ${is_float} =     Evaluate    isinstance(${count}, float)
    ## Cada valor va devolver un boleano
    ##  aqui se valida ese valor de la variable.
    Should Be True    ${is_string}   msg=El valor ${count} NO es un String
    Should Be True    ${is_int}   msg=El valor ${count} NO es un entero.
    Should Be True    ${is_float}   msg=El valor ${count} NO es un flotante.