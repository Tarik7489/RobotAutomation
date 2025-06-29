*** Settings ***

Library    SeleniumLibrary
Resource    ../PageObjects/LoginPage.robot
Library    OperatingSystem
Resource    ../TestCases/Webinar_test.robot
Library    DateTime
*** Variables ***
${SHEET_NAME}    Login
${email}    aswin@yopmail.com
${password}    Invc@123
#create webinar
${Webinar_button}   xpath=(//img[@alt='webinar'])[1]
${Webinar}      xpath=//div[@class='flexRow aCntr jBtwn webiHdr pdngHSM']
${schedule_webinar}     xpath=(//div[@class='flexAutoRow aCntr pointer gap8'])[1]
${Meeting_name_field}      id=meetingName
${delete_webinar_name_field}     id=meetingName
${Webinar_description}      Xpath=//*[@data-placeholder="Webinar Description"]
${add_contact}      xpath=(//input[@id='email'])[1]
${contact_checkbox}     xpath=(//*[@type="checkbox"])[1]
${insert_button}        xpath=(//button[normalize-space()='INSERT'])[1]
${next_button}      xpath=(//*[@type="button"])[17]
# registration
${with_registration}       id=withRegistration
${domain_restriction}       id=fieldCheck1
${domain_field}     id=outlined-basic
${add_button}       id=add
${next_button2}     id=nextBtn
${skip&finish}      xpath=(//button[normalize-space()='skip & finish'])[1]

#notification
${thankyou_mail}    xpath=(//span[@class='MuiButtonBase-root MuiSwitch-switchBase MuiSwitch-colorPrimary PrivateSwitchBase-root MuiSwitch-switchBase MuiSwitch-colorPrimary css-187zakx'])[1]
${First_reminder}   xpath=//body[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[3]/div[2]/span[1]/span[1]
${next_button3}     xpath=//button[normalize-space()='NEXT']
#speaker
${next_button4}     xpath=//button[normalize-space()='NEXT']
${finish}       xpath=//button[normalize-space()='Finish']

#delete webinar

${select_webinar}       xpath=(//span[@class='ellipsisTxt capitalizeTxt'])[1]
${delete_webinar}       xpath=(//button[normalize-space()='Delete'])[1]
${confirm_delete}       xpath=(//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-disableElevation MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-disableElevation css-dn9knr'][normalize-space()='Delete'])[1]
#start_webinar

${start_button}     xpath=(//button[normalize-space()='START'])[1]
${start_webinar_button}      xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-containedSizeSmall MuiButton-sizeSmall']
${Add_resources}        xpath=//input[@accept="application/pdf" or @class="fileBtn" or @type="file"]
${REL_PDF_FILE}     ${CURDIR}${/}..${/}TestFiles${/}certfifcate.pdf

${banner_image}     xpath=(//input[@id="webinarBanner" or @type="file" or @class="uploadInputfeild" or @accept="image/png,image/gif,image/jpeg,image/jpg,image/webp"])[1]
${REL_IMAGE_FILE}   ${CURDIR}${/}..${/}TestFiles${/}Salman.jpg

${Webinar Logo}             xpath=(//input[@id="webinarBanner" or @type="file" or @class="uploadInputfeild" or @accept="image/png,image/gif,image/jpeg,image/jpg,image/webp"])[1]
${Webinar Background}       xpath=(//input[@id="webinarBanner" or @type="file" or @class="uploadInputfeild" or @accept="image/png,image/gif,image/jpeg,image/jpg,image/webp"])[1]
${Webinar Intro Video}      xpath=(//input[@id="webinarBanner" or @type="file" or @class="uploadInputfeild" or @accept="image/png,image/gif,image/jpeg,image/jpg,image/webp"])[1]
${REL_Video_FILE}   ${CURDIR}${/}..${/}TestFiles${/}video.mp4
${REL_Audio_FILE}   ${CURDIR}${/}..${/}TestFiles${/}Audio.mp3
${logo_save_btn}        xpath=(//button[normalize-space()='SAVE'])[1]

# Adding a speaker
${add_speaker_btn}      xpath=(//button[normalize-space()='Add Speakers'])[1]
${speaker_name_field}   name=speakerName
${speaker_email_field}     name=speakerEmail
${speaker_title_field}      name=title
${speaker_image}        xpath=//input[@type="file" or @class="uploadInputfeild" or @accept="image/x-png,image/gif,image/jpeg,image/jpg,image/webp"]
${speaker_add_btn}      xpath=//button[normalize-space()='Add']
${edit_speaker_btn}     xpath=(//button[contains(@title,'Edit')])[1]
${speaker_details_update_btn}   xpath=(//button[normalize-space()='Update'])[1]
${delete_speaker_btn}       xpath=(//button[@title='Delete'])[1]
${cnf_delete_speaker_btn}   xpath=(//button[normalize-space()='Delete'])[1]

# Speaker Data
${speaker_name}         Mike
${speaker_email}        test@gmail.com
${speaker_title}        Sr.QA Engineer
${Edit_speaker_name}    Tarik

# Poll Creation
${create_poll_option}      xpath=(//button[@type="button"])[3]
${webinar_poll_question_field}  xpath=//label[text()="Add Questions"]/following-sibling::div//textarea
${webinar_option_one}       xpath=(//input[@placeholder='+ Add'])[1]
${webinar_option_two}       xpath=(//input[contains(@placeholder,'+ Add')])[2]
${CREATE_POLL}      xpath=(//button[@type="button"])[10]

# Add survey

${create_survey_btn}    xpath=(//button[normalize-space()='Create Survey'])[1]
${survey_title}     id=title
${survey_description}   id=description
${survey_next_btn}      xpath=//button[@aria-label='Next']
${survey_question_dropdown}     xpath=(//b[normalize-space()='Question 1'])[1]
${survey_question_field}    xpath=(//input[@id='question'])[1]
${survey_question_type}     xpath=(//div[@id='questionType'])[1]
${select_single_choice}     xpath=(//li[normalize-space()='Single Choice'])[1]
${survey_option_field}            xpath=(//input[@id='options'])[1]
${survey_create_btn}        xpath=(//button[normalize-space()='Create'])[1]
${survey_edit_btn}          xpath=(//button[contains(@type,'button')])[3]
${survey_update_btn}        xpath=(//button[normalize-space()='Update'])[1]
${survey_delete_btn}        xpath=(//button[@type='button'])[4]
${cnf_survey_delete_btn}    xpath=(//button[normalize-space()='Delete'])[1]

# survey data
${title}    Survey
${description}  We're conducting a short survey to understand your experiences and challenges with video conferencing (VC) meetings. Your feedback will help us improve the quality, productivity, and overall effectiveness of our virtual collaboration tools and processes. The survey takes less than 2 minutes to complete — thank you for sharing your insights!
${question}     Do you find VC meetings productive?
${options}      Always,Most of the time,Occasionally
${Edited_survey_title}  Edited Survey title

${poll_toggle}      xpath=(//span[@class='MuiSwitch-thumb css-19gndve'])[3]
${resources}        xpath=(//input[@id='resources'])[1]
${finish_btn}       xpath=(//button[normalize-space()='Finish'])[1]

# Participant Entry
${email_domain_restriction_checkbox}    xpath=(//input[@id='fieldCheck1'])[1]
${reason_dropdown}      xpath=(//div[@id='demo-simple-select'])[1]
${select_restrict_public_domain}    xpath=(//li[normalize-space()='Restrict public domains'])[1]
${enter_domain}     xpath=(//input[@id='outlined-basic'])[1]
${add_btn}      xpath=(//button[normalize-space()='Add'])[1]

# Webinar details screen
${copy_webinar_url}     xpath=(//img[@aria-label='Copy'])[1]
${copy_speaker_url}     xpath=(//img[@aria-label='Copy'])[2]
${copy_url_toast_msg}   xpath=//div[contains(text(),'Copied!')]
${edit_btn}         xpath=(//button[normalize-space()='Edit'])[1]
${edit_webinar_name}    InMeet Demo
${skip_and_finish_btn}      xpath=(//button[normalize-space()='skip & finish'])[1]
${delete_btn}       xpath=(//button[normalize-space()='Delete'])[1]
${cnf_delete_btn}   xpath=(//button[contains(@class,'MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-disableElevation MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-disableElevation css-dn9knr')][normalize-space()='Delete'])[1]
${Edit_webinar_field}    xpath=//input[@name="meeting-name"]

# Webinar Start
${webinar_start_btn}    xpath=(//button[normalize-space()='START'])[1]
${webinar_join_btn}     xpath=(//span[normalize-space()='Join'])[1]
${vc_webinar_start}     xpath=(//span[normalize-space()='Start'])[1]
${webinar_info}         xpath=(//i[@title='info'])[1]
${webinar_speaker_info}     xpath=(//div[@role='presentation'])[2]
${copy_Webinar_speaker_url}     xpath=(//img[@alt='copy'])[3]
${webinar_info_modal_close}     xpath=(//img[@alt='cancel'])[1]
${start_info_alert_cross_icon}     xpath=//div[contains(@class,'flexAutoRow') and contains(@class,'alignCntr')]//button[contains(@class,'MuiIconButton-root')]

# Speaker view
${view_btn}         xpath=//span[normalize-space()='View']
${close_speaker_modal}      xpath=(//img[@alt='close'])[1]

# Webinar users details
${full_name}    xpath=(//input[@id='Full Name'])[1]
${webinar_email_field}        xpath=(//input[@id='Email'])[1]
${Webinar_user_join_btn}        xpath=//span[normalize-space()='Join Webinar']
${final_join_webinar_btn}   xpath=//span[normalize-space()='JOIN WEBINAR']
${unmute_webinar_btn}   xpath=//span[normalize-space()='unmute']
${mute_unmute_webinar_icon}    xpath=(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeSmall'])[1]
${webinar_url_copy_from_info}   xpath=(//img[@alt='copy'])[2]
${webinar_user_info_icon}       xpath=//div[contains(@class, 'webHead')]//img[@alt='info']
${webinar_user_view_btn}        xpath=//span[normalize-space()='view']

# Engagement Controls
${webinar_three_dots}       xpath=(//img[@alt='more'])[1]
${engagement_controls_option}   xpath=(//span[normalize-space()='Engagement Controls'])[1]
${chat_toggle}      xpath=//input[@id='chat']
${reaction_toggle}      xpath=//input[@id='reactions']
${polls_toggle}     xpath=(//input[@id='polls'])[1]
${resources_toggle}     xpath=//input[@id='resources']
${survey_toggle}    xpath=//input[@id="surveys"]/ancestor::span[contains(@class, "MuiSwitch-root")]
${engagement_control_modal_close}   xpath=(//img[@alt='cancel'])[1]
${stop_webinar_option}      xpath=(//span[normalize-space()='Stop Webinar'])[1]


# Participants modal
${participants_tab}     xpath=(//small[normalize-space()='Participants'])[1]
${participants_webinar_option}      xpath=//*[contains(text(),'Webinar users')]
${participants_modal_three_dots}    xpath=(//img[@src='/icons/three.svg'])[1]
${make_presenter_option}    xpath=//span[normalize-space()='Make Presentor']
${remove_webinar_user}      xpath=(//span[normalize-space()='Remove'])[1]
${webinar_search_user}      xpath=//input[@placeholder='Search by name']
${webinar_user_modal_close}     xpath=(//img[@alt='back'])[1]

# Webinar user
${webinar_emoji_option}     xpath=//small[normalize-space()='Emoji']
${webinar_chat_option}      xpath=//small[normalize-space()='Chat']
${webinar_leave_option}     xpath=//small[normalize-space()='Leave']

# Edit poll
${edit_poll}        xpath=//button[@title='Edit']
${webinar_update_poll}      xpath=//button[normalize-space()='Update Poll']
${webinar_delete_poll_btn}      xpath=(//img[@alt='delete'])[1]
${webinar_cnf_delete_poll_btn}  xpath=//button[normalize-space()='Delete']
${all_attendees_radio_btn}      xpath=//input[@value='attendees']
${second_webinar_user_copy_link}    xpath=//img[@alt='copy']

# Branding

${vc_app_tab}       xpath=(//img[@alt='quad'])[1]
${branding_option}      xpath=(//span[normalize-space()='Branding'])[1]
${input_add_logo}       xpath=//input[@class="fileBtn" or @type="file" or @accept="image/x-png,image/jpeg,image/jpg"]
${logo_add_save_btn}    xpath=(//span[normalize-space()='Save'])[1]
${hide_option}          xpath=(//span[normalize-space()='Hide'])[1]
${logo_delete}          xpath=(//img[@alt='delete'])[1]
${toast_msg_logo_upload}    xpath=(//div[normalize-space()='Logo updated successfully'])[2]
${toast_msg_delete_logo}        xpath=(//div[normalize-space()='Logo deleted successfully'])[2]
${background_header_option}     xpath=(//span[normalize-space()='Backgrounds'])[1]
${toast_msg_background_upload}  xpath=(//div[normalize-space()='Background uploaded successfully'])[2]
${toast_msg_delete_background}      xpath=(//div[normalize-space()='Background deleted successfully'])[2]
${overlay_header_option}        xpath=(//span[normalize-space()='Overlay'])[1]
${customize_option}         xpath=(//div[@class='flexMinWidthCol aCntr jCntr link pdngSM CmBtn'][normalize-space()='Customise'])[1]
${overlay_heading_input_field}      xpath=//input[@name='heading']
${overlay_desc}     xpath=//textarea[@name='description']
${overlay_number}       xpath=//input[@name='mobileNumber']
${overlay_email}        xpath=//input[@name='email']
${overlay_save_btn}     xpath=(//span[normalize-space()='Save'])[1]
${overlay_show_btn}     xpath=//div[@class='flexMinWidthCol aCntr jCntr link pdngSM']
${branding_modal_close_btn}     xpath=//img[@alt='close']
${vc_overlay_close_btn}         xpath=//img[@alt='cancel']
${overlay_hide_btn}         xpath=//div[contains(@class,'flexMinWidthCol aCntr jCntr link pdngSM hideTxt')]
${video_clips_header_option}    xpath=(//span[normalize-space()='Video Clips'])[1]
${input_add_video_clip}       xpath=//input[@class="flInput" or @type="file" or @accept="video/mp4"]
${toast_msg_video_upload}   xpath=(//div[normalize-space()='Video clip uploaded successfully'])[2]
${video_delete_icon}        xpath=//img[contains(@src,'/icons/bin.svg')]
${toast_msg_video_delete}   xpath=(//div[normalize-space()='Video clip deleted successfully'])[2]
${video_play_icon}      xpath=(//img[@alt='audio'])[1]
${played_video_close_btn}       xpath=//img[@alt='close']
${audio_clips_header_option}    xpath=(//span[normalize-space()='Audio Clips'])[1]
${input_upload_audio_input}       xpath=//input[@class="flInput" or type="file" or @accept="audio/mp3"]
${toast_msg_audio_upload}   xpath=(//div[normalize-space()='Audio clip uploaded successfully'])[2]
${audio_delete_icon}        xpath=(//img[@alt='file'])[1]
${toast_msg_delete_audio}   xpath=(//div[normalize-space()='Audio clip deleted successfully'])[2]
${audio_play_btn}       xpath=//img[contains(@alt,'audio')]
${video_clips_branding_modal_close_btn}   xpath=(//img[@alt='close'])[2]

# Webinar user's modal
${webinar_user_option}      xpath=//span[contains(text(),'Webinar users')]
${participants_tab}         xpath=(//small[normalize-space()='Participants'])[1]
${webinar_user_three_dots}      xpath=(//div[contains(@class, 'flexInlineCol')]//img[@src='/icons/three.svg'])[1]
${make_presentor}           xpath=(//span[normalize-space()='Make Presentor'])[1]
${webinar_user_remove}      xpath=(//span[contains(text(),'Remove')])[2]

# Ready to join? screen
${webinar_poll_toggle}      xpath=//input[@id='polls']
${Join_name}        id=displayname
${join_email}       id=displayEmail
${seat_number}      xpath=//input[@placeholder='00']
${webinar_user_share_file_close}    xpath=//img[@src='/icons/exitF.svg' and @alt='fullScreen']
${toast_msg_create_poll}    xpath=//div[@role='alert' and contains(@class, 'Toastify__toast-body') and normalize-space(text())="You’ve successfully created the poll!"]

# End Webinar

${webinar_end_btn}      xpath=//small[contains(text(),'End')]
${end_webinar_for_all_btn}      xpath=//span[normalize-space()='END WEBINAR FOR ALL']
${registration_page_drop_down}      xpath=(//div[@id='demo-simple-select'])[1]
${select_survey_page}       xpath=(//li[normalize-space()='Survey Page'])[1]
${webinar_final_end_btn}        xpath=//span[normalize-space()='End']
${done_webinar_btn}     xpath=//span[normalize-space()='Done']

# Survey submit page
${select_first_survey_option}   xpath=//input[@type='radio' and @value='Always']/ancestor::span[contains(@class, 'MuiButtonBase-root')]
${survey_submit_btn}        xpath=//span[normalize-space()='SUBMIT']

# Webinar time chanege

${duration_icon}       xpath=(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv'])[3]
${select_5minutes}      xpath=//span[@id='mins' and normalize-space(text())='05']
${CALENDAR_ICON_XPATH}    //button[contains(@aria-label, 'Choose date')]
${DATE_FORMAT}    %d

# Webinar Analytics
${select_first_Webinar_from_the_list}    xpath=(//b[contains(text(),'InMeet Demo')])[1]
${analytics_option}     xpath=(//u[normalize-space()='Analytics'])[1]
${attendees_arrow}      xpath=(//*[@data-testid="ArrowForwardIcon"])[2]
${analytics_breadcrumbs}    xpath=//span[normalize-space()='Analytics']
${panelist_arrow}      xpath=(//*[@data-testid="ArrowForwardIcon"])[3]
${Feedback_Survey_arrow}    xpath=(//*[@data-testid="ArrowForwardIcon"])[5]
${survey_ans_dropdown}      xpath=(//*[name()='svg'][contains(@class,'pointer')])[1]
${survey_ans_user}      xpath=(//span[contains(text(),'Users')])[1]
${close_survey_user_modal_icon}     xpath=//div[@class='flexRow aCntr jBtwn']//*[name()='svg']

${poll_arrow}       xpath=(//*[@data-testid="ArrowForwardIcon"])[6]
${webinar_breadcrumbs}      xpath=//span[normalize-space()='Webinar']
${webinar_completed_status}     xpath=(//span[contains(text(),'Completed')])[1]


*** Keywords ***

Start and stop cloud recording
    Click element    ${vc_three_dots}
    Click element    ${start_cloud_recording}
    Click element    ${stop_cloud_recording}

Verify the polls detail in webinar analytics page
    Scroll element into view     ${poll_arrow}
    Sleep    3s
    Wait until element is visible   ${poll_arrow}      20s
    Click element   ${poll_arrow}
    Wait until element is visible    ${survey_ans_dropdown}     20s
    Click element    ${survey_ans_dropdown}
    Wait until page contains    Tiger (2/2 voted)       20s
    Wait until element is visible    ${webinar_breadcrumbs}         20s
    Click element    ${webinar_breadcrumbs}
    Wait until element is visible    ${webinar_completed_status}    20s
    Click element    ${webinar_completed_status}




Verify the Feedback Survey details in webinar analytics page
    Scroll element into view     ${Feedback_Survey_arrow}
    Wait until element is visible    ${Feedback_Survey_arrow}      20s
    Sleep    3s
    Click element   ${Feedback_Survey_arrow}
    Wait until element is visible    ${survey_ans_dropdown}     20s
    Click element    ${survey_ans_dropdown}
    Wait until element is visible    ${survey_ans_user}     20s
    Click element    ${survey_ans_user}
    Wait until page contains    Webinar User    20s
    Sleep    2s
    Click element    ${close_survey_user_modal_icon}
    Wait until element is visible    ${analytics_breadcrumbs}    20s
    Click element    ${analytics_breadcrumbs}

Verify the attendees details in webinar analytics page
    Sleep    5s
    Wait until element is visible    ${select_first_Webinar_from_the_list}       20s
    Click element    ${select_first_Webinar_from_the_list}
    Wait until element is visible    ${analytics_option}    20s
    Click element    ${analytics_option}
    Sleep    3s
    Wait until element is visible    ${attendees_arrow}     20s
    Click element    ${attendees_arrow}
    Wait until page contains    Webinar User    20s
    Wait until page contains    Second Webinar User     20s
    Wait until page contains    India   20s

Verify the panelist details in webinar analytics page
    Wait until element is visible    ${analytics_breadcrumbs}    20s
    Click element    ${analytics_breadcrumbs}
    Sleep    3s
    Wait until element is visible    ${panelist_arrow}      20s
    Click element   ${panelist_arrow}
    Wait until page contains    Second Webinar User    20s
    Wait until page contains    Guest User    20s
    Wait until page contains    India   20s
    Wait until element is visible    ${analytics_breadcrumbs}    20s
    Click element    ${analytics_breadcrumbs}




Click next date from Calendar
    Click Element    ${CALENDAR_ICON_XPATH}
    ${day}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=1)).strftime("${DATE_FORMAT}")    datetime
    Log    Tomorrow's day is: ${day}
    Click Element    xpath=//button[normalize-space(text())='${day}']

Set webinar duration time to 5 minutes
    Wait until element is visible    ${duration_icon}       20s
    Click element    ${duration_icon}
    Wait until element is visible    ${select_5minutes}     20s
    Click element    ${select_5minutes}
    Sleep    3s


Webinar end by Host and verified by speaker, webinar user and submit the survey
    Switch browser    1
    Sleep    2s
    Wait until element is visible    ${vc_three_dots}       20s
    Click element   ${vc_three_dots}
    Click element    ${engagement_controls_option}
    Sleep    2s
    Wait until element is visible    ${survey_toggle}       20s
    Click element    ${survey_toggle}
    Sleep    3s
    Click element    ${engagement_control_modal_close}

    Wait until element is visible     ${webinar_end_btn}    20s
    Click element    ${webinar_end_btn}
    Sleep    2s
    Click element    ${end_webinar_for_all_btn}
    Sleep    2s
    Click element    ${registration_page_drop_down}
    Sleep    2s
    Wait until element is visible     ${select_survey_page}     20s
    Click element    ${select_survey_page}
    Sleep    2s
    Click element    ${webinar_final_end_btn}

    Switch browser    5
    # Navigate to webinar user screen
    Wait until page contains     Thanks for attending webinar. The host has ended the webinar.      20s

    Switch browser    2
    # Navigate to speaker page
    Wait until page contains    Thanks for Choosing InMeet. The Host has ended      20s

    Switch browser    5
    # again back to webinar user screen
    Sleep    3s
    Wait until element is visible    ${done_webinar_btn}    20s
    Click element    ${done_webinar_btn}
    Sleep    4s
    Wait until page contains element    ${select_first_survey_option}      20s
    Click element    ${select_first_survey_option}
    Wait until element is visible    ${survey_submit_btn}       20s
    Click element    ${survey_submit_btn}
    Sleep    2s
    Wait until page contains    Thank you for submitting your feedback      20s






Webinar host sharing files and verified by webinar speaker
    Webinar host sharing the files
    Verify shared files by webinar speaker
    Webinar host sharing video
    Verifying shared video by webinar speaker
    Webinar host sharing a video by copy link and verified by speaker
    Webinar host sharing white board and verified by speaker


Webinar host sharing a video by copy link and verified by speaker
        Switch browser    1
        Verify video play using copied URL
        Sleep    3s
        Switch browser    2

        # Validating video by user B
        Wait until element is visible    ${verify_sharing_video_username}   10s
        Switch browser    1
        Click element    ${webinar_share_file_close}
        Sleep    2s
        Element should be visible    ${participate_tab}
        Sleep    4s
        Switch browser    2
        Page should not contain    Monster is sharing video


Webinar host sharing white board and verified by speaker
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

Webinar host sharing video
     Switch browser    1
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

Verifying shared video by webinar speaker
        Switch browser    2
        Sleep    3s
        # Validating video by user B
        Wait until element is visible    ${verify_sharing_video_username}   10s
        Switch browser    1
        Click element   ${webinar_share_file_close}
        Sleep    2s
        Element should be visible    ${participate_tab}
        Sleep    4s
        Switch browser    2
        Page should not contain    Monster is sharing video



Webinar host sharing the files
     Click element    ${app_tab}
     Sleep    4s
     Wait until element is visible    ${document_share}    15s
     Click element    ${document_share}
     Wait until page contains element    ${delete_doc_present}  15s
     Click element    ${delete_doc_present}
     Sleep    3s
     Wait until page contains    File deleted successfully  10s

     # Normalize the relative file path to a canonical path
     ${IMAGE_FILE}=    Normalize Path    ${REL_PDF_FILE}

     # Again upload the file
     Choose File    ${UPLOAD_LOCATOR}    ${IMAGE_FILE}
     Wait until page contains    certfifcate.pdf     10s
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

Verify shared files by webinar speaker
        Switch browser    2
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
        Wait until page contains element     ${webinar_share_file_close}     15s
        Sleep    3s
        Click element   ${webinar_share_file_close}
        Sleep    2s
        Element should be visible    ${participate_tab}
        Sleep    3s
        Switch browser    2
        Page should not contain element   ${annotation_editor_tool}



Webinar stop the poll and view the result
    Wait until element is visible    ${poll_stop}   15s
    Click element    ${poll_stop}
    Sleep    2s
    Wait until page contains    You’ve successfully stopped the poll!   20s
    Sleep    5s
    Wait until element is visible    ${poll_result}         30s
    Click element    ${poll_result}
    Sleep    4s
    Wait until element is visible    ${publish_result}  15s
    Click element    ${publish_result}
    Sleep    3s
    Wait until page contains    Poll result published successfully!     20s
    Sleep    3s
    Wait until page contains    Tiger (2/2 voted)   20s
    Sleep    3s
    Wait until page contains element    ${poll_close_modal}     15s
    Click element    ${poll_close_modal}

Poll creating for Webinar user
    Switch browser    1
    Wait until element is visible    ${vc_three_dots}       20s
    Click element     ${vc_three_dots}
    Wait until element is visible     ${engagement_controls_option}     20s
    Click element    ${engagement_controls_option}
    Sleep    2s
    Click element    ${webinar_poll_toggle}
    Sleep    3s
    Wait until element is visible     ${engagement_control_modal_close}     20s
    Click element    ${engagement_control_modal_close}
    Sleep    3s

    Webinar Create poll question
    Switch browser    2
    submit poll question
    Switch browser    3
    submit poll question
    Switch browser    1
    Sleep    3s
    Webinar stop the poll and view the result

Webinar Create poll question
    Wait until element is visible     ${app_tab}    15s
    Click element    ${app_tab}
    Sleep    3s
    Click element    ${polling}
    Wait until element is visible   ${create_poll_btn}
    Sleep    2s
    Click element    ${add_poll}
    Input text    ${poll_question_field}    What is the national animal of india
    Input text    ${option_one}     Tiger
    Input text    ${option_two}     Lion
    Click element    ${create_poll_btn}
    Wait until page contains    You’ve successfully created the poll!       20s
    Sleep    4s
    Click element    ${poll_start_btn}
    Sleep    4s
    Wait until page contains    You’ve successfully started the poll!       20s
    Sleep    2s

Verify document share by webinar user after making it as presenter
     Click element    ${app_tab}
     Sleep    4s
     Wait until element is visible    ${document_share}    15s
     Click element    ${document_share}
     Sleep    2s
     Wait until element is visible    ${request_access}     20s
     Click element    ${request_access}
     Switch browser    1
     Wait until element is visible     ${accept_all}        20s
     Click element    ${accept_all}
     Switch browser    4
     Click element    ${app_tab}
     Sleep    4s
     Wait until element is visible    ${document_share}    15s
     Click element    ${document_share}
     Wait until page contains element    ${present_btn}  15s
     Click element    ${present_btn}
     Wait until page contains    You are sharing file   10s
     Wait until page contains element    ${webinar_user_share_file_close}   15s
     Sleep    3s
     Click element   ${webinar_user_share_file_close}

Now webinar user join as a Speaker after making as presenter
    Sleep    6s
#    Wait until element is visible    ${Join_name}   20s
#    Input text    ${Join_name}      Speaker As Webinar User
    Wait until element is visible     ${join_email}     20s
    Input text    ${join_email}     speaker_webinaruser@gmail.com
#    Page should contain    Second Webinar User
    Wait until element is visible    ${join_button}     20s
    Click element    ${join_button}
    Sleep    3s

Remove webinar user
    Wait until element is visible    ${participants_tab}    20s
    Click element    ${participants_tab}
    Wait until element is visible    ${webinar_user_option}     20s
    Click element    ${webinar_user_option}
    Wait until element is visible    ${webinar_user_three_dots}     20s
    Sleep    3s
    Click element    ${webinar_user_three_dots}
    Wait until page contains element    ${webinar_user_remove}  20s
    Sleep    2s
    Click element    ${webinar_user_remove}

Make a presenter to webinar user
    Wait until element is visible    ${webinar_user_three_dots}     20s
    Sleep    2s
    Click element    ${webinar_user_three_dots}
    Wait until page contains element    ${make_presentor}   20s
    Sleep    2s
    Click element    ${make_presentor}
    Wait until page contains    No Webinar users found      20s


Verify the branding module
    Upload and delete branding logo
    Upload and delete branding background
    Add overlay and verify
    Add video clips and play
    Add audio clips and play

Add audio clips and play
    Scroll element into view    ${audio_clips_header_option}
    Wait until element is visible     ${audio_clips_header_option}      20s
    Sleep    3s
    Click element    ${audio_clips_header_option}
    ${AUDIO_FILE}=   Normalize Path    ${REL_Audio_FILE}
    Wait Until Page Contains Element   ${input_upload_audio_input}     20s
    Choose File  ${input_upload_audio_input}           ${AUDIO_FILE}
    Sleep    3s
    Wait until page contains element    ${toast_msg_audio_upload}   20s
    Click element    ${audio_play_btn}
    Sleep    2s
    Click element    ${audio_delete_icon}
    Wait until page contains element    ${toast_msg_delete_audio}       20s
    Sleep    3s
    Click element    ${branding_modal_close_btn}
    Sleep    3s

Add video clips and play
    Click element    ${vc_app_tab}
    Click element    ${branding_option}
    Wait until element is visible    ${video_clips_header_option}   20s
    Sleep    3s
    Click element    ${video_clips_header_option}
    ${VIDEO_FILE}=   Normalize Path    ${REL_VIDEO_FILE}
    Wait Until Page Contains Element   ${input_add_video_clip}     20s
    Choose File  ${input_add_video_clip}        ${VIDEO_FILE}
    Sleep    3s
    Wait until page contains element    ${toast_msg_video_upload}   20s
    Wait until element is visible   ${video_play_icon}      20s
    Sleep    4s
    Click element    ${video_play_icon}
    Sleep    3s
    Click element    ${video_clips_branding_modal_close_btn}
    Sleep    2s
    Click element    ${played_video_close_btn}
    Click element    ${vc_app_tab}
    Click element    ${branding_option}
    Wait until element is visible    ${video_clips_header_option}   20s
    Sleep    3s
    Click element    ${video_clips_header_option}
    Click element    ${video_delete_icon}
    Sleep    3s
    Wait until page contains element    ${toast_msg_video_delete}   20s
    Sleep    3s

Add overlay and verify
    Wait until element is visible     ${overlay_header_option}  20s
    Sleep    4s
    Click element    ${overlay_header_option}
    Wait until element is visible     ${customize_option}   20s
    Sleep    3s
    Click element    ${customize_option}
    Input text    ${overlay_heading_input_field}        Welcome to InMeet: Your Virtual Collaboration Hub
    Sleep    2s
    Input text    ${overlay_desc}    InMeet is your secure, high-quality video conferencing platform designed for modern teams. Whether you're hosting a webinar, client call, or daily standup, InMeet offers seamless connectivity, screen sharing, smart background filters, and real-time collaboration tools to make remote communication effortless.
    Sleep    2s
    Input text    ${overlay_number}     8904517455
    Sleep    2s
    Input text    ${overlay_email}      tarik@inmeet.com
    Sleep    2s
    Click element    ${overlay_save_btn}
    Sleep    2s
    Click element    ${overlay_show_btn}
    Click element    ${branding_modal_close_btn}
    Page should contain    Welcome to InMeet: Your Virtual Collaboration Hub
    Page should contain    InMeet is your secure, high-quality video conferencing platform designed for modern teams. Whether you're hosting a webinar, client call, or daily standup, InMeet offers seamless connectivity, screen sharing, smart background filters, and real-time collaboration tools to make remote communication effortless.
    Page should contain     8904517455
    Page should contain     tarik@inmeet.com
    Click element    ${vc_overlay_close_btn}
    Sleep    2s

Upload and delete branding background
    Wait until element is visible    ${background_header_option}    20s
    Click element   ${background_header_option}
    ${LOGO_FILE}=   Normalize Path    ${REL_IMAGE_FILE}
    Wait Until Page Contains Element    ${input_add_logo}   20s
    Choose File  ${input_add_logo}   ${LOGO_FILE}
    Wait until page contains element    ${toast_msg_background_upload}      20s

Upload and delete branding logo
    Click element    ${vc_app_tab}
    Click element    ${branding_option}
    ${LOGO_FILE}=   Normalize Path    ${REL_IMAGE_FILE}
    Wait Until Page Contains Element    ${input_add_logo}   20s
    Choose File  ${input_add_logo}   ${LOGO_FILE}
    Sleep    3s
    Click element    ${logo_add_save_btn}
    Wait until page contains element        ${toast_msg_logo_upload}        20s
    Sleep    3s


Webinar user send a message with permission flow
    Switch browser    4
    Send Message by webinar user
    Switch browser    1
    Verify message which is send by webinar user
    # For webinar first user messages should not display to another webinar user as chat visibility set to Only Host
    Switch browser    3
    Verify message is not display to another webinar user
    # Now host set to all employees
    Switch browser    1
    Click element    ${vc_three_dots}
    Click element    ${engagement_controls_option}
    Sleep    2s
    Click element    ${all_attendees_radio_btn}
    Sleep    3s
    Click element    ${engagement_control_modal_close}
    Switch browser    4
    # Now second webinar send a message
    Send Message by webinar user
    Switch browser    3
    # Now verify msg by webinar user
    Verify message by webinar user
    Sleep    3s

Verify message is not display to another webinar user
    Sleep    2s
    click on chat box
    Sleep    3s
    Page should not contain    Message by Webinar User
    Sleep    3s
    close chat modal


Create poll for webinar
    Sleep    3s
    Click element   ${create_poll_option}
    Sleep    3s
    Input text    ${webinar_poll_question_field}   What is the national animal of india
    Input text    ${webinar_option_one}     Tiger
    Input text    ${webinar_option_two}     Lion
    Click element    ${CREATE_POLL}
    Sleep    4s
    Wait until page contains element    xpath=//div[contains(text(),'Poll added successfully')]   20s
    Sleep    4s

Edit poll for webinar
    Click element    ${edit_poll}
    ${current_value}=    Get Element Attribute     ${webinar_poll_question_field}      value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys       ${webinar_poll_question_field}       ${KEY_BACKSPACE}
    END
    Input text     ${webinar_poll_question_field}       Updated Poll Questions
    Click element    ${webinar_update_poll}
    Wait until page contains element    xpath=//div[contains(text(),'Poll updated successfully')]   20s
    Sleep    3s
    Page should contain     Updated Poll Questions

Delete poll for Webinar
    Click element   ${webinar_delete_poll_btn}
    Sleep    2s
    Click element    ${webinar_cnf_delete_poll_btn}
    Wait until page contains element    xpath=//div[contains(text(),'Poll deleted successfully')]   20s
    Sleep    3s


Verify display option by webinar user's
    Wait until page contains element    ${webinar_emoji_option}     20s
    Wait until page contains element    ${webinar_chat_option}      20s
    Wait until page contains element    ${webinar_leave_option}     20s

Verify Engagement Controls
    Switch browser    1
    # Send message in chat by host
    Send Message on broadcast by Host
    Switch browser    3
    # Verify the message by webinar user
    Verify VC chat message by User B
    Send emojis in VC chat and verify by webinar user
    # Now verify by disabling the chat and emojis toggle
    Switch browser    1
    Wait until page contains element    ${vc_three_dots}    20s
    Click element     ${vc_three_dots}
    Sleep    2s
    Wait until element is visible     ${engagement_controls_option}     20s
    Click element    ${engagement_controls_option}
    Sleep    2s
    Click element    ${chat_toggle}
    Sleep    3s
    Click element    ${reaction_toggle}
    Switch browser    3
    Element should not be visible    ${webinar_chat_option}
    Sleep    4s
    Element should not be visible     ${webinar_emoji_option}
    Sleep    2s
    Switch browser    1
    Click element    ${resources_toggle}
    Sleep    3s
    Switch browser    3
    Click element    xpath=//small[normalize-space()='Document']
    Page should contain    certfifcate.pdf
    Sleep    2s
    Click element    xpath=//img[@alt="cancel"]
    Switch browser    1
    Sleep    2s
    Click element    ${chat_toggle}
    Sleep    2s
    Click element    ${engagement_control_modal_close}

Verify the speaker details by webinar user
    Wait until page contains element   ${webinar_user_info_icon}      20s
    Click element   ${webinar_user_info_icon}
    Sleep    2s
    Wait until page contains element   ${webinar_user_view_btn}      20s
    Click element    ${webinar_user_view_btn}
    Sleep    2s
    Wait until page contains    Mike    20s
    Wait until page contains    test@gmail.com      20s
    Wait until page contains     Sr.QA Engineer     20s
    Wait until page contains element    ${close_speaker_modal}      20s
    Sleep    3s
    Click element    ${close_speaker_modal}

Join Webinar as a Webinar User

#    Sleep    3s
#    Wait until page contains element    ${start_info_alert_cross_icon}     20s
#    Click element    ${start_info_alert_cross_icon}
    Wait until page contains element    ${webinar_speaker_info}    20s
    Click element    ${webinar_speaker_info}
    Sleep    2s
    Click element    ${webinar_url_copy_from_info}
    Sleep    2s
    ${Webinar_URL}   Get Meeting ID from Clipboard
    Set Global Variable     ${Webinar_URL}  # Store for second test
    Sleep    3s
    Click element    ${webinar_info_modal_close}
    # Now launch new browser and join as a webinar user
    Sleep    3s
    CommonKeywords.Open Browser With Permissions    ${Webinar_URL}
    Sleep    4s
    Wait until element is visible     ${full_name}      20s
    Input text    ${full_name}      Webinar User
    Input text    ${webinar_email_field}            webinar@yopmail.com
    Wait until page contains element    ${Webinar_user_join_btn}    20s
    Sleep    2s
    Click element    ${Webinar_user_join_btn}
    Page should contain    This email domain is not allowed.
    Sleep    2s
    ${current_value}=    Get Element Attribute     ${webinar_email_field}    value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
          Press Keys    ${webinar_email_field}    ${KEY_BACKSPACE}
    END
    Input text    ${webinar_email_field}            webinar@gmail.com
    Wait until page contains element    ${Webinar_user_join_btn}    20s
    Click element    ${Webinar_user_join_btn}
    Wait Until Element Is Enabled    ${final_join_webinar_btn}   300s
    Click element    ${final_join_webinar_btn}
    Sleep    3s
    Wait until page contains element    ${unmute_webinar_btn}   20s
    Click element    ${unmute_webinar_btn}
    Click element    ${mute_unmute_webinar_icon}
    Sleep    2s
    Click element    ${mute_unmute_webinar_icon}

    # Now verify the speaker details by webinar user
    Verify the speaker details by webinar user

Join second webinar user
    Switch browser    3
    Sleep    3s
    Wait until page contains element   ${webinar_user_info_icon}     20s
    Click element    ${webinar_user_info_icon}
    Sleep    2s
    Click element    ${second_webinar_user_copy_link}
    Sleep    2s
    ${Webinar_URL}   Get Meeting ID from Clipboard
    Set Global Variable     ${Webinar_URL}  # Store for second test
    Sleep    3s
    Click element    ${webinar_info_modal_close}
    # Now launch new browser and join as a webinar user
    Sleep    3s
    CommonKeywords.Open Browser With Permissions    ${Webinar_URL}
    Sleep    5s
    Wait until element is visible    ${full_name}   20s
    Input text    ${full_name}     Second Webinar User
    Input text    ${webinar_email_field}            secondwebinar@gmail.com
    Wait until page contains element    ${Webinar_user_join_btn}    20s
    Click element    ${Webinar_user_join_btn}
    Wait Until Element Is Enabled    ${final_join_webinar_btn}   300s
    Click element    ${final_join_webinar_btn}
    Sleep    3s
    Wait until page contains element    ${unmute_webinar_btn}   20s
    Click element    ${unmute_webinar_btn}
    Click element    ${mute_unmute_webinar_icon}
    Sleep    2s
    Click element    ${mute_unmute_webinar_icon}

    # Now verify the speaker details by webinar user
    Verify the speaker details by webinar user


Verify the speaker details
    Wait until page contains element    ${webinar_speaker_info}    20s
    Click element    ${webinar_speaker_info}
    Sleep    2s
    Wait until page contains element    ${view_btn}     20s
    Click element    ${view_btn}
    Sleep    2s
    Wait until page contains    Mike    20s
    Wait until page contains    test@gmail.com      20s
    Wait until page contains     Sr.QA Engineer     20s
    Wait until page contains element    ${close_speaker_modal}      20s
    Sleep    3s
    Click element    ${close_speaker_modal}


Start Webinar
    Wait until page contains element    ${webinar_start_btn}    10s
    Click element    ${webinar_start_btn}
    Sleep    3s
    Wait until page contains element    ${webinar_join_btn}     20s
    Click element    ${webinar_join_btn}
    Sleep    4s
    Wait until page contains    Attendees are waiting to join webinar,when you are ready click on start     20s
    Wait until page contains element    ${vc_webinar_start}    20s
    Click element    ${vc_webinar_start}
    Sleep    4s
    Wait until page contains    This meeting is now being streaming. By joining, you consent to the streaming. Our Privacy Policy applies.      40s

Join Webinar as a Speaker
    Wait until element is visible    ${webinar_info}    20s
    Click element    ${webinar_info}
    Click element    ${copy_Webinar_speaker_url}
    Sleep    2s
    ${Speaker_URL}   Get Meeting ID from Clipboard
    Set Global Variable     ${Speaker_URL}   # Store for second test
    Sleep    3s
    Click element    ${webinar_info_modal_close}
    Sleep    4s
    Wait until page contains    Monster     20s
    Verify the speaker details
    # Now copy the speaker url and join with speaker url
    Sleep    3s
    CommonKeywords.Open Browser With Permissions   ${Speaker_URL}
    Sleep    5s
    Wait until element is visible     ${Name_field_RaadytoJoin}     20s
    Input text    ${Name_field_RaadytoJoin}     Guest User
    Input text    ${email_field_ReadyToJoin}    test@gmail.com
    Click on join button
    Sleep    3s
    Wait until page contains    Monster     10s
    Wait until page contains    Guest User  10s


Edit Webinar Title
    Wait until page contains element    ${edit_btn}     20s
    Click element    ${edit_btn}
    Sleep    3s
    ${current_value}=    Get Element Attribute    ${Edit_webinar_field}   value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
          Press Keys   ${Edit_webinar_field}     ${KEY_BACKSPACE}
    END

    Input text   ${Edit_webinar_field}  InMeet Demo
    Sleep    3s
    Click element    ${next_button}
    Wait until page contains element    ${skip_and_finish_btn}      20s
    Click element    ${skip_and_finish_btn}
    Wait until page contains    Webinar updated succesfully     20s
    Wait until page contains    InMeet Demo     20s
    Click element    ${copy_webinar_url}
    Wait until page contains element    ${copy_url_toast_msg}   20s
    Click element   ${copy_speaker_url}
    Wait until page contains element    ${copy_speaker_url}     20s


Delete_Created_webinar
    Wait until page contains element    ${delete_btn}    20s
    Click element    ${delete_btn}
    Sleep    2s
    Wait until page contains element    ${cnf_delete_btn}    20s
    Click element    ${cnf_delete_btn}
    Sleep    3s
    Page should not contain      Deleted Webinar Name


Participant Entry restriction
    Wait until page contains element    ${email_domain_restriction_checkbox}    20s
    Click element    ${email_domain_restriction_checkbox}
    Sleep    2s
    Click element    ${reason_dropdown}
    Click element    ${select_restrict_public_domain}
    Input text    ${enter_domain}       yopmail.com
    Click element    ${add_btn}
    Wait until page contains    yopmail.com     10s



Upload banner image and intro video
    ${PDF_FILE}=   Normalize Path    ${REL_PDF_FILE}
    Wait Until Page Contains Element    ${Add_resources}   20s
    Choose File  ${Add_resources}   ${PDF_FILE}
    Sleep    3s
    Wait until page contains element     xpath=//div[@class='flexInline']//*[name()='svg']     20s
    Click element    xpath=//div[@class='flexInline']//*[name()='svg']
    Sleep    2s
    Choose File  ${Add_resources}   ${PDF_FILE}
    Sleep    2s
    Wait until element is visible    ${next_button}     20s
    Sleep    10s
    Click button    ${next_button}
    Sleep    5s
    Participant Entry restriction
    ${IMAGE_FILE}=   Normalize Path   ${REL_IMAGE_FILE}
    Wait Until Page Contains Element    ${banner_image}   20s
    Choose File  ${banner_image}   ${IMAGE_FILE}
    Wait until page contains element    xpath=//div[contains(text(),'File uploaded successfully')]      20s
    Sleep    3s
    Click element    xpath=(//img[@aria-label='Delete Banner'])[1]
    Sleep    3s
    Choose File  ${banner_image}   ${IMAGE_FILE}
    Wait until page contains element    xpath=//div[contains(text(),'File uploaded successfully')]      20s
    Sleep    10s
    Scroll element into view    ${next_button2}
    Click element      ${next_button2}
    Wait until element is visible    ${thankyou_mail}     60s
    Click element    ${thankyou_mail}
    sleep    2s
    Click button    ${next_button3}
    Sleep    5s
    ${IMAGE_FILE}=   Normalize Path    ${REL_IMAGE_FILE}
#    Wait Until Page Contains Element    ${Webinar Logo}   20s
    Choose File  ${Webinar Logo}   ${IMAGE_FILE}
    Sleep    3s
    Click element    ${logo_save_btn}
    Wait until page contains element    xpath=//div[contains(text(),'File uploaded successfully')]      20s
    Sleep    3s
    Click element    xpath=(//img[@aria-label='Delete webinar logo'])[1]
    Sleep    3s
    # After deleting the webinar logo again uploading the webinar logo
    Choose File  ${Webinar Logo}   ${IMAGE_FILE}
    Sleep    3s
    Click element    ${logo_save_btn}
    Sleep    2s
    Wait until page contains element    xpath=//div[contains(text(),'File uploaded successfully')]      20s
    ${IMAGE_FILE}=   Normalize Path    ${REL_IMAGE_FILE}
    Wait Until Page Contains Element    ${Webinar Background}   20s
    Choose File  ${Webinar Background}   ${IMAGE_FILE}
    Sleep    2s
    Wait until page contains element    xpath=//div[contains(text(),'File uploaded successfully')]      20s
    Click element    xpath=(//img[@aria-label='Delete Webinar Background'])[1]
    Sleep    3s
    Choose File  ${Webinar Background}   ${IMAGE_FILE}
    Sleep    2s
    Wait until page contains element    xpath=//div[contains(text(),'File uploaded successfully')]      20s
    ${video_FILE}=   Normalize Path    ${REL_Video_FILE}
    Wait Until Page Contains Element    ${Webinar Intro Video}   20s
    Sleep    4s
    Choose File  ${Webinar Intro Video}   ${video_FILE}
    Wait until element is visible    xpath=//div[contains(text(),'File uploaded successfully')]     20s
    Sleep    2s
    Click element    xpath=(//img[@aria-label='Delete Intro video'])[1]
    Sleep    3s
    Choose File  ${Webinar Intro Video}   ${video_FILE}
    Wait until element is visible    xpath=//div[contains(text(),'File uploaded successfully')]     10s
    Click button    ${next_button3}
    Sleep    4s

Engagement
    Sleep    3s
#    Scroll element into view    ${poll_toggle}
#    Wait until element is visible    ${poll_toggle}  10s
    Click element    ${poll_toggle}
#    Wait until element is visible   ${resources}    10s
#    Scroll element into view    ${resources}
    Click element    ${resources}
    Sleep    4s
#    Wait until element is visible    ${finish_btn} 10s
    Click element    ${finish_btn}

Delete Survey
    Wait until element is visible    ${survey_delete_btn}   10s
    Click element    ${survey_delete_btn}
    Wait until element is visible    ${cnf_survey_delete_btn}   10s
    Click element    ${cnf_survey_delete_btn}
    Wait until element is visible    xpath=//div[contains(text(),'Survey deleted successfully')]    10s
    Sleep    3s
    Wait until page contains    No survey added yet!    10s

Edit Survey for Webinar
    Wait until element is visible    ${survey_edit_btn}     10s
    Click element    ${survey_edit_btn}
    ${current_value}=    Get Element Attribute     ${survey_title}    value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
          Press Keys     ${survey_title}     ${KEY_BACKSPACE}
    END
    Input text    ${survey_title}       ${Edited_survey_title}
    Click element    ${survey_next_btn}
    Click element   ${survey_update_btn}
    Sleep    3s
    Wait until element is visible    xpath=//div[contains(text(),'Survey updated successfully')]
    Sleep    3s


Create survey for Webinar
    Wait until element is visible    ${create_survey_btn}   10s
    Click element    ${create_survey_btn}
    Input text    ${survey_title}       ${title}
    Input text   ${survey_description}  ${description}
    Click element    ${survey_next_btn}
    Wait until element is visible    ${survey_question_dropdown}    10s
    Click element    ${survey_question_dropdown}
    Sleep    3s
    Input text      ${survey_question_field}        ${question}
    Wait until element is visible     ${survey_question_type}
    Click element   ${survey_question_type}
    Click element    ${select_single_choice}
    Sleep    3s
    Input text    ${survey_option_field}    ${options}
    Sleep    3s
    Click element    ${survey_create_btn}
    Sleep    3s
    Wait until element is visible    xpath=//div[contains(text(),'Survey created successfully')]    10s


Delete Speaker
        Wait until element is visible    ${delete_speaker_btn}      10s
        Click element    ${delete_speaker_btn}
        Wait until element is visible    ${cnf_delete_speaker_btn}  10s
        Click element    ${cnf_delete_speaker_btn}
        Wait until element is visible    xpath=//div[contains(text(),'Speaker deleted successfully')]   10s
        Page should not contain    Tarik

Edit Speaker Details
        Wait until element is visible    ${edit_speaker_btn}    10s
        Click element    ${edit_speaker_btn}
        ${current_value}=    Get Element Attribute     ${speaker_name_field}     value
        Log    Current field value: ${current_value}
        ${length}=    Get Length    ${current_value}
        Log    Number of characters to delete: ${length}
        ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
        FOR    ${i}    IN RANGE    ${length}
            Press Keys      ${speaker_name_field}      ${KEY_BACKSPACE}
        END
        Input text      ${speaker_name_field}   ${Edit_speaker_name}
        Click element    ${speaker_details_update_btn}
        Wait until element is visible    xpath=//div[contains(text(),'speaker_updated_successfully')]   10s
        Wait until page contains    Tarik   10s
        Sleep    3s
Add Speaker
        Wait until element is visible    ${add_speaker_btn}     10s
        Click element    ${add_speaker_btn}
        ${IMAGE_FILE}=   Normalize Path    ${REL_IMAGE_FILE}
        Wait Until Page Contains Element    ${speaker_image}   20s
        Choose File  ${speaker_image}   ${IMAGE_FILE}
        Wait until element is visible    xpath=//div[contains(text(),'Profile pic updated')]
        Input text    ${speaker_name_field}     ${speaker_name}
        Input text    ${speaker_email_field}    ${speaker_email}
        Input text    ${speaker_title_field}    ${speaker_title}
        Click element    ${speaker_add_btn}
        Wait until element is visible    xpath=//div[contains(text(),'Speaker added successfully')]     10s


Delete_webinar
        Login   ${email}    ${password}
        Wait until element is visible    ${Webinar_button}
        Click element    ${Webinar_button}
        Wait until element is visible   ${select_webinar}   25s
        Click element       ${select_webinar}
        Wait until element is visible    ${Delete_webinar}     35s
        Click button    ${delete_webinar}
        Wait until element is visible    ${confirm_delete}      35s
        Click button    ${confirm_delete}
        Sleep    10s
        Close all browsers