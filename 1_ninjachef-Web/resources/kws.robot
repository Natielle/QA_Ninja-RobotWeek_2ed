
***Settings***
Documentation   Aqui teremos todas as palavras chaves de automação dos comportamentos (keywords)

***Keywords***
Dado que acesso a página principal
  Go To   ${base_url} 

Quando submeto o meu email "${email}"
  Input Text  ${CAMPO_EMAIL}  ${email}
  Click Element   ${BOTAO_ENTRAR}
  # Sleep   5

Então devo ser autenticado
  Wait Until Page Contains Element  ${DIV_DASH}

Entao devo ver a mensagem "${expect_message}"
  Wait Until Element Contains   ${DIV_ALERT}   ${expect_message}


# cadastro de pratos
Dado que "${produto}" é um dos meus pratos
  # Deixa a variavel produto na memoria, pois o próximo step irá precisar saber coisas sobre o produto
  Set Test Variable   ${produto} 
  

Quando faço o cadastro desse item
  # O selenium aguarda até 5 segundos para que o elemento fique visível
  Wait Until Element Is Visible   ${BOTAO_ADD}   5
  Click Element                   ${BOTAO_ADD}

  # Fazendo o upload da imagem
  # EXECDIR é o diretório do projeto
  Choose File    ${CAMPO_FOTO}    ${EXECDIR}/resources/images/${produto['img']}

  Input Text      ${CAMPO_NOME}   ${produto['nome']}
  Input Text      ${CAMPO_TIPO}   ${produto['tipo']}
  Input Text      ${CAMPO_PRECO}   ${produto['preco']}
  # Sleep           10
  Click Element   ${BOTAO_CADASTRAR}

Então devo ser este prato no meu dashboard
  Wait Until Element Contains   ${DIV_LISTA}    ${produto['nome']}
