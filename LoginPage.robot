*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Campo_User_Name} =                   xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[2]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[1]/div/div[2]/input
${Campo_contraseña} =                  xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[2]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[2]/div/div[2]/input
${login_ingreso_button} =              xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[2]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[3]/div/div/div/div
${Username} =                          Testing_2
${contraseña} =                        Testing_2
${Username_es_requerido_alerta} =      xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[2]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[1]/div/div[3]
${Contrasena_es_requerida_alerta} =    xpath://*[@id="root"]/div/div/div/div/div/div[1]/div[2]/div[2]/div[2]/div/div/div/div[1]/div/div[2]/div/div[2]/div/div[3]

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



Login con credenciales validas
    click element            ${Campo_User_Name}
    input text               ${Campo_User_Name}            ${Username}
    input password           ${Campo_contraseña}           ${contraseña}
    click element            ${login_ingreso_button}

Clic enter sin credenciales
     click element                      ${login_ingreso_button}
     wait until element is visible      ${Username_es_requerido_alerta}
     page should contain                User name es requerido
     wait until element is visible      ${Contrasena_es_requerida_alerta}
     page should contain                Contraseña es requerido


