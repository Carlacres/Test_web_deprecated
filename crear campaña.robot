*** Settings ***
Library  SeleniumLibrary


*** Variables ***

${navegador}  Chrome
${pagina}  https://demo.napse.global:3080/
${Usuario}  suser
${Clave}  Nosotros123
${Compania}  napse


*** Test Cases ***
Campaña Objetivo es requerido

    Open browser    ${pagina}   ${navegador}
    Sleep   5s
    Completar el login
    Maximize browser window
    Sleep   5s
    click element  xpath://*[@id="__next"]/div/div/div/div/div/div[1]/div/div/div/div/div/div[2]/div/form/button
    Sleep   5
    click element  xpath://*[@id="content"]/div[1]/div/div[2]/div[1]/div/div[2]/button/i
    Mouse Up  xpath://*[@id="content"]/div[1]/div/div[2]/div[1]/div/div[1]/input
    Sleep   7s
    click element  xpath://*[@id="sidebar"]/ul/li[4]/a/i
    Sleep   3s
    Mouse Up  //*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/div[1]/div[1]/form/div/div/button
    Sleep   3s
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div/div/a/div[2]
    Sleep   3s
    click button  xpath://*[@id="step-1"]/div/form/div[1]/div[2]/button[2]
    click button  xpath://*[@id="step-1"]/div/form/div[2]/div/button
    Sleep   5
    click element  xpath://*[@id="step-2"]/div/form/div[1]/div[2]/div[2]/div/div[1]/button/img
    click button  xpath://*[@id="step-2"]/div/form/div[2]/div/button[2]
    Sleep   5
    input text  xpath://*[@id="step-3"]/div/form/div[1]/div[3]/div/div/div[1]/div[1]/input   con celular
    Sleep   5
    click element  xpath://*[@id="step-3"]/div/form/div[1]/div[3]/div/div/div[2]/button/div[1]/i
    click button  xpath://*[@id="step-3"]/div/form/div[3]/div/button[2]
    Sleep   5
    click element  xpath://*[@id="step-4"]/div/form/div[2]/div/div/div[2]/button[1]/div[1]/i
    click button  xpath://*[@id="step-4"]/div/form/div[4]/div/button[2]
    click button  xpath://*[@id="step-5"]/div/form/div[2]/div/button[2]
    input text  name:name   Campaña: Galaxy S21
    clear element text  name:code
    input text  name:code   CAM-10
    Sleep   5
    click button  xpath://*[@id="step-6"]/div/form/div[4]/div/button[2]
    Sleep   5
    Element Should Contain  xpath://*[@id="step-6"]/div/form/div[3]/div/div[1]/div[2]/div/div   El objetivo es requerido
    Sleep   5



*** Keywords ***
Completar el login
    input text  name:username   ${Usuario}
    input text  name:password   ${Clave}
    input text  name:company   ${Compania}