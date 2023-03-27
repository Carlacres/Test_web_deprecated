*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER} =    chrome
# --user-data-dir="C://Chrome dev session" --disable-web-security "http://10.4.11.1:19080/"


*** Keywords ***

Begin Web Test
    set selenium speed          .2s
    set selenium timeout        10s
    open browser                about:blank         ${Browser}
    maximize browser window
End Web Test
    close all browsers