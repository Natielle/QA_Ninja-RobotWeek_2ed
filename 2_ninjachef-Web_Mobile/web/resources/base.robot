
***Settings***
Documentation   Aqui temos a estrutura base do projeto, selenium importado aqui

# importando a biblioteca do selenium
Library   SeleniumLibrary

# Importando o arquivo que contem as keywords (mesmo diretorio)
Resource  kws.robot
Resource  helpers.robot
Resource  elements.robot

***Variables***
${base_url}    http://ninjachef-qaninja-io.umbler.net/

***Keywords***
## Hooks ou ganchos
Open Session
  # Abre uma página em branco
  Open Browser    about:blank   chrome

Close Session
  Capture Page Screenshot
  Close Browser