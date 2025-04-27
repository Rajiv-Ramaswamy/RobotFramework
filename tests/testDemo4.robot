*** Settings ***
Documentation        To validate the login form
Library            SeleniumLibrary
Test Setup        Open the browser with the Mortgage payment URL
Test Teardown    Close the browser session
Test Template    Validate Unsuccessful login
Resource        ../PageObjects/generic.robot

# The keyword 'Test Template' refers to the test case that is to be used for data driven execution. Single
# test case with multiple sets of data. Mention the test case name with a tab space from the keyword Test Template

*** Variables ***
${loginErrorMsg}    css:.alert-danger
${expectedError}    Incorrect username/password.

*** Test Cases ***    username            password
Invalid Username    dsahed                learning
Invalid Password    rahulshettyacademy    ploudfg
Special Characters    @#$                learning

# To achieve data driven execution, the business keywords to be included in Keywords module and the test data
# to be included in the Test cases module

*** Keywords ***
# When you place your test case with business keywords inside the *** Keywords *** module, it becomes a test template
# Also use the [Arguments] keyword and list the arguments required for the validation along with the test case with
# business keywords. The [Arguments] are required in the keyword definitions as well for the test step that has
# multiple data inputs. The keyword implementations are also in the Keywords module for the test template just below
# the business keywords

Validate Unsuccessful login
    [Arguments]    ${username}    ${password}
    Fill the login form    ${username}    ${password}
    Wait until it checks and displays error message
    Verify error message is correct

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    ${loginErrorMsg}

Verify error message is correct
    ${result}=    Get Text    ${loginErrorMsg}
    Should Be Equal As Strings    ${result}    ${expectedError}