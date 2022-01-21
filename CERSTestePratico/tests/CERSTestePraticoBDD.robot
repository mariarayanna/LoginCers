*** Settings ***
Resource             ../resource/resource.robot
Test SETUP           Abrir navegador
Test TEARDOWN        Fechar navegador
 
*** Test Cases ***

Cenário 01 - Efetuar Login existente
    Dado que estou na página home do site e acesso a área de login
    Quando tento logar com o "mariart.designdigital@gmail.com" e "senha12345"
    Então devo estar na tela inicial

Cenário 02 - Efetuar Login inexistente
    Dado que estou na página home do site e acesso a área de login
    Quando tento logar com o "mariart.designdigit@gmail.com" e "senha123"
    Então a página deve exibir um texto informando "Login e/ou Senha inválido"

#*** Keywords ***