*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${navegador}  Chrome
${pagina}  https://demo.napse.global:3080/
${Usuario}  suser
${Clave}  Nosotros123
${Compania}  napse
${Cliente nombre}  dibu
${Cliente dni}  25888999
${Cliente apellido}  Rudel


*** Test Cases ***
Búsqueda de Clientes Apellido

    Open browser    ${pagina}   ${navegador}
    Sleep   5s
    input text  name:username   ${Usuario}
    input text  name:password   ${Clave}
    input text  name:company   ${Compania}
    click element  xpath://*[@id="__next"]/div/div/div/div/div/div[1]/div/div/div/div/div/div[2]/div/form/button
    Sleep   5
    click element  xpath://*[@id="sidebar"]/ul/li[2]/a/i
    Sleep   5s
    Mouse Up  xpath://*[@id="content"]/div[1]/div/div[2]/div[1]/div/div[1]/input
    Sleep   3s
    input text  id:term   ${Cliente apellido}
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/div/div[1]/form/div/div/button/i
    Sleep   5s
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/table/tbody/tr[1]/td[9]/div/button
    Sleep   5s
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/table/tbody/tr[1]/td[9]/div/div/a
    Sleep   10s
    Element Should Contain  xpath://*[@id="content"]/div[2]/div/div[2]/div/h1   RUDEL

Busqueda de clientes Nombre
    click element  xpath://*[@id="sidebar"]/ul/li[2]/a/i
    Sleep   5s
    Mouse Up  xpath://*[@id="content"]/div[1]/div/div[2]/div[1]/div/div[1]/input
    Sleep   3s
    input text  id:term   ${Cliente nombre}  dibu
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/div/div[1]/form/div/div/button/i
    Sleep   5s
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/table/tbody/tr[1]/td[9]/div/button
    Sleep   5s
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/table/tbody/tr[1]/td[9]/div/div/a
    Sleep   10s
    Element Should Contain  xpath://*[@id="content"]/div[2]/div/div[2]/div/h1   DIBU

Busqueda de clientes dni
    click element  xpath://*[@id="sidebar"]/ul/li[2]/a/i
    Sleep   5s
    Mouse Up  xpath://*[@id="content"]/div[1]/div/div[2]/div[1]/div/div[1]/input
    Sleep   3s
    input text  id:term   ${Cliente dni}
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/div/div[1]/form/div/div/button/i
    Sleep   5s
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/table/tbody/tr[1]/td[9]/div/button
    Sleep   5s
    click element  xpath://*[@id="content"]/div[2]/div/div[3]/div/div/div[1]/table/tbody/tr[1]/td[9]/div/div/a
    Sleep   10s
    Element Should Contain  xpath://*[@id="content"]/div[2]/div/div[2]/div/h1   RODRIGO
    Click element  xpath://*[@id="content"]/div[1]/div/div[2]/div[2]/div/a/div/button/span/i
    Click element  xpath://*[@id="content"]/div[1]/div/div[2]/div[2]/div/a/div/div/a[2]