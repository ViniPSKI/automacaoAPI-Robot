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

#Cadastro e validação de produto
Quando faço o post de um produto
    ${HEADERS}    Create Dictionary    Authorization=${TOKEN}
    ${PostProduto}    Create Dictionary    nome=Teste09    preco=14    descricao=TesteRequest    quantidade=10
    ${RESPONSE}=     POST    ${base_url}produtos    json=${PostProduto}    headers=${HEADERS}    expected_status=201
    ${ID_PRODUTO}    Get From Dictionary    ${RESPONSE.json()}    _id
    Set Suite Variable    ${ID_PRODUTO}

Então valido a existencia do mesmo
    ${RESPONSE}=    GET    ${base_url}produtos/${ID_PRODUTO}    expected_status=200

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