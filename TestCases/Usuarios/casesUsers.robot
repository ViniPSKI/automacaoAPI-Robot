*** Settings ***
Documentation       Casos de Teste da Automaçao de API
Library     RequestsLibrary
Resource    ../../KeyWords/Usuarios/KeywordsUser.robot
Resource    ../../KeyWords/keywords.robot

*** Test Cases ***
Acessar Pagina com Login
    Dado que crio o usuario
    Então faço o Login

Deletando usuario
    Dado que faço uma request de verificação