#  Ainda separando os testes em camadas

***Settings***
Documentation   Suite dos testes de cadastro

# Importa o base através de caminho relativo
Resource  ../resources/base.robot

# Executa antes de iniciar os testes
Test Setup  Open Session

# Executa após de finalizar os testes
Test Teardown   Close Session

***Test Cases*
Cadastro simples
  Dado que acesso a página principal
  Quando submeto o meu email "joao@gmail.com"
  Então devo ser autenticado

Email incorreto
  Dado que acesso a página principal
  Quando submeto o meu email "joao&yahoo.com"
  Entao devo ver a mensagem "Oops. Informe um email válido!"

Email não informado
  Dado que acesso a página principal
  Quando submeto o meu email "${EMPTY}"
  Entao devo ver a mensagem "Oops. Informe um email válido!"
