*** Settings ***
# Prefixed and Suffixed by *** refers to module name declaration
Documentation    To validate the login form
# The documentation keyword describes what we are doing with that robot file
# We can use the documentation keyword to give a description of our test suite by tabbing from the keyword
Library    SeleniumLibrary
# For every keyword in Settings module, a tab is needed and not space. We can specify the libraries that we are
# using in our robot file, in the settings module and provide documentation keyword to give a description
# A robot file is basically a test suite
Test Setup        Open the browser with the Mortgage payment URL
Test Teardown    Close the browser session
Resource        ../PageObjects/generic.robot
Resource        ../PageObjects/landingPage.robot
# The settings module can be used to define documentation/description, library and test setup/teardown keywords
# Define a custom or business keyword for test teardown and provide its definition in the Keywords module using
# selenium keywords along with the definition for other test steps

*** Test Cases ***
Validate Unsuccessful login
    [Tags]    SMOKE
    # First we are writing business keywords which are the test steps for the test cases.
    # Followed by this, we will be writing library keywords to execute the test steps by mapping the business
    # keywords with selenium or other library keywords
    # The business keywords also start with a tab under the test case name so that it is distinguished
    landingPage.Fill the login form    ${username}    ${wrongPassword}
    landingPage.Wait until it checks and displays error message
    landingPage.Verify error message is correct