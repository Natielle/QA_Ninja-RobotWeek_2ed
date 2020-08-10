
***Settings***
Documentation   Aqui teremos keywords de apoio

***Keywords***
Login Session
  # argumentos obrigatórios
  [Arguments]   ${email}

  # abre o navegador
  base.Open Session

  # Steps
  Go To   ${base_url} 

  Input Text      ${CAMPO_EMAIL}    ${email}
  Click Element   ${BOTAO_ENTRAR}

  Wait Until Page Contains Element    ${DIV_DASH}

Get Api Login
  [Arguments]   ${email_param}

  # dicionario de dados do robot e python
  &{headers}      Create Dictionary   Content-Type=application/json
  &{payload}      Create Dictionary   email=${email_param}

  # Cria a requisição post
  Create Session      api    ${api_url}
  ${resp}=            Post Request   api    /sessions   data=${payload}   headers=${headers}
  Status Should Be    200            ${resp}

  # mostra a resposta em texto
  # Log To Console      ${resp.text}

  # mostra apenas o id
  # Log To Console      ${resp.json()['_id']}

  ${token}    Convert To String    ${resp.json()['_id']}
  [return]    ${token}

