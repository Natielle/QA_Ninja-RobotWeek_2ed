***Settings***
Documentation   Codigo base para abrir uma sessao com o Appium Server

Library   AppiumLibrary

Resource  kws.robot

***Keywords***
# Ganchos ou hooks
Open Session
  Open Application    http://localhost:4723/wd/hub
  ...                 platformName=Android
  ...                 automationName=UiAutomator2
  ...                 deviceName=Emulator
  ...                 app=${EXECDIR}/app/ninjachef.apk
  ...                 udid=emulator-5554
  ...                 adbExecTimeout=60000

Close Session
  Capture Page Screenshot
  Close Application