*** Settings ***
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/PO/configuracion_dispositivo.robot
Resource    ../Resources/PO/Venta_combustible.robot
Resource    ../Resources/PO/Venta_Otros.robot
Resource    ../Resources/PO/Caminos_negativos.robot

*** Variables ***
${LOGIN_URL} =                  http://10.4.11.1:19080/
${BROWSER} =                    chrome
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
${OPCION_MANUAL_BUTTON} =       xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[3]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div[2]/div[2]/div
*** Keywords ***
Acceder a la url
    [Documentation]          Info sobre Login
    [Tags]                   Login          YPF     Configuración

    ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument      disable-web-security
    Call Method    ${options}    add_argument      allow-running-insecure-content
    Call Method    ${options}    add_argument      "C://Chrome dev session"
    Create WebDriver             Chrome            chrome_options=${options}
    Go To                        http://10.4.11.1:19080/
    maximize browser window

Ir a la pagina de Login
        configuracion_dispositivo.Completar configuración
        configuracion_dispositivo.Verify Login Page Loaded

Login
        LoginPage.Login con credenciales validas

Login campos vacios

        LoginPage.Clic enter sin credenciales

Seleccionar Opcion Manual
       Venta_combustible.Seleccionar tipo de operación

Completar campo Tarjeta
       Venta_combustible.Rellenar campo tarjeta

Completar expiracion Tarjeta
     Venta_combustible.Expiracion tarjeta         ${EXPIRACION_TARJETA_CAMPO}      ${Expiration_tarjeta}        ${EXPIRACION_CONFIRMAR_BUTTON}

Seleccionar Tipo de Venta
     Venta_combustible.Seleccionar opcion Venta Combustible

Seleccionar Surtidor
     Venta_combustible.Seleccionar surtidor         ${SURTIDOR_01_COMBUSTIBLE}  ${AUTORIZAR_OPCION_SI}    ${ODOMETRO_VALOR_CAMPO}    ${Odometro_valor}      ${ODOMETRO_VALOR_CONFIRMAR}

Seleccionar Combustible Infinia Facturable
     Venta_combustible.Seleccionar combustible

Seleccionar Opcion Venta otros
     Venta_Otros.Seleccionar Otros

Seleccionar Opcion Lubricante
     Venta_Otros.Seleccionar Lubricante

Seleccionar Opcion S&A
     Venta_Otros.Seleccionar S&A            ${Opcion_S&A_Button}

Seleccionar Opcion Producto SyA 1
     Venta_Otros.Seleccionar Producto SyA   ${Producto_SYA_1_Button}

Completar Importe
      Venta_Otros.Agregar Monto             ${Fuel_other_monto_campo}     ${Fuel_other_monto}        ${Fuel_other_Ok_button}

Finalizar Operacion
       Venta_Otros.Finalizar

Clic confirmar sin rellenar campo tarjeta
      Venta_combustible.Intentar avanzar sin rellenar campo tarjeta

Validar alerta Tarjeta es requerida
      Caminos_negativos.Validar alerta Dni o tarjeta son requeridos

Validar generación de Remito
      Venta_combustible.Obtener Remito

Seleccionar Opcion App ruta
      Venta_combustible.Click app ruta

Click en la Patente
      Venta_combustible.Seleccionar patente






