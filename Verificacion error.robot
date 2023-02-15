*** Settings ***
Library  SeleniumLibrary



*** Variables ***
${navegador}  Chrome
${pagina}  https://demo.napse.global:3080/
${Usuario}  suser
${Clave}  Nosotros123
${Compania}  napse
${Compañia no existe}  susi



*** Test Cases ***
Login compañia invalida
    Open browser    ${pagina}   ${navegador}
    Sleep   5s
    Login invalido
    Esperar mensaje de error
    Verificar mensaje de error



*** Keywords ***

Completar el login
    input text  name:username   ${Usuario}
    input text  name:password   ${Clave}
    input text  name:company   ${Compania}
    click button  xpath://*[@id="__next"]/div/div/div/div/div/div[1]/div/div/div/div/div/div[2]/div/form/button

Login invalido
    input text  name:username   ${Usuario}
    input text  name:password   ${Clave}
    input text  name:company   ${Compañia no existe}
    click button  xpath://*[@id="__next"]/div/div/div/div/div/div[1]/div/div/div/div/div/div[2]/div/form/button

Esperar mensaje de error
    Wait Until Element is Visible   xpath:/html/body/div[2]/div/div[6]/button[1]


Verificar mensaje de error

    ${result}=   Get text   xpath:/html/body/div[2]/div/div[6]/button[1]
    Should Be Equal As Strings   ${result}  OK