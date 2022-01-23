*** Settings ***
Resource            ../pageObjects/basePage.robot
Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***
${LOGIN_BTN}=            id:submit
${REGISTER_ERROR}=  css:.errorField
${SIGNIN_LNK}=  link=Registreer
${LOGIN_LNK}=  link=Aanmelden
${NAVBAR_TXT}=  id:navigation


*** Keywords ***


Go To Register Page
    Click Element  ${SIGNIN_LNK}

Go To Login Page
    Click Element    ${LOGIN_LNK}

Get Navbar Text
    Wait Until Element Is Visible  ${NAVBAR_TXT}
    ${text}=  Get Text  ${NAVBAR_TXT}
    [Return]  ${text}

*** Test Cases ***



Register with valid data
    Set Browser Implicit Wait    5
     Go To Register Page

    Input Text    id=firstName    jan
    Input Text    id=lastName    metpet
    Input Password    id=wachtwoord    testje
    Input Text    id=email    voorbeeld@gmail.com
    Input Text    id=phoneNumber    0488076514
    Input Text    id=street    teststraat
    Input Text    id=number    22
    Input Text    id=place    puurs
    Input Text    id=postcode    2870

    Click Button    Registreer
        Page Should not Contain Button    Registreer

register with invalid phonenumber


    Go To Register Page
    Input Text    id=firstName    jan
    Input Text    id=lastName    metpet
    Input Password    id=wachtwoord    testje
    Input Text    id=email    voorbeeld@gmail.com
    Input Text    id=phoneNumber    04880
    Input Text    id=street    teststraat
    Input Text    id=number    22
    Input Text    id=place    puurs
    Input Text    id=postcode    2870
    Click Button    Registreer
    Element Should Be Visible  ${REGISTER_ERROR}

#


Test contact refresh button

   Click Element    link=Contact
   Input Text    id=name    blablabla
   Input Text    id=email    blablabla
   Input Text    id=bericht    blablabla
   Set Browser Implicit Wait    10
   Click Button    Reset
   Textfield Value Should Be    id=name    \
   Textfield Value Should Be    id=email    \
   Textarea Value Should Be    id=bericht   \



Test admin privileges
    Set Browser Implicit Wait    10
#    Wait Until Element Is Visible    ${LOGIN_LNK}
    Go To Login Page

    Input Text    id=inputUsername    vrydi.oudewaal@email.com
    Sleep    5s
    Input Password    id=inputPassword    admin
    Execute Javascript  window.scrollTo(0, document.body.scrollHeight)
    Click Button    id=submit
    ${text}=  Get Navbar Text
    Should Contain  ${text}  Admin
    Should Contain  ${text}  Geschiedenis
    Click Element    link=Afmelden


Test login with valid credentials
    Go To Login Page
    Input Text    id=inputUsername    vrydi.oudewaal@email.com
    Input Password    id=inputPassword    admin
    Set Browser Implicit Wait    10
    Execute Javascript  window.scrollTo(0, document.body.scrollHeight)
    Click Button    ${LOGIN_BTN}
    ${text}=  Get Navbar Text
    Should Contain  ${text}  Afmelden

