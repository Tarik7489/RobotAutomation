*** Settings ***
Library                 SeleniumLibrary
Resource                ../PageObjects/CommonKeywords.robot
Resource                ../PageObjects/PresencePage.robot
Library                 OperatingSystem
Library                 ../Libraries/ExcelLibrary.py
Test Teardown    Close All Browsers With Screenshot On Failure
Suite Setup    Kill Browsers Before Retry

*** Variables ***
${SHEET_NAME}   credentials

${iframe}                       xpath=//iframe[@title='External Page']



*** Keywords ***

Close All Browsers With Screenshot On Failure
    Run Keyword And Ignore Error    Capture Screenshot On Failure
    Close All Browsers

Kill Browsers Before Retry
    Run Keyword And Ignore Error    Close All Browsers

*** Test Cases ***

Dependencies
    Common_Login
    Open_chats
    Click element                      ${search_field}
    Input text                         ${search_field}   Chilukuri Bindu
    Click element    ${chat}
    Sleep    3s
    Clear_chat
    Send_messages
    Close all browsers
unread_chat_dependencies
    Unread_chat
    Close all browsers

Verify_presence_module

    Common_Login
    Open_chats
    Page should contain element    ${chat_settings}
    Page should contain element    ${chat_filter}
    Page should contain element    ${search_field}
    Click element                  ${search_field}
    Close all browsers

Verify_invite_user

    Common_Login
    Open_chats
    Click element                    ${+_icon}
    Wait until element is visible    ${invite_email}                60s
    Click element                    ${invite_email}
    Page should contain element      ${invite_gmail}
    Page should contain element      ${invite_icloud}
    Page should contain element      ${invite_outlook}
    Click image                      ${invite_close}
    Sleep    2s
    Click element                    ${search_field_+icon}
    Input text                       ${search_field_+icon}      megha@yopmail.com
    Wait until page contains         megha                        30s
    Click element                    ${back_chats}
    Close all browsers

verify_initiate_new_user_chat

    Common_Login
    Open_chats
    Click element                      ${+_icon}
    Wait until element is visible      ${new_user}                         20s
    Sleep    2s
    Click element                      ${new_user}
    Sleep    2s
    Click element                      ${chat_field1}
    Sleep    2s
    Input text                         ${chat_field1}     helloo
    Click image                        ${send_message}
    Sleep    3s
    Close all browsers

verify_newchat_text

    Common_Login
    Open_chats
    Click element                      ${+_icon}
    Wait until element is visible      ${search_field_+icon}                20s
    Click element                      ${search_field_+icon}
    Input text                         ${search_field_+icon}     india@yopmail.com
    Wait until element is visible      ${new_user1}                         20s
    Click element                      ${new_user1}
    Wait until page contains    You haven’t initiated a conversation yet    10s
    Close all browsers

search_functionality

    Common_Login
    Open_chats
    Click element                      ${search_field}
    Input text                         ${search_field}   bindu
    Click element                      ${search_field_close}
    Click element                      ${search_field}
    Input text                         ${search_field}   1234567
    Wait until page contains    We didn’t find any matches     10s
    Click element                      ${search_field_close}
    Close all browsers

Delete_&_clear_chat

    Common_Login
    Open_chats
    Click element                       ${new_user}
    Wait until element is visible       ${chat_field}           60s
    Clear_chat
    Wait until page contains        chat cleared successfully   60s
    Delete_chat
    Close all browsers

send_msg_audio_emoji

    Common_Login
    Browser_B
    Switch browser    1
    Open_chat
    send_msg

    Switch browser    2
    Open_chats
    Click element                       ${search_field}
    Input text                          ${search_field}  aswin
    Wait until page contains         helloo                 30s
    Click element                       ${search_field_close}

    Switch browser    1
    send_emoji

    Switch browser    2
    Open_chats
    Click element                       ${search_field}
    Input text                          ${search_field}  aswin
    Wait until page contains    🥳                         30s
    Click element                       ${search_field_close}

    Switch browser    1
    Sleep    4s
    send_audio
    Switch browser    2
    Wait until page contains    shared an audio           30s
    Close all browsers

Upload_files

    Common_Login
    Open_chat
    send_image
    send_video
    upload_pdf
    send_image2
    Wait until page contains    File size should not exceed 50 MB    10s
    Close all browsers

verify_search_in_chats

    Common_Login
    Open_chats
    Open_chat
    Wait until element is visible    ${chat_search}
    Click element                    ${chat_search}
    Input text                       ${search_field_chat}      helloo
    Click element                    ${search_close}
    Close all browsers

select_message_P-P

    Common_Login
    Open_chat
    Chat_3_dots
    Select_message
    Sleep    2s
    Click element                       ${select_frwd}
    Sleep    2s
    Click element                       ${select_contact}
    Click button                        ${frwd_button}
    Sleep    3s
    Chat_3_dots
    Select_message
    Click image                         ${dlt_msg}
    Sleep    3s
    Click element                       ${dlt_select}
    Sleep    3s
    Click element                       ${confirm_delete}
    Close all browsers

3dot_verification

    Common_Login
    Open_chat
    sleep   3s
    Mouse over    ${msg_3_dot1}
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Wait until element is visible    ${edit}                    20s
    Click element    ${edit}
    Input text                      ${reply_mesg_field}    terror
    Click image                     ${send_message}
    Sleep    3s
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Wait until element is visible    ${reply}                   20s
    Click element                   ${reply}
    Input text                      ${reply_mesg_field}    Hello
    Click image                     ${send_message}
    sleep    3s
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Sleep    2s
    Click element                   ${forward}
    Sleep    2s
    Click element                   ${select_user}
    Click button                    ${frwd_button}
    Sleep    3s
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Sleep    2s
    Click element                   ${3dot_dlt}
    Sleep    3s
    Click element                   ${dlt_select}
    Wait until element is visible   ${confirm_delete}            30s
    Click element                   ${confirm_delete}
    Sleep    5s
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Sleep    3s
    Click element    ${dlt}
    Wait until element is visible   ${confirm_delete}            30s
    Click element                   ${confirm_delete}
    sleep    5s
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Wait until element is visible   ${pin}                       20s
    Click element                   ${pin}
    Sleep    3s
    Click element                   ${close_pin}
    Wait until element is visible   ${remove_pin}                20s
    Click button                    ${remove_pin}
    Sleep    3s
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Wait until element is visible   ${copy}                      20s
    Click element                   ${copy}
    Page should contain    Copied!
    Close all browsers


Verify_Contact_info

    Common_Login
    Open_chat
    Wait until element is visible    ${chat_profile}       60s
    Click element                    ${chat_profile}
    Page should contain     image
    Page should contain     Videos
    Page should contain     Docs
    Page should contain     Links
    Page should contain     Groups In Common
    Page should contain     Mute Notifications
    Page should contain     Block Chilukuri Bindu
    Page should contain     Delete Conversation
    Close all browsers


Chat_profile_image

    Common_Login
    Open_chat
    Wait until element is visible    ${chat_profile}
    Click element                    ${chat_profile}
    #video
    Sleep    2s
    Click element                    ${chat_profile}
    Wait until element is visible    ${video}           20s
    Click element                    ${video}
    Select checkbox                  ${media_image}
    Click element                    ${media_frwd}
    Click element                    ${select_user}
    Wait until element is visible    ${frwd_button}      20s
    Click button                     ${frwd_button}
    Sleep    2s
    #documents
    Click element                    ${chat_profile}
    Click element                    ${doc}
    Select checkbox                  ${media_image}
    Click element                    ${media_frwd}
    Click element                    ${select_user}
    Click button                     ${frwd_button}
    Sleep    2s
    #links
    Send_Link
    Send_Link
    Click element                   ${chat_profile}
    Click element                   ${link}
    Select checkbox                 ${media_image}
    Click element                   ${media_frwd}
    Click element                   ${select_user}
    Click button                    ${frwd_button}
    Sleep   2s
    #groups in common
    Click element                   ${close_profile}
    Click element                   ${chat_profile}
    Click element                   ${common_group}
    Wait until page contains        trash😊             20s
    #image
    Wait until element is visible    ${image}           20s
    Click element                    ${image}
    Wait until element is visible    ${image_files}     20s
    Select checkbox                  ${media_image}
    Click element                    ${media_frwd}
    Click element                    ${select_user}
    Click button                     ${frwd_button}
    Close all browsers

Block_&_Unblock_user

    Common_Login
    Open_chat
    Block_user
    sleep    4s
    Unblock_user
    Close all browsers

Filter_option

     Common_Login
     Open_chats
     Click element           ${filter}
     Page should contain     Groups
     Page should contain     Meetings
     Page should contain     Muted Chats
     Page should contain     Blocked Chats
     Page should contain     Unread Chats
     Close all browsers

filter_Dependencies
    Browser_D
    Open_chat_Aswin
    Send_messages
    Close all browsers

Filter_functions

    Common_Login
    Open_chats
    Click element    ${filter}
    Click element    ${group}
    Page should contain    trash
    Sleep    4s
    Click element    ${filter}
    Click element    ${muted_chat}
    Page should contain    ram
    sleep    3s
    Click element    ${filter}
    Click element    ${Blocked_chats}
    Wait until page contains    Ginka Hagane       30s
    sleep     3s
    Click element    ${filter}
    Click element    ${unread_chats}
    Page should contain element    ${unread_count}
    Close all browsers

Verify_chat_settings

    Common_Login
    Open_chats
    Click element               ${chat_settings}
    Wait until page contains    Sync Mobile Device Contacts     20s
    Wait until page contains    Mute Group Messages             20s
    Wait until page contains    Mute Normal Messages            20s
    Wait until page contains    Notifications                   20s
    Wait until page contains    Photos                          20s
    Wait until page contains    Documents                       20s
    Wait until page contains    Video                           20s
    Wait until page contains    Privacy                         20s
    Wait until page contains    Status                          20s
    Wait until page contains    Read Receipt                    20s
    Wait until page contains    Blocked Contacts                20s
    Wait until page contains    Chat Background                 20s
    Close all browsers

chat_settings_custom_status

    Browser_B
    Common_Login
    Open_chats
    Click element                   ${chat_settings}
    Click element                   ${status}
    Input text                      ${status_field}     Boss
    Click element                   ${Today}
    Wait until page contains    1 Hour                  20s
    Wait until page contains    2 Hours                 20s
    Wait until page contains    Never                   20s
    Wait until page contains    Custom Date & Time      20s
    Click element                    ${never}
    Wait until page contains    Never                   20s
    Click button                     ${clear}
    Input text                       ${status_field}   Boss
    Click button                     ${save}
    Switch browser    1
    open_chat_Aswin
    Wait until page contains          Boss
    Switch browser    2
    Wait until element is visible    ${status}          20s
    Click element                    ${status}
    Wait until element is visible    ${CLEAR STATUS}    20s
    Click button                     ${CLEAR STATUS}
    Close all browsers

Chat_status_cancel

    Common_Login
    Open_chats
    Click element                    ${chat_settings}
    Click element                    ${status}
    Input text                       ${status_field}     Boss
    Click element                    ${Today}
    Wait until page contains    1 Hour                  20s
    Wait until page contains    2 Hours                 20s
    Wait until page contains    Never                   20s
    Wait until page contains    Custom Date & Time      20s
    Click element                    ${never}
    Wait until page contains    Never                   20s
    Click button                     ${clear}
    Input text                       ${status_field}   Boss
    Click element                    ${Today}
    Click element                    ${never}
    Click element                    ${cancel_status}
    Wait until page contains    Set Status Message      30s
    Close all browsers


chat_settings_default_status

    Browser_B
    Common_Login
    Open_chats
    Click element                   ${chat_settings}
    Click element                   ${default_status}
    Wait until page contains    available               10s
    Wait until page contains    Away                    10s
    Wait until page contains    Busy                    10s
    Wait until page contains    Out of Office           10s
    Wait until page contains    Do not disturb          10s
    Click element                   ${away}
    Wait until page contains    Status updated successfully    20s

    Switch browser    1
    open_chat_Aswin
    Wait until page contains    Away                    10s

    Switch browser    2
    Click element                   ${default_status}
    Sleep             2s
    Click element                   ${busy}
    Wait until page contains    Status updated successfully    20s

    Switch browser    1
    Wait until page contains    Busy                    10s

    Switch browser    2
    Click element                   ${default_status}
    Sleep             2s
    Click element                   ${office}
    Wait until page contains    Status updated successfully    20s

    Switch browser    1
    Wait until page contains    Out of Office                   10s

    Switch browser    2
    Click element                   ${default_status}
    Sleep             2s
    Click element                   ${disturb}
    Wait until page contains    Status updated successfully    20s

    Switch browser    1
    Wait until page contains    Do not disturb                  10s

    Switch browser    2
    Click element                   ${default_status}
    Sleep             2s
    Click element                   ${available}
    Wait until page contains    Status updated successfully    20s

    Switch browser    1
    Wait until page contains         Available                 10s
    Close all browsers

chat_settings_functionalities

    Common_Login
    Open_chats
    Click element                   ${chat_settings}
    Unselect checkbox               ${Sync Mobile Device Contacts}
    Select checkbox                 ${Mute Group Messages}
    Select checkbox                 ${Mute Normal Messages}
    Select checkbox                 ${Photos_settings}
    Select checkbox                 ${Documents_settings}
    Unselect checkbox               ${Audio_settings}
    Select checkbox                 ${Video_settings}
    Unselect checkbox               ${Status_settings}
    Unselect checkbox               ${Read_Receipt}
    Sleep    3s
    Select checkbox                 ${Sync Mobile Device Contacts}
    Sleep    3s
    Click element                   ${close_download_app}
    Unselect checkbox               ${Mute Group Messages}
    Unselect checkbox               ${Mute Normal Messages}
    Unselect checkbox               ${Photos_settings}
    Unselect checkbox               ${Documents_settings}
    Select checkbox                 ${Audio_settings}
    unselect checkbox               ${Video_settings}
    Select checkbox                 ${Status_settings}
    Select checkbox                 ${Read_Receipt}
    Click element                   ${verify_blocked_user}
    Wait until page contains     Ginka Hagane                               30s
    Click element                   ${settings_back}
    Click element                   ${close_settings}
    Close_all_browsers


chat_settings_Unblock

    Common_Login
    Open_chat
    Block_user
    Wait until page contains     Chilukuri Bindu blocked successfully       30s
    Click element                    ${chat_settings}
    Click element                    ${verify_blocked_user}
    Wait until element is visible    ${setting_blocked_user}                30s
    Click element                    ${setting_blocked_user}
    Wait until element is visible    ${confirm_unblock}                     40s
    Click button                     ${confirm_unblock}
    Wait until page contains     Chilukuri Bindu unblocked successfully      30s
    Close all browsers


chat_+_icon

    Common_Login
    Open_chats
    Wait until element is visible       ${+_icon}              30s
    Click element                       ${+_icon}
    Wait until element is visible       ${+_search}            30s
    Page should contain    New Group
    Page should contain    Invite Via Email
    Click element                       ${new_group}
    Wait until element is visible       ${back_button}         60s
    Click element                       ${back_button}
    Wait until element is visible       ${invite_email}        60s
    Click element                       ${invite_email}
    Page should contain    Gmail
    Page should contain    iCloud
    Page should contain    Outlook
    Click image                         ${invite_close}
    Click element                       ${invite_back}
    Close all browsers



P-P_audio_call

    Common_Login
    Open_chat
    Click image                      ${voice_call}
    Wait until element is visible    ${voice_call_disconnect}              30s
    Page should contain    Calling ...
    Page should contain    Chilukuri Bindu
    Page should contain    Calling ...
    Page should contain element    xpath=//div[@class='flexAutoRow avatarImg']
    Click element                  ${voice_call_disconnect}
    Close all browsers

voice_call_p-p

    Browser_B
    Common_Login
    Open_chat
    Click image                         ${voice_call}
    Wait until element is visible       ${voice_call_disconnect}            30s

    Switch browser    1
    open_chat_Aswin
    Wait until element is visible       ${voice_call_attend}                30s
    Click element                       ${voice_call_attend}
    Wait until element is visible       ${mic_call}                         10s
    Wait until element is visible       ${end_call}
    sleep    3s
    Mouse over                          ${maximise}
    Click element                       ${maximise}
    Wait until element is visible       ${voice_mic}                        10s
    Click element                       ${voice_mic}
    Wait until element is visible       ${voice_mic_off}                    30s

    Switch browser    2
    sleep    3s
    Wait until element is visible       ${maximise}                         30s
    Click element                       ${maximise}
    Wait until element is visible       ${mute}                             30s

    Switch browser    1
    Click element                       ${voice_mic_off}
    Sleep       2s

    Switch browser    2
    Page should not contain element     ${mute}
    Click element                       ${end_call}
    Wait until element is visible       ${voice_call}                       30s
    Close all browsers


User_on_another_call

    Browser_B
    Browser_c
    Common_Login

    Switch browser    1
    open_chat_Aswin
    Click element                      ${search_field}
    Input text                         ${search_field}      kajal
    Click element                      ${kajal}
    Click image                        ${voice_call}
    Sleep       4s

    Switch browser    2
    Wait until element is visible       ${voice_call_attend}               30s
    Click element                       ${voice_call_attend}
    Sleep    3s

    Switch browser    3
    Open_chat
    Click image                         ${voice_call}
    Wait until page contains    User is on another call.                    30s
    Close all browsers


P-P_voice_call_disconnect

    Browser_B
    open_chat_Aswin
    Common_Login
    Open_chat
    Click image                      ${voice_call}
    Wait until element is visible     ${voice_call_disconnect}                30s
    Wait until page contains    On an Inmeet call                           30s

    Switch browser    1
    Wait until element is visible    ${voice_call_disconnect}               30s
    Click element                    ${voice_call_disconnect}

    Switch browser    2
    Wait until page contains    Available                                   30s
    Close all browsers


video_call_p-p

    Common_Login
    Open_chat
    Click image                      ${video_call}
    Wait until element is visible    ${P-P_video_call_disconnect}             30s
    Page should contain         Calling ...
    Page should contain         Chilukuri Bindu
    Page should contain         Calling ...
    Sleep    10s
    Click element                    ${P-P_video_call_disconnect}
    Wait until page contains    Available                                 30s
    Close all browsers

P-P_video_call_decline

    Browser_B
    Common_Login
    Open_chat
    Click image                         ${video_call}
    Wait until element is visible       ${P-P_video_call_disconnect}                  30s

    Switch browser    1
    open_chat_Aswin
    Wait until element is visible       ${P-P_video_call_disconnect}                   30s
    Click element                       ${P-P_video_call_disconnect}

    Switch browser    2
    Wait until page contains    Available                                          30s
    Close all browsers

P-P_video_call_attend

    Browser_B
    Common_Login
    Open_chat
    Click image                         ${video_call}
    Wait until element is visible       ${P-P_video_call_disconnect}               30s

    Switch browser    1
    open_chat_Aswin
    Wait until element is visible       ${video_call_attend}                       30s
    Click element                       ${video_call_attend}
    Wait until element is visible       ${video_call_mic}                          30s
    Wait until element is visible       ${video_call_cam}                          30s
    Wait until element is visible       ${screen_share_call}                       30s
    Wait until element is visible       ${video_call_end}                          30s
    Click element                       ${video_call_max_screen}
    Close all browsers

user_on_another_video_call

    Browser_B
    Browser_c
    Common_Login

    Switch browser    1
    open_chat_Aswin
    Click element                      ${search_field}
    Input text                         ${search_field}   kajal
    Click element                      ${kajal}
    Click image                        ${video_call}

    Switch browser    2
    Wait until element is visible      ${video_call_attend}                  30s
    Click element                      ${video_call_attend}

    Switch browser    3
    Open_chat
    Click image                        ${video_call}
    Wait until page contains    User is on another call.                     30s
    Close all browsers



verify_P-P_video_call

    Browser_B
    open_chat_Aswin
    Common_Login
    Open_chat
    Click image                         ${video_call}

    Switch browser    1
    Wait until element is visible       ${video_call_attend}                30s
    Click element                       ${video_call_attend}
    Sleep    3s
    Mouse over                          ${video_call_max_screen}
    Click element                       ${video_call_max_screen}
    Sleep    2s
    Wait until element is visible       ${full_screen_video_call_mic}       30s
    Click image                         ${full_screen_video_call_mic}

    Switch browser    2
    Sleep    4s
    Mouse over                          ${video_call_mouse_over}
    Click element                       ${video_call_max_screen}
    Wait until element is visible       ${mute}                             30s
    Click image                         ${full_screen_video_call_mic}

    Switch browser    1
    Click element                       ${mic_off}
    Page should contain    Video On
    Page should contain    Mic On
    Wait until element is visible       ${mute}                             30s
    Page should contain element         ${screen_share_call}
    Page should contain element         ${cam_on}
    Click image                         ${cam_on}
    Page should contain    Video Off
    Click image                         ${cam_off}
    Page should contain    Video On
    Click image                         ${full_screen_video_call_mic}
    Page should contain    Mic Off
    Click image                         ${mic_off}
    Page should contain    Mic On
    Click image                         ${video_call_end}

    Switch browser    2
    Wait until page contains        Available                                   30s
    Close all browsers

Unblock_user_throw_chat

    Common_Login
    Open_chat
    Block_user
    Click element       ${close_profile}
    Click element       ${unblock?}
    Wait until element is visible         ${confirm_unblock}                40s
    Click button        ${confirm_unblock}
    Wait until page contains    Chilukuri Bindu unblocked successfully      30s
    Close all browsers

                                                        ##groups

Create_group

    Common_Login
    Open_chats
    Wait until element is visible       ${+_icon}                           30s
    Click element                       ${+_icon}
    Wait until element is visible       ${+_search}                         30s
    Click element                       ${new_group}
    Sleep    2s
    Wait until element is visible    ${Contact_select_all}                  20s
    Click element    ${Contact_select_all}
    Wait until page contains    Deselect All
    Click element    ${Contact_select_all}
    Wait until page contains    Select All
    Sleep    2s
    select_contact
    Click element       ${Next}
    Sleep    3s
    Remove_profile
    Upload_group_profile
    Input text          ${Group_name}    New group
    Click element       ${emoji_name}
    Click image         ${Group_name_emoji}
    Click element       ${close_emoji}
    Enable_&_Disable_group_permissions
    Enable_&_Disable_group_permissions
    Click element       ${Create_group}
    Wait until element is visible       ${fresh_group}        30s
    Verify_the_group_participants
    Close all browsers

Send_message_and_upload_files_to_group

    Common_Login
    Open_group
    Send_messages
    send_audio
    send_image
    send_video
    upload_pdf
    send_image2
    Wait until page contains    File size should not exceed 50 MB    10s
    Close all browsers

verify_search_in_group_chats

    Common_Login
    Open_group
    Send_messages
    Wait until element is visible    ${chat_search}
    Click element                    ${chat_search}
    Input text                       ${search_field_chat}      helloo
    Click element                    ${search_close}
    Close all browsers

group_select_messages

    Common_Login
    Open_group
    Send_messages
    Sleep    3s
    Chat_3_dots
    Select_message
    Sleep    2s
    Click element                       ${select_frwd}
    Sleep    2s
    Click element                    ${select_contact}
    Click button                        ${frwd_button}
    Sleep    3s
    Open_group
    Chat_3_dots
    Select_message
    Click image                         ${dlt_msg}
    Sleep    3s
    Click element                       ${dlt_select_group}
    Sleep    3s
    Click element                       ${confirm_delete}
    Close all browsers

Unselect_message

    Common_Login
    Open_group
    Sleep    3s
    Chat_3_dots
    Select_message
    Click element                       ${3_dots}
    Wait until element is visible       ${Un_select_chat}           20s
    Click element                       ${Un_select_chat}
    Close all browsers

Update_group_info_as_admin

    Common_Login
    Open_group
    Sleep    3s
    Click element       ${group_chat_profile}
    Click element       ${edit_name}
    Backspace2
    Input text          ${edited_group_name}    Radio
    Click element       ${emoji_name}
    Click image         ${Group_name_emoji}
    Click element       ${tick}
    Wait until page contains    You changed the group name to "Radio😀"             30s
    Wait until element is visible    ${edit_name}                                   30s
    Click element       ${edit_name}
    Backspace2
    Input text          ${edited_group_name}    New group
    Click element       ${emoji_name}
    Click image         ${Group_name_emoji}
    Click element       ${tick}
    Wait until page contains    You changed the group name to "New group😀"         30s
    Sleep    3s
    Click element       ${edit_profile}
    Edit_group_profile
    Wait until page contains    Profile image updated successfully                  30s
    Close all browsers

Update_group_info_as_participants

    Browser_B
    Open_group
    Sleep    3s
    Click element                       ${group_chat_profile}
    Click element                       ${edit_name}
    Backspace2
    Input text                          ${edited_group_name}    Radio
    Click element                       ${emoji_name}
    Click image                         ${Group_name_emoji}
    Click element                       ${tick}
    Wait until page contains    You changed the group name to "Radio😀"             30s
    Wait until element is visible       ${edit_name}                                30s
    Click element                       ${edit_name}
    Backspace2
    Input text                          ${edited_group_name}    New group
    Click element                       ${emoji_name}
    Click image                         ${Group_name_emoji}
    Click element                       ${tick}
    Wait until page contains    You changed the group name to "New group😀"         30s
    Sleep    3s
    Click element                       ${edit_profile}
    Edit_group_profile
    Wait until page contains    Profile image updated successfully                  30s
    Close all browsers

Group_message_3dot

    Common_Login
    Open_group
    sleep   3s
    Mouse over    ${msg_3_dot1}
    ##edit
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Wait until element is visible    ${edit}                    20s
    Click element    ${edit}
    Input text                      ${reply_mesg_field}    terror
    Click image                     ${send_message}
    Sleep    3s
    ##reply
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Wait until element is visible    ${reply}                   20s
    Click element                   ${reply}
    Input text                      ${reply_mesg_field}    Hello
    Click image                     ${send_message}
    sleep    3s
    ##forward
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Sleep    2s
    Click element                   ${forward}
    Sleep    2s
    Click element                   ${select_user}
    Click button                    ${frwd_button}
    Sleep    3s
    ##pin & remove pin
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Wait until element is visible   ${pin}                       20s
    Click element                   ${pin}
    Sleep    3s
    Click element                   ${close_pin}
    Wait until element is visible   ${remove_pin}                20s
    Click button                    ${remove_pin}
    Sleep    3s
    ##copy
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Wait until element is visible   ${copy}                      20s
    Click element                   ${copy}
    Page should contain    Copied!
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Sleep    2s
    ##dlt for all
    Click element                   ${3dot_dlt}
    Sleep    3s
    Click element                   ${group_dlt_checkbox}
    Wait until element is visible   ${confirm_delete}            30s
    Click element                   ${confirm_delete}
    Sleep    5s
    ##dlt
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Sleep    3s
    Click element    ${dlt}
    Wait until element is visible   ${confirm_delete}            30s
    Click element                   ${confirm_delete}
    sleep    5s
    Close all browsers


Add_participant_and_remove_as_admin

    Browser_D
    Common_Login
    Browser_B
    Switch browser    2
    Open_group
    Sleep    3s
    ##add participant
    Click element       ${group_chat_profile}
    Click element       ${add_participant}
    Click element       ${select_tarik}
    Click button        ${add}
    Wait until page contains    You added Tarik Aziz to group               30s
    Switch browser    1
    Open_group
    Wait until page contains    Aswin added you to group                    30s
    ##remove
    Switch browser    2
    Click element       ${participants}
    Input text          ${participant_search}     tarik@instavc.com
    Click element       ${participant_3dots}
    Click element       ${remove_participants}
    Sleep    2s
    Click element       ${confirm_remove}
    Wait until page contains    You removed Tarik Aziz                      30s
    Click element       ${media_close}

    Switch browser    1
    Open_group
    Wait until page contains    You're unable to send messages to this group as you're no longer a member.         30s
    Delete_chat
    ##make admin
    Switch browser    2
    Click element       ${participants}
    Input text          ${participant_search}     madhavi.ch@instavc.com
    Click element       ${participant_3dots}
    Click element       ${make_admin}

    Switch browser    3
    Open_group
    Click element       ${group_chat_profile}
    Click element       ${participants}
    Input text          ${participant_search}     madhavi.ch@instavc.com
    Page should contain    Admin
    ##remove admin
    Switch browser    2
    Input text          ${participant_search}     madhavi.ch@instavc.com
    Sleep    2s
    Click element       ${participant_3dots}
    Sleep    3s
    Click element       ${remove_admin}
    sleep   2s
    Switch browser    3
    Input text          ${participant_search}     madhavi.ch@instavc.com
    Page should not contain    Admin
    Close all browsers

Verify_send_private_mesg_from_participant

    Common_Login
    Browser_B
    Open_chat_Aswin
    Clear_chat
    Switch browser    1
    Open_group
    Sleep    2s
    Click element       ${group_chat_profile}
    Click element       ${participants}
    Input text          ${participant_search}     madhavi.ch@instavc.com
    Sleep    2s
    Click element       ${participant_3dots}
    Sleep    3s
    Click element    ${send_message_participants}
    Sleep    2s
    send_msg

    Switch browser    2
    Wait until page contains        hello           30s
    Close all browsers

Disable_Group_permissions

    Common_Login
    Browser_B
    Switch browser    1
    Open_group
    Sleep    2s
    Click element       ${group_chat_profile}
    Click element       ${Group_permission}
    Enable_&_Disable_group_permissions

    Switch browser    2
    Open_group
    Page should not contain element     ${chat_field}
    Click element                       ${group_chat_profile}
    Page should not contain element     ${add_participant}
    Page should not contain element     ${edit_name}

    Switch browser    1
    Enable_&_Disable_group_permissions

    Switch browser    2
    Open_group
    Page should contain element     ${chat_field}
    Click element                   ${group_chat_profile}
    Page should contain element     ${add_participant}
    Page should contain element     ${edit_name}
    Close all browsers

Verify_group_chat_profile

    Common_Login
    Open_group
    Wait until element is visible    ${group_chat_profile}          30s
    Click element                    ${group_chat_profile}
    Page should contain        image
    Page should contain        Videos
    Page should contain        Docs
    Page should contain        Links
    Page should contain        Participants
    Page should contain        Mute Notifications
    Page should contain        Invite via link
    Page should contain        Group Permissions
    Scroll element into view    ${exit_group}
    Close all browsers


verify_the_group_chat

     Common_Login
     Open_group
     Wait until element is visible    ${group_chat_profile}          30s
     Click element                    ${group_chat_profile}

     #video
     Sleep    4s
     Click element                    ${fresh_group}
     sleep    4s
     Click element                    ${group_chat_profile}
     Wait until element is visible    ${video}                       20s
     Click element                    ${video}
     Select checkbox                  ${media_image}
     Click element                    ${media_frwd}
     Click element                    ${select_user}
     Wait until element is visible    ${frwd_button}                 20s
     Click button                     ${frwd_button}

     #documents
     Sleep    4s
     Click element                    ${fresh_group}
     Click element                    ${group_chat_profile}
     Click element                    ${doc}
     Select checkbox                  ${media_image}
     Click element                    ${media_frwd}
     Click element                    ${select_user}
     Click button                     ${frwd_button}

     #links
     Sleep    4s
     Click element                   ${fresh_group}
     Send_Link
     Click element                   ${group_chat_profile}
     Click element                   ${link}
     Select checkbox                 ${media_image}
     Click element                   ${media_frwd}
     Click element                   ${select_user}
     Click button                    ${frwd_button}

     #image
     Wait until element is visible    ${image}                        20s
     Click element                    ${image}
     Select checkbox                  ${media_image}
     Click element                    ${media_frwd}
     Click element                    ${select_user}
     Click button                     ${frwd_button}
     Close all browsers



Invite_participant_group

    Browser_D
    Open_chat_Aswin
    Clear_chat
    Common_Login
    Open_group
    Wait until element is visible    ${group_chat_profile}          30s
    Click element                    ${group_chat_profile}
    Scroll element into view    ${exit_group}
    Sleep    2s
    Click element    ${invite_link}
    Page should contain    Copied!
    ${INVITE_LINK}    Get Meeting ID from Clipboard
    Set Global Variable    ${INVITE_LINK}  # Store for second test
    Click element    ${tarik}
    Click element    ${chat_field}
    Input text    ${chat_field}     ${INVITE_LINK}
    Click image    ${send_message}

    Switch browser    1
    sleep    5s
    Double click element        ${invite_link_txt}
    Sleep    2s
    Wait until page contains    You joined using this group's invite link

    Switch browser    2
    Click element    ${fresh_group}
    Page should contain    Tarik Aziz joined using this group's invite link

    Switch browser    1

    Click element    ${fresh_group}
    Click element    ${group_chat_profile}
    Click element    ${exit_group}
    Click element    ${confirm_exit}
    Wait until page contains    You left    20s
    Wait until page contains    You're unable to send messages to this group as you're no longer a member.      20s
    Delete_chat
    Close all browsers

Verify_admin_not_able_to_exit

    Common_Login
    Open_group
    Click element    ${group_chat_profile}
    Click element    ${exit_group}
    Click element    ${confirm_exit}
    Wait until page contains    Please make another member an admin before exiting the group.                10s
    Close all browsers

Delete_group_message

    Common_Login
    Open_group
    Sleep    3s
    Mouse over    ${msg_3_dot}
    Click Element At Coordinates    ${msg_3_dot}    -10         0
    Sleep    3s
    Click element    ${dlt}
    Wait until element is visible   ${confirm_delete}               30s
    Click element                  ${group_dlt_checkbox}
    Click element                   ${confirm_delete}
    Wait until page contains    You deleted this message            30s
    sleep    3s
    Browser_B
    Open_group
    Wait until page contains    This message was deleted            30s
    Close all browsers

Verify_admin_can_exit_after_make_anyone_admin

    Common_Login
    Open_group
    Click element       ${group_chat_profile}
    Click element       ${participants}
    Input text          ${participant_search}     madhavi.ch@instavc.com
    Click element       ${participant_3dots}
    Click element       ${make_admin}
    Click element       ${media_close}
    Sleep    2s
    Click element       ${group_chat_profile}
    Click element       ${exit_group}
    Click element       ${confirm_exit}
    Wait until page contains    Exited from group successfully      20s
    Wait until page contains    You left    20s
    Wait until page contains    You're unable to send messages to this group as you're no longer a member.      20s

    Browser_B
    Open_group
    Click element       ${group_chat_profile}
    Click element       ${add_participant}
    Sleep    2s
    Click element       ${select_aswin}
    Click button        ${add}
#    Click element       ${group_chat_profile}
    Sleep    3s
    Click element       ${participants}
    Input text          ${participant_search}     aswin@yopmail.com
    Click element       ${participant_3dots}
    Click element       ${make_admin}
    Click element       ${media_close}

    Switch browser    1
    Click element       ${fresh_group}
#    Click element       ${group_chat_profile}
    Click element       ${participants}
    Input text          ${participant_search}     madhavi.ch@instavc.com
    Sleep    2s
    Click element       ${participant_3dots}
    Sleep    3s
    Click element       ${remove_admin}
    Close all browsers

Delete_group

    Common_Login
    Open_group
    Click element       ${group_chat_profile}
    Click element       ${participants}
    Click element       ${participant_3dots}
    Click element       ${remove_participants}
    Sleep    2s
    Click element       ${confirm_remove}
    Sleep    2s
    Click element       ${group_chat_profile}
    Click element       ${participant_3dots}
    Click element       ${remove_participants}
    Sleep    2s
    Click element       ${confirm_remove}
    sleep    3s
    Click element       ${media_close}
    Click element       ${group_chat_profile}
    Click element       ${exit_group}
    Click element       ${confirm_exit}
    Click element       ${media_close}
    Wait until page contains    You're unable to send messages to this group as you're no longer a member.      20s
    Delete_chat
    Sleep    3s
    Close all browsers

##group calls

#Verify_group_voice_call
#
#    Browser_B
#    Browser_c
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                      ${voice_call}
#    Wait until element is visible    ${voice_call_disconnect}              30s
#    Page should contain    Calling ...
#    Page should contain   New group😀
#    Page should contain element    xpath=//div[@class='flexAutoRow avatarImg']
#
#    Switch browser    1
#    Wait until page contains    Incoming audio call ...                    30s
#    Page should contain   New group😀
#    Page should contain element    xpath=//div[@class='flexAutoRow avatarImg']
#
#    Switch browser    2
#    Wait until page contains    Incoming audio call ...                    30s
#    Page should contain   New group😀
#    Page should contain element    xpath=//div[@class='flexAutoRow avatarImg']
#    Close all browsers
#
#
#Verify_the_participants_decline_voice_call
#
#    Browser_B
#    Browser_c
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                      ${voice_call}
#    Wait until element is visible    ${voice_call_disconnect}              30s
#
#    Switch browser    1
#    Wait until element is visible    ${voice_call_disconnect}               30s
#    Click element                    ${voice_call_disconnect}
#    Switch browser    2
#    Wait until element is visible    ${voice_call_disconnect}               30s
#    Click element                    ${voice_call_disconnect}
#    Close all browsers
#
#Verify_the_participants_attend_voice_call
#
#    Browser_B
#    Browser_c
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                      ${voice_call}
#    Wait until element is visible    ${voice_call_disconnect}              30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#
#    Switch browser    2
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#
#    Switch browser    1
#    Select Frame                        ${iframe}
#    Sleep    5s
#    Wait until element is visible       ${mic_call}                         30s
#    Wait until element is visible       ${screen_share}                     10s
#    Click element                        ${end_call}
#    Unselect Frame
#
#    Switch browser    2
#    Select Frame                        ${iframe}
#    Wait until element is visible       ${mic_call}                         30s
#    Wait until element is visible       ${screen_share}                     10s
#    Wait until element is visible       ${end_call}                         10s
#    Click element                       ${end_call}
#    Unselect frame
#    Close all browsers
#
#Group_call_verification
#
#    Browser_B
#    Browser_c
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                      ${voice_call}
#    Wait until element is visible    ${voice_call_disconnect}               30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#    Select Frame                        ${iframe}
#    Sleep    3s
#    Wait until element is visible       ${mic_call}                         30s
#    Click element                       ${mic_call}
#    Unselect Frame
#
#    Switch browser    3
#    Select Frame                        ${iframe}
#    Click element                       ${call_participants}
#    Page should contain    Kajal
#    Page should contain    Chilukuri Bindu
#    Page should contain    Aswin (Host)
#    Unselect Frame
#
#    Switch browser    2
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_disconnect}
#
#    Switch browser    3
#    Sleep    3s
#    Select Frame                        ${iframe}
#    Click element    ${Ring}
#    Click element    ${close}
#    Unselect Frame
#
#    Switch browser    2
#    Wait until page contains    Incoming audio call ...                    30s
#    Page should contain   New group😀
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#    Select Frame                        ${iframe}
#    Wait until element is visible       ${mic_call}                         30s
#    Click element                       ${call_participants}
#    Sleep    3s
#    Page should contain element           ${group_mic_off}
#    Unselect frame
#
#    Switch browser    1
#    Select Frame                        ${iframe}
#    Click element                       ${mic_call}
#    Unselect frame
#
#    Switch browser    2
#    Select Frame                         ${iframe}
#    Page should contain element          ${group_mic_on}
#    Unselect frame
#    Close all browsers
#
#verify_ring_all
#
#    Browser_B
#    Browser_c
#    Open_group
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                      ${voice_call}
#    Wait until element is visible    ${voice_call_disconnect}              30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#    Select Frame                        ${iframe}
#    Wait until element is visible       ${mic_call}                         30s
#    Unselect Frame
#
#    Switch browser    2
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_disconnect}
#
#    Switch browser    3
#    Sleep    3s
#    Select Frame                        ${iframe}
#    Click element                       ${call_participants}
#    Click element                       ${Ring_all}
#    Unselect Frame
#
#    Switch browser    2
#    Wait until page contains    Incoming audio call ...                    30s
#    Page should contain         New group😀
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#    Select Frame                        ${iframe}
#    Wait until element is visible       ${mic_call}                         30s
#    Unselect frame
#    Close all browsers
#
#Join_call_from_chat
#
#    Browser_c
#    Browser_B
#    Open_group
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                      ${voice_call}
#    Wait until element is visible    ${voice_call_disconnect}              30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#    Select Frame                        ${iframe}
#    Wait until element is visible       ${mic_call}                         30s
#    Unselect Frame
#
#    Switch browser    2
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_disconnect}
#    Sleep    3s
#    Click element                       ${call_attend_chat}
#    Wait until element is visible       ${iframe}                           20s
#    Select Frame                        ${iframe}
#    Wait until element is visible       ${mic_call}                         30s
#    Unselect frame
#    Close all browsers
#
#Search_functionalities_under_participant
#
#    Browser_B
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                         ${voice_call}
#    Wait until element is visible       ${voice_call_disconnect}              30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#    Select Frame                        ${iframe}
#    Click element                       ${call_participants}
#    Input text                          ${search_participant}           Chilukuri Bindu
#    Page should contain                     Chilukuri Bindu
#    Unselect frame
#
#    Switch browser    2
#    Select frame                        ${iframe}
#    Click element                       ${call_participants}
#    Input text                          ${search_participant}           kajal
#    Page should contain                     No search Results found
#    Unselect frame
#    Close all browsers
#
#Verify_host_has_moderator_access_and_participant_doesn't
#
#    Browser_B
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                         ${voice_call}
#    Wait until element is visible       ${voice_call_disconnect}              30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#
#    Switch browser    2
#    Sleep    3s
#    Select frame                        ${iframe}
#    Click element                       ${call_participants}
#    Wait until element is visible       ${call_3dots}                       30s
#    Click element                       ${call_3dots}
#    Page should contain                 Moderate Actions
#    Page should contain                 Add to spotlight
#    Page should contain                 Unmute screen share
#    Page should contain                 Stop Audio
#    Page should contain                 Request Audio
#    Page should contain                 Stop Screenshare
#    Page should contain                 Remove user
#    Unselect frame
#
#    Switch browser    1
#    Select frame                        ${iframe}
#    Click element                       ${call_participants}
#    Wait until element is visible       ${call_3dots}                       30s
#    Click element                       ${call_3dots}
#    Page should not contain             Moderate Actions
#    Page should contain                 Add to spotlight
#    Page should contain                 Unmute screen share
#    Page should not contain             Stop Audio
#    Page should not contain             Request Audio
#    Page should not contain             Stop Screenshare
#    Page should not contain             Remove user
#    Unselect frame
#    Close all browsers
#
#Verify_host_request_audio
#
#    Browser_B
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                         ${voice_call}
#    Wait until element is visible       ${voice_call_disconnect}              30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#    Select frame                        ${iframe}
#    Wait until element is visible    ${mic_call}                            30s
#    Sleep    5s
#    Click element                    ${mic_call}
#    Wait until page contains             Mic Off                            30s
#    Unselect frame
#
#    Switch browser    2
#    Group_call_request_audio
#
#
#    Switch browser    1
#    Select frame           ${iframe}
#    Wait until page contains    Host Requested Audio            20s
#    Page should contain    Host requested you to enable your audio.
##    Click element            ${ok_enable}
##    Page should contain       Mic On
##    Click element           ${mic_call}
##    Unselect frame
##
##    Switch browser    2
##    Group_call_request_audio
##
##    Switch browser    1
##    Select frame            ${iframe}
##    Wait until page contains    Host Requested Audio            20s
##    Page should contain    Host requested you to enable your audio.
##    Click element    ${cancel_request}
##
##    Unselect frame
#    Close all browsers
#
#Remove_user_from_call
#
#    Browser_B
#    Browser_c
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                         ${voice_call}
#    Wait until element is visible       ${voice_call_disconnect}              30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#
#    Switch browser    2
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#
#    Switch browser    3
#    Select frame                        ${iframe}
#    Click element                       ${call_participants}
#    Wait until element is visible       ${call_3dots}                       30s
#    Click element                       ${call_3dots}
#    Click element                       ${Remove_user}
#    Sleep    10s
#    Close all browsers
#
#Add_&_remove_spotlight
#
#    Browser_B
#    Common_Login
#    Open_group
#    Wait until element is visible    ${voice_call}                          30s
#    Click image                         ${voice_call}
#    Wait until element is visible       ${voice_call_disconnect}            30s
#
#    Switch browser    1
#    Wait until element is visible       ${voice_call_attend}                30s
#    Click element                       ${voice_call_attend}
#
#    Switch browser    2
#    Sleep    4s
#    Select frame                        ${iframe}
#    Click element                       ${call_participants}
#    Wait until element is visible       ${call_3dots}                       30s
#    Click element                       ${call_3dots}
#    Click element    ${add_to_spotlight}
#    Click element    ${call_3dots}
#    Wait until page contains    Remove from spotlight                       30s
#    Click element    ${Remove_from_spotlight}
#    Click element    ${call_3dots}
#    Wait until page contains    Add to spotlight                            30s
#    Unselect frame
#    Close all browsers
#
##Verify_the_participants_attend_video_call
##
##    Browser_B
##    Browser_c
##    Common_Login
##    Open_group
##    Click image                      ${video_call}
##    Wait until element is visible    ${P-P_video_call_disconnect}             30s
##    Page should contain         Calling ...
##    Page should contain   New group😀
##
##    Switch browser    1
##    Wait until element is visible       ${video_call_attend}                30s
##    Click element                       ${video_call_attend}
##
##    Switch browser    2
##    Wait until element is visible       ${video_call_attend}               30s
##    Click element                       ${video_call_attend}
##
##    Switch browser    1
###    Select Frame                        ${iframe_1}
##    Sleep    5s
##    Wait until element is visible       ${mic_call}                         30s
##    Wait until element is visible       ${screen_share}                     10s
##    Click element                       ${end_call}
##    Unselect Frame
##
##    Switch browser    2
##    Select Frame                        ${iframe_1}
##    Wait until element is visible       ${mic_call}                         30s
##    Wait until element is visible       ${screen_share}                     10s
##    Wait until element is visible       ${end_call}                         10s
##    Click element                       ${end_call}
##    Unselect frame
##    Close all browsers