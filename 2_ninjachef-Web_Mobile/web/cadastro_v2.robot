# Entendendo melhor o test setup e teardown

***Settings***
Documentation   Suite dos testes de cadastro

# importando a biblioteca do selenium
Library   SeleniumLibrary

# Executa antes de iniciar os testes
Test Setup  Open Session

# Executa após de finalizar os testes
Test Teardown   Close Session

***Test Cases*
Cadastro simples
  Dado que acesso a página principal
  Quando submeto o meu email "joao@gmail.com"
  Então devo ser autenticado

***Keywords***
Dado que acesso a página principal
  Go To   http://ninjachef-qaninja-io.umbler.net/

Quando submeto o meu email "${email}"
  Input Text  id:email  ${email}
  Click Element   css:button[type=submit]
  Sleep   5

Então devo ser autenticado
  Wait Until Page Contains Element  class:dashboard

## Hooks ou ganchos
Open Session
  # Abre uma página em branco
  Open Browser  about:blank   chrome

Close Session
  Close Browser