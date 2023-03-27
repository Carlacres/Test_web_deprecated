*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HEADER_CONFIGURACION} =       Configuración
${CAMPO_PROTOCOLO} =            xpath://*[@id="root"]/div/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[1]/div[2]/input
${CAMPO_HOST} =                 xpath://*[@id="root"]/div/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[2]/div[2]/input
${CAMPO_PUERTO} =               xpath://*[@id="root"]/div/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[3]/div[2]/input
${CAMPO_URI} =                  xpath://*[@id="root"]/div/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[4]/div[2]/input
${CAMPO_TERMINAL} =             xpath://*[@id="root"]/div/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[5]/div[2]/input
${CONECTAR_BOTON} =             xpath://*[@id="root"]/div/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[6]/div
${TERMINAL} =                   6
${PROTOCOLO} =                  http
${HOST} =                       stsypflab
${Login_subtitle} =             ¡Hola!
${PUERTO} =                     8081
${Login_subtitle} =             Usá tu usuario y contraseña para iniciar sesión

*** Keywords ***

Completar configuración
        input text                  ${CAMPO_HOST}          ${HOST}
        input text                  ${CAMPO_TERMINAL}      ${TERMINAL}
        input text                  ${CAMPO_PUERTO}        ${PUERTO}
        click element               ${CONECTAR_BOTON}

Verify Login Page Loaded
    wait until page contains        ${Login_subtitle}