*** Settings ***
Documentation    This robot file is to learn Dictionary in python
Library        Collections
Library    RequestsLibrary

*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_ID}
${book_name}    TestTech

*** Test Cases ***
Play around with Dictionary
    &{rajDetails}=    Create Dictionary    Name=Rajiv    Age=30    Gender=Male    MaritalStatus=Married
    Log    ${rajDetails}
    Dictionary Should Contain Key    ${rajDetails}    Gender
    Get From Dictionary    ${rajDetails}        Age
    
Add book into Library Database
    [Tags]    API
    &{req_body}=    Create Dictionary    name=${book_name}    isbn=blow    aisle=9000    author=Waja
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    Log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    Msg
    Dictionary Should Contain Key    ${response.json()}    ID
    ${actualMsg}=    Get From Dictionary    ${response.json()}    Msg
    Should Be Equal As Strings    successfully added    ${actualMsg}
    ${book_ID}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_ID}
    Log    ${book_ID}
    Status Should Be    200    ${response}
    
Get the book details which got added
    [Tags]    API
    ${get_response}=    GET    ${base_url}/Library/GetBook.php    params=ID=${book_ID}    expected_status=200
    Log    ${get_response.json()}
    Should Be Equal As Strings    ${book_name}    ${get_response.json()}[0][book_name]
    # The api response for a get request here is a list with a dictionary in its 0th index
    
Delete the book from database
    [Tags]    API
    &{deleteReq_body}    Create Dictionary    ID=${book_ID}
    ${delete_response}=    POST    ${base_url}/Library/DeleteBook.php    json=${deleteReq_body}    expected_status=200
    Log    ${delete_response.json()}
    Should Be Equal As Strings    book is successfully deleted    ${delete_response.json()}[msg]