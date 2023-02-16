*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${navegador}  Chrome
${pagina}  https://demo.napse.global:3080/
${Usuario}  suser
${Clave}  Nosotros123
${Compania}  napse


*** Test Cases ***
Crear Segmento

    Open browser    ${pagina}   ${navegador}
    Sleep   5s
    Completar el login
    Maximize browser window
    click element  xpath://*[@id="__next"]/div/div/div/div/div/div[1]/div/div/div/div/div/div[2]/div/form/button
    Sleep   5s
    click element  xpath://*[@id="sidebar"]/ul/li[3]/a/i
    Sleep   5s
    Mouse Up  xpath://*[@id="content"]/div[1]/div/div[2]/div[1]/div/div[2]/button/i
    Sleep   3s
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div/a/div[2]
    Sleep   5s
    click element  xpath://*[@id="step-1"]/div/form/div[1]/div[1]/div[2]/div/div/div[2]/div[1]/div/div/div[1]
    Sleep   8s

*** Keywords ***
Completar el login
    input text  name:username   ${Usuario}
    input text  name:password   ${Clave}
    input text  name:company   ${Compania}




