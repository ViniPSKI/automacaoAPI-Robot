*** Settings ***
Documentation       KeyWords da Automaçao de API
Library     RequestsLibrary
Library    Collections
Resource    ../keywords.robot
Resource    ../Usuarios/KeywordsUser.robot
Resource    ../Produtos/keywordsProducts.robot

*** Variables ***
${base_url}             https://serverest.dev/

*** Keywords ***
#Cadastro e validação de carrinho
Criando array de produto
    #Cria um array de produtos, já que a estrutura para envio do Json é com array
    ${Produtos}    Create List
    ${ProdutoCarrinho}    Create Dictionary    idProduto=${ID_PRODUTO}    quantidade=2
    Append To List    ${Produtos}    ${ProdutoCarrinho}
    RETURN    ${Produtos}

Quando faço um cadastro um novo carrinho
    ${HEADERS}    Create Dictionary    Authorization=${TOKEN}
    ${ListaProdutos}    Criando array de produto
    ${PostCarrinho}    Create Dictionary    produtos=${ListaProdutos}
    ${RESPONSE}=     POST    ${base_url}carrinhos    json=${PostCarrinho}    headers=${HEADERS}    expected_status=201

Então concluo a compra
    ${HEADERS}    Create Dictionary    Authorization=${TOKEN}
    #Deleta o carrinho vinculado a conta logada
    ${RESPONSE}=     DELETE    ${base_url}carrinhos/concluir-compra    headers=${HEADERS}    expected_status=200