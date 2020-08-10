***Settings***
Documentation   Testes do login no ninjachef mobile

Resource    ../resources/base.robot

Test Setup        Open Session
Test Teardown     Close Session

***Test Cases***
Acessar o cardapio
  Dado que desejo comer "Massas"
  Quando submeto meu email "papito@ninjachef.com.br"
  Entao devo ver a lista de pratos por tipo

