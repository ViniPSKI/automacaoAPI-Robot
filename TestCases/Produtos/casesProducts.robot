*** Settings ***
Documentation       Casos de Teste da Automaçao de API
Library     RequestsLibrary
Resource    ../../KeyWords/Produtos/keywordsProducts.robot

*** Test Cases ***
Fazer Post de um produto
    Dado que faço uma request de verificação
    Quando faço o post de um produto
    Então valido a existencia do mesmo