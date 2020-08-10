
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

# -----------------------------------------------
# KEYWORDS DO CENARIO DE RECEBER NOVO PEDIDO
# -----------------------------------------------
Dado que "${email_cozinheiro}" é a minha conta de cozinheiro
  Set Test Variable     ${email_cozinheiro}
  ${token_cozinheiro}    Get Api Login  ${email_cozinheiro}
  Set Test Variable      ${token_cozinheiro} 

E "${email_cliente}" é o email do meu cliente
  Set Test Variable     ${email_cliente}
  ${token_cliente}      Get Api Login  ${email_cliente}
  Set Test Variable     ${token_cliente} 
  

E que "${produto}" está cadastrado no meu dashboard
  # ------------- cadastrando o produto -------------
  Set Test Variable     ${produto}

  &{payload}   Create Dictionary   name=${produto}   plate=Tipo    price=20.0
  ${img_file}   Get Binary File   ${EXECDIR}/resources/images/prato_comida.jpg
  &{files}     Create Dictionary   thumbnail=${img_file}
  
  &{headers}      Create Dictionary   user_id=${token_cozinheiro}
  
  Create Session      api    ${api_url}
  ${resp}=            Post Request   api    /products   files=${files}    data=${payload}   headers=${headers}
  Status Should Be    200            ${resp}

  # obtendo o produto id
  ${produto_id}    Convert To String    ${resp.json()['_id']}
  Set Test Variable      ${produto_id}

  # ------------- acessando a dash -------------
  Go To   ${base_url} 
  Input Text      ${CAMPO_EMAIL}    ${email_cozinheiro}
  Click Element   ${BOTAO_ENTRAR}
  Wait Until Page Contains Element    ${DIV_DASH}

Quando o cliente solicita o preparo desse prato
  # dicionario de dados do robot e python
  &{headers}      Create Dictionary   Content-Type=application/json   user_id=${token_cliente}
  &{payload}      Create Dictionary   payment=Dinheiro

  Create Session      api    ${api_url}
  ${resp}=            Post Request   api    /products/${produto_id}/orders   data=${payload}   headers=${headers}
  Status Should Be    200            ${resp}

  # Sleep   5

Então devo receber uma notificação de pedido desse produtos
  ${mensagem_esperada}    Convert To String   ${email_cliente} está solicitando o preparo do seguinte prato: ${produto}.
  Wait Until Page Contains  ${mensagem_esperada}    5   

E posso aceitar ou rejeitaar esse pedidos
  # aguarda os botoes de aceitar e rejeitar serem carregados
  Wait Until Page Contains  ACEITAR    5   
  Wait Until Page Contains  REJEITAR    5   