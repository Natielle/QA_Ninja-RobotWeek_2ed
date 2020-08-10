# Separando os testes em camadas

***Settings***
Documentation   Receber pedidos
...             Sendo um cozinheiro que possui pratos no dashboard
...             Quero receber solicitação de preparo dos meus produtos
...             Para que eu possa envia-los aos meus clientes

# Importa o base através de caminho relativo
Resource  ../resources/base.robot

# Executa antes de iniciar os testes
Test Setup  Open Session

# Executa após de finalizar os testes
Test Teardown   Close Session

***Test Cases***
Receber novo pedidos
  Dado que "eduguedes@gmail.com" é a minha conta de cozinheiro
  E "fernando@bol.com.br" é o email do meu cliente
  E que "Carne de Jaca Louca" está cadastrado no meu dashboard
  Quando o cliente solicita o preparo desse prato
  Então devo receber uma notificação de pedido desse produtos
  E posso aceitar ou rejeitaar esse pedidos

