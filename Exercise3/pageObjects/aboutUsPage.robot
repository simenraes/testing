*** Settings ***
Resource  basePage.robot

*** Variables ***
${ABOUTUS_TXT}=       css:#center_column > div > div > div:nth-child(1) > div

*** Keywords ***
Get About Us Text
    Wait Until Element Is Visible  ${ABOUTUS_TXT}
    ${text}=  Get Text  ${ABOUTUS_TXT}
    [Return]  ${text}