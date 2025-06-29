*** Settings ***

Library    SeleniumLibrary
Library    ../Libraries/ExcelLibrary.py
Resource   ../PageObjects/CommonKeywords.robot
Resource    ../PageObjects/LoginPage.robot
Library    OperatingSystem
Library    BuiltIn

*** Variables ***
${KEY_META}      \\uE03D
${KEY_DELETE}    \\uE017
# All names
${existing_profile_name}     Monster


${view_profile_btn}     //span[normalize-space()='View Profile']
${change_password_btn}      (//button[@type='button'])[3]
${current_password_input_field}     (//input[@id='password'])[1]
${new_password_input_field}     (//input[@id='password'])[2]
${confirm_password_input_field}     (//input[@id='password'])[3]
${save_btn}     xpath=//button[normalize-space()='SAVE']
${profile}  xpath=(//div[contains(@class,'flexMinWidthRow aCntr pdngRLG jEnd gap16 rCompt headerD')]//div[contains(@class,'flexAutoCol')])[1]
${language}     xpath=//small[@class='pdngLMD small'][normalize-space()='Languages']
${hindi_language}   xpath=//span[contains(text(),'Hindi - हिन्दी')]
${english_language}     xpath=//span[normalize-space()='English']

#About & More option
${about}     xpath=(//small[@class='pdngLMD small'][normalize-space()='About & More'])[1]
${inmeet_link}  xpath=//a[normalize-space()='https://inmeet.ai']
${privacy}  xpath=//a[normalize-space()='Data protection and privacy policy']

# Edit profile
${edit_btn}     xpath=//small[normalize-space()='Edit']
${upload_profile}   xpath=//input[@class="imgEdit pointer" or @type="file" or @accept="image/png,image/jpeg,image/" ]
${save_btn}     xpath=//button[normalize-space()='SAVE']
${REL_IMAGE_FILE}  ${CURDIR}${/}..${/}TestFiles${/}Salman.jpg
${delete_profile_btn}   xpath=//small[normalize-space()='Delete']
${confirm_delete_profile_btn}   xpath=(//button[normalize-space()='Delete'])[1]
${edit_profile_btn}     xpath=//button[normalize-space()='Edit Profile']
${profile_name_input_field}     id=name
${profile_save_btn}     xpath=(//button[normalize-space()='SAVE'])[1]

# Verify_Licenses_PymentHistory_Help_Module
${licenses_tab}     xpath=//img[@src='/icons/license.svg']
${payment_history_tab}      xpath=//img[@src='/images/mypaymenthistroyimage.svg']
${help_tab}     xpath=(//img[@alt='help'])[1]

# Transcription
${transcription_tab}    xpath=//img[@alt='transcription']
${all_invitees_toggle}  xpath=//input[@id='allInvitees']
${font_size_slider}     xpath=//input[@type="range"]
${ok_btn}               xpath=//button[normalize-space()='OK']
${yellow_colour}         xpath=(//span[@class='colorBg2 pointer'])[1]
${white_colour}           xpath=(//span[@class='colorBg1 pointer'])[1]



${NAME_LENGTH}    10
${new_profile_name}=    Generate Random String    ${NAME_LENGTH}    [LETTERS]

*** Keywords ***

verify Transcription module
    click on profile dropdown
    click on view profile
    Wait until page contains element    ${transcription_tab}    15s
    Click element    ${transcription_tab}
    Sleep    3s
    Wait until page contains    After generating and publishing, these individuals can view the summary in past meeting details     10s
    Wait until page contains    All Invitees    10s
    Wait until page contains    Here i can able to change the font size and color   10s
    Wait until page contains    Closed Caption Settings     10s
    Sleep    3s
    Wait until page contains element    ${all_invitees_toggle}      15s
    Click element    ${all_invitees_toggle}
    Sleep    3s
   # Approach 2: Drag and Drop By Offset
     Drag And Drop By Offset    ${font_size_slider}    40    0
     Sleep    3s

    Sleep    3s
    Click element    ${yellow_colour}
    Click element    ${ok_btn}
    Sleep    4s

    # Again modify same as old
    Click element    ${all_invitees_toggle}
    Sleep    3s
   # Approach 2: Drag and Drop By Offset
     Drag And Drop By Offset    ${font_size_slider}    -40    0
     Sleep    3s

    Sleep    3s
    Click element    ${white_colour}
    Click element    ${ok_btn}
    Sleep    4s




verify Licenses and Pyment History and Help Module text
    click on profile dropdown
    click on view profile
#    Wait until page contains    ${licenses_tab}     15s
    Sleep    3s
    Click element    ${licenses_tab}
    Sleep    2s
    Wait until page contains    Concurrent  10s
    Wait until page contains    pro  10s
    Wait until page contains    Participants    10s
    Wait until page contains      1500       10s

    #Verify payment history
    Wait until page contains element     ${payment_history_tab}     15s
    Click element   ${payment_history_tab}
    Sleep    3s
    Wait until page contains    Success     10s
    Wait until page contains    1224.84     10s
    Wait until page contains   28, Apr, 2025   10s
    Wait until page contains    concurrent standard  10s
    Wait until page contains    Meetings    10s
    Wait until page contains    680f15892256348dfebb0e91    10s

    # Verify help tab
    Wait until page contains element    ${help_tab}     15s
    Click element    ${help_tab}
    Sleep    2s
    Wait until page contains    We're here to make your experience as smooth and enjoyable as possible. Whether you have a question, need assistance, or want to share your thoughts, we've got you covered.    10s


click on upload image
    Wait until element is visible    ${upload_profile}      15s
    Click element    ${upload_profile}

click on edit profile button
    Wait until element is visible    ${edit_btn}    15s
    Click element    ${edit_btn}

click on save button
    Wait until element is visible    ${save_btn}    15s
    Click element    ${save_btn}

click on profile
    Wait until element is visible    ${profile}    15s
    Click element  ${profile}

click on view profile
    Wait until element is visible     ${view_profile_btn}   15s
    Click element    ${view_profile_btn}


click on language tab
    Wait until element is visible    ${language}       15s
    Click element    ${language}

select hindi language
    Wait until element is visible    ${hindi_language}      15s
    Click element    ${hindi_language}

select english language
    Wait until element is visible    ${english_language}    15s
    Click element    ${english_language}

click on about tab
    Wait until element is visible    ${about}   15s
    Click element    ${about}

click on inmeet link
    Wait until element is visible   ${inmeet_link}       15s
    Click link   ${inmeet_link}

click on privacy link
    Wait until element is visible    ${privacy}     15s
    Click link    ${privacy}


upload profile image
        click on profile dropdown
        click on view profile
        click on edit profile button
        Sleep    3s
         # Normalize the relative file path to a canonical path
        ${IMAGE_FILE}=    Normalize Path    ${REL_IMAGE_FILE}
        # 2. Wait until the <input> is in the DOM (even if hidden)
        Wait Until Page Contains Element   ${upload_profile}    20s
        # 4. Now choose the file
        Choose File    ${upload_profile}   ${IMAGE_FILE}
        Sleep    4s
        click on save button
        Sleep    4s

delete profile image
        click on edit profile button
        Wait until page contains element    ${delete_profile_btn}   15s
        Click element    ${delete_profile_btn}
        Wait until page contains element    ${confirm_delete_profile_btn}   15s
        Click element    ${confirm_delete_profile_btn}
        Wait until page contains    Profile Photo deleted successfully  15s


Change Profile Name With Random Name
    ${new_profile_name}=    Generate Random String    ${NAME_LENGTH}    [LETTERS]
    Log    Generated new profile name: ${new_profile_name}
    click on profile dropdown
    click on view profile
    Wait until page contains element    ${edit_profile_btn}    15s
    Click element    ${edit_profile_btn}
    Wait until page contains element    ${profile_name_input_field}    15s
    Click element    ${profile_name_input_field}
    Sleep    2s
    ${current_value}=    Get Element Attribute    ${profile_name_input_field}    value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys    ${profile_name_input_field}    ${KEY_BACKSPACE}
    END
    Sleep    1s
    ${value_after}=    Get Element Attribute    ${profile_name_input_field}    value
    Log    Field value after deletion: ${value_after}
    Click element    ${profile_name_input_field}
    Input text    ${profile_name_input_field}    ${new_profile_name}
    Sleep    2s
    Wait until page contains element    ${profile_save_btn}    15s
    Click element    ${profile_save_btn}
    Wait until page contains    Profile Updated Successfully    15s
    Wait until page contains    ${new_profile_name}    15s


change profile name with already existing name
#    click on profile dropdown
#    click on view profile
    Wait until page contains element    ${edit_profile_btn}    15s
    Click element    ${edit_profile_btn}
    Wait until page contains element    ${profile_name_input_field}    15s
    Click element    ${profile_name_input_field}
    Sleep    2s
    ${current_value}=    Get Element Attribute    ${profile_name_input_field}    value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys    ${profile_name_input_field}    ${KEY_BACKSPACE}
    END
    Sleep    1s
    ${value_after}=    Get Element Attribute    ${profile_name_input_field}    value
    Log    Field value after deletion: ${value_after}
    Click element    ${profile_name_input_field}
    Input text    ${profile_name_input_field}    ${existing_profile_name}
    Sleep    2s
    Wait until page contains element    ${profile_save_btn}    15s
    Click element    ${profile_save_btn}
    Wait until page contains    Profile Updated Successfully    15s
    Wait until page contains    ${existing_profile_name}    15s

    Sleep    4s
    Click element    ${edit_profile_btn}
    Wait until page contains element    ${profile_name_input_field}    15s
    Click element    ${profile_name_input_field}
    Sleep    2s
    ${current_value}=    Get Element Attribute    ${profile_name_input_field}    value
    Log    Current field value: ${current_value}
    ${length}=    Get Length    ${current_value}
    Log    Number of characters to delete: ${length}
    ${KEY_BACKSPACE}=    Evaluate    sys.modules['selenium.webdriver'].Keys.BACKSPACE    sys, selenium.webdriver
    FOR    ${i}    IN RANGE    ${length}
        Press Keys    ${profile_name_input_field}    ${KEY_BACKSPACE}
    END
    Sleep    1s
    ${value_after}=    Get Element Attribute    ${profile_name_input_field}    value
    Log    Field value after deletion: ${value_after}
    Click element    ${profile_name_input_field}
    Input text    ${profile_name_input_field}    ${existing_profile_name}
    Sleep    2s
    Element should be disabled    ${profile_save_btn}

