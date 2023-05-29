*** Settings ***
Documentation       Casos de Teste da Automaçao de API
Library     RequestsLibrary
Resource    ../../KeyWords/Carrinho/keywordsCar.robot

*** Test Cases ***
Cadastrando um carrinho
    Dado que faço uma request de verificação
    Quando faço um cadastro um novo carrinho

Concluindo a compra
    Dado que faço uma request de verificação
    Então concluo a compra