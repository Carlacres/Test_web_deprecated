*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Venta_otros_Button} =             xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[5]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[3]/div
${Opcion_Lubri_Button}  =           xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[6]/div[2]/div[2]/div/div/div/div[1]/div/div/div[2]/div/div/div
${Opcion_S&A_Button} =              xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[6]/div[2]/div[2]/div/div/div/div[1]/div/div/div[3]/div/div/div
${Producto_SYA_1_Button} =          xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[6]/div[2]/div[2]/div/div/div/div[1]/div/div/div[4]/div/div/div
${Fuel_other_monto_campo} =         xpath:/html/body/div[22]/div/div[2]/div/div/div[2]/div/div[3]/div[2]/input
${Fuel_other_monto} =               100
${Fuel_other_Ok_button} =           xpath:/html/body/div[22]/div/div[2]/div/div/div[2]/div/div[4]/div[1]/div/div/div
${Fuel_other_Finalizar_button} =    xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[6]/div[2]/div[2]/div/div/div/div[1]/div/div/div[6]/div/div/div
${Fuel_other_Cancelar_button} =     xpath:/html/body/div[23]/div/div[2]/div/div/div[2]/div/div[3]/div[2]/div/div/div
${Fuel_other_Cancel_Print} =        xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[2]/div[2]/div[2]/div/div/div/div[1]/div/div/div/div[1]/div
${Fuel_other_Body_Print} =          xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[2]/div[2]/div[2]/div/div/div/div[1]/div/div/div/div[2]
#70841411277800608

*** Keywords ***

Seleccionar Otros
            wait until element is visible       ${Venta_otros_Button}
            click element                       ${Venta_otros_Button}

Seleccionar Lubricante
            wait until element is visible       ${Opcion_Lubri_Button}
            click element                       ${Opcion_Lubri_Button}

Seleccionar S&A
     [Arguments]                            ${Opcion_S&A_Button}
     wait until element is enabled          ${Opcion_S&A_Button}      timeout=0:00:10
     wait until element is visible          ${Opcion_S&A_Button}      timeout=0:00:10
     set focus to element                   ${Opcion_S&A_Button}
     click element                          ${Opcion_S&A_Button}

Seleccionar Producto SyA
     [Arguments]                            ${Producto_SYA_1_Button}
     wait until element is enabled          ${Producto_SYA_1_Button}      timeout=0:00:10
     wait until element is visible          ${Producto_SYA_1_Button}      timeout=0:00:10
     set focus to element                   ${Producto_SYA_1_Button}
     click element                          ${Producto_SYA_1_Button}


Agregar Monto
     [Arguments]                            ${Fuel_other_monto_campo}     ${Fuel_other_monto}        ${Fuel_other_Ok_button}
     wait until element is enabled          ${Fuel_other_monto_campo}      timeout=0:00:10
     wait until element is visible          ${Fuel_other_monto_campo}      timeout=0:00:10
     set focus to element                   ${Fuel_other_monto_campo}
     input text                             ${Fuel_other_monto_campo}      ${Fuel_other_monto}
     click element                          ${Fuel_other_Ok_button}

Finalizar

    wait until element is enabled         ${Fuel_other_Finalizar_button}      timeout=0:00:10
    wait until element is visible         ${Fuel_other_Finalizar_button}      timeout=0:00:10
    set focus to element                  ${Fuel_other_Finalizar_button}
    click element                         ${Fuel_other_Finalizar_button}
    Sleep                                 5s
    wait until element is enabled         ${Fuel_other_Cancel_Print}          timeout=0:00:10
    wait until element is visible         ${Fuel_other_Cancel_Print}          timeout=0:00:10
    capture page screenshot
    set focus to element                  ${Fuel_other_Cancel_Print}
    element should contain                 ${Fuel_other_Body_Print}            Producto SyA 1       ignore_case=False

#Validar Remito