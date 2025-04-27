*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup    Open the browser with the URL
Test Teardown    Close the browser session
Resource    ../PageObjects/generic.robot

# We can give the knowledge of the resource file that we are utilizing in our framework, to our robot file by
# using the keyword 'Resource' in the Settings module

*** Variables ***
${loginErrorMsg}    css:.alert-danger

*** Test Cases ***
Validate Unsuccessful login
    # The definition for the business keywords will be searched in the respective robot file and if it is not
    # present there, then the resource file will be checked which is declared in the settings module
    Fill the login form    ${username}    ${wrongPassword}
    Wait until element is visible in the webpage    ${loginErrorMsg}
    Verify error message is correct

*** Keywords ***
Wait until element is visible in the webpage
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message is correct
    ${result}=    Get Text    ${loginErrorMsg}
    Should Be Equal As Strings    ${result}    Incorrect username/password.