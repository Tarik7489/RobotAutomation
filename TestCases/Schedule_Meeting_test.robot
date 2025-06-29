*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../Libraries/ExcelLibrary.py
Resource   ../PageObjects/LoginPage.robot
Resource   ../PageObjects/CommonKeywords.robot
Resource    ../PageObjects/Schedule_Meeting_Page.robot
Test Teardown    Close All Browsers With Screenshot On Failure

Suite Setup    Kill Browsers Before Retry

*** Variables ***
${BASE_URL}      https://preprodapp.inmeet.ai/
${EXCEL_FILE}    ${CURDIR}/../TestData/login_data.xlsx
${SHEET_NAME}    Login

*** Keywords ***

Close All Browsers With Screenshot On Failure
    Run Keyword And Ignore Error    Capture Screenshot On Failure
    Close All Browsers

Kill Browsers Before Retry
    Run Keyword And Ignore Error    Close All Browsers


*** Test Cases ***

Schedule_Meeting_Start_By_Host_And_Verify_Schedule_Meeting
        Schedule Meeting With Password
        Delete Schedule Meeting
        Sleep    2s
        Schedule Meeting With Password
        Edit Schedule Meeting
        Start the Schedule meeting
        Verify transcript flow
        Verify Cloud Recording start and stop
        Close all browsers

Schedule_Meeting_Only_Participant_Join_Via_URL_And_Password
        # As Allow participants to join anytime is enabled so without host starting the meeting participant can join the meeting
        Only Participant joining the schedule meeting via password

Schedule_Meeting_Cloud_Recording_Disable
        Cloud recording disable and verify that cloud recording options are not displaying

Schedule_Meeting_Disable_Transcription_Toggle
        Transcription toggle is disable and verify that Transcription options are not displaying

Schedule_Meeting_Disable_Allow_participants_to_join_anytime_toggle
        Allow participants to join anytime toggle is disable and verify without host starting the meeting participant can't join the meeting

Schedule_Meeting_Start_By_Host_And_Join_Participant_Document_Video_And_White_Board_Share
        Host starting the schedule meeting with Password
        Sleep    4s
        Verify document share
        Participant joining the schedule meeting    # Participant joining the meeting via copied URL
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
#        Switch browser    2
#        Page should not contain element    //*[contains(text(),'To move canvas')]
        Close all browsers


Schedule_Meeting_Create_Poll
        Host starting the schedule meeting with Password
        Sleep    4s
        Participant joining the schedule meeting
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
        Close all browsers


Schedule_Meeting_Breakout_Rooms
        Host starting the schedule meeting with Password
        Sleep    4s
        Participant joining the schedule meeting
        Sleep    4s
        Third Participant joining the schedule meeting
        Sleep    4s
        Switch browser    1
        Sleep    3s
        verify breakdown room functionality
        Close all browsers

Schedule_Meeting_Host_Controls
        Host starting the schedule meeting with Password
        Sleep    4s
        Participant joining the schedule meeting
        Sleep    4s
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
        Close all browsers

Schedule_Meeting_Host_Control_Annotation
        Host starting the schedule meeting with Password
        Sleep    4s
        Participant joining the schedule meeting
        Sleep    4s
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
        Close all browsers

Schedule_Meeting_Added_New_Video_Input
        Host starting the schedule meeting with Password
        Sleep    4s
        Participant joining the schedule meeting
        Sleep    4s
        Switch browser    1
        Sleep    3s
        Add a new video and verify the added video input
        Close all browsers


Schedule_Meeting_Unlock_Room_And_Rejoin_Meeting
        # Start Meeting in Chrome
        Host starting the schedule meeting with Password
        Sleep    4s
        Lock the Room
        Participant joining the locked Room
        Sleep    4s
        Wait until page contains    Thanks for Waiting. we will let you know    10s
        Wait until page contains    when host unlock the room:      10s
        Sleep    10s
        Switch browser    1
        # Verify the user under waiting room
        Decline the participant request in waiting room

        # Now unlock the room
        Unlock the Room
        Switch browser    2
        # Join the meeting again as now room is unlocked
        Third Participant joining the unlocked room
        Sleep    4s
        Wait until page contains    Tarik Aziz      10s
        Wait until page contains    Monster   10s
        Close all browsers

Schedule_Meeting_Lock_Room_Accept_Participants_Request
        # Start Meeting in Chrome
        Host starting the schedule meeting with Password
        Sleep    4s
        Lock the Room
        Participant joining the locked Room
        Sleep    2s
        Wait until page contains    Thanks for Waiting. we will let you know    10s
        Wait until page contains    when host unlock the room:      10s
        Switch browser    1
        # Verify the user under waiting room
        Accept the participant request in waiting room

        # As request is accepted then we can verify both the name
        Wait until page contains    Tarik Aziz      10s
        Wait until page contains    Monster   10s
        Close all browsers

Schedule_Meeting_Moderate_Actions_Control_By_Host
        # Start Meeting in Chrome
        Host starting the schedule meeting with Password
        Sleep    3s
        Participant joining the locked Room
        Sleep    2s
        Wait until page contains element    ${mic_on}   10s
        Wait until page contains element    ${video_on}     10s

        # Host give access as moderate and presenter
        Switch browser    1
        Schedule Meeting - Provide permission to Participant as Moderator and presenter

        # Host gave only presenter access and after access try to share document
        Switch browser    1
        Schedule meeting - Provide permission to Participant as presenter only

        # Host mute all audio and stop all participant videos
        Switch browser    1
        Host click on mute all and stop all videos

        # host stop audio and videos and requested the audio and video and accepted by Participants
        Switch browser    1
        host stop the audio and videos then requested for audio and video enable

        # Now host remove the participants from the meeting
        Switch browser    1
        Host remove participant from the meeting and rejoining the meeting
        Sleep    3s

        # Now again removed participant rejoin the meeting
        Participant joining the locked Room
        Sleep    3s
        Switch browser    1
        Wait until page contains    Tarik Aziz      10s
        Wait until page contains    Monster   10s
        Close all browsers


Schedule_Meeting_Verify_Private_Msg_Disappear_After_Rejoining_Meeting_Participant
        # Start Meeting in Chrome
        Host starting the schedule meeting with Password
        Sleep    3s
        Participant joining the locked Room
        Sleep    2s
        Wait until page contains element    ${mic_on}   10s
        Wait until page contains element    ${video_on}     10s

        # Host send a private msg and verify then rejoining and verify msg is not displaying
        Switch browser    1
        Send a private message from Moderate Actions modal and verify the private message by participant
        Sleep    3s
        Participant joining the locked Room
        After rejoining meeting private messages are disappear
        Close all browsers

Schedule_Meeting_Invite_Participant
        # Start Meeting in Chrome
        Host starting the schedule meeting with Password
        Sleep    3s
        Invite Participant
        Open browser    https://mailsac.com/inbox/tarik%40mailsac.com       chrome
        Reload page
        Reload page
        Reload page
        Reload page
        Reload page
        Reload page
        Reload page
        Reload page
        Reload page
        Reload page
        Sleep    7s
        Click First Email From mailsac
        Sleep    3s
        Page should contain    Monster is inviting you to this online conference meeting!
        Close all browsers


Schedule_Meeting_Add_Remove_Spotlight
        Host starting the schedule meeting with Password
        Sleep    4s
        Second Participant joining the Schedule Meeting
        Sleep    4s
        Third Participant joining the schedule meeting
        Sleep    3s
        Switch browser    1
        Add and Remove Spotlight Participant
        Close all browsers

Schedule_Meeting_Host_End_Meeting
        Host starting the schedule meeting with Password
        Sleep    4s
        Second Participant joining the Schedule Meeting
        Sleep    4s
        Switch browser    1
        Host end the meeting
        Close all browsers

#Schedule_Meeting_Host_Leave_And_Rejoin_The_Meeting

# we have a bug host leave the meeting then in dashboard same meeting is not showing
#        Host starting the schedule meeting with Password
#        Sleep    4s
#        Third Participant joining the schedule meeting
#        Sleep    4s
#        Switch browser    1
#        Host leave the meeting
#        Switch browser    1
#        Host rejoining the schedule meeting with password
#        Close all browsers

Schedule_Meeting_Select_No_Of_Video_Layout_To_Display_On_Screen
        Host starting the schedule meeting with Password
        Sleep    4s
        Second Participant joining the Schedule Meeting
        # Now mute the audio
        mute the audio
        Sleep    4s
        Third Participant joining the schedule meeting
        Sleep    3s
        Switch browser    1
        Number of video display on screen set to one
        Close all browsers

Schedule_Meeting_Hide_Self_video
        Host starting the schedule meeting with Password
        Sleep    4s
        Third Participant joining the schedule meeting
        Switch browser    1
        hide self video
        Close all browsers


Schedule_Meeting_Join_Meeting_With_Screen_Share_ID
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Start Schedule Meeting and copy the screen share ID
        Sleep    4s
        Join Meeting with Screen Share ID   ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Close all browsers
    END

Schedule_Meeting_ReactEmoji_ShareEmojis_SendVideo_Vc_Chat
        Start Schedule Meeting and copy the screen share ID
        Sleep    4s
        Third Participant joining the schedule meeting
        Switch browser    1
        React Emojis and Verify by participant
        Send emojis in VC chat and verify
        Switch browser    1
        Send video in VC chat and verify the video
        Close all browsers


Schedule_Meeting_Create_Edit_Delete_Daily_Weekly_Monthly_Repeat_Meeting
        Create, Edit & delete daily,weekly and monthly repeat meeting


Schedule_Meeting_Enable_Captions_And_Enable_Transcription_To_Co_Host
        Host starting the schedule meeting with Password
        Sleep    4s
        Third Participant joining the schedule meeting
        Wait until element is visible    ${CC_Icon}      10s
        Wait until element is visible    ${transcript_Icon}  10s
        Switch browser    1
        Verify Enable Captions host control flow
        # Enable_Transcription_To_Co_Host
        Switch browser    2
        Sleep    3s
        Verify Enable transcription to co-host Flow

