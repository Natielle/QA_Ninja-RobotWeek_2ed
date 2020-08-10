
***Settings***
# Nessa documentation podemos acompanhar a história do usuário
Documentation   Cadastro de produtos/pratos
...             Sendo um cozinheiro amador
...             Quero cadastrar meus melhores pratos
...             Para que eu possa cozinha-los para outras pessoas

# Importa o base através de caminho relativo
Resource  ../resources/base.robot

# Executa antes de iniciar os testes
Test Setup  Login Session  natinha@yahoo.com

# Executa após de finalizar os testes
Test Teardown   Close Session

***Variables***
# dicionario do robot (com &)
&{nhoque}=    img=nhoque.jpg  nome=Nhoque molho páprica   tipo=Massas   preco=20.00

***Test Cases*
Novo prato
  Dado que "${nhoque}" é um dos meus pratos
  Quando faço o cadastro desse item
  Então devo ser este prato no meu dashboard

