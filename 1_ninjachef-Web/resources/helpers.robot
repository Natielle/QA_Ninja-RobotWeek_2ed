
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
