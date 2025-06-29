*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String

*** Variables ***
${MAIN_APP_URL}          https://preprodapp.inmeet.ai/              # Your main app URL
${EMAIL_PROVIDER_URL}   https://moakt.com/en                 # Your email provider URL
${TEMP_EMAIL}         tarika@teml.net                 # Fixed email
${EMAIL_PASSWORD}       Invc@123            # Email account password
${NEW_PASSWORD}         Invc@123                     # New password to set
${OTP_LENGTH}           6
${TEMP_EMAIL_USER}      tarika
*** Test Cases ***
Forgot Password For Tarik Account
    [Documentation]    Trigger forgot password for ${TEMP_EMAIL}, fetch OTP from email, reset password, and verify login with new password.

    # --- STEP 1: Trigger Forgot Password in Main App ---
    Open Browser    ${MAIN_APP_URL}    chrome
    Maximize browser window
    Wait Until Page Contains Element    xpath=(//span[@class='small'])[1]   10s
    Click Element    xpath=(//span[@class='small'])[1]
    Wait Until Page Contains Element   name=email  10s
    Click element    name=email
    Input Text    name=email  ${TEMP_EMAIL}
    Click Element    xpath=//button[normalize-space()='Send Otp']
    Wait Until Page Contains    Enter 6 digit verification code we just sent you on your email address    20s
    # The main app now displays the OTP entry screen.
    # Do NOT close this browser.

    # --- STEP 2: Retrieve OTP from Email Provider ---
    # Open a second browser for the email provider.
    Open Browser    ${EMAIL_PROVIDER_URL}    chrome
    # Now we have two browsers:
    #   Browser 1: Main App (OTP entry screen)
    #   Browser 2: Email Provider
    Switch Browser    2
    Wait Until Page Contains Element    xpath=(//input[@placeholder='your mail name !'])[1]    10s
    Sleep    3s
    Input Text    xpath=(//input[@placeholder='your mail name !'])[1]    ${TEMP_EMAIL_USER}
    Sleep    4s
    Wait Until Page Contains Element    xpath=(//input[@value='Create'])[1]   10s
    Sleep    3s
    Click Element   xpath=(//input[@value='Create'])[1]
#    Wait Until Page Contains    Your Email was created    10s

    # Wait for the OTP email (assume subject "Reset Your Password") to arrive.
    Wait Until Page Contains Element    xpath=(//label[normalize-space()='Refresh List'])[1]   60s
    Click Element    xpath=(//label[normalize-space()='Refresh List'])[1]
    Reload page
    Reload page
    Reload page
    Reload page
    Reload page
    Reload page
    Sleep    10s
    Wait Until Page Contains Element    xpath=(//a[normalize-space()='Your verification code'])[1]     10s
    Click Element   xpath=(//a[normalize-space()='Your verification code'])[1]
    Sleep    4s
    ${EMAIL_BODY}=    Get Text    xpath=//body
    Log    Email body: ${EMAIL_BODY}

    # Extract a 6-digit OTP from the email body.
    ${OTP}=    Evaluate    re.search(r'(\d{6})', '''${EMAIL_BODY}''').group(1)    re
    Log    Extracted OTP: ${OTP}
    Close Browser
    # Now we only have Browser 1 (Main App) open.

    # --- STEP 3: Use OTP to Reset Password in Main App ---
    Switch Browser    1
    Wait Until Page Contains Element    xpath=xpath=//div[contains(@class, 'otp-input-container')]//input[contains(@class, 'otp-input')]    20s
    Input Text    xpath=xpath=//div[contains(@class, 'otp-input-container')]//input[contains(@class, 'otp-input')]    ${OTP}
    Wait Until Page Contains Element    xpath=//input[@id="newPassword"]    10s
    Input Text    xpath=(//input[@id='filled-adornment-password'])[1]   ${NEW_PASSWORD}
    Input Text    xpath=(//input[@id='filled-adornment-password'])[2]    ${NEW_PASSWORD}
    Sleep    4s
    Click Element    xpath=(//button[normalize-space()='SUMBIT'])[1]
    Wait Until Page Contains    Success !   20s

    # --- STEP 4: Verify Login with New Password ---
    # If the app logs you out after resetting the password,
    # log in again with the new password.
    Wait Until Page Contains Element    xpath=//button[normalize-space()='Continue Login']  15s
    Click element    xpath=//button[normalize-space()='Continue Login']
    Wait Until Page Contains Element  id=email    10s
    Input Text    id=email     ${TEMP_EMAIL}
    Input Text    id=password    ${NEW_PASSWORD}
    Click Element    xpath=//button[normalize-space()='Login']
    Sleep    5s

    Close Browser
