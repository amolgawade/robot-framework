*** Settings ***

Documentation       To validate the login form
Library             SeleniumLibrary

Library             DataDriver      file=Resources/data.csv     encoding=utf_8      dialect=unix
Test Teardown       Close Browser
Test Template       validate UnSuccesful login

*** Variables ***
${error_message_login}      //*[@id="login-form"]/div[1]

*** Test Cases ***
login with user


*** Keywords ***
validate UnSuccesful login
        [Arguments]     ${username}         ${password}
        open the browser with mortage payment url
        fill login form     ${username}               ${password}
        wait until it checks and display error maessage
        verify the error message
        hello_word

*** Keywords ***
open the browser with mortage payment url
    Create Webdriver    Firefox
    Go To    https://rahulshettyacademy.com/loginpagePractise/#

fill login form
     [Arguments]         ${username}               ${password}
     Input Text         //input[@id="username"]    ${username}
     Input Password     //input[@id="password"]    ${password}
     Click Button       //input[@id="signInBtn"]
wait until it checks and display error maessage
    Wait Until Element Is Visible       ${error_message_login}


verify the error message
    ${actual_text}=     Get Text    ${error_message_login}
    
    Should Be Equal As Strings    ${actual_text}    Incorrect username/password.
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
    

