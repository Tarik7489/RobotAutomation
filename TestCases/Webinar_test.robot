*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObjects/LoginPage.robot
Library    OperatingSystem
Resource    ../PageObjects/CommonKeywords.robot
Resource    ../PageObjects/InstantMeetingPage.robot
Resource    ../PageObjects/WebinarPage.robot
Test Teardown    Close All Browsers With Screenshot On Failure
Suite Setup    Kill Browsers Before Retry

*** Variables ***

${REL_PDF_FILE}     ${CURDIR}${/}..${/}TestFiles${/}certfifcate.pdf

${REL_IMAGE_FILE}   ${CURDIR}${/}..${/}TestFiles${/}Salman.jpg

${REL_Video_FILE}   ${CURDIR}${/}..${/}TestFiles${/}video.mp4

*** Keywords ***

Close All Browsers With Screenshot On Failure
    Run Keyword And Ignore Error    Capture Screenshot On Failure
    Close All Browsers

Kill Browsers Before Retry
    Run Keyword And Ignore Error    Close All Browsers


*** Test Cases ***

Create_webinar_and_delete_webinar
    Common_Login
    Wait until element is visible    ${Webinar_button}
    Click element    ${Webinar_button}
    Wait until element is visible    ${Webinar}     10s
    Click element    ${schedule_webinar}
    Wait until element is visible    ${Meeting_name_field}      10s
    Sleep    4s
    Input text    ${Meeting_name_field}     Deleted Webinar Name
    Input text    ${Webinar_description}   Life's too short for boring coffee and missed adventures. So, grab that cup and make today legendary!
    Click next date from Calendar
    Sleep    7s
    Click element   ${next_button}
    Wait until element is visible    ${skip&finish}     20s
    Click button    ${skip&finish}
    Delete_Created_webinar
    Close all browsers

All_Webinar_Creation_And_Actions
    Common_Login
    Wait until element is visible    ${Webinar_button}
    Click element    ${Webinar_button}
    Wait until element is visible    ${Webinar}     60S
    Click element    ${schedule_webinar}
    Sleep    5s
    Click element     ${Meeting_name_field}
    Input text    ${Meeting_name_field}     hello
    Input text    ${Webinar_description}   Life's too short for boring coffee and missed adventures. So, grab that cup and make today legendary!
    ${current_value}=    Get Element Attribute      ${seat_number}   value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
          Press Keys      ${seat_number}      ${KEY_BACKSPACE}
    END
    Input text      ${seat_number}      4
    Set webinar duration time to 5 minutes
    Click element    ${add_contact}
    Input text    ${add_contact}        tarikb@yopmail.com
    Sleep    2s
    Press keys    ${add_contact}      ENTER
    sleep    4s
    Upload banner image and intro video
    Sleep    4s
    # Adding a speaker details
    Add Speaker
    # Editing a speaker details
    Edit Speaker Details
    # Delete Speaker
    Delete Speaker
    # Again add speaker
    Add Speaker
    Sleep    2s
    Click button    ${next_button3}
    Sleep    4s
    Create poll for webinar
    Edit poll for webinar
    Delete poll for Webinar
    Sleep    3s
    Click button    ${next_button3}
    Sleep    4s
    Create survey for Webinar
    Edit Survey for Webinar
    Delete Survey
    Create survey for Webinar
    Click button    ${next_button3}
    Wait until element is visible     ${finish_btn}     10s
    Click element    ${finish_btn}
    Sleep    4s
    Edit Webinar Title
    Sleep    2s
    Start Webinar
    Verify the branding module
    Sleep    6s
    Join Webinar as a Speaker
    Switch browser    1
    Webinar host sharing files and verified by webinar speaker
    Switch browser    2
    Join Webinar as a Webinar User
    Poll creating for Webinar user
    Join second webinar user
    Verify display option by webinar user's
    Verify Engagement Controls
    Webinar user send a message with permission flow
    Switch browser    1
    Remove webinar user
    Switch browser    3
    Wait until page contains    Login    20s
    Switch browser    1
    Make a presenter to webinar user
    Switch browser  4
    Now webinar user join as a Speaker after making as presenter
    Verify document share by webinar user after making it as presenter
    Switch browser    1
    Sleep    2s
    Wait until element is visible     ${webinar_user_modal_close}   20s
    Click element    ${webinar_user_modal_close}
    Join Webinar as a Webinar User
    Webinar end by Host and verified by speaker, webinar user and submit the survey
    Sleep    2s
    Close all browsers


Verify_Webinar_Analytics
    Common_Login
    Wait until element is visible    ${Webinar_button}
    Click element    ${Webinar_button}
    Verify the attendees details in webinar analytics page
    Verify the panelist details in webinar analytics page
    Verify the Feedback Survey details in webinar analytics page
    Verify the polls detail in webinar analytics page
    Close all browsers