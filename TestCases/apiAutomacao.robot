*** Settings ***
Documentation       Casos de Teste da Automaçao de API
Library     RequestsLibrary
Resource    ../KeyWords/keywords.robot

*** Test Cases ***
Verificar se API está online
    Dado que faço uma request de verificação
