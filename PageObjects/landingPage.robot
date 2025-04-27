*** Settings ***
Documentation    This landingPage file will include all locators, keyword implementations etc., that are specific to
...    the landing page.
Library    SeleniumLibrary
Resource    generic.robot

*** Variables ***
${loginErrorMsg}      css:.alert-danger
${userRadioButton}    xpath://input[@value = 'user']/following-sibling::span[@class = 'checkmark']
${okayButtonAlert}    id:okayBtn
${dropdownHomePage}    css:select.form-control
${alertElement}        xpath://div[@class='modal-backdrop fade']
${dropdownValue}        consult
${termsConditions}    id:terms
${expectedError}        Incorrect username/password.
${childWindowLink}    css:.blinkingText
${practiseTitle}    LoginPage Practise | Rahul Shetty Academy
${usernameLocator}        id:username

*** Keywords ***
Fill the login form
    [Arguments]    ${user_name}    ${password}
    Input Text        ${usernameLocator}    ${user_name}
    Input Password    id:password            ${password}
    Click Button      id:signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    ${loginErrorMsg}

Verify error message is correct
    ${result}=    Get Text    ${loginErrorMsg}
    Should Be Equal As Strings    ${result}    ${expectedError}
    
Click the User option in the radio button
    Click Element    ${userRadioButton}

Wait for the alert popup to appear
    Wait Until Element Is Visible    ${okayButtonAlert}

Handle the alert popup
    Click Button    ${okayButtonAlert}
    Click Button    ${okayButtonAlert}

Select the dropdown in the form page and choose the option Consultant
    Wait Until Element Is Not Visible    ${okayButtonAlert}
    Wait Until Element Is Visible    ${dropdownHomePage}
    Wait Until Element Is Not Visible    ${alertElement}
    Select From List By Value    ${dropdownHomePage}    ${dropdownValue}
    # For selecting an option from a dropdown in robot framework, we need not click on the dropdown first and then
    # select value from it. Instead we can directly use Select From List By Value keyword and specify the value
    # that needs to be selected. Here still the locator needs to point the dropdown and then give the value to select

Click the terms & conditions checkbox
    Select Checkbox    ${termsConditions}
    Checkbox Should Be Selected    ${termsConditions}

Click on the link for the child window
    Click Element    ${childWindowLink}
    Sleep    5

Switch back to parent window and enter the email id
    Switch Window    MAIN
    Title Should Be    ${practiseTitle}
    Input Text    ${usernameLocator}    ${username}