*** Settings ***
Library    SeleniumLibrary




*** Variables ***
${Alerta_tarjeta_Dni_requerido} =     xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[4]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div[2]/div[3]

*** Keywords ***
Validar alerta Dni o tarjeta son requeridos

     wait until element is enabled          ${Alerta_tarjeta_Dni_requerido}      timeout=0:00:10
     wait until element is visible          ${Alerta_tarjeta_Dni_requerido}      timeout=0:00:10
     set focus to element                   ${Alerta_tarjeta_Dni_requerido}
     click element                          ${Alerta_tarjeta_Dni_requerido}
