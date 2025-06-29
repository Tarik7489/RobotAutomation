*** Settings ***

Library    SeleniumLibrary
Resource    ../PageObjects/InstantMeetingPage.robot
Resource    ../PageObjects/CommonKeywords.robot
Resource    ../PageObjects/CommonKeywords.robot
Test Teardown    Close All Browsers With Screenshot On Failure
Library    OperatingSystem
Suite Setup    Kill Browsers Before Retry


*** Variables ***
${RETRIES}    3
${BASE_URL}      https://preprodapp.inmeet.ai/
${EXCEL_FILE}    ${CURDIR}/../TestData/login_data.xlsx
${SHEET_NAME}    Login
${MEETING_ID}   None
${UPLOAD_LOCATOR}    xpath=//input[@accept="application/pdf" or @class="fileBtn" or @type="file"]
${REL_IMAGE_FILE}  ${CURDIR}${/}..${/}TestFiles${/}sample.pdf


${url}  https://preprodapp.inmeet.ai

*** Keywords ***

Close All Browsers With Screenshot On Failure
    Run Keyword And Ignore Error    Capture Screenshot On Failure
    Close All Browsers

Kill Browsers Before Retry
    Run Keyword And Ignore Error    Close All Browsers

*** Test Cases ***

1st_Test_Instant_Meeting
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        # 1st Test Cases :- Sharing files and verified
        Log to console    Sharing files and verified

        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Verify document share
        # Join Meeting in Another browser
        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
        Sleep    3s
        # Verify shared document by user B
        Verify shared document by user B
        Sleep    3s

        # Video sharing flow by host
        Switch browser    1
        Verify video share
        Switch browser    2
        Sleep    3s
        # Validating video by user B
        Wait until element is visible    ${verify_sharing_video_username}   10s
        Switch browser    1
        Click element    ${share_file_close}
        Sleep    2s
        Element should be visible    ${participate_tab}
        Sleep    4s
        Switch browser    2
        Page should not contain    Monster is sharing video

        # Now host sharing a video by copy link
        Switch browser    1
        Verify video play using copied URL
        Sleep    3s
        Switch browser    2

        # Validating video by user B
        Wait until element is visible    ${verify_sharing_video_username}   10s
        Switch browser    1
        Click element    ${share_file_close}
        Sleep    2s
        Element should be visible    ${participate_tab}
        Sleep    4s
        Switch browser    2
        Page should not contain    Monster is sharing video

        #share white board by Host
        Switch browser    1
        Verify start white board

        # Verify the white board by User B
        Switch browser    2
        Sleep    3s
#        Wait until page contains element    //*[contains(text(),'To move canvas')]     10s
        Switch browser    1
        Sleep    1s
        Click element    ${close_white_board}
        Element should be visible    ${participate_tab}



        # 2. Test Cases:- Poll Creating
        Log to console    Poll Creating

        Switch browser    1

        Sleep    3s
        raise hand as a user one
        click on chat box
        enter anything on chat box
        click on send message button
        close chat modal
        Switch browser    2
        Sleep    2s
        # Verify the raise hand
        verify the raise hand symbol when hand is raised
        click on chat box
        Sleep    3s
        Page should contain  Testing
        # Verify mic and video disable and raise hand functionality
        Switch browser    1
        disable mic and video button
        Switch browser    2
        close chat modal
        click on participate tab
        verify mic and video buttons are disable
        # Verify Mic and video enable functionality
        Switch browser    1
        Sleep    3s
        enable mic and video button
        Sleep    4s
        Switch browser    2
        verify mic and video buttons are enable
        close the participate modal

        # Verify poll creation
        Switch browser    1
        Sleep    2s
        create poll question

        # Verify submit poll ans
        Switch browser    2
        submit poll question
        Sleep    5s

        # Stop poll and verify the ans
        Switch browser    1
        Sleep    3s
        stop the poll and view the result

        # Copy the meeting ID
        Click on Meeting Info
        Sleep    3s
        copy meeting id
        Sleep    2s
        ${MEETING_ID}    Get Meeting ID from Clipboard
        Set Global Variable    ${MEETING_ID}  # Store for second test
        Log    "Meeting ID: ${MEETING_ID}"
        Click element    ${close_modal}



        # 3. Test Cases:- Breakout Room
        Log to console    Breakout Room

        Sleep    4s
        Join Meeting As Another User    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Sleep    4s
        Switch browser    1
        Sleep    3s
        verify breakdown room functionality

        # Now breakout room is done and we are logout the 3rd user from the meeting
        Switch browser    3
        Sleep    3
        Click element    xpath=//small[normalize-space()='Leave Meeting']
        Wait until element is visible   xpath=//span[normalize-space()='LEAVE']     20s
        Click element    xpath=//span[normalize-space()='LEAVE']
        Close browser


        # 4. Test Case:- Host Controls
        Log to console    Host Controls

        Switch browser    2
        Sleep    3s
        # Verify initially emojis and share screen buttons are enabled
        Element should be enabled    ${emoji_tab}
        Element should be enabled       ${share_screen_tab}

        # Mic and video disable
        disable mic and video button
        Switch browser    1
        # Verify user able to send a files in VC chat
        Send files in VC chat
        # Verify send message in VC chat
        Send Message on VC Chat by Host
        # Send a private message on vc
        Send a private message on VC by Host
        Switch browser    2
        # Verify the files send by Host
        Verify the files send in VC chat by Host
        # Verify the msg send by Host
        Verify VC chat message by User B
        # Verify the Private message
        Sleep    3s
        Verify private message by User B
        Sleep    3s
        Switch browser    1
        # Host disable chat, microphone and video, emojis, share screen, send files controls
        Verify send files control disable by Host
        Verify emojis and share screen control disable by Host
        Verify chat module disable by Host
        Verify microphone and video disable by Host
        Switch browser    2
        # Verify that send files button is not present
        click on chat box
        Element should not be visible    ${UPLOAD_LOCATOR}
        close chat modal
        Sleep    3s
        # Verify that video and microphone buttons are disabled
        Sleep    3s
        Element should not be visible     ${mic_on}
        Element should not be visible    ${video_on}

        # Verify emojis and share screen buttons are not visible
        Sleep    3s
        Element should not be visible     ${emoji_tab}
        Element should not be visible    ${share_screen_tab}

        # Verify chat module is disabled
        Sleep    4s
        click on chat box
        Wait until page contains element     ${group_msg_tab}   10s
        Sleep    3s
        Click element    ${group_msg_tab}
        Sleep    3s
        Page should contain    Chat input is disabled by host
        Page should not contain element     ${input_chat}

        # Verify private chat is disabled
        Click element    ${private_msg_tab}
        Sleep    3s
        Click element    ${select_msg}
        Page should contain    Chat input is disabled by host
        Page should not contain element     ${input_chat}
        Sleep    2s
        close chat modal
        close chat modal

    END



2nd_Test_Case_Instant_Meeting
     # 5. Test Case:- Host Controls Annotation
     Log to console    Host Controls Annotation
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        # 1. Host Controls Document share
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
        Sleep    3s
        Switch browser    1
        Verify document share
        Switch browser    2
        Verify shared document by user B
        Switch browser    1
        Sleep    3s
        Verify annotation control disable by Host
        Verify document share
        Switch browser    2
        Sleep    3s
        Element should not be visible    ${annotation_editor_tool}


        # 2. Test Cases:-Instant_Meeting_Added_New_Video_Input
        Log to console    Instant_Meeting_Added_New_Video_Input

        Sleep    2s
        Switch browser    1
        Sleep    3s
        Add a new video and verify the added video input

        # Copy the meeting ID
        Switch browser    1
        Sleep    3
        Click on Meeting Info
        Sleep    3s
        copy meeting id
        Sleep    2s
        ${MEETING_ID}    Get Meeting ID from Clipboard
        Set Global Variable    ${MEETING_ID}  # Store for second test
        Log    "Meeting ID: ${MEETING_ID}"
        Click element    ${close_modal}


        # 3. Test Case:- Instant_Meeting_Add_Remove_Spotlight
        Log to console    Instant_Meeting_Add_Remove_Spotlight

        Sleep    4s
        Join Meeting As Another User    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Sleep    3s
        Switch browser    1
        Add and Remove Spotlight Participant
        Press Keys    xpath=//body    ESCAPE
        Click element    ${close_participate_modal}
        Sleep    3s
        Close all browsers
    END


3rd_Test_Case_Instant_Meeting
    Log to console    Instant_Meeting_Unlock_Room_And_Rejoin_Meeting
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        # 1. Lock the room and decline the request and rejoin the meeting
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Lock the Room
        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
        Sleep    2s
        Wait until page contains    Monster 's Meeting  10s
        Wait until page contains    Thanks for Waiting. we will let you know    10s
        Wait until page contains    when host unlock the room:      10s
        Switch browser    1
        # Verify the user under waiting room
        Decline the participant request in waiting room
        Switch browser    2
        Close browser

        Switch browser    1
        # Now unlock the room
        Unlock the Room
        Switch browser    2
        # Join the meeting again as now room is unlocked
        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
        Sleep    3s
        Wait until page contains    Tarik Aziz      10s
        Wait until page contains    Monster   10s
        Click element    xpath=//small[normalize-space()='Leave Meeting']
        Wait until element is visible   xpath=//span[normalize-space()='LEAVE']     20s
        Click element    xpath=//span[normalize-space()='LEAVE']
        Close browser


        #Now logout the 3rd user and host lock the room again
        Switch browser    1
        Lock the Room
        Sleep    2
        Click on Meeting Info
        Sleep    3s
        copy meeting id
        Sleep    2s
        ${MEETING_ID}    Get Meeting ID from Clipboard
        Set Global Variable    ${MEETING_ID}  # Store for second test
        Log    "Meeting ID: ${MEETING_ID}"
        Click element    ${close_modal}

        # 2. Now join the locked room and host accept the request
        Log to console  Instant_Meeting_Lock_Room_Accept_Participants_Request
        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
        Sleep    2s
        Wait until page contains    Monster 's Meeting  10s
        Wait until page contains    Thanks for Waiting. we will let you know    10s
        Wait until page contains    when host unlock the room:      10s
        Switch browser    1
        # Verify the user under waiting room
        Accept the participant request in waiting room

        # As request is accepted then we can verify both the name
        Wait until page contains    Tarik Aziz      10s
        Wait until page contains    Monster   10s
        Sleep    3s
        Close all browsers
    END


#Instant_Meeting_Document_Video_And_White_Board_Share
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        # Start Meeting in Chrome
#        Start Meeting As User One    ${row}[email]    ${row}[password]
#        Sleep    4s
#        Verify document share
#        # Join Meeting in Another browser
#        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
#        Sleep    3s
#        # Verify shared document by user B
#        Verify shared document by user B
#        Sleep    3s
#
#        # Video sharing flow by host
#        Switch browser    1
#        Verify video share
#        Switch browser    2
#        Sleep    3s
#        # Validating video by user B
#        Wait until element is visible    ${verify_sharing_video_username}   10s
#        Switch browser    1
#        Click element    ${share_file_close}
#        Sleep    2s
#        Element should be visible    ${participate_tab}
#        Sleep    4s
#        Switch browser    2
#        Page should not contain    Monster is sharing video
#
#        # Now host sharing a video by copy link
#        Switch browser    1
#        Verify video play using copied URL
#        Sleep    3s
#        Switch browser    2
#
#        # Validating video by user B
#        Wait until element is visible    ${verify_sharing_video_username}   10s
#        Switch browser    1
#        Click element    ${share_file_close}
#        Sleep    2s
#        Element should be visible    ${participate_tab}
#        Sleep    4s
#        Switch browser    2
#        Page should not contain    Monster is sharing video
#
#        #share white board by Host
#        Switch browser    1
#        Verify start white board
#
#        # Verify the white board by User B
#        Switch browser    2
#        Sleep    3s
##        Wait until page contains element    //*[contains(text(),'To move canvas')]     10s
#        Switch browser    1
#        Sleep    1s
#        Click element    ${close_white_board}
#        Element should be visible    ${participate_tab}
##        Switch browser    2
##        Page should not contain element    //*[contains(text(),'To move canvas')]
#         Close all browsers
#    END
#
#Instant_Meeting_Create_Poll
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        # Start Meeting in Chrome
#        Start Meeting As User One    ${row}[email]    ${row}[password]
#        Sleep    5s
#        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
#        Switch browser    1
#
#        Sleep    3s
#        raise hand as a user one
#        click on chat box
#        enter anything on chat box
#        click on send message button
#        close chat modal
#        Switch browser    2
#        Sleep    2s
#        # Verify the raise hand
#        verify the raise hand symbol when hand is raised
#        click on chat box
#        Sleep    3s
#        Page should contain  Testing
#        # Verify mic and video disable and raise hand functionality
#        Switch browser    1
#        disable mic and video button
#        Switch browser    2
#        close chat modal
#        click on participate tab
#        verify mic and video buttons are disable
#        # Verify Mic and video enable functionality
#        Switch browser    1
#        Sleep    3s
#        enable mic and video button
#        Sleep    4s
#        Switch browser    2
#        verify mic and video buttons are enable
#        close the participate modal
#
#        # Verify poll creation
#        Switch browser    1
#        Sleep    2s
#        create poll question
#
#        # Verify submit poll ans
#        Switch browser    2
#        submit poll question
#        Sleep    5s
#
#        # Stop poll and verify the ans
#        Switch browser    1
#        Sleep    3s
#        stop the poll and view the result
#        Close all browsers
#    END
#
#
#Instant_Meeting_Breakout_Rooms
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        # Start Meeting in Chrome
#        Start Meeting As User One    ${row}[email]    ${row}[password]
#        Sleep    4s
#        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
#        Sleep    4s
#        Join Meeting As Another User    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
#        Sleep    4s
#        Switch browser    1
#        Sleep    3s
#        verify breakdown room functionality
#        Close all browsers
#    END
#
#Instant_Meeting_Host_Controls
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        # Start Meeting in Chrome
#        Start Meeting As User One    ${row}[email]    ${row}[password]
#        Sleep    4s
#        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
#        Sleep    3s
#        # Verify initially emojis and share screen buttons are enabled
#        Element should be enabled    ${emoji_tab}
#        Element should be enabled       ${share_screen_tab}
#
#        # Mic and video disable
#        disable mic and video button
#        Switch browser    1
#        # Verify user able to send a files in VC chat
#        Send files in VC chat
#        # Verify send message in VC chat
#        Send Message on VC Chat by Host
#        # Send a private message on vc
#        Send a private message on VC by Host
#        Switch browser    2
#        # Verify the files send by Host
#        Verify the files send in VC chat by Host
#        # Verify the msg send by Host
#        Verify VC chat message by User B
#        # Verify the Private message
#        Sleep    3s
#        Verify private message by User B
#        Sleep    3s
#        Switch browser    1
#        # Host disable chat, microphone and video, emojis, share screen, send files controls
#        Verify send files control disable by Host
#        Verify emojis and share screen control disable by Host
#        Verify chat module disable by Host
#        Verify microphone and video disable by Host
#        Switch browser    2
#        # Verify that send files button is not present
#        click on chat box
#        Element should not be visible    ${UPLOAD_LOCATOR}
#        close chat modal
#        Sleep    3s
#        # Verify that video and microphone buttons are disabled
#        Sleep    3s
#        Element should not be visible     ${mic_on}
#        Element should not be visible    ${video_on}
#
#        # Verify emojis and share screen buttons are not visible
#        Sleep    3s
#        Element should not be visible     ${emoji_tab}
#        Element should not be visible    ${share_screen_tab}
#
#        # Verify chat module is disabled
#        Sleep    4s
#        click on chat box
#        Wait until page contains element     ${group_msg_tab}   10s
#        Sleep    3s
#        Click element    ${group_msg_tab}
#        Sleep    3s
#        Page should contain    Chat input is disabled by host
#        Page should not contain element     ${input_chat}
#
#        # Verify private chat is disabled
#        Click element    ${private_msg_tab}
#        Sleep    3s
#        Click element    ${select_msg}
#        Page should contain    Chat input is disabled by host
#        Page should not contain element     ${input_chat}
#        Sleep    2s
#        Close all browsers
#    END
#
#Instant_Meeting_Host_Control_Annotation
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        # Start Meeting in Chrome
#        Start Meeting As User One    ${row}[email]    ${row}[password]
#        Sleep    4s
#        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
#        Sleep    3s
#        Switch browser    1
#        Verify document share
#        Switch browser    2
#        Verify shared document by user B
#        Switch browser    1
#        Sleep    3s
#        Verify annotation control disable by Host
#        Verify document share
#        Switch browser    2
#        Sleep    3s
#        Element should not be visible    ${annotation_editor_tool}
#        Close all browsers
#    END

Instant_Meeting_Added_New_Video_Input
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        # Start Meeting in Chrome
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
        Sleep    2s
        Switch browser    1
        Sleep    3s
        Add a new video and verify the added video input
        Close all browsers
    END

#Instant_Meeting_Unlock_Room_And_Rejoin_Meeting
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        # Start Meeting in Chrome
#        Start Meeting As User One    ${row}[email]    ${row}[password]
#        Sleep    4s
#        Lock the Room
#        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
#        Sleep    2s
#        Wait until page contains    Monster 's Meeting  10s
#        Wait until page contains    Thanks for Waiting. we will let you know    10s
#        Wait until page contains    when host unlock the room:      10s
#        Switch browser    1
#        # Verify the user under waiting room
#        Decline the participant request in waiting room
#
#        # Now unlock the room
#        Unlock the Room
#        Switch browser    2
#        # Join the meeting again as now room is unlocked
#        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
#        Sleep    3s
#        Wait until page contains    Tarik Aziz      10s
#        Wait until page contains    Monster   10s
#        Close all browsers
#    END
#
#Instant_Meeting_Lock_Room_Accept_Participants_Request
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        # Start Meeting in Chrome
#        Start Meeting As User One    ${row}[email]    ${row}[password]
#        Sleep    4s
#        Lock the Room
#        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
#        Sleep    2s
#        Wait until page contains    Monster 's Meeting  10s
#        Wait until page contains    Thanks for Waiting. we will let you know    10s
#        Wait until page contains    when host unlock the room:      10s
#        Switch browser    1
#        # Verify the user under waiting room
#        Accept the participant request in waiting room
#
#        # As request is accepted then we can verify both the name
#        Wait until page contains    Tarik Aziz      10s
#        Wait until page contains    Monster   10s
#        Close all browsers
#    END

Instant_Meeting_Moderate_Actions_Control_By_Host
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        # Start Meeting in Chrome
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    3s
        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
        Sleep    2s
        Wait until page contains element    ${mic_on}   10s
        Wait until page contains element    ${video_on}     10s

        # Host give access as moderate and presenter
        Switch browser    1
        Provide permission to Participant as Moderator and presenter

        # Host gave only presenter access and after access try to share document
        Switch browser    1
        Provide permission to Participant as presenter only

        # Host mute all audio and stop all participant videos
        Switch browser    1
        Instant meeting Host click on mute all and stop all videos

        # host stop audio and videos and requested the audio and video and accepted by Participants
        Switch browser    1
        host stop the audio and videos then requested for audio and video enable

        # Now host remove the participants from the meeting
        Switch browser    1
        Host remove participant from the meeting and rejoining the meeting
        Sleep    3s

        # Now again removed participant rejoin the meeting
        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
        Sleep    3s
        Switch browser    1
        Wait until page contains    Tarik Aziz      10s
        Wait until page contains    Monster   10s
        Close all browsers
    END


Instant_Meeting_Verify_Private_Msg_Disappear_After_Rejoining_Meeting_Participant
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        # Start Meeting in Chrome
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    3s
        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
        Sleep    2s
        Wait until page contains element    ${mic_on}   10s
        Wait until page contains element    ${video_on}     10s

        # Host send a private msg and verify then rejoining and verify msg is not displaying
        Switch browser    1
        Send a private message from Moderate Actions modal and verify the private message by participant
        Sleep    3s
        Join Meeting to Locked Room   ${row}[3rdUserEmail]    ${row}[joinUserPassword]
        After rejoining meeting private messages are disappear
        Close all browsers
    END


Instant_Meeting_Invite_Participant
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        # Start Meeting in Chrome
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    3s
        Invite Participant
        Open browser    https://mailsac.com/inbox/tarik%40mailsac.com       chrome
        Reload page
        Reload page
        Reload page
        Reload page
        Reload page
        Click First Email From mailsac
        Sleep    3s
        Page should contain    Monster is inviting you to this online conference meeting!
        Close all browsers
    END

#Instant_Meeting_Add_Remove_Spotlight
#    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
#    FOR    ${row}    IN    @{test_data}
#        Start Meeting As User One    ${row}[email]    ${row}[password]
#        Sleep    4s
#        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
#        Sleep    4s
#        Join Meeting As Another User    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
#        Sleep    3s
#        Switch browser    1
#        Add and Remove Spotlight Participant
#        Close all browsers
#    END

Instant_Meeting_Host_End_Meeting
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
        Sleep    4s
        Switch browser    1
        Host end the meeting
        Close all browsers
    END

Instant_Meeting_Host_Leave_And_Rejoin_The_Meeting
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Join Meeting As Another User    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Sleep    4s
        Switch browser    1
        Host leave the meeting
        Switch browser    1
        Host rejoining the meeting
        Close all browsers
    END

Instant_Meeting_Select_No_Of_Video_Layout_To_Display_On_Screen
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Join Meeting As Another User    ${row}[joinUserEmail]    ${row}[joinUserPassword]
        # Now mute the audio
        mute the audio
        Sleep    4s
        Join Meeting As Another User    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Sleep    3s
        Switch browser    1
        Number of video display on screen set to one
        Close all browsers
    END

Instant_Meeting_Hide_Self_video
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Join Meeting As Another User    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Switch browser    1
        hide self video
        Close all browsers
    END


Instant_Meeting_Participant_Join_Meeting_Via_Meeting_URL
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Host starting the meeting and copy the meeting URL and share with participant    ${row}[email]    ${row}[password]
        Sleep    4s
        Joining the meeting via meeting URL
        Close all browsers
    END


Instant_Meeting_Join_Meeting_With_Screen_Share_ID
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Start Meeting and copy the screen share ID    ${row}[email]    ${row}[password]
        Sleep    4s
        Join Meeting with Screen Share ID   ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Close all browsers
    END

Instant_Meeting_ReactEmoji_ShareEmojis_SendVideo_Vc_Chat
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Start Meeting As User One    ${row}[email]    ${row}[password]
        Sleep    4s
        Join Meeting As Another User    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Switch browser    1
        React Emojis and Verify by participant
        Send emojis in VC chat and verify
        Switch browser    1
        Send video in VC chat and verify the video
        Close all browsers
    END


*** Keywords ***
