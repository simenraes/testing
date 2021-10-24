*** Settings ***
Resource            ../pageObjects/basePage.robot

*** Variables ***

*** Test Cases ***

Open Heroku App And Test CancelButton
    Open Browser  https://appartementenverhuurbv.herokuapp.com/  Google Chrome
    Click Link  /user/login
    Sleep    3s
    Click Button    CancelButton

    Sleep  5s
    Close Browser

Test Register
    Open Browser  https://appartementenverhuurbv.herokuapp.com/  Google Chrome
    Click Link  /user/login
    Click Button    registreerButton
    Sleep    10s
    Click Button    registreerSubmit
    Sleep    3s
    Close Browser
    
Test Login With Invalid Credentials
    Open Browser  https://appartementenverhuurbv.herokuapp.com/  Google Chrome
    Click Link    /user/login
    Sleep    15s
    Click Button    loginSubmit
    Sleep    5s
    Close Browser

Test Login With Valid Credentials
    Open Browser  https://appartementenverhuurbv.herokuapp.com/  Google Chrome
    Click Link    /user/login
    Sleep    10s
    Click Button    loginSubmit
    Sleep    5s
    Close Browser

Test Filter
    Open Browser  https://appartementenverhuurbv.herokuapp.com/  Google Chrome
    Click Link    /appartementenlijst
    Click Link    /appartementenlijst/filter
    Sleep    10s
    Click Element    zoekFilter
    Sleep    5s
    Close Browser



