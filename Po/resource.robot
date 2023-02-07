*** Settings ***
Documentation       A resorce file is reusable keywords and variables
...
...
Library     SeleniumLibrary



*** Variables ***
${user_name}        rahulshettyacademy
${invalid_pass}      123
${valid_pass}       learning
${url}              https://rahulshettyacademy.com/loginpagePractise/#



*** Keywords ***

open the browser with mortage payment url
    Create Webdriver    Firefox
    Go To    ${url}

Close Browser session
      close browser

