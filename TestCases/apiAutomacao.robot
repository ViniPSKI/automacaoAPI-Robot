*** Settings ***
Documentation       Casos de Teste da Automaçao de API
Library     RequestsLibrary
Resource    ../KeyWords/keywords.robot

*** Test Cases ***
Verificar se API está online
    Dado que faço uma request de verificação

Acessar Pagina com Login
    Dado que crio o usuario
    Então faço o Login

Fazer Post de um produto
    Dado que faço uma request de verificação
    Quando faço o post de um produto
    Então valido a existencia do mesmo

Cadastrando um carrinho
    Dado que faço uma request de verificação
    Quando faço um cadastro um novo carrinho

Concluindo a compra
    Dado que faço uma request de verificação
    Então concluo a compra