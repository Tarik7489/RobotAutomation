*** Settings ***
Library                  SeleniumLibrary
Resource                 ../PageObjects/LoginPage.robot
Library                  OperatingSystem
Library                  SeleniumLibrary
Resource                 ../PageObjects/CommonKeywords.robot
Library                  OperatingSystem
Library                  ../Libraries/ExcelLibrary.py


*** Variables ***
${iframe}                xpath=//iframe[@title='External Page']
${SHEET_NAME}   credentials
##search
${+_search}              xpath=//input[@placeholder="Search by Email address..."]
${+_search1}             xpath=(//input[@placeholder="Search..."])[2]
##chats
${chats_button}          xpath=//img[@alt='chat']
${chat}                  xpath=//span[normalize-space()='Chilukuri Bindu']
${kajal}                 xpath=//span[normalize-space()='Kajal']
${Aswin}                 xpath=//span[normalize-space()='Aswin']
${tarik}                 xpath=//span[normalize-space()='Tarik Aziz']

##send_msg
${chat_field}            id=msgField
${chat_field1}           xpath=//textarea[@placeholder="Type something..."]
${send_message}          xpath=//img[@alt='send']
${REL_IMAGE_FILE}        ${CURDIR}${/}..${/}TestFiles${/}img.png
${REL_IMAGE_FILE2}       ${CURDIR}${/}..${/}TestFiles${/}65mb.png
${Upload_locator}        xpath=//input[@accept="application/pdf" or @class="fileBtn" or @type="file"]
${send}                  xpath=//button[normalize-space()='SEND']
${REL_Video_FILE}        ${CURDIR}${/}..${/}TestFiles${/}video.mp4
${REL_PDF_FILE}          ${CURDIR}${/}..${/}TestFiles${/}sample.pdf
${REL_Audio_FILE}        ${CURDIR}${/}..${/}TestFiles${/}Audio.mp3
${img_txt}               xpath=(//textarea[@placeholder="Type something..."])[2]

## settings
${chat_settings}         xpath=//div[@class='flexAutoRow pointer pdngHXS']//*[name()='svg']
${chat_filter}           xpath=(//*[name()='svg'][@class='primaryTxt pointer'])[1]
${search_field}          xpath=//input[@placeholder="Search..."]
${search_field_close}    xpath=(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeMedium pointer css-vubbuv'])[1]

#invite user
${+_icon}                xpath=//div[@class='imgAvatar40 boxShadowPlusIcon primaryBg brdrRadius50 flexInline jCntr aCntr positionAbs chatmoreListIcon pointer']
${search_field_+icon}    xpath=//input[@placeholder="Search by Email address..."]
${invite_email}          xpath=//span[normalize-space()='Invite Via Email']
${invite_gmail}          xpath=(//div[@class='inviteEmails'])[1]
${invite_icloud}         xpath=(//div[@class='inviteEmails'])[2]
${invite_outlook}        xpath=(//div[@class='inviteEmails'])[3]
${invite_close}          xpath=//img[@alt='cancel']
${invite_back}           xpath=(//*[name()='svg'][@stroke='currentColor'])[4]
${back_chats}            xpath=//div[@class='flexRow aCntr chatHeadBg chatHeader pdngHLG']//div[@class='flexAutoRow pointer']//*[name()='svg']//*[name()='path' and contains(@d,'M21 11H6.4')]
${new_user}              xpath=//span[contains(text(),'Hamesh')]
${new_user1}             xpath=(//span[@class='capitalizeTxt txtBlXS'])[1]
${back_button}           xpath=//body/div[@id='root']/div[@class='baseBlockCntnr']/div[@class='flexCol mainHoc']/div[@class='flexCol mainComponent']/div[@class='flexCol pdngMD fullH aCntr']/div[@class='flexRow fullH whiteBg chatCntr brdrRadiusLSM positionRelative shadow2']/div[contains(@class,'flexCol leftBlock positionRelative brdrgray brdrRadiusTL')]/div[contains(@class,'flexCol fullH')]/div[@class='flexCol leftSlider slideIn']/div[@class='flexCol leftSlider slideIn']/div[@class='flexRow aCntr chatHeadBg chatHeader pdngHMD']/div[1]//*[name()='svg']

##chat
${mic}                   xpath=//*[name()='path' and contains(@d,'M192 0C139')]
${mic_stop}              xpath=(//img[@alt='stop'])[1]
${emoji}                 xpath=(//div[@class='flexAutoRow pdngHSM aCntr'])[1]
${select_emoji}          xpath=(//img[@alt='partying face'])[1]


##search chat
${chat_search}           xpath=//div[@aria-label='Search']//*[name()='svg']
${search_field_chat}     xpath=(//input[@placeholder="Search..."])[2]
${search_close}          xpath=(//*[name()='svg'][@class='lightTxt'])[1]

#3dots
${3_dots}                xpath=(//*[name()='svg'][@class='pointer'])[1]
${clear_chat}            xpath=(//li[normalize-space()='Clear Chat'])[1]
${confirm_clear}         xpath=(//button[normalize-space()='Clear'])[1]
${delete_chat}           xpath=(//li[normalize-space()='Delete Chat'])[1]
${confirm_delete}        xpath=(//button[normalize-space()='Delete'])[1]
${select_chat}           xpath=(//li[normalize-space()='Select Messages'])[1]
${Un_select_chat}        xpath=//li[normalize-space()='Unselect Messages']
${select_msg1}           xpath=(//input[@type='checkbox'])[4]
${select_msg2}           xpath=(//input[@type='checkbox'])[5]
${select_msg3}           xpath=(//input[@type='checkbox'])[6]
${select_msg4}           xpath=(//input[@type='checkbox'])[7]
${select_frwd}           xpath=//*[name()='path' and contains(@d,'M13 14H11C')]
${select_contact}        xpath=//div[@class='flexMinWidthCol pdngHSM' and .//span[text()='Chilukuri Bindu']]
${frwd_button}           xpath=(//button[normalize-space()='Forward'])[1]
${msg_3_dot1}            xpath=(//*[name()='path'])[16]
${msg_3_dot}             xpath=(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeSmall css-1k33q06'])[4]
${reply}                 xpath=(//div[contains(text(),'Reply')])[1]
${reply_mesg_field}      id=msgField
${send_message}          xpath=//img[@alt='send']
${msg}                   xpath=(//div[@class='senderMsz messagewidth pdngXS chathover chatCntrHeader'])[16]
${select_user}           xpath=//div[@class='flexCol']//div[1]//div[3]//span[1]//input[1]
${forward}               xpath=(//div[contains(text(),'Forward')])[1]
${dlt_msg}               xpath=(//img[@alt='Delete'])[1]
${dlt_select}            xpath=//span[text()='Also delete for Chilukuri Bindu']/ancestor::div[contains(@class, 'flexRow')]//input[@type='checkbox']
${dlt_select_group}      xpath=//div[@class='flexRow aCntr']//div//input[@type='checkbox']
${pin}                   xpath=//div[contains(text(),'Pin')]
${3dot_dlt}              xpath=//div[contains(text(),'Delete')]
${close_pin}             xpath=//div[@class='flexAutoRow pdngHXXS pointer aCntr jCntr']//*[name()='svg']
${remove_pin}            xpath=//button[normalize-space()='Remove']
${edit}                  xpath=//div[contains(text(),'Edit')]
${copy}                  xpath=//div[contains(text(),'Copy')]
${dlt}                   xpath=(//div[contains(text(),'Delete')])[1]

##block
${block_user}            xpath=(//div[@class='flexMinWidthRow pdngHSM capitalizeTxt'])[1]
${confirm_block}         xpath=(//button[normalize-space()='Block'])[1]
${unblock_user}          xpath=//div[@class='flexCol profileBlock whiteBg chatSlideIn brdrgray brdrRadiusTR']//div[8]
${confirm_unblock}       xpath=//button[normalize-space()='UNBLOCK']
${chat_profile}          xpath=//div[@class='flexCol aCntr jCntr gradientBg wTxt pointer']
${unblock?}              xpath=(//span[@class='pointer linkTxt'])[1]

##filter
${filter}                xpath=//*[name()='path' and contains(@d,'M472 168H4')]
${group}                 xpath=//li[normalize-space()='Groups']
${muted_chat}            xpath=//li[normalize-space()='Muted Chats']
${Blocked_Chats}         xpath=//li[normalize-space()='Blocked Chats']
${unread_chats}          xpath=//li[normalize-space()='Unread Chats']
${unread_count}          xpath=(//small[@class='wTxt small13'])[1]

##chat_profile
${chat_profile}          xpath=//div[@class='flexCol aCntr jCntr gradientBg wTxt pointer']
${image}                 xpath=//img[@src='/icons/imagesIcon.svg']
${chat_profile}          xpath=(//div[@class='flexCol aCntr jCntr gradientBg wTxt pointer'])[1]
${image_files}           xpath=(//div[@class='flexRow pdngXXS'])[1]
${media_image}           xpath=(//input[@type='checkbox'])[1]
${media_close}           xpath=//div[@class='flexAutoRow pointer aCntr']//*[name()='svg']
${media_frwd}            xpath=//div[@aria-label='Forward']//*[name()='svg']
${video}                 xpath=//div[contains(@class, 'flexRow') and contains(@class, 'pdngMD') and .//span[text()='Videos']]
${dlt}                   xpath=(//div[contains(text(),'Delete')])[1]
${doc}                   xpath=(//div[@class='flexMinWidthRow pdngHSM'])[3]
${link}                  xpath=(//div[@class='flexMinWidthRow pdngHSM'])[4]
${close_profile}         xpath= //div[@class='flexAutoRow pointer aCntr']//*[name()='svg']
${common_group}          xpath=//span[normalize-space()='Groups In Common']

## settings
${status}                xpath=//span[@class='txtBlBoldXS ellipsisTxt']
${status_field}          id=standard-basic
${Today}                 id=demo-simple-select
${never}                 xpath=//li[normalize-space()='Never']
${clear}                 xpath=//button[normalize-space()='CLEAR']
${save}                  xpath=//button[normalize-space()='SAVE']
${CLEAR STATUS}          xpath=//button[normalize-space()='CLEAR STATUS']
${default_status}        xpath=//div[@class='flexRow aCntr pointer pdngRXS']//*[name()='svg']
${Away}                  xpath=//span[@class='pdngLXS'][normalize-space()='Away']
${busy}                  xpath=//span[normalize-space()='Busy']
${office}                xpath=//span[normalize-space()='Out of Office']
${disturb}               xpath=//span[normalize-space()='Do not disturb']
${available}             xpath=//span[normalize-space()='available']

##chat settings
${Sync Mobile Device Contacts}     xpath=//div[@class='flexRow aCntr pdngXS']//input[@type='checkbox']
${Mute Group Messages}             xpath=//body[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/span[1]/span[1]/input[1]
${Mute Normal Messages}            xpath=//body[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/span[1]/span[1]/input[1]
${Photos_settings}                 xpath=//body[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]/span[1]/span[1]/input[1]
${Documents_settings}              xpath=//body[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]/span[1]/span[1]/input[1]
${Audio_settings}                  xpath=//div[@class='flexCol pdngSM settingBrdrbottom']//div[3]//div[2]//span[1]//span[1]//input[1]
${Video_settings}                  xpath=//body[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]/span[1]/span[1]/input[1]
${Status_settings}                 xpath=//body[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]/span[1]/span[1]/input[1]
${Read_Receipt}                    xpath=//body[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]/span[1]/span[1]/input[1]
${close_download_app}              xpath=//div[@class='flexAutoRow pointer']//*[name()='svg']
${verify_blocked_user}             xpath=(//div[@class='flexRow aCntr pdngXS pointer'])[1]
${close_settings}                  xpath=//*[name()='path' and contains(@d,'M21 11H6.4')]
${settings_back}                   xpath=//div[@class='flexMinHeightCol scrollbarChatList pdngVMD']//div[@class='flexAutoRow pointer pdngLXS']//*[name()='svg']


##+icon
${cancel_status}                   xpath=//button[normalize-space()='CANCEL']
${setting_blocked_user}            xpath=(//span[@class='capitalizeTxt txtBlXS'][normalize-space()='Chilukuri Bindu'])[1]

##voice call
${voice_call}               xpath=//img[@alt='call']
${voice_call_disconnect}    xpath=(//div[@class='callBg brdrRadius50 textCntr pointer'])[1]
${voice_call_attend}        xpath=//span[@class='callStartBg brdrRadius50 textCntr pointer']//*[name()='svg']
${maximise}                 xpath=//img[contains(@title,'maximize')]
${voice_mic_off}            xpath=//img[@alt='Turn on mic']
${voice_mic}                xpath=//img[contains(@alt,'Turn off mic')]
${mic_call}                 xpath=//img[@alt='mic']
${mute}                     xpath=//img[@alt='mute']
${end_call}                 xpath=//img[contains(@alt,'end')]

##video call
${video_call}               xpath=//img[@alt='video']
#${video_call_attend}         xpath=(//span[@class='callStartBg brdrRadius50 textCntr '])[1]
${video_call_attend}        css=.callStartBg.brdrRadius50.textCntr
${video_call_mic}           xpath=//img[@alt='mic']
${video_call_max_screen}    xpath=//img[@title='maximize']
${video_call_cam}           xpath=//img[@alt='cam']
${screen_share_call}        xpath=//img[@alt='screen Share']
${video_call_disconnect}    xpath=//img[@alt='end']
${full_screen_video_call_mic}            xpath=//img[@alt='Turn off mic']
${mic_off}                              xpath=(//img[@alt='Turn on mic'])[1]
${cam_on}                               xpath=//img[@src='/icons/camOn.svg']
${cam_off}                                xpath=//img[@src='/icons/camOff.svg']
${video_call_end}           xpath=//img[@alt='end']
${contact_video_Call}       xpath=//div[@class='positionAbs']
${video_call_mouse_over}    xpath=//span[@class='nameTag'][normalize-space()='You']

##create group
${new_group}              xpath=//div[@class='flexCol presencebrdrbottom pdngHMD']//div[1]//div[2]
${Next}                   xpath=//button[normalize-space()='NEXT']
${Group_name}             xpath=(//input[@id=':r1t:' or @type="text" ])[4]
${Create_group}           xpath=//button[normalize-space()='Create']
${fresh_group}            xpath=//span[normalize-space()='New group😀']

##create group
${profile_image}        xpath=//img[@src='/images/noProfileimage.svg']
${save_btn}             xpath=//button[normalize-space()='SAVE']
${new_profile}          ${CURDIR}${/}..${/}TestFiles${/}Salman.jpg
${remove_profile}      xpath=//div[@class='profileAvatarUpdated jCntr aCntr pointer']//img
${dlt_profile}          xpath=//span[normalize-space()='Delete']
${remove}               xpath=//button[normalize-space()='remove']

${Group_name_emoji}     xpath=//img[@alt='grinning']
${emoji_name}           xpath=//img[@src='/images/ProfileEmohieselect.svg']
${close_emoji}          xpath=//*[name()='path' and contains(@d,'M19 6.41 1')]
${Send_messages}        xpath=//input[@name='isMemberCanSendMsg']
${isMemberCanAdd}       xpath=//input[@name='isMemberCanAdd']
${isMemberCanEdit}      xpath=//input[@name='isMemberCanEdit']
${edited_group_name}       xpath=//input[@id='standard-basic']
${edit_group_profile}      xpath=(//input[@type="file" or @accept="image/x-png,image/jpeg,image/jpg" ])[2]

##group
${Next}                         xpath=//button[normalize-space()='NEXT']
${Group_name}                   xpath=(//input[@id=':r1t:' or @type="text" ])[4]
${edited_group_name}            xpath=//input[@id='standard-basic']
${Create_group}                 xpath=//button[normalize-space()='Create']
${fresh_group}                  xpath=//span[normalize-space()='New group😀']
${Contact_select_all}           xpath=//span[@class='link']
${edit_name}                    xpath=//div[@class='flexInline pdngHXS mrgnTXXS']//*[name()='svg']
${group_chat_profile}           xpath=(//span[normalize-space()='New group😀'])[2]
${tick}                         xpath=(//div[@class='flexMinWidthRow pdngRXS aCntr']//div[@class='flexAutoRow aCntr']//*[name()='svg'])[3]
${edit_profile}                 xpath=(//*[name()='svg'][@class='pointer'])[4]
${add_participant}              xpath=//div[@class='flexMinWidthRow pdngHXS jBtwn aCntr']//*[name()='svg']
${select_tarik}                 xpath=//div[@class='flexMinWidthCol pdngHSM' and .//span[text()='Tarik Aziz']]
${select_aswin}                 xpath=//div[@class='flexMinWidthCol pdngHSM' and .//span[text()='Aswin']]
${add}                          xpath=//button[normalize-space()='Add']
${participants}                 xpath=//div[@class='flexRow aCntr pdngMD brdrBSM']
${participant_search}           xpath=(//input[@placeholder="Search..." or @id=':rt:'] )[2]
${participant_3dots}            xpath=//div[@class='flexAutoRow pointer']//*[name()='svg']
${remove_participants}          xpath=//li[normalize-space()='Remove']
${make_admin}                   xpath=//li[normalize-space()='Make group admin']
${confirm_remove}               xpath=//button[normalize-space()='Remove']
${remove_admin}                 xpath=//li[contains(normalize-space(), 'Remove group admin')]
${send_message_participants}    xpath=//li[normalize-space()='Send Message']
${Group_permission}             xpath=//span[normalize-space()='Group Permissions']
${exit_group}                   xpath=//span[normalize-space()='Exit Group']
${group_dlt_checkbox}           xpath=//input[@type='checkbox']
${invite_link}                  xpath=//span[normalize-space()='Invite via link']
${invite_link_txt}              xpath=//a[contains(text(),'https://preprodapp.inmeet.ai/presence?groupId')]
${confirm_exit}                 xpath=//button[normalize-space()='exit']

##groupcall
${iframe}                       xpath=//iframe[@title='External Page']
##group calls
${screen_share}                 xpath= //img[@alt='share']
${P-P_video_call_disconnect}     xpath=(//div[@class='callBg brdrRadius50 textCntr '])[1]
${call_participants}             xpath=(//small[text()='Participants'])
${Ring_all}                     xpath=(//span[text()='Ring All'])
${Ring}                         xpath=(//span[text()='Ring'])
${close}                        xpath=(//img[@src='icons/close.svg' or @alt='close'])
${group_mic_on}                 xpath=//img[@src='/icons/pMic.svg' or @alt='audio']
${group_mic_off}                xpath=(//img[@src='/icons/pMicOff.svg' or @alt='audio'])[1]
${call_attend_chat}             xpath=//div[@class='flexRow aCntr jCntr']
${search_participant}           xpath=//input[@placeholder='Search by name']
${call_3dots}                   xpath=(//img[@src='/icons/three.svg'])[1]
${stop_audio}                   xpath=(//small[normalize-space()='Stop Audio'])
${request_audio}                xpath=(//span[normalize-space()='Request Audio'])
${Stop_Screenshare}             xpath=(//span[normalize-space()='Stop Screenshare'])
${Remove_user}                  xpath=(//span[normalize-space()='Remove user'])
${Remove_from_spotlight}        xpath=//p[normalize-space()='Remove from spotlight']
${add_to_spotlight}             xpath=(//p[normalize-space()='Add to spotlight'])
${ok_enable}                    xpath=//button[normalize-space(text())='OK, ENABLE']
${3dot_call_card}               xpath=(//img[@src='/icons/moreOptsVideo.svg'])
${cancel_request}               xpath=(//span[text()='Cancel'])
${iframe_1}                     xpath=iframe[title='External Page']

*** Keywords ***


# Reusable Methods
Get Meeting ID from Clipboard

    [Documentation]    Fetches the copied Meeting ID from clipboard
    ${clipboard_value}    Evaluate    __import__('pyperclip').paste()
    RETURN    ${clipboard_value}


Browser_B
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Open Browser With Permissions   ${url}
        Enter Login Credentials    ${row}[joinUserEmail]    ${row}[joinUserPassword]
        Click on Login Button
        Sleep    3s
    END

Browser_c
    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Open Browser With Permissions   ${url}
        Enter Login Credentials    ${row}[3rdUserEmail]    ${row}[3rdUserPassword]
        Click on Login Button
        Sleep    3s
    END
Browser_D

    ${test_data}    Read Excel Data    ${EXCEL_FILE}    ${SHEET_NAME}
    FOR    ${row}    IN    @{test_data}
        Open Browser With Permissions   ${url}
        Enter Login Credentials    ${row}[4thUserEmail]    ${row}[4thUserPassword]
        Click on Login Button
        Sleep    3s
    END
Open_chats
    Wait until element is visible   ${chats_button}     60s
    Click image    ${chats_button}
    sleep       5s

Open_chat
    Open_chats
    Wait until element is visible    ${chat}            60s
    Click element    ${chat}
    Wait until element is visible     ${chat_field}     60s

open_chat_Aswin
    Open_chats
    Wait until element is visible    ${Aswin}     60s
    Click element    ${Aswin}
    Wait until element is visible     ${chat_field}    60s

send_msg
    Click element    ${chat_field}
    Input text    ${chat_field}     helloo
    Click image    ${send_message}
    sleep    5s

Send_Link
    Click element    ${chat_field}
    Input text    ${chat_field}     https://preprodapp.inmeet.ai/presence
    Click image    ${send_message}
    sleep    5s

Send_messages

    send_msg
    send_msg
    send_msg
    send_msg
    send_msg
    send_msg
    send_msg
    send_msg
    send_msg
    send_msg
    send_msg
    send_msg

send_audio
    Click element    ${mic}
    sleep    10s
    Click element    ${mic_stop}
    Click element    ${send_message}

send_emoji
    Click element    ${emoji}
    sleep    5s
    Click element    ${select_emoji}
    Click element    ${send_message}

send_image

    ${IMAGE_FILE}=   Normalize Path    ${REL_IMAGE_FILE}
    Wait Until Page Contains Element    ${Upload_locator}   20s
    Choose File  ${Upload_locator}   ${IMAGE_FILE}
    Input text    ${img_txt}    new one
    Sleep    4s
    Click button    ${send}
    Sleep    2s
send_image2

    ${IMAGE_FILE_big}=   Normalize Path    ${REL_IMAGE_FILE2}
    Wait Until Page Contains Element    ${Upload_locator}   20s
    Choose File  ${Upload_locator}   ${IMAGE_FILE_big}

send_video

    ${video_FILE}=   Normalize Path    ${REL_Video_FILE}
    Wait Until Page Contains Element    ${Upload_locator}   20s
    Sleep    4s
    Choose File  ${Upload_locator}   ${video_FILE}
    Input text    ${img_txt}    new one
    Sleep    4s
    Click button    ${send}
upload_pdf

    ${PDF_FILE}=   Normalize Path    ${REL_PDF_FILE}
    Wait Until Page Contains Element    ${UPLOAD_LOCATOR}   20s
    Choose File  ${UPLOAD_LOCATOR}   ${PDF_FILE}
    Input text    ${img_txt}    new one
    Sleep    4s
    Click button    ${send}
    Sleep    2s

Audio_video
    ${Audio_FILE}=   Normalize Path    ${REL_Audio_FILE}
    Wait Until Page Contains Element    ${Upload_locator}   20s
    Choose File  ${Upload_locator}   ${Audio_FILE}
    Input text    ${img_txt}    new one
    Sleep    4s
    Click button    ${send}
    Sleep    2s

Block_user

    Wait until element is visible    ${chat_profile}    60s
    Click element         ${chat_profile}
    Click element      ${block_user}
    Wait until element is visible    ${confirm_block}    60s
    Click button    ${confirm_block}
    Wait until page contains     Chilukuri Bindu blocked successfully       30s


Unblock_user

    Wait until element is visible    ${chat_profile}    60s
    Click element         ${chat_profile}
    Click element     ${unblock_user}
    Wait until element is visible    ${confirm_unblock}     40s
    Click button    ${confirm_unblock}
    Wait until page contains    Chilukuri Bindu unblocked successfully      30s

Select_message

    Select checkbox                     ${select_msg1}
    Select checkbox                     ${select_msg2}
    Select checkbox                     ${select_msg3}
    Select checkbox                     ${select_msg4}

Chat_3_dots

    Click element                       ${3_dots}
    Wait until element is visible       ${select_chat}      20s
    Click element                       ${select_chat}
    sleep    2s

Backspace

    ${current_value}=    Get Element Attribute     ${+_search1}       value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys      ${+_search1}       ${KEY_BACKSPACE}
    END

Backspace2

    ${current_value}=    Get Element Attribute     ${edited_group_name}         value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys      ${edited_group_name}         ${KEY_BACKSPACE}
    END


Verify_the_group_participants

    Browser_B
    Open_chats
    Wait until element is visible       ${fresh_group}        30s
    Browser_c
    Open_chats
    Wait until element is visible       ${fresh_group}        30s

Upload_group_profile

    Click element    ${profile_image}
    ${IMAGE_FILE}=   Normalize Path    ${new_profile}
    Wait Until Page Contains Element    ${Upload_locator}   20s
    Choose File  ${Upload_locator}   ${IMAGE_FILE}
    Sleep    2s
    Click button    ${save_btn}

Edit_group_profile

    ${IMAGE_FILE}=   Normalize Path    ${new_profile}
    Wait Until Page Contains Element    ${edit_group_profile}   20s
    Choose File  ${edit_group_profile}   ${IMAGE_FILE}
    Sleep    2s
    Click button    ${save_btn}

Remove_profile

    Upload_group_profile
    Click element   ${remove_profile}
    Click element    ${dlt_profile}
    Click button    ${remove}

select_contact

    Input text                          ${+_search1}            kajal@instavc.com
    Press keys                          ${+_search1}           ENTER
    Sleep    2s
    Click element                       ${kajal}
    Backspace
    Input text      ${+_search1}        madhavi.ch@instavc.com
    Click element   xpath=(//input[@class='PrivateSwitchBase-input css-1m9pwf3'])[1]



Enable_&_Disable_group_permissions

    Click element    ${Send_messages}
    Click element    ${isMemberCanAdd}
    Click element    ${isMemberCanEdit}



Open_group

    Open_chats
    Wait until element is visible       ${fresh_group}        30s
    Click element    ${fresh_group}

Delete_chat

    Click element                      ${3_dots}
    Wait until element is visible      ${delete_chat}           20s
    Click element                       ${delete_chat}
    Click button                        ${confirm_delete}
    Wait until page contains        Chat deleted successfully   60s


Clear_chat
    Click element                       ${3_dots}
    Wait until element is visible       ${clear_chat}           20s
    Click element                       ${clear_chat}
    Wait until element is visible       ${confirm_clear}        20s
    Click button                        ${confirm_clear}
    Wait until page contains        chat cleared successfully   60s

Group_call_request_audio
    Select frame            ${iframe}
    Click element           ${call_participants}
    Sleep    3s
    Click element           ${call_3dots}
    Click element           ${request_audio}
    Unselect frame


Unread_chat

    Browser_D
    Open_chat_Aswin
    Click element    ${Aswin}
    Send_messages