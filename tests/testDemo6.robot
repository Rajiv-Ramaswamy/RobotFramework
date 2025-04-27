*** Settings ***
Documentation    To validate the login form
Library        SeleniumLibrary
Library        Collections
Library        ../customLibraries/shop.py
Library        ../customLibraries/checkout.py
Test Setup    Open the browser with the Mortgage payment URL
Test Teardown    Close the browser session
Resource        ../PageObjects/generic.robot
Resource        ../PageObjects/landingPage.robot
Resource        ../PageObjects/shopPage.robot
Resource        ../PageObjects/confirmationPage.robot

*** Variables ***
@{productslist}    Samsung Note 8    Nokia Edge
${deliveryLoc}            India
${deliveryLocSuggestion}    //a[text() = "${deliveryLoc}"]
*** Test Cases ***
Validate Successful login and purchase
    [Tags]    REGRESSION
    landingPage.Fill the login form    ${username}    ${validPassword}
    shopPage.Wait until element is visible in the webpage
    shopPage.Verify card titles in the shop page
    add items to cart and checkout    ${productslist}
    verify products and click checkout    ${productslist}
    confirmationPage.Enter your delivery location on the confirmation page    ${deliveryLoc}
    confirmationPage.Select the delivery location suggestion    ${deliveryLocSuggestion}
    confirmationPage.Click on the terms and conditions checkbox
    confirmationPage.Click on the purchase button
    confirmationPage.Verify the success message on the screen
    # Here, the business keyword "add items to cart and checkout" is a custom keyword implementation created in
    # python. The custom python implementation keyword is imported in this .robot file as library using the
    # 'library' keyword and the path of the file is provided with a tab space