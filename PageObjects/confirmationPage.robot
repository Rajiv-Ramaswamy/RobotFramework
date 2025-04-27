*** Settings ***
Documentation    This confirmationPage file will include all locators, keyword implementations etc., that are specific to
...    the confirmation page.
Library    SeleniumLibrary

*** Variables ***
${deliverySuggestion}    //a[text() = "India"]

*** Keywords ***
Enter your delivery location on the confirmation page
    [Arguments]    ${delivery_Loc}
    Input Text    country    ${delivery_Loc}

Select the delivery location suggestion
    [Arguments]    ${delivery_Loc_suggestion}
    Sleep    3
    Wait Until Element Is Visible    ${delivery_Loc_suggestion}
    Click Element    ${delivery_Loc_suggestion}
    Wait Until Element Is Not Visible    ${delivery_Loc_suggestion}

Click on the terms and conditions checkbox
    Sleep    3
    #Wait Until Element Is Enabled    ${checkbox}
    #Select Checkbox    ${checkbox}
    Click Link    xpath://a[text() = "term & Conditions"]
    Wait Until Element Is Visible    xpath://h1[text() = "Terms And Conditions"]
    Click Button    xpath://button[text() = "Close"]

Click on the Purchase button
    Sleep    3
    Element Should Not Be Visible    xpath://button[text() = "Close"]
    Click Button        xpath://input[@type = "submit" and @value = "Purchase"]

Verify the success message on the screen
    Sleep    1
    Page Should Contain    Success!