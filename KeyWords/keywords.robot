*** Settings ***
Documentation       KeyWords da Automaçao de API
Library     RequestsLibrary
Library    Collections

*** Variables ***
${base_url}             https://serverest.dev/

*** Keywords ***
#Verificação da API
Dado que faço uma request de verificação
    ${RESPONSE}=    GET    ${base_url}    expected_status=200