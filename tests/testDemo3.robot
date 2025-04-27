*** Settings ***
Documentation    To validate the child window on clicking its link
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open the browser with the Mortgage payment URL
Test Teardown    Close the browser session
Resource    ../PageObjects/generic.robot
Resource    ../PageObjects/childWindowPage.robot
Resource    ../PageObjects/landingPage.robot

*** Test Cases ***
Validate the child window by clicking on its link
    [Tags]    SMOKE    REGRESSION
    landingPage.Click on the link for the child window
    childWindowPage.Verify that the user is switched to child window on clicking the link
    childWindowPage.Fetch the email id from the child window
    landingPage.Switch back to parent window and enter the email id