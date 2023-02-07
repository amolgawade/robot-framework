*** Settings ***
Documentation       A resorce file is reusable keywords and variables
...
...
Library     SeleniumLibrary


*** Variables ***



*** Keywords ***

Enter the country name and select terms
    [Arguments]              ${country_name}
    input text          //input[@id="country"]          ${country_name}
    sleep  7
    Wait Until Element Is Visible    //a[contains(text(),'${country_name}')]
    sleep  5
    click element       //a[contains(text(),'${country_name}')]
    click element      //div[@class="checkbox checkbox-primary"]


Purchase the product and confirm the product
    click element      //input[@value="Purchase"]
    page should contain     Success!



