*** Settings ***
Documentation       KeyWords da Automaçao de API
Library     RequestsLibrary
Library    Collections
Resource    ../keywords.robot
Resource    ../Usuarios/KeywordsUser.robot

*** Variables ***
${base_url}             https://serverest.dev/

*** Keywords ***
#Cadastro e validação de produto
Quando faço o post de um produto
    ${HEADERS}    Create Dictionary    Authorization=${TOKEN}
    ${PostProduto}    Create Dictionary    nome=Teste09    preco=14    descricao=TesteRequest    quantidade=10
    ${RESPONSE}=     POST    ${base_url}produtos    json=${PostProduto}    headers=${HEADERS}    expected_status=201
    ${ID_PRODUTO}    Get From Dictionary    ${RESPONSE.json()}    _id
    Set Suite Variable    ${ID_PRODUTO}

Então valido a existencia do mesmo
    ${RESPONSE}=    GET    ${base_url}produtos/${ID_PRODUTO}    expected_status=200