*** Settings ***
Documentation       KeyWords da Automaçao de API
Library     RequestsLibrary
Library    Collections 

*** Variables ***
${base_url}             https://serverest.dev/

*** Keywords ***
#Usuarios
    #Criação e Login com um Usuário   
Dado que crio o usuario
    ${PostUser}    Create Dictionary    nome=teste3     email=teste3@qa.com.br     password=teste    administrador=true
    ${RESPONSE}=    POST    ${base_url}usuarios    json=${PostUser}    expected_status=201

Então faço o Login
    ${PostLogin}    Create Dictionary    email=teste3@qa.com.br     password=teste 
    ${RESPONSE}=    POST    ${base_url}login    json=${PostLogin}    expected_status=200
    #Obtém o Token para que seja possivel cadastrar um produtor e acessar partes de ADM da API
    ${TOKEN}    Get From Dictionary    ${RESPONSE.json()}    authorization
    Set Suite Variable    ${TOKEN}
