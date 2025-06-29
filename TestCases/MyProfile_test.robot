
*** Settings ***

Library    SeleniumLibrary
Resource   ../PageObjects/LoginPage.robot
Resource   ../PageObjects/CommonKeywords.robot
Library    ../Libraries/ExcelLibrary.py
Resource    ../PageObjects/MyProfilePage.robot
Test Teardown    Close All Browsers With Screenshot On Failure

Suite Setup    Kill Browsers Before Retry

*** Variables ***
${BASE_URL}      https://preprodapp.inmeet.ai/
${EXCEL_FILE}    ${CURDIR}/../TestData/login_data.xlsx
${SHEET_NAME}    Login
${expected_inmeet_url}   https://www.inmeet.ai/
${expected_privacy_page_url}    https://www.instavc.com/privacy-policy
${OLD_PASSWORD}    Invc@123
${USERNAME}        tarik@yopmail.com

*** Keywords ***
Close All Browsers With Screenshot On Failure
    Run Keyword And Ignore Error    Capture Screenshot On Failure
    Close All Browsers

Kill Browsers Before Retry
    Run Keyword And Ignore Error    Close All Browsers

*** Test Cases ***

Change Password And Revert To Old
    # 1. Generate a random password of the form "Invc@<random5digits>"
    ${random_num}=    Evaluate    random.randint(10000,99999)    random
    ${NEW_PASSWORD}=  Set Variable    Invc@${random_num}

    # 2. Log in with the old password
    Open Browser    ${BASE_URL}    chrome
    Maximize browser window
    Wait Until Page Contains Element    id=email    10s
    Input Text      id=email    ${USERNAME}
    Input Text     id=password   ${OLD_PASSWORD}
    Click Element  xpath=//button[normalize-space()='Login']
    Sleep    4s

    # 3. Navigate to Change Password UI
    #    (Adjust locators for your UI)
    Click Element    ${profile}
    Click Element    ${view_profile_btn}
    Sleep    3s
    Click Element    ${change_password_btn}

    # 4. Enter old password, new password, and confirm
    Wait Until Element Is Visible      ${current_password_input_field}     10s
    Input Text    ${current_password_input_field}       ${OLD_PASSWORD}
    Sleep    3s
    Input Text    ${new_password_input_field}           ${NEW_PASSWORD}
    Sleep    3s
    Input Text    ${confirm_password_input_field}       ${NEW_PASSWORD}
    Sleep    3s
    Click Button    ${save_btn}
    Sleep    4s

    # 5. Verify success message (or similar)
    Wait Until Page Contains    Password updated successfully    10s
    Sleep    3s
    # 6. Log out
    Logout
    Sleep    3s

    # 7. Log in with the new password
    Wait Until Page Contains Element      id=email     10s
    Input Text      id=email    ${USERNAME}
    Input Text     id=password    ${NEW_PASSWORD}
    Click Element  xpath=//button[normalize-space()='Login']
    Sleep    4s

    # 8. Change password back to old
    Click Element    ${profile}
    Click Element    ${view_profile_btn}
    Sleep    3s
    Click Element    ${change_password_btn}

    Input Text    ${current_password_input_field}       ${NEW_PASSWORD}
    Sleep    3s
    Input Text    ${new_password_input_field}           ${OLD_PASSWORD}
    Sleep    3s
    Input Text    ${confirm_password_input_field}        ${OLD_PASSWORD}
    Sleep    3s
    Click Button    ${save_btn}
    Sleep    4s
    Wait Until Page Contains    Password updated successfully    10s
    Sleep    3s

    # 9. Log out
    LOGOUT
    Sleep    4s

    # 10. Finally, confirm old password works again
    Wait Until Page Contains Element   id=email    10s
    Input Text      id=email    ${USERNAME}
    Input Text     id=password   ${OLD_PASSWORD}
    Click Element  xpath=//button[normalize-space()='Login']
    Sleep    4s

    # Test completed
    Close Browser

Verify_Language_Functionality
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Launch Browser    ${BASE_URL}
        Login     ${row}[email]    ${row}[password]
        click on profile dropdown
        click on view profile
        click on language tab
        select hindi language
        Sleep    2s
        Log    Now verifying if Hindi language is changed or not
        Page should contain    भाषा
        Sleep    2s
        select english language
        Log    Now switch back to english default language
        Page should contain    Language
        Sleep    2s
        Close browser
    END

Verify_About_More_Functionality
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Launch Browser    ${BASE_URL}
        Login     ${row}[email]    ${row}[password]
        click on profile dropdown
        click on view profile
        click on about tab
        Sleep    5s
        Page should contain    We build software products that make everyday business interactions within the organization and with the outside world smarter. In essence, creating nextgen worker & customer experiences through design & technology. Smarter business interaction (an instance of communication, or a business process, or whole of communication, or a business process, or whole system of connected processes) that is not only structured, intuitive, and resource optimized but also is highly scalable, global and intelligent.
        Page should contain    inMeet.ai
        Page should contain    About
        Page should contain    Version: 3.6.0
        Page should contain    Visit for more info: https://inmeet.ai
        Sleep    2s
        click on inmeet link
        # ✅ Get all open window handles
        ${windows}   Get Window Handles
        # ✅ Switch to the new tab (last opened)
        Switch Window    ${windows}[-1]
        Sleep    3s
        # ✅ Get and verify the new tab URL
        ${current_url}    Get Location
        Log To Console    ${current_url}
        Should Be Equal As Strings    ${current_url}    ${expected_inmeet_url}
        # ✅ Switch back to the original window (first tab)
        Switch Window    ${windows}[0]
        Sleep    2s
        Page should contain    Data protection and privacy policy
        click on privacy link
        # Verify the privacy page url
        ${privacy_window}   Get window handles
        Switch window     ${privacy_window}[-1]
        Sleep    3s
        ${current_privacy_url}    Get Location
        Log To Console      ${current_privacy_url}
        Should Be Equal As Strings      ${current_privacy_url}   ${expected_privacy_page_url}
        Sleep    3s
        Close browser
    END

Verify_Edit_and_Delete_Profile_Image_Functionality
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Launch Browser    ${BASE_URL}
        Login     ${row}[email]    ${row}[password]
        Sleep    3s
        upload profile image
        Sleep    4s
        # Delete Profile image
        delete profile image
        Close browser
    END

Verify_Change_Profile_Name_Functionality
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Launch Browser    ${BASE_URL}
        Login     ${row}[email]    ${row}[password]
        Sleep    3s
        Change Profile Name With Random Name
        Sleep    4s
        change profile name with already existing name
        Sleep    2s
        Close browser
    END

Verify_Licenses_PymentHistory_Help_Module
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Launch Browser    ${BASE_URL}
        Login     ${row}[email]    ${row}[password]
        Sleep    3s
        verify Licenses and Pyment History and Help Module text
        Close browser
    END

Verify_Transcription_Module
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Launch Browser    ${BASE_URL}
        Login     ${row}[email]    ${row}[password]
        Sleep    3s
        verify Transcription module
        Close browser
    END









