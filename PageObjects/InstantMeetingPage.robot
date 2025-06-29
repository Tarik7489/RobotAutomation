*** Settings ***

Library    SeleniumLibrary
Resource    ../PageObjects/LoginPage.robot
Library    OperatingSystem
Library    String
Resource    ../PageObjects/CommonKeywords.robot
Resource    ../PageObjects/Schedule_Meeting_Page.robot


*** Variables ***
${BASE_URL}      https://preprodapp.inmeet.ai/
${copy_meeting_id}  xpath=(//img[@alt='copy'])[1]
${MEETING_ID}   None

${Join_Meeting}     xpath=//div[@class='flexRow aCntr jBtwn dshOne']//div[2]
${MeetingID_field}      name=meetingId
${seat_place_holder}    xpath=//input[@placeholder='00']
${MEETING_ID}    ${EMPTY}
${join_button}      xpath=//button[@id='joinButton']
${joining_meeting_btn}  xpath=//button[normalize-space()='Join meeting']

${Instant_Meeting}   xpath=//body/div[@id='root']/div[@class='baseBlockCntnr']/div[@class='flexCol mainHoc']/div[@class='flexCol mainComponent']/div[@class='flexCol fullH dashBoard pdngSM positionRelative']/div[@class='flexRow dBody']/div[@class='flexCol fullH lCmpt ']/div[@class='flexCol pdngXS']/div[@class='flexRow aCntr jBtwn dshOne']/div[1]
${Start_Meeting}     xpath=//button[normalize-space()='Start Meeting']
${join_button}      xpath=//button[@id='joinButton']
${meeting_info}     xpath=(//b[normalize-space()='i'])[1]
${copy_meeting_id}  xpath=(//img[@alt='copy'])[1]
${close_modal}      xpath=(//img[@alt='cancel'])[1]

# Inside VC
${chat_box}     xpath=//small[normalize-space()='Chat']
${input_chat}   xpath=//textarea[@id='message-container']
${send_btn}     xpath=(//img[@class='pointer icons2'])[1]
${mic_off}      xpath=(//small[@class='disableActionColor'])[1]
${mic_of}       xpath=(//small[normalize-space()='Mic Off'])[1]
${video_off}    xpath=(//small[normalize-space()='Video Off'])[1]
${participate_tab}  xpath=//small[normalize-space()='Participants']
${mic_on}       xpath=//small[normalize-space()='Mic On']
${video_on}     xpath=//small[normalize-space()='Video On']
${close_chat_modal}     xpath=(//img[@alt='close'])[1]
${mic_disable}   xpath=//img[@src='/icons/pMicOff.svg']
${video_disable}    xpath=(//img[@src='/icons/pVideoOff.svg'])[1]
${close_participate_modal}  xpath=(//img[@alt='close'])[1]
${raise_hand_symbol}       xpath=(//img[@src='/icons/handrise.svg'])[1]
${raise_hand}       xpath=(//img[@alt='hand'])[1]
${emoji_tab}    xpath=(//img[@alt='emoji'])[1]
${select_emoji}     xpath=//button[.//img[@alt="emoji4"]]
${emoji_symbol}     xpath=//img[@src="./emojis/emoji4.svg"]
${share_screen_tab}     xpath=(//img[@alt='share'])[1]

#Poll Creation
${app_tab}      xpath=(//img[contains(@alt,'quad')])[1]
${polling}      xpath=//span[normalize-space()='Polling']
${add_poll}  xpath=//span[normalize-space()='Create Poll']
${poll_question_field}  xpath=//input[@id='poll']
${option_one}   xpath=(//input[@placeholder='+ Add'])[1]
${option_two}   xpath=(//input[contains(@placeholder,'+ Add')])[2]
${create_poll_btn}  xpath=//span[contains(text(),'Create Poll')]
${poll_start_btn}   xpath=//span[normalize-space()='Start']
${poll_close_modal}     xpath=(//img[@alt='close'])[1]

#Ans given
${select_first_option}  xpath=(//input[@type="radio"])[1]
${poll_result}      xpath=(//span[contains(text(),'Result')])[1]
${publish_result}   xpath=//span[normalize-space()='Publish Result']
${poll_stop}    xpath=//span[normalize-space()='Stop']
${submit_poll_btn}    xpath=//span[normalize-space()='Submit']

# Document share
${document_share}   xpath=//span[normalize-space()='Document Share']
${UPLOAD_LOCATOR}    xpath=//input[@accept="application/pdf" or @class="fileBtn" or @type="file"]
${REL_IMAGE_FILE}  ${CURDIR}${/}..${/}TestFiles${/}sample.pdf
${present_btn}      xpath=//span[normalize-space()='Present']
${delete_doc_present}   xpath=//img[@src='/icons/bin.svg']
${share_file_close}     xpath=/html/body/div[1]/div/div[6]/div/div/div/div[1]/div/div/div/img
${webinar_share_file_close}     xpath=//img[contains(@src, 'exitF.svg')]
${share_full_screen}    xpath=(//img[@title='Full screen'])[1]
${share_minimize_screen}    xpath=//img[@src='/icons/exitFull.svg']
${download_share_files}     xpath=//img[@src='/icons/downloadBG.svg']
${zoom_file}        xpath=//button[contains(@class,'MuiIconButton-root') and .//*[local-name()='svg']]

# video share
${video_share}  xpath=//span[normalize-space()='Video Share']
${REL_VIDEO_FILE}  ${CURDIR}${/}..${/}TestFiles${/}video.mp4
${video_link_input_field}   xpath=//input[@placeholder='Paste Video Link Here']
${video_play_btn}   xpath=//span[normalize-space()='Play']

# White board
${white_board_tab}  xpath=//span[normalize-space()='Start White Board']
${close_white_board}    xpath=(//img[@alt='close'])[1]

#Breakdown room
${breakdown_room_tab}   xpath=//span[normalize-space()='Breakout Rooms']
${select_manual}        xpath=//input[@value='manual']
${create_room_btn}      xpath=//span[normalize-space()='Create rooms']
${second_checkbox}      xpath=(//span[@class='MuiIconButton-label'])[3]
${third_checkbox}       xpath=(//span[@class='MuiIconButton-label'])[4]
${move_btn}             xpath=//span[normalize-space()='Move']
${select_room_one}      xpath=//span[normalize-space()='Room 1Testing']
${start_breakout_room_btn}  xpath=//span[normalize-space()='Start Breakout Rooms']
# Other user has to accept and join the breakout rooms
${Join_now_btn}         xpath=//span[normalize-space()='Join Now']
${side_nav_breakout}    xpath=(//img[@alt='arrow'])[1]
${navigate_room_one}    xpath=//small[normalize-space()='Room 1Testing']
${navigate_room_two}    xpath=//small[normalize-space()='Room 2']
${room_one_three_dots}  xpath=(//img[@alt='opts'])[1]
${rename_btn}           xpath=//span[contains(@class,'pdngSM pointer')]
${rename_input_field}   xpath=(//input[@type="text"])[2]
${rename_name_submit_btn}   xpath=//small[@class='flexAutoCol pdngXS roomNameCheck']
${end_all_breakout_sessions}    xpath=//span[normalize-space()='End ALl Breakout Sessions']
${confirm_end_all_breakout_sessions}    xpath=//span[@class='MuiButton-label'][normalize-space()='End Breakout Rooms']

# other user should click on ok button
${ok_breakout_btn}      xpath=(//span[normalize-space()='Ok'])[1]


# Anotation
${anotation_btn}    xpath=//img[@alt='pen']
${request_access}   xpath=//span[normalize-space()='Request Access']
${accept_all}       xpath=//span[normalize-space()='Accept All']
${annotation_editor_tool}   xpath=//div[@class='flexMinHeightCol hideScrollY pdngXXS aCntr']


# Host Control

${vc_three_dots}     xpath=(//img[@alt='more'])[1]
${host_control_option}  xpath=//span[normalize-space()='Host control']
${send_chat_toggle}     xpath=//input[@id='hostHandleChat']
${private_chat_toggle}  xpath=//input[@id='hostHandlePrivateChat']
${send_files_toggle}    xpath=//input[@id='hostHandleSendFiles']
${turn_on_micro_phone_toggle}  xpath=//input[@id='hostHandleMicroPhone']
${turn_on_video_toggle}        xpath=//input[@id='hostHandleVideo']
${emojis_toggle}        xpath=//input[@id='hostHandleEmojis']
${share_screen_toggle}  xpath=//input[@id='hostHandleScreenShare']
${enable_annotation_toggle}  xpath=//input[@id='hostHandleAnnotation']
${close_host_control_modal}     xpath=//img[@alt='cancel']

#private chat
${private_tab}      xpath=(//span[normalize-space()='Private'])[1]
${plus_btn}         xpath=//span[@class='plusbutton pointer']
${select_people}    xpath=//span[@class='small capitalizeTxt']
${select_msg}       xpath=//span[@class='ellipsisTxt sHdng chatTxtClr capitalizeTxt']
${private_msg_tab}  xpath=//*[contains(text(),'Private ')]
${group_msg_tab}    xpath=(//span[normalize-space()='Group'])[1]

# share files in VC chat
${vc_file_input}     xpath=//input[@id='contained-button-file']

# Add new video input
${add_new_video_input_option}   xpath=//span[normalize-space()='Add new video input']
${add_video_btn}            xpath=//span[normalize-space()='ADD']
${close_add_new_video}      xpath=(//*[name()='svg'][@class='MuiSvgIcon-root'])[3]


# lock room
${lock_room}    xpath=(//span[normalize-space()='Lock room'])[1]
${unlock_room}  xpath=//span[normalize-space()='Unlock Room']
${waiting_room_tab}     xpath=//span[normalize-space()='Waiting Room']
${decline_request}      xpath=(//button[contains(@type,'button')])[18]
${accept_request}       xpath=(//button[contains(@title,'Admit')])[1]
${participant_section}  xpath=(//span[contains(text(),'Participants')])[1]

# Participants control
${participants_three_dots}  xpath=(//img[@src='/icons/three.svg'])[1]
${mute_video_option}    xpath=//span[normalize-space()='Mute video']
${unmute_video_option}  xpath=//span[normalize-space()='Unmute video']
${chat_option}          xpath=//span[normalize-space()='Chat']
${spotlight_option}     xpath=//p[normalize-space()='Add to spotlight']
${stop_audio_option}    xpath=//span[normalize-space()='Stop Audio']
${stop_video_option}     xpath=//span[normalize-space()='Stop Video']
${request_audio_option}     xpath=//span[normalize-space()='Request Audio']
${request_video_option}     xpath=//span[normalize-space()='Request Video']
${ok_enable_btn}            xpath=//span[normalize-space()='Ok, Enable']
${remove_user_option}       xpath=//span[normalize-space()='Remove user']
${moderator_option}     xpath=(//input[@id='moderator'])[1]
${presenter_option}     xpath=(//input[@id='presenter'])[1]
${participant_mute_all}     xpath=(//small[normalize-space()='Mute all'])[1]
${instant_participant_mute_all}     xpath=//small[normalize-space(text())="Mute all"]
${participant_stop_all_video}   xpath=//small[normalize-space()='Stop all videos']
${participant_stop_all_screens}     xpath=//small[normalize-space()='Stop all screens']
${participant_end_meeting_btn}      xpath=//small[contains(text(),'End Meeting')]
${participant_cnf_end_meeting_btn}  xpath=(//span[normalize-space()='END'])[1]
${participant_add_invitees}     xpath=//button[@title='Add Invitees']
${participant_no_of_seat}       xpath=//input[@placeholder='00']
${participant_email_field}      xpath=(//input[@id='email'])[1]
${update_send_invite_btn}   xpath=//span[normalize-space()='Update and Send Invite']

${participant_name}        Tarik Aziz
${search_participant}   xpath=(//input[@placeholder='Search by name'])[1]
${leave_meeting_btn}    xpath= //small[normalize-space()='Leave Meeting']
${confirm_leave_btn}    xpath=//span[normalize-space()='LEAVE']

# Layout View

${layout_btn}       xpath=(//img[@alt='layout'])[1]
${Democratic_view}  xpath=//span[normalize-space()='Democratic view']
${Show_self_video}  xpath=//span[normalize-space()='Show self video']
${Picture_in_picture}   xpath=//span[normalize-space()='Picture in picture']
${Enter_full_screen}   xpath=//span[normalize-space()='Enter full screen']
${Hide_self_view_video}     xpath=//span[normalize-space()='Hide self view video']
${Filmstrip_view}   xpath=//span[normalize-space()='Filmstrip view']
${Sidebar_View}     xpath=//span[normalize-space()='Sidebar View']
${spot_light_btn}   xpath=//button[@aria-label='Add to spotlight']//span[@class='MuiFab-label']//*[name()='svg']
${remove_spot_light_btn}    xpath=//button[@aria-label='Remove from spotlight']//span[@class='MuiFab-label']//*[name()='svg']

${Remove_spotLight_text}    xpath=//p[normalize-space()='Remove from spotlight']

#end meeting

${end_btn}      xpath=(//small[contains(text(),'End')])[1]
${end_meeting_for_all_btn}  xpath=//span[normalize-space()='END MEETING FOR ALL']
${cnf_end_meeting_btn}  xpath=//span[normalize-space()='END']
${end_meeting_msg}  xpath=//span[normalize-space()='Thanks for Choosing InMeet. The Host has ended']

# Host leave the meeting
${Leave_Meeting}    xpath=//span[normalize-space()='LEAVE MEETING']
${End_Meeting_btn}  xpath=//span[normalize-space()='LEAVE']

# Video seetings

${settings_tab}     xpath=//span[normalize-space()='Settings']
${video_option}     xpath=//span[contains(text(),'Video')]
${select_number_of_video}   xpath=(//div[@id='Last N'])[1]
${select_one_video}     xpath=//li[normalize-space()='1']
${close_settings_modal}     xpath=(//img[@alt='cancel'])[1]
${advance_settings}     xpath=(//span[normalize-space()='Advance'])[2]
${checkbox_self_video_hidden}       xpath=(//input[contains(@type,'checkbox')])[2]

# Host Rejoin the meeting
${leave_meeting_join_btn}       xpath=(//button[@type='button'][normalize-space()='Join'])[1]

# Joining the meeting via meeting URL

${copy_meeting_url}     xpath=(//img[@alt='copy'])[2]
${Name_field_RaadytoJoin}   id=displayname
${email_field_ReadyToJoin}  id=displayEmail
${screen_share}     xpath=(//small[normalize-space()='Screen Share'])[1]

# Screen share ID
${input_share_screen_id}   name=screenId
${share_btn}        xpath=(//button[normalize-space()='Share'])[1]
${join_share_screen_btn}    xpath=//span[normalize-space()='Join & Share Screen']
${screen_share_icon}    xpath=(//li[@role='menuitem'])[1]
${request_btn}      xpath=//span[normalize-space()='Request']
${screen_share_accept_all}  xpath=//span[normalize-space()='Accept All']

# Send Emojis
${emojis_tab}   xpath=(//img[@alt='emoji'])[1]
${select_emojis}     xpath=(//img[@alt='emoji5'])[1]
${upload_profile}   xpath=//input[@class="imgEdit pointer" or @type="file" or @accept="image/png,image/jpeg,image/" ]
${REL_VIDEO_FILE}  ${CURDIR}${/}..${/}TestFiles${/}video.mp4
${vc_chat_video_play}   xpath=(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeLarge'])[1]
${video_close_btn}      xpath=(//div[@class='backIcon'])[2]
${vc_emojis}            xpath=(//img[@src='icons/Icon.svg'])[1]
${vc_select_emojis}     xpath=//img[@alt='laughing']
${received_emojis}      xpath=(//p[contains(text(),'😆')])[1]

${verify_sharing_video_username}    xpath=//small[normalize-space()='Monster is sharing video']
${verify_sharing_file_username}     xpath=//small[normalize-space()='Monster is sharing file']
${meeting_password}    Testing
${Enter_Meeting_Password}   name=password
${ok_btn}       xpath=(//button[normalize-space()='OK'])[1]
${verify_text_msg}      Testing
*** Keywords ***

Send emojis in VC chat and verify by webinar user
     Switch browser    1
     Click on chat box
     Sleep    3s
     Wait until element is visible    xpath=(//span[normalize-space()='Broadcast'])[1]      20s
     Click element    xpath=(//span[normalize-space()='Broadcast'])[1]
     Wait until element is visible    ${vc_emojis}   10s
     Sleep    3s
     Click element    ${vc_emojis}
     Wait until element is visible     ${vc_select_emojis}      10s
     Sleep    3s
     Click element    ${vc_select_emojis}
     Sleep    2s
     Click element    ${send_btn}
     Sleep    2s
     close chat modal
     Switch browser    3
     Click on chat box
     Wait until page contains element    ${received_emojis}     10s
     close chat modal

Send emojis in VC chat and verify
     Click on chat box
     Wait until element is visible    ${vc_emojis}   10s
     Sleep    3s
     Click element    ${vc_emojis}
     Wait until element is visible     ${vc_select_emojis}      10s
     Sleep    3s
     Click element    ${vc_select_emojis}
     Sleep    2s
     Click element    ${send_btn}
     Switch browser    2
     Click on chat box
     Wait until page contains element    ${received_emojis}     10s



Send video in VC chat and verify the video
    # Normalize the relative file path to a canonical path
     ${VIDEO_FILE}=    Normalize Path    ${REL_VIDEO_FILE}
    # 2. Wait until the <input> is in the DOM (even if hidden)
      Wait Until Page Contains Element   ${upload_profile}    20s
    # 4. Now choose the file
      Choose File    ${upload_profile}   ${VIDEO_FILE}
      Wait until page contains    File uploaded successfully    10s
      Switch browser    2
      Wait until page contains element    ${vc_chat_video_play}     10s
      Click element    ${vc_chat_video_play}
      Sleep    3s
      Wait until page contains    video.mp4     10s


React Emojis and Verify by participant
     Click element    ${emojis_tab}
     Sleep    3s
     Click element   ${select_emojis}
     Press keys    xpath=//body         ESCAPE
#     Wait until page contains element  ${select_emojis}     10s

Join Meeting with Screen Share ID
   [Arguments]     ${joinUserEmail}    ${joinUserPassword}
   [Documentation]    Opens a new browser and joins the meeting as another user
    Open Browser With Permissions    ${BASE_URL}    firefox  # Open second browser session
    Login     ${joinUserEmail}    ${joinUserPassword}
    Sleep    3s
    Wait until page contains element    ${screen_share}     10s
    Sleep    3s
    Click Element    ${screen_share}
    Sleep    2s
    # Enter the copied share screen ID (Try both approaches)
    Input Text    ${input_share_screen_id}    ${screen_share_id}
    Wait until page contains element     ${share_btn}   10s
    Click element    ${share_btn}
    Wait until element is visible    ${join_share_screen_btn}      15s
    Sleep    3s
    Click element   ${join_share_screen_btn}
    Sleep    3s
    Wait until page contains    You got the role: normal    10s
    Wait until page contains    You have joined the room    10s
    Sleep    3s
    Wait until page contains    Please wait until the host gives you the presenter role     10s
    Click element    ${screen_share_icon}
    Click element    ${request_btn}
    Switch browser    1
    Sleep    3s
    Click element    ${screen_share_accept_all}
    Switch browser    2
    Sleep    3s
    Wait until page contains    You got the role: presenter     10s
    Page should contain    You can now share your screen
    Sleep    3s


Start Meeting and copy the screen share ID
    [Arguments]    ${email}    ${password}
    [Documentation]    Starts an instant meeting in Chrome and extracts Meeting ID
    Open Browser With Permissions    ${BASE_URL}    chrome
    Enter Login Credentials    ${email}    ${password}
    Click on Login Button
    Sleep    3s
    Click on Instant Meeting
    Sleep    3s
    Element should be visible    //input[@value="Monster 's Meeting"]
    Sleep    2s
    Page should contain    30 Mins     10s
    Click element    ${seat_place_holder}
    Clear element text    ${seat_place_holder}
    Input text    ${seat_place_holder}      10
    Click on Start Meeting
    Sleep    5s
    Click on Join Button
    Sleep    10s
    Click on Meeting Info
    Sleep    3s
    ${screen_share_id}=    Get Text    xpath=(//span[contains(text(), 'Screen Share ID')]/following::span)[1]
    Log    Screen Share ID: ${screen_share_id}
    Set Global Variable    ${screen_share_id}
    Click element    ${close_modal}

Start Schedule Meeting and copy the screen share ID
    Host starting the schedule meeting with Password
    Sleep    10s
    Click on Meeting Info
    Sleep    3s
    ${screen_share_id}=    Get Text    xpath=(//span[contains(text(), 'Screen Share ID')]/following::span)[1]
    Log    Screen Share ID: ${screen_share_id}
    Set Global Variable    ${screen_share_id}
    Click element    ${close_modal}

Joining the meeting via meeting URL
    Open Browser With Permissions    ${MEETING_URL}   chrome
    Sleep    3s
    Input text    ${Name_field_RaadytoJoin}     Guest User
    Input text    ${email_field_ReadyToJoin}    test@gmail.com
    Click on join button
    Sleep    3s
    Wait until page contains    Monster     10s
    Wait until page contains    Guest User  10s


Copying Meeting URL
    Wait until page contains element    ${copy_meeting_url}     10s
    Click element    ${copy_meeting_url}

Host starting the meeting and copy the meeting URL and share with participant
    [Arguments]    ${email}    ${password}
    [Documentation]    Starts an instant meeting in Chrome and extracts Meeting ID
    Open Browser With Permissions    ${BASE_URL}    chrome
    Enter Login Credentials    ${email}    ${password}
    Click on Login Button
    Sleep    3s
    Click on Instant Meeting
    Sleep    3s
    Element should be visible    //input[@value="Monster 's Meeting"]
    Sleep    2s
    Page should contain    30 Mins     10s
    Click element    ${seat_place_holder}
    Clear element text    ${seat_place_holder}
    Input text    ${seat_place_holder}      10
    Click on Start Meeting
    Sleep    5s
    Click on Join Button
    Sleep    10s
    Click on Meeting Info
    Sleep    3s
    Copying Meeting URL
    Sleep    2s
    ${MEETING_URL}    Get Meeting ID from Clipboard
    Set Global Variable    ${MEETING_URL}  # Store for second test
    Log    "Meeting ID: ${MEETING_URL}"
    Click element    ${close_modal}


Host rejoining the meeting
    Wait until page contains element    ${leave_meeting_join_btn}   10s
    Click element    ${leave_meeting_join_btn}
    Click on Join Button
    Wait until page contains    Monster     10s
    Wait until page contains    Tarik Aziz  10s

Host rejoining the schedule meeting with password
    Common_Login
    Wait until page contains element    ${leave_meeting_join_btn}   10s
    Click element    ${leave_meeting_join_btn}
    Wait until element is visible   ${Enter_Meeting_Password}   10s
    Input text    ${Enter_Meeting_Password}     ${meeting_password}
    Click element    ${ok_btn}
    Wait until element is visible    (//span[normalize-space()='Join'])[1]      15s
    Click element    (//span[normalize-space()='Join'])[1]
    Sleep    3s
    Wait until page contains    Monster     10s
    Wait until page contains    Tarik Aziz  10s


hide self video
    Wait until page contains    Monster     10s
    Wait until page contains    Tarik Aziz  10s
    Click element    ${vc_three_dots}
    Click element   ${settings_tab}
    Click element    ${advance_settings}
    Sleep    2s
    Click element    ${checkbox_self_video_hidden}
    Sleep    2s
    Click element    ${close_settings_modal}
    Sleep    2s
    Wait until page contains    Tarik Aziz   10s
    Page should not contain    Monster

mute the audio
    Wait until page contains element    ${mic_on}   10s
    Click element    ${mic_on}

Number of video display on screen set to one
    Wait until page contains    Monster     10s
    Wait until page contains    Tarik Aziz  10s
    Wait until page contains    Bindu Mrs   10s
    Click element    ${vc_three_dots}
    Click element   ${settings_tab}
    Wait until page contains element    ${video_option}     10s
    Click element     ${video_option}
    Wait until page contains element    ${select_number_of_video}   10s
    Click element    ${select_number_of_video}
    Sleep    2s
    Click element    ${select_one_video}
    Click element    ${close_settings_modal}

    # Now visible only Monster and Tarik Aziz as bindu is mute while joining then it will not display
    Sleep    3s
    Wait until page contains    Monster     10s
    Wait until page contains    Bindu Mrs  10s
    Page should not contain    Tarik Aziz

Host leave the meeting
    Click element    ${end_btn}
    Sleep    2s
    Click element    ${Leave_Meeting}
    Sleep    2s
    Click element    ${End_Meeting_btn}
    Switch browser    2
    Sleep    3s
    Wait until page contains    Tarik Aziz      10s
    Page should not contain    Monster

Host end the meeting
    Click element    ${end_btn}
    Sleep    2s
    Click element    ${end_meeting_for_all_btn}
    Sleep    2s
    Click element    ${cnf_end_meeting_btn}
    Switch browser    2
    Wait until page contains element    ${end_meeting_msg}      10s
    Sleep    3s

Add and Remove Spotlight Participant
    Click element    ${layout_btn}
    Wait until page contains element    ${Democratic_view}      10s
    Wait until page contains element    ${Picture_in_picture}   10s
    Wait until page contains element    ${Enter_full_screen}    10s
    Wait until page contains element    ${Hide_self_view_video}     10s
    Wait until page contains element    ${Filmstrip_view}   10s
    Wait until page contains element    ${Sidebar_View}     10s
    Click element   ${Sidebar_View}
    Click element    ${participate_tab}
    Wait until page contains element    ${search_participant}   10s
    Sleep    3s
    Input text    ${search_participant}     ${participant_name}
    Wait until page contains    ${participant_name}
    Sleep    3s
    Click element    ${participants_three_dots}
    Wait until page contains element    ${spotlight_option}     10s
    Click element    ${spotlight_option}
    Sleep    3s
    Click element    ${participants_three_dots}
    Wait until page contains element    ${Remove_spotLight_text}
    Press Keys    xpath=//body    ESCAPE
    Click element    ${close_participate_modal}
    Sleep    3s
    Page should contain    ${participant_name}

    # Remove the participant from the spotlight
    Click element    ${participate_tab}
    Wait until page contains element    ${search_participant}   10s
    Sleep    3s
    Input text    ${search_participant}     ${participant_name}
    Wait until page contains    ${participant_name}
    Sleep    3s
    Click element    ${participants_three_dots}
    Sleep    3s
    Click element    ${Remove_spotLight_text}
    Sleep    3s
    # After removing verify that it removed from spotlight
    Click element    ${participants_three_dots}
    Sleep    3s
    Element should not be visible     ${Remove_spotLight_text}
    Sleep    2s
    Element should be visible    ${spotlight_option}
    Sleep    3s

Click First Email From mailsac
     Wait Until Element Is Visible    xpath=//table//tr[.//text()[contains(., 'noreply@instavc.com')]]    timeout=10s
     Click Element    xpath=(//table//tr[.//text()[contains(., 'noreply@instavc.com')]])[1]

Invite Participant
    Click element   ${participate_tab}
    Wait until page contains element    ${participant_add_invitees}     10s
    Sleep    3s
    Click element    ${participant_add_invitees}
    Input text    ${participant_no_of_seat}     7
    Input text    ${participant_email_field}    tarik@mailsac.com
    Press keys       ${participant_email_field}    ENTER
    Wait until page contains element     ${update_send_invite_btn}      10s
    Click element    ${update_send_invite_btn}
    Wait until page contains    You've successfully increased participant limit     10s
    Wait until page contains    You’ve successfully invited participants    10s


After rejoining meeting private messages are disappear
    click on chat box
    Sleep    3s
    Click element    ${private_msg_tab}
    Page should contain    No conversations


Send a private message from Moderate Actions modal and verify the private message by participant
    Click element    ${participate_tab}
    Sleep    3s
    Wait until page contains element     ${participants_three_dots}     10s
    Click element    ${participants_three_dots}

    Click element    ${chat_option}
    Input text    ${input_chat}     Private
    click on send message button
    close chat modal
    close chat modal
    Switch browser    2
    Verify private message by User B

    # Now participant leave the event and rejoining the event and verify private messages are not displaying
    Click element   ${leave_meeting_btn}
    Sleep    3s
    Click element    ${confirm_leave_btn}
    Page should contain    Thanks for Choosing InMeet.You left:
    Close browser



Presenter sharing the documents
     Click element    ${app_tab}
     Sleep    4s
     Wait until element is visible    ${document_share}    15s
     Click element    ${document_share}

     # Normalize the relative file path to a canonical path
     ${IMAGE_FILE}=    Normalize Path    ${REL_IMAGE_FILE}
     # 2. Wait until the <input> is in the DOM (even if hidden)
     Wait Until Page Contains Element    ${UPLOAD_LOCATOR}    20s

     # Upload the file
     Choose File    ${UPLOAD_LOCATOR}    ${IMAGE_FILE}
     Wait until page contains    sample.pdf     10s
     Wait until page contains element    ${present_btn}  15s
     Click element    ${present_btn}
     Wait until page contains    You are sharing file   10s
     Click element      ${share_file_close}
     Sleep    2s

Provide permission to Participant as Moderator and presenter
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
    Switch browser    2
    # Now have complete host access
    Click element    ${vc_three_dots}
    Sleep    3s
    Wait until page contains element     ${host_control_option}     10s
    Sleep    2s
    Click element    ${host_control_option}
    Sleep    2s
    # Now bug is there in escape, it is not closing the modal it is opening the Host control modal so we need to close it
    Click element    ${close_host_control_modal}
    Sleep    2s

Schedule Meeting - Provide permission to Participant as Moderator and presenter
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
    Switch browser    2
    # Now have complete host access
    Click element    ${vc_three_dots}
    Sleep    3s
    Wait until page contains element     ${host_control_option}     10s
    Sleep    2s
    Click element    ${host_control_option}
    Sleep    2s
    # Now bug is there in escape, it is not closing the modal it is opening the Host control modal so we need to close it
    Click element    ${close_host_control_modal}
    Sleep    2s

Provide permission to Participant as presenter only
    Sleep    4s
    Wait until page contains element    ${participants_three_dots}      10s
    Click element    ${participants_three_dots}
    Scroll element into view   ${moderator_option}
    Click element    ${moderator_option}
    Sleep    2s
#    Press Keys    xpath=//body    ESCAPE
    Execute JavaScript    document.querySelector('.MuiPopover-paper')?.remove()

    # Now we have a bug like modal is not closing it is opening host control
    Sleep    3s
    Switch browser    2
    # Now have only presenter access
    Click element    ${vc_three_dots}
    Sleep    3s
    Element should not be visible    ${host_control_option}
    Sleep    2s
    Press Keys    xpath=//body    ESCAPE

    # As a presenter share documents
    Presenter sharing the documents


Schedule meeting - Provide permission to Participant as presenter only
    Sleep    4s
    Wait until page contains element    ${participants_three_dots}      10s
    Click element    ${participants_three_dots}
    Scroll element into view   ${moderator_option}
    Click element    ${moderator_option}
    Sleep    2s
    Press Keys    xpath=//body    ESCAPE
    Sleep    3s
    Switch browser    2
    # Now have only presenter access
    Click element    ${vc_three_dots}
    Sleep    3s
    Element should not be visible    ${host_control_option}
    Sleep    2s
    Press Keys    xpath=//body    ESCAPE

    # As a presenter share documents
    Presenter sharing the documents


Host remove participant from the meeting and rejoining the meeting
    Click element    ${participants_three_dots}
    Scroll element into view    ${remove_user_option}
    Click element    ${remove_user_option}
    Switch browser    2
    Sleep    2s
    ##Comment-  Now this message is not displaying sometimes
    Page should contain    You have been removed from the meeting.
    Switch browser    1
    Element should not be visible    ${participant_name}

Instant meeting Host click on mute all and stop all videos
    Sleep    3s
    Double click element    ${instant_participant_mute_all}
    Sleep    2s
    Click element    ${participant_stop_all_video}
    Sleep    2s
    Switch browser    2
    Sleep    3s
    Element should not be visible    ${mic_on}
    Element should not be visible    ${video_on}
    Sleep    3s
    Click element     ${mic_off}
    Click element    ${video_off}
    Wait until page contains element    ${mic_on}   10s
    Wait until page contains element    ${video_on}     10s

Host click on mute all and stop all videos
    Sleep    3s
    Wait until page contains element    ${participant_mute_all}     10s
    Sleep    3s
    Click element    ${participant_mute_all}
    Sleep    2s
    Click element    ${participant_stop_all_video}
    Sleep    2s
    Switch browser    2
    Sleep    3s
    Element should not be visible    ${mic_on}
    Element should not be visible    ${video_on}
    Sleep    3s
    Click element     ${mic_off}
    Click element    ${video_off}
    Wait until page contains element    ${mic_on}   10s
    Wait until page contains element    ${video_on}     10s

host stop the audio and videos then requested for audio and video enable
#    Input text    ${search_participant}     ${participant_name}
#    Wait until page contains    ${participant_name}
    Click element    ${participants_three_dots}
    Scroll element into view    ${stop_audio_option}
    Click element     ${stop_audio_option}
    Sleep    3s
    Click element     ${participants_three_dots}
    Sleep    3s
    Scroll element into view      ${stop_video_option}
    Click element    ${stop_video_option}
    Switch browser    2
    Sleep    3s
    Element should not be visible    ${mic_on}
    Sleep    3s
    Element should not be visible    ${video_on}
    Switch browser    1
    Click element     ${participants_three_dots}
    Scroll element into view    ${request_audio_option}
    Click element    ${request_audio_option}
    Switch browser    2
    Sleep    2s
    Wait until page contains element     ${ok_enable_btn}   10s
    Click element    ${ok_enable_btn}
    Sleep    3s
    Wait until page contains element    ${mic_on}   10s
    Switch browser    1
    Click element     ${participants_three_dots}
    Scroll element into view   ${request_video_option}
    Click element   ${request_video_option}
    Switch browser    2
    Sleep    2s
    Wait until page contains element     ${ok_enable_btn}   10s
    Click element    ${ok_enable_btn}
    Sleep    3s
    Wait until page contains element    ${video_on}  10s




Decline the participant request in waiting room
    Click element    ${participate_tab}
    Sleep    3s
    Click element    ${waiting_room_tab}
    Wait until page contains    Tarik Aziz      10s
    Sleep    3s
    Click element    ${decline_request}
    Sleep    3s
    Page should not contain      Tarik Aziz       10s
    Wait until page contains    No Participants     10s
    Click element    ${close_participate_modal}

Accept the participant request in waiting room
    Click element    ${participate_tab}
    Sleep    3s
    Click element    ${waiting_room_tab}
    Wait until page contains    Tarik Aziz      10s
    Sleep    3s
    Click element    ${accept_request}
    Sleep    3s
    Wait until page contains    No Participants     10s
    Click element    ${participant_section}
    Wait until page contains    Tarik Aziz      10s
    Sleep    2s
    Wait until element is visible    ${close_participate_modal}     20s
    Click element    ${close_participate_modal}


Lock the Room
   Click element     ${vc_three_dots}
   Sleep    3s
   Click element    ${lock_room}

Unlock the Room
   Click element     ${vc_three_dots}
   Sleep    3s
   Click element    ${unlock_room}

Add a new video and verify the added video input
    Click element    ${vc_three_dots}
    Click element    ${add_new_video_input_option}
    Sleep    3s
    Click element    ${add_video_btn}
    Wait until page contains element    ${close_add_new_video}
    Switch browser    2
    Sleep    2s
    Wait until page contains element    ${close_add_new_video}
    Switch browser    1
    Click element    ${close_add_new_video}
    Element should not be visible    ${close_add_new_video}
    Switch browser    2
    Element should not be visible    ${close_add_new_video}

Send files in VC chat
     click on chat box
      # Normalize the relative file path to a canonical path
     ${IMAGE_FILE}=    Normalize Path    ${REL_IMAGE_FILE}
     # 2. Wait until the <input> is in the DOM (even if hidden)
     Wait Until Page Contains Element    ${UPLOAD_LOCATOR}    20s

     # 4. Now choose the file
     Choose File    ${UPLOAD_LOCATOR}    ${IMAGE_FILE}
     Sleep    3s
     Wait until page contains    File uploaded successfully      10s
     click on send message button
     close chat modal

Verify the files send in VC chat by Host
    click on chat box
    Wait until page contains    sample.pdf      10s
    close chat modal
    Sleep    3s

Verify send files control disable by Host
    Click element    ${vc_three_dots}
    Click element    ${host_control_option}
    Sleep    3s
    Click element    ${send_files_toggle}
    Sleep    2s
    Click element    ${close_host_control_modal}

Verify annotation control disable by Host
    Click element    ${vc_three_dots}
    Click element    ${host_control_option}
    Sleep    3s
    Click element    ${enable_annotation_toggle}
    Sleep    2s
    Click element    ${close_host_control_modal}


Send a private message on VC by Host
    click on chat box
    Sleep    3s
    Click element    ${private_tab}
    Click element    ${plus_btn}
    Sleep    2s
    Click element    ${select_people}
    Input text    ${input_chat}     Private
    click on send message button
    close chat modal
    close chat modal

Verify private message by User B
    click on chat box
    Sleep    3s
    Click element    ${private_msg_tab}
    Wait until page contains    Private     10s
    Sleep    2s
    close chat modal

Verify chat module disable by Host
    Click element    ${vc_three_dots}
    Click element    ${host_control_option}
    Sleep    3s
    Click element    ${send_chat_toggle}
    Sleep    2s
    Click element    ${close_host_control_modal}

Verify microphone and video disable by Host
    Click element    ${vc_three_dots}
    Click element    ${host_control_option}
    Sleep    3s
    Click element    ${turn_on_micro_phone_toggle}
    Sleep    2s
    Click element    ${turn_on_video_toggle}
    Sleep    1s
    Click element    ${close_host_control_modal}

Verify emojis and share screen control disable by Host
    Click element    ${vc_three_dots}
    Click element    ${host_control_option}
    Sleep    3s
    Click element    ${emojis_toggle}
    Sleep    2s
    Click element    ${share_screen_toggle}
    Sleep    1s
    Click element    ${close_host_control_modal}

Send Message on VC Chat by Host
    click on chat box
    enter anything on chat box
    click on send message button
    close chat modal


Send Message by webinar user
    click on chat box
    enter anything by webinar user
    click on send message button
    close chat modal



Send Message on broadcast by Host
    click on chat box
    Sleep    3s
    Wait until element is visible    xpath=(//span[normalize-space()='Broadcast'])[1]       20s
    Click element    xpath=(//span[normalize-space()='Broadcast'])[1]
    enter anything on chat box
    click on send message button
    close chat modal

Verify VC chat message by User B
    Sleep    2s
    click on chat box
    Sleep    2s
    Page should contain    Testing
    Sleep    3s
    close chat modal

Verify message by webinar user
    Sleep    2s
    click on chat box
    Sleep    2s
    Page should contain    Message by Webinar User
    Sleep    3s
    close chat modal

Verify message which is send by webinar user
    Sleep    2s
    click on chat box
    Sleep    3s
    Wait until element is visible    xpath=(//span[normalize-space()='Broadcast'])[1]       20s
    Click element    xpath=(//span[normalize-space()='Broadcast'])[1]
    Sleep    3s
    Page should contain    Message by Webinar User
    Sleep    3s
    close chat modal


host control toggles
    Click element    ${vc_three_dots}
    Click element    ${host_control_option}
    Click element    ${send_chat_toggle}
    Click element    ${turn_on_micro_phone_toggle}
    Click element    ${turn_on_video_toggle}
    Click element    ${emojis_toggle}
    Click element    ${share_screen_toggle}
    Click element    ${enable_annotation_toggle}

    # Now enable all
    Click element    ${send_chat_toggle}
    Click element    ${turn_on_micro_phone_toggle}
    Click element    ${turn_on_video_toggle}
    Click element    ${emojis_toggle}
    Click element    ${share_screen_toggle}
    Click element    ${enable_annotation_toggle}
    Sleep    4s

verify breakdown room functionality
    Click element    ${app_tab}
    Sleep    4s
    Click element    ${breakdown_room_tab}
    Sleep    4s
    Click element    ${select_manual}
    Click element    ${create_room_btn}
    Sleep    1s
    Click element    ${room_one_three_dots}
    Click element    ${rename_btn}
    Sleep    1s

    ${KEY_CMD}=    Evaluate    sys.modules['selenium.webdriver'].Keys.COMMAND    sys, selenium.webdriver
    Click Element    ${rename_input_field}
    Press Keys       ${rename_input_field}    ${KEY_CMD}+a
    Press Keys       ${rename_input_field}    DELETE
    Input Text       ${rename_input_field}    Testing

    Sleep    2s
    Click element    ${rename_name_submit_btn}
    Sleep    3s
    Page should contain    Room 1Testing
    Click element    ${second_checkbox}
    Click element    ${third_checkbox}
    Sleep    2s
    Click element    ${move_btn}
    Click element    ${select_room_one}
    Click element    ${start_breakout_room_btn}
    Sleep    3s
    Switch browser    2
    Sleep    4s

    Click element    ${Join_now_btn}
    Sleep    3s
    Switch browser    3
    Sleep    4s
    Click element    ${Join_now_btn}
    Sleep    4s
    Switch browser    1
    Sleep    3s
    Page should not contain    Tarik Aziz
    Page should not contain    Bindu Mrs
    Wait until page contains    Monster     10s
    Click element    ${side_nav_breakout}
    Sleep    3s

    Click element    ${navigate_room_one}
    Sleep    3s
    Wait until page contains    Tarik Aziz      10s
    Wait until page contains    Bindu Mrs       10s
    Wait until page contains    Monster         10s
    Click element    ${side_nav_breakout}
    Sleep    3s
    Click element    ${navigate_room_two}
    Sleep    3s
    Page should not contain    Tarik Aziz
    Page should not contain    Bindu Mrs
    Wait until page contains    Monster     10s
    Sleep    4s
    Click element    ${app_tab}
    Click element    ${breakdown_room_tab}
    Sleep    3s
    Wait until page contains element    ${end_all_breakout_sessions}    10s
    Click element    ${end_all_breakout_sessions}
    Wait until page contains element   ${confirm_end_all_breakout_sessions}     15s
    Sleep    3s
    Click element    ${confirm_end_all_breakout_sessions}
    Sleep    3s
    Switch browser    2
    Sleep    4s
    Click element    ${ok_breakout_btn}
    Switch browser    3
    Sleep    4s
    Click element    ${ok_breakout_btn}
    Switch browser    1
    Sleep    3s
    Wait until page contains    Tarik Aziz      10s
    Wait until page contains    Bindu Mrs       10s
    Wait until page contains    Monster         10s
    Sleep    8s



Verify start white board
     Click element    ${app_tab}
     Sleep    4s
     Wait until page contains element    ${white_board_tab}     15s
     Click element    ${white_board_tab}
     Sleep    2s
#     Wait until page contains element    //*[contains(text(),'To move canvas')]     10s
      # We can't validate


Verify video play using copied URL
     Click element    ${app_tab}
     Sleep    4s
     Wait until element is visible    ${video_share}    15s
     Click element    ${video_share}
     Wait until page contains element    ${video_link_input_field}      15s
     Input text    ${video_link_input_field}    https://www.youtube.com/watch?v=a3ICNMQW7Ok
     Wait until page contains element   ${video_play_btn}   15s
     Click element    ${video_play_btn}
     Wait until page contains    You are sharing video      10s
#     Wait until page contains    Wildlife Windows 7 Sample Video    10s
     Execute JavaScript    return document.querySelector('video').play()
     Sleep    3s
     # 2. Pause the video
     Execute JavaScript    return document.querySelector('video').pause()
     Sleep    1s
     # Set volume to 50%
     Execute JavaScript    document.querySelector('video').volume = 0.5

     # Mute video
     Execute JavaScript    document.querySelector('video').muted = true

     # Confirm it's muted
     ${is_muted}=    Execute JavaScript    return document.querySelector('video').muted
     Should Be True    ${is_muted}
#     Click element    ${share_file_close}
#     Sleep    2s
#     Element should be visible    ${participate_tab}
#     Sleep    4s


Verify video share
     Sleep    2s
     Click element    ${app_tab}
     Sleep    4s
     Wait until element is visible    ${video_share}    15s
     Click element    ${video_share}

     # Normalize the relative file path to a canonical path
     ${VIDEO_FILE}=    Normalize Path    ${REL_VIDEO_FILE}
     # 2. Wait until the <input> is in the DOM (even if hidden)
     Wait Until Page Contains Element    ${UPLOAD_LOCATOR}    20s

     # 4. Now choose the file
     Choose File    ${UPLOAD_LOCATOR}    ${VIDEO_FILE}
     Sleep    15s
     # Verify the file uploaded successfully
     Wait until page contains    video.mp4    10s
     Wait until page contains element    ${delete_doc_present}  15s
     Click element    ${delete_doc_present}
     Sleep    3s
     Wait until page contains    video deleted successfully  10s

     # Again upload the file
     Choose File    ${UPLOAD_LOCATOR}    ${VIDEO_FILE}
     Wait until page contains    video.mp4    10s
     Wait until page contains element    ${present_btn}  15s
     Click element    ${present_btn}
     Wait until page contains    You are sharing video   10s
   # 1. Play the video
      Execute JavaScript    return document.querySelector('video').play()
      Sleep    3s
        # 2. Pause the video
      Execute JavaScript    return document.querySelector('video').pause()
      Sleep    1s
        # 3. Seek to 10 seconds
      Execute JavaScript    var vid = document.querySelector('video'); vid.currentTime = 10; return vid.currentTime;
        # 4. Get the current time and verify it's at or beyond 10s
      ${current_time}=    Execute JavaScript    return document.querySelector('video').currentTime
       Should Be True    ${current_time} >= 10

        # Set volume to 50%
        Execute JavaScript    document.querySelector('video').volume = 0.5

        # Mute video
         Execute JavaScript    document.querySelector('video').muted = true

        # Confirm it's muted
        ${is_muted}=    Execute JavaScript    return document.querySelector('video').muted
        Should Be True    ${is_muted}

#        Click element    ${share_file_close}
#        Sleep    2s
#        Element should be visible    ${participate_tab}
#        Sleep    4s


Verify document share
     Click element    ${app_tab}
     Sleep    4s
     Wait until element is visible    ${document_share}    15s
     Click element    ${document_share}

     # Normalize the relative file path to a canonical path
     ${IMAGE_FILE}=    Normalize Path    ${REL_IMAGE_FILE}
     # 2. Wait until the <input> is in the DOM (even if hidden)
     Wait Until Page Contains Element    ${UPLOAD_LOCATOR}    20s

     # 4. Now choose the file
     Choose File    ${UPLOAD_LOCATOR}    ${IMAGE_FILE}
     Sleep    15s
     # Verify the file uploaded successfully
     Wait until page contains    sample.pdf     10s
     Wait until page contains element    ${delete_doc_present}  15s
     Click element    ${delete_doc_present}
     Sleep    3s
     Wait until page contains    File deleted successfully  10s

     # Again upload the file
     Choose File    ${UPLOAD_LOCATOR}    ${IMAGE_FILE}
     Wait until page contains    sample.pdf     10s
     Wait until page contains element    ${present_btn}  15s
     Click element    ${present_btn}
     Wait until page contains    You are sharing file   10s
     Wait until page contains element    ${share_full_screen}   15s
     Sleep    3s
     Click element    ${share_full_screen}
     Sleep    1s
     Wait until page contains element    ${share_minimize_screen}   15s
     Click element    ${share_minimize_screen}
     Wait until page contains element     ${download_share_files}   15s
     Sleep    4s
     Click element    ${download_share_files}
     Sleep    2s

Verify shared document by user B
        Sleep    2s
        Wait until page contains element    ${verify_sharing_file_username}     10s
        Click element    ${anotation_btn}
        Click element    ${request_access}
        Sleep    2s
        Switch browser    1
        Sleep    3s
        Click element    ${accept_all}
        Switch browser    2
        Sleep    3s
        Page should contain element    ${annotation_editor_tool}
        Sleep    3s
        Switch browser    1
        Sleep    1s
        Wait until page contains element     ${share_file_close}   15s
        Sleep    3s
        Click element    ${share_file_close}
        Sleep    2s
        Element should be visible    ${participate_tab}
        Sleep    3s
        Switch browser    2
        Page should not contain element   ${annotation_editor_tool}




verify add emoji reaction by user two
    Wait until element is visible    ${emoji_symbol}  15s
    Page should contain element    ${emoji_symbol}

add emoji reaction as a user one
    Wait until element is visible    ${emoji_tab}        15s
    Click element    ${emoji_tab}
    Wait until element is visible   ${select_emoji}        15s
    Sleep    7s
    Click element     ${select_emoji}
    Execute JavaScript               arguments[0].click()    ${select_emoji}



close the participate modal
    Wait until element is visible    ${close_participate_modal}     15s
    Click element    ${close_participate_modal}

stop the poll and view the result
    Wait until element is visible    ${poll_stop}   15s
    Click element    ${poll_stop}
    Sleep    2s
    Wait until page contains    You’ve successfully stopped the poll!   20s
    Sleep    3s
    Wait until element is visible    ${poll_result}
    Click element    ${poll_result}
    Sleep    4s
    Wait until element is visible    ${publish_result}  15s
    Click element    ${publish_result}
    Sleep    3s
    Wait until page contains    Poll result published successfully!     20s
    Sleep    3s
    Wait until page contains    Tiger (1/1 voted)   20s
    Sleep    3s
    Wait until page contains element    ${poll_close_modal}     15s
    Click element    ${poll_close_modal}

create poll question
    Wait until element is visible     ${app_tab}    15s
    Click element    ${app_tab}
    Sleep    3s
    Click element    ${polling}
    Wait until element is visible   ${add_poll}
    Sleep    2s
    Click element    ${add_poll}
    Input text    ${poll_question_field}    What is the national animal of india
    Input text    ${option_one}     Tiger
    Input text    ${option_two}     Lion
    Click element    ${create_poll_btn}
    Sleep    4s
    Page should contain   You’ve successfully created the poll!
    Sleep    4s
    Click element    ${poll_start_btn}
    Sleep    4s
    Page should contain    You’ve successfully started the poll!
    Sleep    2s

submit poll question
    Wait Until Element Is Visible    xpath=//label[.//span[text()='Tiger']]    15s
    Click Element                    xpath=//label[.//span[text()='Tiger']]
    Sleep                            2s
    Click Element                    ${submit_poll_btn}
    Sleep                            1s
    Wait until page contains          You’ve successfully submitted the poll!       20s
    Sleep    3s


verify mic and video buttons are enable
    Page should not contain element    ${mic_disable}
    Sleep    2s
    Page should not contain element    ${video_disable}

close chat modal
    Wait until element is visible    ${close_chat_modal}    15s
    Click element    ${close_chat_modal}

enable mic and video button
    Wait until element is visible    ${mic_off}     15s
    Click element    ${mic_off}
    Wait until element is visible    ${video_off}   15s
    Click element    ${video_off}

disable mic and video button
    Wait until element is visible    ${mic_on}  15s
    Click element    ${mic_on}
    Wait until element is visible    ${video_on}    15s
    Click element    ${video_on}

raise hand as a user one
    Wait until element is visible    ${raise_hand}      15s
    Click element    ${raise_hand}

verify the raise hand symbol when hand is raised
    Wait until element is visible    ${raise_hand_symbol}   15s
    Page should contain element    ${raise_hand_symbol}
    

click on participate tab
    Wait until element is visible   ${participate_tab}      15s
    Click element    ${participate_tab}

verify mic and video buttons are disable
    Wait until element is visible   ${mic_disable}      15s
    Page should contain element    ${mic_disable}
    Wait until element is visible   ${video_disable}    15s
    Page should contain element     ${video_disable}


click on chat box
    Wait until element is visible    ${chat_box}    15s
    Click element    ${chat_box}

enter anything on chat box
    Wait until element is visible    ${input_chat}  15s
    Input text    ${input_chat}     Testing

enter anything by webinar user
    Wait until element is visible    ${input_chat}  15s
    Input text    ${input_chat}     Message by Webinar User

click on send message button
    Wait until element is visible    ${send_btn}    15s
    Click element    ${send_btn}

click on instant meeting
    Wait until element is visible    ${Instant_Meeting}     15s
    Click element    ${Instant_Meeting}

click on start meeting
    Wait until element is visible   ${Start_Meeting}    15s
    Click element    ${Start_Meeting}

click on join button
    Wait until element is visible   ${join_button}    35s
    Click element    ${join_button}

click on meeting info
    Wait until element is visible    ${meeting_info}    15s
    Click element    ${meeting_info}

copy meeting id
    Wait until element is visible    ${copy_meeting_id}     15s
    Click element    ${copy_meeting_id}


# Reusable Methods
Get Meeting ID from Clipboard
    [Documentation]    Fetches the copied Meeting ID from clipboard
    ${clipboard_value}    Evaluate    __import__('pyperclip').paste()
    RETURN    ${clipboard_value}

Start Meeting As User One
    [Arguments]    ${email}    ${password}
    [Documentation]    Starts an instant meeting in Chrome and extracts Meeting ID
    Open Browser With Permissions    ${BASE_URL}    chrome
    Enter Login Credentials    ${email}    ${password}
    Click on Login Button
    Sleep    3s
    Click on Instant Meeting
    Sleep    3s
    Element should be visible    //input[@value="Monster 's Meeting"]
    Sleep    2s
    Page should contain    30 Mins     10s
    Click element    ${seat_place_holder}
    Clear element text    ${seat_place_holder}
    Input text    ${seat_place_holder}      10
    Click on Start Meeting
    Sleep    5s
    Click on Join Button
    Sleep    10s
    Click on Meeting Info
    Sleep    3s
    copy meeting id
    Sleep    2s
    ${MEETING_ID}    Get Meeting ID from Clipboard
    Set Global Variable    ${MEETING_ID}  # Store for second test
    Log    "Meeting ID: ${MEETING_ID}"
    Click element    ${close_modal}

Join Meeting As Another User
   [Arguments]     ${joinUserEmail}    ${joinUserPassword}
   [Documentation]    Opens a new browser and joins the meeting as another user
    Open Browser With Permissions    ${BASE_URL}    firefox  # Open second browser session
    Login     ${joinUserEmail}    ${joinUserPassword}
    Sleep    3s
    Wait until page contains element     ${Join_Meeting}    10s
    Sleep    3s
    Click Element    ${Join_Meeting}
    Sleep    2s
    # Clear field before entering value
    Clear Element Text    ${MeetingID_field}
    # Enter the copied Meeting ID (Try both approaches)
    Input Text    ${MeetingID_field}     ${MEETING_ID}
    Sleep    2s
    Press Keys    ${MeetingID_field}    ${MEETING_ID}  # Alternative approach
    Wait Until Element Is Visible    ${joining_meeting_btn}     15s
    Click Element    ${joining_meeting_btn}
    Sleep    5s
    Wait until element is visible    ${join_button}     15s
    Sleep    3s
    Click element    ${join_button}


Join Meeting As 3rd User login
   [Arguments]     ${joinUserEmail}    ${joinUserPassword}
   [Documentation]    Opens a new browser and joins the meeting as another user
    Open Browser With Permissions    ${BASE_URL}    firefox  # Open second browser session
    Login     ${joinUserEmail}    ${joinUserPassword}
    Sleep    3s
    Click Element    ${Join_Meeting}
    Sleep    2s
    # Clear field before entering value
    Clear Element Text    ${MeetingID_field}
    # Enter the copied Meeting ID (Try both approaches)
    Input Text    ${MeetingID_field}     ${MEETING_ID}
    Sleep    2s
    Press Keys    ${MeetingID_field}    ${MEETING_ID}  # Alternative approach
    Wait Until Element Is Visible    ${joining_meeting_btn}     15s
    Click Element    ${joining_meeting_btn}
    Sleep    5s
    Wait until element is visible    ${join_button}     15s
    Sleep    3s
    Click element    ${join_button}
    Sleep    15s

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

Join Meeting to Locked Room
   [Arguments]     ${joinUserEmail}    ${joinUserPassword}
   [Documentation]    Opens a new browser and joins the meeting as another user
    Open Browser With Permissions    ${BASE_URL}    firefox  # Open second browser session
    Login     ${joinUserEmail}    ${joinUserPassword}
    Sleep    3s
    Wait until page contains element    ${Join_Meeting}     10s
    Click Element    ${Join_Meeting}
    Sleep    2s
    # Clear field before entering value
    Clear Element Text    ${MeetingID_field}
    # Enter the copied Meeting ID (Try both approaches)
    Input Text    ${MeetingID_field}     ${MEETING_ID}
    Sleep    2s
    Press Keys    ${MeetingID_field}    ${MEETING_ID}  # Alternative approach
    Wait Until Element Is Visible    ${joining_meeting_btn}     15s
    Click Element    ${joining_meeting_btn}
    Sleep    5s
    Wait until element is visible    ${join_button}     15s
    Sleep    3s
    Click element    ${join_button}


