*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${EMAIL_INPUT}      id=email
${PASSWORD_INPUT}   id=password
${LOGIN_BUTTON}     xpath=//button[normalize-space()='Login']
${profile}  xpath=(//div[contains(@class,'flexMinWidthRow aCntr pdngRLG jEnd gap16 rCompt headerD')]//div[contains(@class,'flexAutoCol')])[1]
${logout_btn}   xpath=//*[contains(text(),'Logout')]
${confirm_logout_btn}   xpath=//button[normalize-space()='Logout'][1]

*** Keywords ***
Enter Login Credentials
    [Arguments]    ${email}    ${password}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${PASSWORD_INPUT}    ${password}


enter email
    [Arguments]      ${email}
    Input text      ${EMAIL_INPUT}   ${email}

enter password
    [Arguments]     ${password}
    Input text      ${PASSWORD_INPUT}   ${password}

click on login button
    Wait until element is visible    ${LOGIN_BUTTON}    10s
    Click button    ${LOGIN_BUTTON}

click on profile dropdown
    Wait until element is visible    ${profile}     15s
    Click element    ${profile}

click on logout button
    Wait until element is visible    ${logout_btn}  15s
    Click element    ${logout_btn}

click on confirm logout button
    Wait until element is visible    ${confirm_logout_btn}  15s
    Click element    ${confirm_logout_btn}


Logout
   Wait until element is visible    ${profile}     15s
   Click element    ${profile}
   Wait until element is visible    ${logout_btn}  15s
   Click element    ${logout_btn}
   Wait until element is visible    ${confirm_logout_btn}  15s
   Click element    ${confirm_logout_btn}

Login
    [Arguments]    ${email}    ${password}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${PASSWORD_INPUT}    ${password}
    click on login button
