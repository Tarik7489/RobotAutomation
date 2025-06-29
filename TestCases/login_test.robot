*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../Libraries/ExcelLibrary.py
Resource   ../PageObjects/LoginPage.robot
Resource   ../PageObjects/CommonKeywords.robot
Test Teardown    Close All Browsers With Screenshot On Failure
Suite Setup    Kill Browsers Before Retry

*** Variables ***
${BASE_URL}      https://preprodapp.inmeet.ai/
${Expected_URL}  https://preprodapp.inmeet.ai/meetings
${EXCEL_FILE}    ${CURDIR}/../TestData/login_data.xlsx
${SHEET_NAME}    Login
${VIDEO_NAME}      test_video
*** Keywords ***

Close All Browsers With Screenshot On Failure
    Run Keyword And Ignore Error    Capture Screenshot On Failure
    Close All Browsers

Kill Browsers Before Retry
    Run Keyword And Ignore Error    Close All Browsers


*** Test Cases ***

Verify_Banner_Text
    Launch Browser with headless   ${BASE_URL}
    Wait until page contains    Get work done together, from anywhere with our video conferencing and chat      10s
    Close all browsers

#
#Login_With_Valid_Credentials
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        Open Browser With Permissions   ${BASE_URL}
#        Enter Login Credentials    ${row}[email]    ${row}[password]
#        Click on Login Button
#        Sleep    4s
#        ${current_url}    Get Location
#        Log To Console    ${current_url}
#        Should Be Equal As Strings    ${current_url}    ${Expected_URL}
#        Close all browsers
#    END

Login_With_Invalid_Credentials
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Launch Browser with headless   ${BASE_URL}
        Enter Login Credentials    ${row}[email]    ${row}[invalidPassword]
        Click on Login Button
        Sleep    3s
        Page Should Contain    Incorrect username or password.
        Sleep    2s
        Close all browsers
    END
