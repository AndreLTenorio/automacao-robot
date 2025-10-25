*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${URL}            https://www.amazon.com.br
${MENU_ELETRONICOS}    (//a[contains(text(),'Eletrônicos')])[1]
${HEADER_ELETRÔNICOS}    text:Eletrônicos e Tecnologia
${TEXTO_HEADER_ELETRÔNICOS}    Eletrônicos e Tecnologia | Amazon.com.br

*** Keywords ***
Abrir o navegador    
    Open Browser    browser=chrome
    Maximize Browser Window


Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To  url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
    

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Title Should Be    ${TEXTO_HEADER_ELETRÔNICOS}