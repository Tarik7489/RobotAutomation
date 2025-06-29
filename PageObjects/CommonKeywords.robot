*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    ../Libraries/ExcelLibrary.py
Library    String
Resource    ../PageObjects/LoginPage.robot

*** Variables ***
${BROWSER}    chrome
${url}      https://preprodapp.inmeet.ai/
${EXCEL_FILE}    ${CURDIR}/../TestData/login_data.xlsx
${url}          https://preprodapp.inmeet.ai/



*** Keywords ***
Launch Browser
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Sleep

Launch Browser with headless
    [Arguments]    ${url}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_argument    --headless
    Call Method    ${chrome options}    add_argument    --disable-gpu
#    Call Method    ${chrome options}   add_argument    "--window-size=1920,1080"
    Open Browser    ${url}    chrome    options=${chrome options}
    Maximize Browser Window

Close Browser Session
    Close all browsers


Generate Random Password
    ${random_numbers}    Generate Random String    4    [NUMBERS]
    ${password}    Set Variable    Invc@${random_numbers}  # ✅ New password format: Invc@1234
    RETURN    ${password}

Store Password In Excel
    [Arguments]    ${file_path}    ${sheet_name}    ${email}    ${new_password}
    Write Excel Data    ${file_path}    ${sheet_name}    ${email}    ${new_password}


Open Browser With Permissions
    [Arguments]      ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${chrome_options}    add_argument    --use-fake-device-for-media-stream
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-popup-blocking

     # ✅ Headless mode
#    Call Method    ${chrome_options}    add_argument    --headless
#    Call Method    ${chrome_options}    add_argument    --disable-gpu
#    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080

    # if i don't want then i can remove this headless logic


    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${url}
    Maximize Browser Window


Capture Screenshot On Failure
    ${test_status}=    Get Variable Value    ${TEST_STATUS}
    ${test_name}=      Get Variable Value    ${TEST_NAME}
    ${safe_test_name}=    Replace String    ${test_name}    ' '    '_'
    Run Keyword If    '${test_status}' == 'FAIL'
    ...    Capture Page Screenshot    Screenshots/${safe_test_name}.png

Common_Login
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Open Browser With Permissions   ${url}
        Enter Login Credentials    ${row}[email]    ${row}[password]
        Click on Login Button
        Sleep    3s
    END



