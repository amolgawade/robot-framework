*** Settings ***
Documentation       All the page objects and keywords , variables
...
...
Library     SeleniumLibrary

*** Variables ***
${shop_page_load}           //a[@class="nav-link btn btn-primary"]
${error_message_login}      //*[@id="login-form"]/div[1]


*** Keywords ***

fill login form

    [Arguments]         ${username}               ${password}
    Input Text         //input[@id="username"]    ${username}
    Input Password     //input[@id="password"]    ${password}
    Click Button       //input[@id="signInBtn"]

Wait Until Element Is located in page
    Wait Until Element Is Visible        ${error_message_login}

verify the error message
    ${actual_text}=     Get Text    ${error_message_login}

    Should Be Equal As Strings    ${actual_text}    Incorrect username/password.
    Element Text Should Be    ${error_message_login}    Incorrect username/password.


fill login form and select user option
    Input Text         //input[@id="username"]    rahulshettyacademy
    Input Password     //input[@id="password"]    learning
    Click Button    //input[@value="user"]
    Set Selenium Speed      0.5
    Wait Until Element Is Visible    //div[@class="modal-body"]
    Click Button    //button[@id="okayBtn"]

    Wait Until Element Is Not Visible    //div[@class="modal-body"]
    Click Element    //select[@class="form-control"]
    Select From List By Value    //select[@class="form-control"]       teach


    Click Element    //input[@id="terms"]
    Click Button       //input[@id="signInBtn"]