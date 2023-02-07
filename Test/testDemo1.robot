*** Settings ***
Documentation        To validate the login form
Library              SeleniumLibrary
Test Teardown        Close Browser

*** Variables ***
${error_message_login}      //*[@id="login-form"]/div[1]

*** Test Cases ***
validate UnSuccesful login
        open the browser with mortage payment url
        fill login form
        wait until it checks and display error maessage
        verify the error message

*** Keywords ***
open the browser with mortage payment url
    Create Webdriver    Firefox
    Go To    https://rahulshettyacademy.com/loginpagePractise/#

fill login form
    Input Text    //input[@id="username"]    rahulshettyacademy
    Input Password    //input[@id="password"]    123
    Click Button    //input[@id="signInBtn"]

wait until it checks and display error maessage
    Wait Until Element Is Visible       ${error_message_login}


verify the error message
    ${actual_text}=     Get Text    ${error_message_login}
    
    Should Be Equal As Strings    ${actual_text}    Incorrect username/password.
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
    

