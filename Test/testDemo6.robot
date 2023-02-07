*** Settings ***

Documentation       To validate the login form
Library             SeleniumLibrary
Library              Collections
Library             ../Test/customLibrary/Shop.py
Test Setup          open the browser with mortage payment url
Test Teardown       Close Browser session
Resource            ../Po/resource.robot
Resource            ../Po/landingPage.robot
Resource            ../Po/ShopPage.robot
Resource            ../Po/CheckoutPage.robot
Resource            ../Po/ConfirmPage.robot

*** Variables ***
${country_name}         India
@{list_product}             Nokia Edge      Blackberry

*** Test Cases ***
#validate UnSuccesful login
#
#       landingPage.fill login form      ${user_name}         ${invalid_pass}
#       landingPage.Wait Until Element Is located in page
#       landingPage.verify the error message

validate the card display in shoping page
        landingPage.fill login form       ${user_name}     ${valid_pass}
        ShopPage.Wait Until Element Is located in page
        ShopPage.verify the card title in shop page
        add_items_to_cart_and_checkout          ${list_product}
        ShopPage.click on checkout
        Checkoutpage.verify the item in checkout page and proceed
        Checkoutpage.click on checkout
        ConfirmPage.Enter the country name and select terms         ${country_name}
        ConfirmPage.Purchase the product and confirm the product
#        select the card from shop           Blackberry

#select the form and navigate to alert window
#      landingPage.fill login form and select user option







