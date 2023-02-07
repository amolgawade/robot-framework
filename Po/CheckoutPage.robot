*** Settings ***
Documentation       All the page objects and keywords , variables
...
...
Library     SeleniumLibrary

*** Variables ***
${shop_page_load}           //a[@class="nav-link btn btn-primary"]
${error_message_login}      //*[@id="login-form"]/div[1]


*** Keywords ***
verify the item in checkout page and proceed
    @{list_title}=    Get WebElements     (//h4/a)
    @{expe_title}=  Create List          Nokia Edge       Blackberry
    @{actual_text}=     Create List
    FOR    ${element}    IN    @{list_title}
        Log    ${element.text}
        Append To List      ${actual_text}      ${element.text}

    END
    Lists Should Be Equal    ${expe_title}      ${actual_text}


Checkoutpage.click on checkout
    sleep  5
    wait until page contains    Checkout
    click element     (//button[@type='button'])[5]

