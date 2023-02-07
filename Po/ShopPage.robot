*** Settings ***
Documentation       A resorce file is reusable keywords and variables
...
...
Library     SeleniumLibrary


*** Variables ***

${error_message_login}      //*[@id="login-form"]/div[1]
${shop_page_load}           //a[@class="nav-link btn btn-primary"]

*** Keywords ***

Wait Until Element Is located in page
    Wait Until Element Is Visible       ${shop_page_load}


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

ShopPage.click on checkout
    click element        //a[@class='nav-link btn btn-primary']

