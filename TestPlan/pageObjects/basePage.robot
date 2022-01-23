*** Settings ***
Resource  ../helpers/browser.robot

*** Variables ***
${BROWSER}=     Google Chrome
${BASE_URL}=    https://mystery-dinner.herokuapp.com/

*** Keywords ***
Open My Website
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser  ${url}  ${browser}
#    // keywords!!!!!!!!!