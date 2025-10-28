*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${URL}            https://www.amazon.com.br
${MENU_ELETRONICOS}    (//a[contains(text(),'Eletrônicos')])[1]
${HEADER_ELETRÔNICOS}    (//span[contains(text(),'Eletrônicos e Tecnologia')])[1]


*** Keywords ***
Abrir o navegador    
    Open Browser    browser=chrome
    Maximize Browser Window


Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To  url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
    

Verificar se aparece a frase "${FRASE}"
    Wait Until page contains    ${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRÔNICOS}
 
Verificar se o título da página fica "${TITULO}"    
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    (//span[@class='a-size-base-plus'][normalize-space()='${NOME_CATEGORIA}'])[1]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[normalize-space()='${PRODUTO}'])[1]

    