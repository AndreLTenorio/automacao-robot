*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${URL}            https://www.amazon.com.br/
${MENU_ELETRONICOS}    [href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics']
${HEADER_ELETRÔNICOS}    /html[1]/head[1]/title[1]
${TEXTO_HEADER_ELETRÔNICOS}    Eletrônicos e Tecnologia

*** Keywords ***
Abrir o navegador    
    Open Browser    browser=chrome
    Maximize Browser Window


Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To  url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletronicos"
    Click Element    locator=${MENU_ELETRONICOS}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRÔNICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRÔNICOS}