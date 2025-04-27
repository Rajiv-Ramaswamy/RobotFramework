*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup    Run Keywords    Open the browser with the URL    AND    generic.Fill the login form    ${username}    ${validPassword}
Test Teardown    Close the browser session
Resource    ../PageObjects/generic.robot
Resource    ../PageObjects/shopPage.robot
Resource    ../PageObjects/landingPage.robot

# The Run Keywords can be used to specify more than one business keyword or test step to run in Test Setup
# We can give the knowledge of the resource file that we are utilizing in our framework, to our robot file by
# using the keyword 'Resource' in the Settings module

*** Test Cases ***

Validate Successful login
    [Tags]    SMOKE
    shopPage.Wait until element is visible in the webpage
    shopPage.Verify card titles in the shop page
    shopPage.Select the add button of the given Card    Samsung Note 8

Validate Radio button, alert popup and dropdown in the login form
    [Tags]    REGRESSION
    landingPage.Click the User option in the radio button
    landingPage.Wait for the alert popup to appear
    landingPage.Handle the alert popup
    landingPage.Select the dropdown in the form page and choose the option Consultant
    landingPage.Click the terms & conditions checkbox