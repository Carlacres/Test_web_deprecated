*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Ingreso_manual_boton} =          xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[3]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[2]/div/div/div/div/div[1]/div/div
${App_ruta_boton} =                xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[3]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[3]/div/div/div/div/div[1]/div/div
${OPERACION_SALIR_BUTTON} =        xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[3]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div[3]/div/div/div
${COMPLETAR_TARJETA_CAMPO} =       xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[4]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div[2]/div[2]/input
${Tarjeta_numero} =                70841411277800301
${CONFIRMAR_TARJETA_BUTTON} =      xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[4]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div[3]/div/div/div
${EXPIRACION_TARJETA_CAMPO} =      xpath:/html/body/div[15]/div/div[2]/div/div/div[2]/div/div[3]/div[2]/input
${EXPIRACION_OK_BUTTON} =          xpath:/html/body/div[15]/div/div[2]/div/div/div[2]/div/div[4]/div[1]/div/div/div
${EXPIRACION_CONFIRMAR_BUTTON} =   xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[4]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div[4]/div
${VENTA_COMBUSTIBLE_BUTTON} =      xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[5]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[1]/div/div/div
${Seleccionar_operacion_header} =  xpath:
${SURTIDOR_01_COMBUSTIBLE} =       xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[6]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[2]/div/div/div[1]
${AUTORIZAR_OPCION_SI} =           xpath:/html/body/div[23]/div/div[2]/div/div/div[2]/div/div[5]/div[1]/div
${ODOMETRO_VALOR_CAMPO} =          xpath:/html/body/div[24]/div/div[2]/div/div/div[2]/div/div[3]/div[2]/input
${ODOMETRO_VALOR_CONFIRMAR} =      xpath:/html/body/div[24]/div/div[2]/div/div/div[2]/div/div[4]/div/div/div/div
${Expiration_tarjeta} =            5555
${Odometro_valor} =                200
${Opcion_infinia_facturable} =     xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[6]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[3]/div/div/div
${Header} =                        Hola usuario: Testing_2
${Present_en_curso_header} =       xpath: //*[@id="root"]/div/div/div/div/div/div[1]/div[7]/div[2]/div[2]/div/div/div/div[1]/div/div[1]/div/div[1]
${Cerrar_remito_infinia} =         xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[2]/div[2]/div[2]/div/div/div/div[1]/div/div/div/div[1]/div
${Body_remito_infinia} =           INFINIA FACTURABL
${Accion_suspender_button} =       xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[7]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div[6]/div[1]/div/div/div
${Seleccionar_patente} =           xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[4]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div/div[2]
${Acciones_clientes_header} =      xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[5]/div[2]/div[2]/div/div/div/div[1]/div/div[1]/div/div[2]
${App_ruta_header} =               xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[4]/div[2]/div[2]/div/div/div/div[1]/div/div[1]/div/div
*** Keywords ***

Seleccionar tipo de operación
            wait until element is visible       ${Ingreso_manual_boton}
            click element                       ${Ingreso_manual_boton}

Rellenar campo tarjeta
    wait until page contains element       ${COMPLETAR_TARJETA_CAMPO}
    click element                          ${COMPLETAR_TARJETA_CAMPO}
    input text                             ${COMPLETAR_TARJETA_CAMPO}      ${Tarjeta_numero}
    click element                          ${CONFIRMAR_TARJETA_BUTTON}

Intentar avanzar sin rellenar campo tarjeta
    wait until page contains element       ${COMPLETAR_TARJETA_CAMPO}
    click element                          ${COMPLETAR_TARJETA_CAMPO}
    click element                          ${CONFIRMAR_TARJETA_BUTTON}


Expiracion tarjeta
    [Arguments]                            ${EXPIRACION_TARJETA_CAMPO}      ${Expiration_tarjeta}       ${EXPIRACION_CONFIRMAR_BUTTON}
    wait until element is enabled          ${EXPIRACION_TARJETA_CAMPO}      timeout=0:00:10
    wait until element is visible          ${EXPIRACION_TARJETA_CAMPO}      timeout=0:00:10
    set focus to element                   ${EXPIRACION_TARJETA_CAMPO}
    input text                             ${EXPIRACION_TARJETA_CAMPO}      ${Expiration_tarjeta}
    wait until element is enabled          ${EXPIRACION_OK_BUTTON}          timeout=0:00:10
    wait until element is visible          ${EXPIRACION_OK_BUTTON}          timeout=0:00:10
    set focus to element                   ${EXPIRACION_OK_BUTTON}
    click element                          ${EXPIRACION_OK_BUTTON}
    click element                          ${EXPIRACION_CONFIRMAR_BUTTON}

Seleccionar opcion Venta Combustible
     wait until element is enabled          ${VENTA_COMBUSTIBLE_BUTTON}      timeout=0:00:15
     wait until element is visible          ${VENTA_COMBUSTIBLE_BUTTON}      timeout=0:00:20
     set focus to element                   ${VENTA_COMBUSTIBLE_BUTTON}
     click element                          ${VENTA_COMBUSTIBLE_BUTTON}

Seleccionar surtidor
    [Arguments]         ${SURTIDOR_01_COMBUSTIBLE}  ${AUTORIZAR_OPCION_SI}    ${ODOMETRO_VALOR_CAMPO}    ${Odometro_valor}      ${ODOMETRO_VALOR_CONFIRMAR}
    wait until page contains element       ${SURTIDOR_01_COMBUSTIBLE}
    click element                          ${SURTIDOR_01_COMBUSTIBLE}
    wait until element is enabled          ${AUTORIZAR_OPCION_SI}               timeout=0:00:10
    wait until element is visible          ${AUTORIZAR_OPCION_SI}               timeout=0:00:10
    set focus to element                   ${AUTORIZAR_OPCION_SI}
    click element                          ${AUTORIZAR_OPCION_SI}
    wait until element is enabled          ${ODOMETRO_VALOR_CAMPO}              timeout=0:00:10
    wait until element is visible          ${ODOMETRO_VALOR_CAMPO}              timeout=0:00:10
    set focus to element                   ${ODOMETRO_VALOR_CAMPO}
    input text                             ${ODOMETRO_VALOR_CAMPO}              ${Odometro_valor}
    wait until element is enabled          ${ODOMETRO_VALOR_CONFIRMAR}          timeout=0:00:10
    wait until element is visible          ${ODOMETRO_VALOR_CONFIRMAR}          timeout=0:00:10
    set focus to element                   ${ODOMETRO_VALOR_CONFIRMAR}
    click element                          ${ODOMETRO_VALOR_CONFIRMAR}


Seleccionar combustible
    wait until element is enabled          ${Opcion_infinia_facturable}      timeout=0:00:10
    wait until element is visible          ${Opcion_infinia_facturable}      timeout=0:00:10
    set focus to element                   ${Opcion_infinia_facturable}
    click element                          ${Opcion_infinia_facturable}

Obtener Remito
    wait until element is enabled         ${Present_en_curso_header}          timeout=0:00:20
    wait until element is visible         ${Present_en_curso_header}          timeout=0:00:20
    sleep                                 5s
    wait until element is enabled         ${Cerrar_remito_infinia}            timeout=0:08:00
    wait until element is visible         ${Cerrar_remito_infinia}            timeout=0:08:00
    capture page screenshot
    set focus to element                  ${Cerrar_remito_infinia}
    element should contain                ${Cerrar_remito_infinia}             ${Body_remito_infinia}       ignore_case=False

# Pantalla Preset --Capturar Header aca tendria que esperar 1 min
# Pantalla remito -- que aparezca la x
# que compare texto del remito (infinia facturabl)

Click app ruta
            wait until element is visible       ${App_ruta_boton}
            click element                       ${App_ruta_boton}

Seleccionar patente

    wait until element is enabled          ${Seleccionar_patente}               timeout=0:00:10
    wait until element is visible          ${Seleccionar_patente}               timeout=0:00:10
    set focus to element                   ${Seleccionar_patente}
    click element                          ${Seleccionar_patente}
    Sleep                                  5s


