*** Settings ***
#Documentation    To validate the login form
#Library        SeleniumLibrary
#Test Setup    Open the browser with the Mortgage payment URL
#Test Teardown    Close the browser session
#Resource        ../PageObjects/generic.robot
#Library    DataDriver    ../resources/testdata.csv
#Test Template    Validate Unsuccessful login

*** Variables ***
#${loginErrorMsg}    css:.alert-danger
#${expectedError}    Incorrect username/password.

*** Test Cases ***
#Verify login with ${username} and ${password}    xyzabc    learning
# The above statement with sample data set is provided as a backup in case the .csv file got corrupted or not accessed
# Whereas in test template without DataDriver, the data sets would have been specified in Test Cases module
# Using the DataDriver library to handle multiple datasets in a .csv or .xlsx file is similar to Test Template but
# here the data is in a file and not in Test Cases module. In Test Cases module, a simple test case with variable
# and sample data is used
# For handling data in a file also, we need to use the Test Template keyword

*** Keywords ***
# When you place your test case with business keywords inside the *** Keywords *** module, it becomes a test template

#Validate Unsuccessful login
    #[Arguments]    ${username}    ${password}
    #Fill the login form    ${username}    ${password}
    #Wait until it checks and displays error message
    #Verify error message is correct

#Fill the login form
    #[Arguments]    ${username}    ${password}
    #Input Text        id:username    ${username}
    #Input Password    id:password    ${password}
    #Click Button      id:signInBtn

#Wait until it checks and displays error message
    #Wait Until Element Is Visible    ${loginErrorMsg}

#Verify error message is correct
    #${result}=    Get Text    ${loginErrorMsg}
    #Should Be Equal As Strings    ${result}    ${expectedError}