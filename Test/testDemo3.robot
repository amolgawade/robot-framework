*** settings ***

Documentation       To validate the login form
Library             SeleniumLibrary
Test Teardown       Close Browser
Test Setup          open the browser with mortage payment url
Resource            resource.robot


*** Variables ***
${error_message_login}      //*[@id="login-form"]/div[1]
${text}=        mentor@rahulshettyacademy.com
*** Test Cases ***
validate child window functionality
        select the link for chiled window
        verify the user switched to chiled window
        grab email id in the chiled window
        switch to the parent window


*** Keywords ***
select the link for chiled window
    Click Element    //a[@class="blinkingText"]
    Sleep    3

verify the user switched to chiled window
    Switch Window   NEW
    Title Should Be    RS Academy
    Element Text Should Be    css:h1    DOCUMENTS REQUEST


grab email id in the chiled window

    Element Text Should Be      //a[normalize-space()="mentor@rahulshettyacademy.com"]      ${text}

switch to the parent window
    Switch Window   MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy



