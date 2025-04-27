*** Settings ***
Documentation    This childWindowPage file will include all locators, keyword implementations etc., that are specific to
...    the childWindow page.
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${childWindowHeader}    css:h1
${headerText}        DOCUMENTS REQUEST
${emailStatement}    xpath://p[@class = "im-para"]/following-sibling::p[text() = "Please email us at "]

*** Keywords ***
Verify that the user is switched to child window on clicking the link
    Switch Window    NEW
    Wait Until Element Is Visible    ${childWindowHeader}
    Element Text Should Be    ${childWindowHeader}    ${headerText}

Fetch the email id from the child window
    ${text}=    Get Text    ${emailStatement}
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    @{words_2}=    Split String    ${text_split}
    ${email}=    Get From List    ${words_2}    0