# primeiro contato com o robot

***Settings***
Documentation   Suite dos testes de cadastro
Library   SeleniumLibrary

***Test Cases*
Cadastro simples
  Dado que acesso a página principal
  Quando submeto o meu email "joao@gmail.com"
  Então devo ser autenticado

***Keywords***
Dado que acesso a página principal
  Open Browser  http://ninjachef-qaninja-io.umbler.net/   chrome

Quando submeto o meu email "${email}"
  Input Text  id:email  ${email}
  Click Element   css:button[type=submit]
  Sleep   5

Então devo ser autenticado
  Wait Until Page Contains Element  class:dashboard
  Close Browser