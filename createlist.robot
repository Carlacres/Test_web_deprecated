*** Settings ***
Library  SeleniumLibrary
Library  Collections



*** Variables ***
${navegador}  Chrome
${pagina}  https://demo.napse.global:3080/
${Usuario}  suser
${Clave}  Nosotros123
${Compania}  napse


*** Test Cases ***
Tipos de comunicado Campañas
    Open browser    ${pagina}   ${navegador}
    Sleep   5s
    Completar el login
    Sleep   5s
    Maximize browser Window
    click element  xpath://*[@id="sidebar"]/ul/li[4]/a/i
    Mouse up  xpath://*[@id="content"]/div[1]/div/div[2]/div[1]/div/div[2]/button/i
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div/div/a/div[2]
    Sleep   5s
    Verificar tipos de comunicado


*** Keywords ***

Completar el login
    input text  name:username   ${Usuario}
    input text  name:password   ${Clave}
    input text  name:company   ${Compania}
    click button  xpath://*[@id="__next"]/div/div/div/div/div/div[1]/div/div/div/div/div/div[2]/div/form/button

Verificar tipos de comunicado
    @{expectedList} =   Create List     Whatsapp      E-Mail       SMS
    ${elements} =   Get WebElements    .p-2.m-2.border.btn.btn-secondary.btn-block
    @{actualList} =  Create List


FOR  ${element}    IN     ${elements}
Log  ${element.text}
Append to List   @{actualList}   ${element.text}


END
List Shoulb Be Equal    ${expectedList}   ${actualList}

