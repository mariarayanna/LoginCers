*** Settings ***
Library              SeleniumLibrary

*** Variables ***
${URL}                  https://www.cers.com.br
${BROWSER}              edge
${clique_um}            //button[@id='dropdown-login-register-btn']
${Clique_dois}          //a[@id='dropdown-login-btn']
${campo_email}          //input[@id='login-email-field']
${campo_senha}          //input[@id='login-password-field']
${botao_prosseguir}     //button[@id="login-next-btn"]
${botao_entrar}         //button[@id='login-submit-btn']
${icone_logado}         //span[@class='nc-icon nc-icon-circle-10-2']

*** Keywords ***
### SETUP E TEARDOWN

Abrir navegador
    Open Browser         ${URL}     ${BROWSER}

Fechar navegador  
    Close Browser 

### Ações

Dado que estou na página home do site e acesso a área de login
    Click Button                      ${clique_um}
    Click Link                        ${clique_dois}
    Sleep    3

Quando tento logar com o "${LOGIN}" e "${SENHA}"
    Input Text        ${campo_email}      ${LOGIN}
    Click Button      ${botao_prosseguir}
    Input Text        ${campo_senha}      ${SENHA}
    Click Button      ${botao_entrar}
    Sleep    3

Então devo estar na tela inicial
    Title Should Be   Cursos online Concursos, OAB, Jurídico e Pós Graduação | CERS

Então a página deve exibir um texto informando "${MENSAGEM}"
    Should Be Equal    ${MENSAGEM}    Login e/ou Senha inválido
