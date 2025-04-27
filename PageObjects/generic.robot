*** Settings ***
Documentation    This resource file will include all commonly used functions, variables etc.,
...    The setup, teardown, login url, credentials etc., will be declared in the resource file
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/loginpagePractise/
${username}    rahulshettyacademy
${wrongPassword}    12345678
${validPassword}    learning
${browser}        Chrome

*** Keywords ***
Open the browser with the Mortgage payment URL
    Create Webdriver    Firefox
    Go To    ${url}
    Maximize Browser Window

Open the browser with the URL
    Create Webdriver    ${browser}
    Go To    ${url}
    Maximize Browser Window
    
Fill the login form
    [Arguments]    ${user_name}    ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

Close the browser session
    Close Browser