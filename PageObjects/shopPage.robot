*** Settings ***
Documentation    This shopPage file will include all locators, keyword implementations etc., that are specific to
...    the shop page.
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${homePageElement}        css:.nav-link
${cardNamesLocator}    xpath://h4[@class='card-title']/child::a[@href='#']

*** Keywords ***
Wait until element is visible in the webpage
    Wait Until Element Is Visible    ${homePageElement}

Verify card titles in the shop page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get Webelements    ${cardNamesLocator}
    @{actualList}=    Create List

    FOR    ${elements}    IN    @{elements}
        Append To List    ${actualList}    ${elements.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select the add button of the given Card
    [Arguments]    ${cardName}
    ${index}=    Set Variable    1
    @{elements}=    Get Webelements    ${cardNamesLocator}
    FOR    ${elements}    IN    @{elements}
        Exit For Loop If    '${elements.text}' == '${cardName}'
        ${index}=    Evaluate    ${index}+1
    END
    Click Button    xpath:(//div[@class ='card-footer'])[${index}]/button