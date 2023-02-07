*** Settings ***

Documentation       To validate the login form
Library             SeleniumLibrary
Library             Collections
Library             BuiltIn
Test Setup          open the browser with mortage payment url
Test Teardown       Close Browser session
Resource            resource.robot



*** Variables ***
${error_message_login}      //*[@id="login-form"]/div[1]
${shop_page_load}           //a[@class="nav-link btn btn-primary"]


*** Test Cases ***
#validate UnSuccesful login
#
#        fill login form     ${user_name}        ${invalid_pass}
#        Wait Until Element Is located in page       ${error_message_login}
#        verify the error message

#validate the card display in shoping page
#        fill login form       ${user_name}     ${valid_pass}
#        Wait Until Element Is located in page       ${shop_page_load}
#        verify the card title in shop page
#        select the card from shop           Blackberry

select the form and navigate to alert window
        fill login form and select user option



*** Keywords ***

fill login form

    [Arguments]         ${username}               ${password}
    Input Text         //input[@id="username"]    ${username}
    Input Password     //input[@id="password"]    ${password}
    Click Button       //input[@id="signInBtn"]

Wait Until Element Is located in page
    [Arguments]         ${element}
    Wait Until Element Is Visible       ${element}


verify the error message
    ${actual_text}=     Get Text    ${error_message_login}
    
    Should Be Equal As Strings    ${actual_text}    Incorrect username/password.
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
    
verify the card title in shop page
    @{list_title}=    Get WebElements     (//h4[@class='card-title'])
    @{expe_title}=  Create List     iphone X    Samsung Note 8      Nokia Edge       Blackberry
    @{actual_text}=     Create List
    FOR    ${element}    IN    @{list_title}
        Log    ${element.text}
        Append To List      ${actual_text}      ${element.text}

    END
    Lists Should Be Equal    ${expe_title}      ${actual_text}

select the card from shop
        [Arguments]         ${cardname}
        @{list_title}=    Get WebElements     (//h4[@class='card-title'])
        ${index}=       Set Variable        1
        FOR    ${element}    IN    @{list_title}
            Exit For Loop If    '${cardname}' == '${element.text}'
            ${index} =  Evaluate      ${index} + 1
        END
        
        Click Button    (//button[contains(text(),'Add')])[${index}]

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




