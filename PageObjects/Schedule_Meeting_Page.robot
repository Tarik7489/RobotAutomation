
*** Settings ***

Library    SeleniumLibrary
Library    OperatingSystem
Library    ../Libraries/ExcelLibrary.py
Resource   ../PageObjects/LoginPage.robot
Resource   ../PageObjects/CommonKeywords.robot
Resource    ../PageObjects/InstantMeetingPage.robot
Library     DateTime

*** Variables ***
# Url and Passwords
${des}     Scheduling a meeting involves planning a specific time and date for an event, ensuring all attendees are informed and available.
${invite_mail_id}       tarikb@yopmail.com
${updated_meeting_name}     Updated Monster's Meeting
${REL_IMAGE_FILE}  ${CURDIR}${/}..${/}TestFiles${/}sample.pdf
${upload_profile}   xpath=//input[ @type="file" or @accept=".pdf"]
${meeting_password}    Testing

# Locators
${schedule_option}      xpath=//small[normalize-space()='Schedule']
${input_meeting_name_field}     xpath=//input[@id='meeting-name']
${add_description}      xpath=(//span[@class='link sHdng pdngVXS'])[1]
${input_meeting_description}    xpath=(//textarea[@id='meeting-description'])[1]
${seat_No}      xpath=//input[@placeholder='00']
${add_Invitee}  xpath=(//*[name()='svg'][@aria-label='Contacts'])[1]
${invite_email_input}   xpath=(//input[@id='email'])[1]
${advanced_dropdown}    xpath=(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv'])[5]
${input_add_attachment}     xpath=(//input[@type='file'])[1]
${password_toggle}      xpath=(//input[@type='checkbox'])[2]
${cloud_recording_toggle}   xpath=(//input[@type='checkbox'])[3]
${participant_join_anytime_toggle}  xpath=(//input[@type='checkbox'])[4]
${transcription_toggle}     xpath=(//input[@type='checkbox'])[5]
${schedule_btn}     xpath=(//button[normalize-space()='Schedule'])[1]

${delete_btn}       xpath=(//button[normalize-space()='Delete'])[1]
${edit_btn}         xpath=(//button[normalize-space()='Edit'])[1]
${update_meeting_btn}   xpath=(//button[normalize-space()='Update Meeting'])[1]
${start_btn}        xpath=(//button[normalize-space()='START'])[1]
${password_input_field}     xpath=(//input[@type="text"])[6]

${Enter_Meeting_Password}   name=password
${ok_btn}       xpath=(//button[normalize-space()='OK'])[1]
${join_btn}     xpath=(//span[normalize-space()='Join'])[1]

# Inside vc
${CC_Icon}      xpath=(//*[name()='svg'][@stroke='currentColor'])[1]
${transcript_Icon}   xpath=(//img[@alt='transcript'])[1]
${transcript_close_icon}   xpath=(//*[name()='svg'][@class='MuiSvgIcon-root'])[3]
${document_share_close_btn}     xpath=(//img[@alt='cancel'])[1]
${stop_transcription}   xpath=(//span[normalize-space()='Stop Transcription'])[1]
${start_transcription}  xpath=(//span[normalize-space()='Start Transcription'])[1]
${ok_transcription}     xpath=(//span[normalize-space()='OK'])[1]
${view_transcription}   xpath=//span[normalize-space()='View Transcription']
${transcription_close_modal}    xpath=//img[@alt='close']
${start_cloud_recording}      xpath=(//span[normalize-space()='Start cloud recording'])[1]
${record_icon}          xpath=(//img[@alt='record'])[1]
${stop_cloud_recording}     xpath=(//span[normalize-space()='Stop cloud recording'])[1]

# Edit screen

${copy_meeting_url}     xpath=(//img[contains(@aria-label,'Copy')])[1]

# Reoccuring event
${repeat_toggle}        xpath=(//input[@type='checkbox'])[1]
${select_meet}          xpath=//div[@id='select-meet']
${two_meet}             xpath=(//li[normalize-space()='2 Meets'])[1]
${delete_meeting}     xpath=//button[normalize-space()='Delete']
${confirm_delete_meeting}   xpath=(//button[normalize-space()='Delete'])[2]
${weekly_tab}           xpath=(//button[normalize-space()='Weekly'])[1]
${three_week}           xpath=(//li[normalize-space()='3 Weeks'])[1]
${repeat_every}         xpath=//div[@id='select-repeat']
${monthly_tab}          xpath=(//button[normalize-space()='Monthly'])[1]
${date_radio_btn}       xpath=(//input[@value='untilDate'])[1]

${CALENDAR_ICON}    xpath=(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv'])[6]
${SELECTED_DATE}    xpath=//button[contains(@class,"MuiPickersDay-today")]
${edit_schedule_meeting}    xpath=(//button[normalize-space()='Edit'])[1]


# Schedule co-host control

${enable_caption}       xpath=(//input[@id='hostHandleCC'])[1]
${hostHandleCoHostTc}                 xpath=(//input[@id='hostHandleCoHostTc'])[1]


*** Keywords ***

Verify Enable Captions host control flow
    Click element       ${vc_three_dots}
    Click element    ${host_control_option}
    Click element    ${enable_caption}
    Click element    ${close_host_control_modal}
    Switch browser    2
    Sleep    4s
    Element should not be visible    ${CC_Icon}
    Wait until element is visible    ${transcript_Icon}  10s

Verify Enable transcription to co-host Flow
    Click element       ${app_tab}
    Element should not be visible    ${stop_transcription}
    Switch browser    1
    Wait until page contains element     ${participate_tab}     10s
    Click element    ${participate_tab}
    Sleep    3s
    Wait until page contains element    ${search_participant}   10s
    Input text    ${search_participant}     ${participant_name}
    Wait until page contains    ${participant_name}
    Sleep    3s
    Click element    ${participants_three_dots}
    Scroll element into view   ${moderator_option}
    Click element    ${moderator_option}
    Sleep    2s
    Press Keys    xpath=//body    ESCAPE
    Sleep    3s
    # Now moderator access is provided, check co-host can start the transcription
    Switch browser    2
#    Click element       ${app_tab}
    Wait until page contains element    ${stop_transcription}       10s
    Sleep    3s

    # Now disabled the toggle
    Switch browser    1
    Wait until page contains element     ${close_participate_modal}     10s
    Click element    ${close_participate_modal}
    Click element       ${vc_three_dots}
    Click element    ${host_control_option}
    Click element    ${hostHandleCoHostTc}
    Click element    ${close_host_control_modal}

    # Now switch to browser 2 and verify even participant got the moderate access still can't see the transcription
    Switch browser    2
    Sleep    2s
    Element should not be visible    ${stop_transcription}



Select Next Date In Calendar
    # Step 1: Open calendar
    Click Element    ${CALENDAR_ICON}
    Sleep    1s  # optional delay to wait for animation

    # Step 2: Get today's date number
    ${today_text}=    Get Text    ${SELECTED_DATE}
    ${today}=    Convert To Integer    ${today_text}

    # Step 3: Compute next day
    ${NEXT_DATE}=    Evaluate    ${today} + 3

    # Step 4: Try to click the next day
    Click Element    xpath=//button[normalize-space(text())="${NEXT_DATE}" and not(@disabled)]

Create $ Delete monthly repeat meeting
    Sleep    3s
    Wait until element is visible    ${schedule_option}     10s
    Click element    ${schedule_option}
    Wait until element is visible    ${add_description}     10s
    Sleep    4s
    Click element    ${add_description}
    Input text    ${input_meeting_description}      ${des}
    Input text    ${seat_No}    4
    Input text    ${invite_email_input}     ${invite_mail_id}
    Press keys    ${invite_email_input}     ENTER
    Click element    ${advanced_dropdown}
    Sleep    2s
    Wait until page contains element     ${repeat_toggle}      10s
    Click element    ${repeat_toggle}
    Click element    ${monthly_tab}
    Click element    ${select_meet}
    Click element    ${two_meet}
    Sleep    4s
    Wait until element is visible    ${schedule_btn}        10s
    Click element    ${schedule_btn}
    Sleep    3s
    Wait until page contains    Meeting created successfully    10s
    Sleep    4s
    # Edit meeting
    Edit Schedule Meeting
    # Delete the daily event
    Click element    ${delete_meeting}
    Sleep    2s
    Click element    ${confirm_delete_meeting}
    Wait until page contains    Deleted successfully    10s
    Sleep    3s


Create weekly repeat meeting
    Sleep    4s
    Wait until element is visible    ${schedule_option}     10s
    Click element    ${schedule_option}
    Wait until element is visible    ${add_description}     10s
    Sleep    4s
    Click element    ${add_description}
    Input text    ${input_meeting_description}      ${des}
    Input text    ${seat_No}    4
    Input text    ${invite_email_input}     ${invite_mail_id}
    Press keys    ${invite_email_input}     ENTER
    Click element    ${advanced_dropdown}
    Sleep    2s
    Wait until page contains element     ${repeat_toggle}      10s
    Click element    ${repeat_toggle}
    Click element    ${weekly_tab}
    Click element    ${repeat_every}
    Sleep    2s
    Click element    ${three_week}
    Wait until element is visible    ${schedule_btn}        10s
    Click element    ${schedule_btn}
    Sleep    3s
    Wait until page contains    Meeting created successfully    10s
    Wait until page contains element    ${delete_meeting}   10s
    # Delete the daily event
    Click element    ${delete_meeting}
    Sleep    2s
    Click element    ${confirm_delete_meeting}
    Wait until page contains    Deleted successfully    10s
    Sleep    3s

Create, Edit & delete daily,weekly and monthly repeat meeting
    Common_Login
    Create $ Delete monthly repeat meeting
    Sleep    3s
    Wait until element is visible    ${schedule_option}     10s
    Click element    ${schedule_option}
    Wait until element is visible    ${add_description}     10s
    Sleep    4s
    Click element    ${add_description}
    Input text    ${input_meeting_description}      ${des}
    Input text    ${seat_No}    4
    Input text    ${invite_email_input}     ${invite_mail_id}
    Press keys    ${invite_email_input}     ENTER
    Click element    ${advanced_dropdown}
    Sleep    2s
    Wait until page contains element     ${repeat_toggle}      10s
    Click element    ${repeat_toggle}
    Click element    ${date_radio_btn}
    Select Next Date In Calendar
    Wait until element is visible    ${schedule_btn}        10s
    Click element    ${schedule_btn}
    Wait until page contains    Meeting created successfully    10s
    Sleep    4s
    # Delete the daily event
    Click element    ${delete_meeting}
    Sleep    2s
    Click element    ${confirm_delete_meeting}
    Wait until page contains    Deleted successfully    10s
    Sleep    3s
    # Create and Delete weekly meeting
    Create weekly repeat meeting
    Sleep    2s


Allow participants to join anytime toggle is disable and verify without host starting the meeting participant can't join the meeting
    Schedule Meeting With Password and disable the Allow participants to join anytime toggle
    Sleep    3s
    Wait until element is visible    ${copy_meeting_url}    10s
    Sleep    2s
    Click element     ${copy_meeting_url}
    Page should contain    Copied!
    ${MEETING_ID}    Get Meeting ID from Clipboard
    Set Global Variable    ${MEETING_ID}  # Store for second test
    Log    "Meeting ID: ${MEETING_ID}"

    # Now copy, paste the url in another browser and enter the meeting password and join the meeting
    Open Browser With Permissions     ${MEETING_ID}    chrome
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Sleep    3s
    Input text    ${Name_field_RaadytoJoin}     Guest User
    Input text    ${email_field_ReadyToJoin}    test@gmail.com
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Sleep    5s
    Page should contain    Thanks for Waiting. we will let you know when host is ready.


Transcription toggle is disable and verify that Transcription options are not displaying
    Common_Login
    Sleep    3s
    Wait until element is visible    ${schedule_option}     10s
    Click element    ${schedule_option}
    Wait until element is visible    ${add_description}     10s
    Sleep    4s
    Click element    ${add_description}
    Input text    ${input_meeting_description}      ${des}
    Input text    ${seat_No}    4
    Input text    ${invite_email_input}     ${invite_mail_id}
    Press keys    ${invite_email_input}     ENTER
    Click element    ${advanced_dropdown}
    Click element    ${cloud_recording_toggle}
    Click element    ${participant_join_anytime_toggle}
#    Click element    ${transcription_toggle}
    Click element    ${schedule_btn}
    Sleep    3s
    Wait until page contains    Meeting created successfully    10s
    Sleep    4s
     # Now verify the Transcription options are not display as it is disable
    Wait until element is visible    ${start_btn}       10s
    Click element    ${start_btn}
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Sleep    6s
    Wait until element is visible    ${vc_three_dots}   10s
    # Verify transcription alert
    Page should not contain    Transcription service is now active. By continuing, you consent to transcription and storage of your audio during the meeting.
    Element should not be visible    ${CC_Icon}
    Element should not be visible    ${transcript_Icon}
    Click element    ${app_tab}
    Sleep    3s
    Element should not be visible     ${start_transcription}
    Element should not be visible    ${view_transcription}
    Sleep    3s

Cloud recording disable and verify that cloud recording options are not displaying
    Common_Login
    Sleep    3s
    Wait until element is visible    ${schedule_option}     10s
    Click element    ${schedule_option}
    Wait until element is visible    ${add_description}     10s
    Sleep    4s
    Click element    ${add_description}
    Input text    ${input_meeting_description}      ${des}
    Input text    ${seat_No}    4
    Input text    ${invite_email_input}     ${invite_mail_id}
    Press keys    ${invite_email_input}     ENTER
    Click element    ${advanced_dropdown}
    Click element    ${participant_join_anytime_toggle}
    Click element    ${transcription_toggle}
    Click element    ${schedule_btn}
    Sleep    3s
    Wait until page contains    Meeting created successfully    10s
    Sleep    4s

    # Now verify the cloud recording options are not display as it is disable
    Wait until element is visible    ${start_btn}       10s
    Click element    ${start_btn}
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    # Verify transcription alert
    Wait until page contains    Transcription service is now active. By continuing, you consent to transcription and storage of your audio during the meeting.  10s
    Wait until element is visible    ${vc_three_dots}   10s
    Click element    ${vc_three_dots}
    Element should not be visible    ${start_cloud_recording}
    Sleep    3s


Only Participant joining the schedule meeting via password
    Schedule Meeting With Password
    Sleep    3s
    Wait until element is visible    ${copy_meeting_url}    10s
    Sleep    2s
    Click element     ${copy_meeting_url}
    Page should contain    Copied!
    ${MEETING_ID}    Get Meeting ID from Clipboard
    Set Global Variable    ${MEETING_ID}  # Store for second test
    Log    "Meeting ID: ${MEETING_ID}"

    # Now copy, paste the url in another browser and enter the meeting password and join the meeting
    Open Browser With Permissions     ${MEETING_ID}    chrome
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Sleep    3s
    Input text    ${Name_field_RaadytoJoin}     Tarik Aziz
    Input text    ${email_field_ReadyToJoin}    test@gmail.com
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Wait until page contains     Tarik Aziz     10s
    Page should not contain    Monster



Verify Cloud Recording start and stop
    Wait until element is visible     ${vc_three_dots}  10s
    Click element    ${vc_three_dots}
    Wait until element is visible    ${start_cloud_recording}     10s
    Click element   ${start_cloud_recording}
    Sleep    4s
    Press keys    xpath=//body    ESCAPE
    Click element    ${close_host_control_modal}
    Wait until element is visible    ${record_icon}     10s

    # Stop the recording
    Sleep    2s
    Click element    ${vc_three_dots}
    Wait until element is visible    ${stop_cloud_recording}    10s
    Sleep    2s
    Click element    ${stop_cloud_recording}
    Sleep    4s
    Wait until element is visible    ${start_cloud_recording}   10s
#    Press keys    xpath=//body      ESCAPE
    Click element    ${host_control_option}
    Sleep    2s
    Click element    ${close_host_control_modal}
    Element should not be visible   ${record_icon}
    Sleep    3s


Verify transcript flow
    Wait until element is visible    ${CC_Icon}      10s
    Wait until element is visible    ${transcript_Icon}  10s
    Click element    ${CC_Icon}
    Sleep    3s
#    Wait until page contains    Monster :   10s
    Click element    ${app_tab}
    Sleep    3s
    Click element    ${stop_transcription}
    Sleep    2s
    Element should not be visible    ${CC_Icon}
    Element should not be visible    ${transcript_Icon}
    Sleep    3s
    Click element    ${app_tab}
    Element should not be visible    ${stop_transcription}
    Wait until page contains element    ${start_transcription}  10s
    Click element    ${start_transcription}
    Sleep    2s
    Click element    ${ok_transcription}
    Wait until element is visible    ${CC_Icon}      10s
    Wait until element is visible    ${transcript_Icon}  10s
    Sleep    2s
    Click element    ${app_tab}
    Wait until element is visible   ${view_transcription}   10s
    Click element    ${view_transcription}
    Page should contain    Transcription
    Wait until element is visible    ${transcription_close_modal}   10s
    Click element    ${transcription_close_modal}


Start the Schedule meeting
    Wait until element is visible    ${start_btn}       10s
    Click element    ${start_btn}
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    # Verify transcription alert
    Wait until page contains    Transcription service is now active. By continuing, you consent to transcription and storage of your audio during the meeting.      10s
    Click element    ${app_tab}
    Sleep    4s
    Wait until element is visible    ${document_share}    15s
    Click element    ${document_share}
    Wait until page contains    sample.pdf  10s
    Sleep    3s
    Click element    ${delete_doc_present}
    Sleep    3s
    Wait until page contains    File deleted successfully  10s
    Sleep    4s
#    Wait until page contains    ${document_share_close_btn} 10s
    Sleep    3s
    Click element    ${document_share_close_btn}
    Sleep    2s


Edit Schedule Meeting
    Scroll element into view    ${edit_btn}
    Wait until element is visible    ${edit_btn}    10s
    Sleep    5s
    Wait until element is visible     ${edit_btn}       20s
    Click element    ${edit_btn}
    ${current_value}=    Get Element Attribute     ${input_meeting_name_field}    value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys     ${input_meeting_name_field}     ${KEY_BACKSPACE}
    END
    Input text     ${input_meeting_name_field}      ${updated_meeting_name}
    Wait until element is visible     ${update_meeting_btn}     10s
    Click element    ${update_meeting_btn}
    Wait until page contains    Meeting updated successfully    10s
    Sleep    3s
    Wait until page contains    ${updated_meeting_name}     10s

Delete Schedule Meeting
    Scroll element into view    ${delete_btn}
    Wait until page contains element    ${delete_btn}    20s
    Click element    ${delete_btn}
    Wait until page contains element    ${confirm_delete_meeting}   20s
    Click element     ${confirm_delete_meeting}
    Sleep    2s
    Wait until page contains element    xpath=//div[contains(text(),'Deleted successfully')]    20s

Schedule Meeting With Password
    Common_Login
    Sleep    3s
    Wait until element is visible    ${schedule_option}     10s
    Click element    ${schedule_option}
    Wait until element is visible    ${add_description}     10s
    Sleep    4s
    Click element    ${add_description}
    Input text    ${input_meeting_description}      ${des}
    Input text    ${seat_No}    4
    Input text    ${invite_email_input}     ${invite_mail_id}
    Press keys    ${invite_email_input}     ENTER
    Click element    ${advanced_dropdown}
    # Normalize the relative file path to a canonical path
    ${IMAGE_FILE}=    Normalize Path    ${REL_IMAGE_FILE}
    # 2. Wait until the <input> is in the DOM (even if hidden)
    Wait Until Page Contains Element   ${upload_profile}    20s
    # 4. Now choose the file
    Choose File    ${upload_profile}   ${IMAGE_FILE}
    Wait until page contains    sample.pdf  10s
    Sleep    4s
    Click element    ${password_toggle}
    Sleep    3s
     ${current_value}=    Get Element Attribute      ${password_input_field}     value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}

     ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys     ${password_input_field}     ${KEY_BACKSPACE}
    END
    Input text    ${password_input_field}       Testing
    Click element    ${cloud_recording_toggle}
    Click element    ${participant_join_anytime_toggle}
    Click element    ${transcription_toggle}
    Click element    ${schedule_btn}
    Sleep    3s
    Wait until page contains    Meeting created successfully    10s
    Sleep    4s

Schedule Meeting With Password and disable the Allow participants to join anytime toggle
    Common_Login
    Sleep    3s
    Wait until element is visible    ${schedule_option}     10s
    Click element    ${schedule_option}
    Wait until element is visible    ${add_description}     10s
    Sleep    4s
    Click element    ${add_description}
    Input text    ${input_meeting_description}      ${des}
    Input text    ${seat_No}    4
    Input text    ${invite_email_input}     ${invite_mail_id}
    Press keys    ${invite_email_input}     ENTER
    Click element    ${advanced_dropdown}
    # Normalize the relative file path to a canonical path
    ${IMAGE_FILE}=    Normalize Path    ${REL_IMAGE_FILE}
    # 2. Wait until the <input> is in the DOM (even if hidden)
    Wait Until Page Contains Element   ${upload_profile}    20s
    # 4. Now choose the file
    Choose File    ${upload_profile}   ${IMAGE_FILE}
    Wait until page contains    sample.pdf  10s
    Sleep    4s
    Click element    ${password_toggle}
    Sleep    3s
     ${current_value}=    Get Element Attribute      ${password_input_field}     value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}

     ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys     ${password_input_field}     ${KEY_BACKSPACE}
    END
    Input text    ${password_input_field}       Testing
    Click element    ${cloud_recording_toggle}
    Click element    ${transcription_toggle}
    Click element    ${schedule_btn}
    Sleep    3s
    Wait until page contains    Meeting created successfully    10s
    Sleep    4s

Participant joining the schedule meeting
    # Now copy, paste the url in another browser and enter the meeting password and join the meeting
    Open Browser With Permissions     ${MEETING_ID}    chrome
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Sleep    3s
    Input text    ${Name_field_RaadytoJoin}     Bindu Mrs
    Input text    ${email_field_ReadyToJoin}    test@gmail.com
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Wait until page contains   Bindu Mrs     10s
    Wait until page contains    Monster     10s


Participant joining the locked Room
    # Now copy, paste the url in another browser and enter the meeting password and join the meeting
    Open Browser With Permissions     ${MEETING_ID}    chrome
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Sleep    3s
    Input text    ${Name_field_RaadytoJoin}     Tarik Aziz
    Input text    ${email_field_ReadyToJoin}    test@gmail.com
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Sleep    4s

Second Participant joining the Schedule Meeting
    # Now copy, paste the url in another browser and enter the meeting password and join the meeting
    Open Browser With Permissions     ${MEETING_ID}    chrome
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Sleep    3s
    Input text    ${Name_field_RaadytoJoin}     Bindu Mrs
    Input text    ${email_field_ReadyToJoin}    test@gmail.com
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Sleep    4s

Third Participant joining the schedule meeting
    # Now copy, paste the url in another browser and enter the meeting password and join the meeting
    Open Browser With Permissions     ${MEETING_ID}    chrome
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Sleep    3s
    Input text    ${Name_field_RaadytoJoin}     Tarik Aziz
    Input text    ${email_field_ReadyToJoin}    testas@gmail.com
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Wait until page contains      Tarik Aziz    10s
    Wait until page contains    Monster     10s

Third Participant joining the unlocked room
    # Now copy, paste the url in another browser and enter the meeting password and join the meeting
    Open Browser With Permissions     ${MEETING_ID}    chrome
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Sleep    3s
    Input text    ${Name_field_RaadytoJoin}     Tarik Aziz
    Input text    ${email_field_ReadyToJoin}    testas@gmail.com
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Sleep    4s
    Wait until page contains      Tarik Aziz    10s
    Wait until page contains    Monster     10s

Copy the meeting URL
    Sleep    3s
    Wait until element is visible    ${copy_meeting_url}    10s
    Sleep    2s
    Click element     ${copy_meeting_url}
    Page should contain    Copied!
    ${MEETING_ID}    Get Meeting ID from Clipboard
    Set Global Variable    ${MEETING_ID}  # Store for second test
    Log    "Meeting ID: ${MEETING_ID}"

Host starting the schedule meeting with Password
    Schedule Meeting With Password    # Host Schedule the Meeting
    Copy the meeting URL
    Start the Schedule meeting

Open Browser With Permissions
    [Arguments]    ${url}    ${browser}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${chrome_options}    add_argument    --use-fake-device-for-media-stream
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-popup-blocking

    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${url}
    Maximize Browser Window