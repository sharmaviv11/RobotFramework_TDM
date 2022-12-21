*** Settings ***
Documentation   Automation Testing Demo
...             Settings, Test Cases, Variables and Keywords are all different modules
...             'Test Cases' module consists of name of the test case and then business/custom keywords or you can also say child steps
...             Under the 'Keywords' module > business keywords mentioned in the 'Test Case' module needs to be tied up in the form of selenium library keywords
Library     OperatingSystem
Library     String
Library     SeleniumLibrary
Library     BuiltIn
Library     Collections
#Library     DiffLibrary
Resource    resourcefile.robot
#Test Teardown       Close Browser


*** Test Cases ***
Test Case_1: Validate successful login
    open the browser with snowflake URL
    wait until element is visible and sign in

Test Case_2: Change role to SNOWFLAKE_READER_DEV
    click on the user and switch role to SNOWFLAKE_READER_DEV

Test Case_3: Query data in raw and qa layer
    open existing worksheet for raw and qa layer and then compare





*** Keywords ***

# Test Case_1: Validate successful login
Open the browser with snowflake URL
    Create Webdriver  Edge
    go to       ${url}
    maximize browser window

wait until element is visible and sign in
    wait until element is visible   css:.sso-login-button
    click element   css:.sso-login-button
    set selenium timeout    30s

# Test Case_2: Change role to SNOWFLAKE_READER_DEV
click on the user and switch role to SNOWFLAKE_READER_DEV
        sleep       3s
        # click on user drop down
        wait until element is visible       css:.x-btn-arrow-right
        click element                       css:.x-btn-arrow-right
        # switch role
        sleep       3s
        wait until element is visible       css:.menu-item-icon-right_1vqg841
        click element                       css:.menu-item-icon-right_1vqg841
        sleep       3s
        # select role
        wait until element is visible       xpath://*[@id="sleet-component-1327"]/div/div[2]/div[2]/div[1]/div/div[2]
        click element                       xpath://*[@id="sleet-component-1327"]/div/div[2]/div[2]/div[1]/div/div[2]
        sleep       3s
        # again select role
        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[7]/div[1]/div[4]
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[7]/div[1]/div[4]
        sleep       3s
        # click change role
        wait until element is enabled       xpath=//*[@id="sleet-component-1187"]/div/div/div[2]/div[3]/span/div/div/div/div/form/div[1]/div/div[2]/div/span
        click element                       xpath=//*[@id="sleet-component-1187"]/div/div/div[2]/div[3]/span/div/div/div/div/form/div[1]/div/div[2]/div/span
        # click drop down menu to change role
        sleep       3s
        wait until element is enabled       class:stylesSelectDropdown__opener_____Isx
        click element                       class:stylesSelectDropdown__opener_____Isx
        sleep       3s
        # enter role type and enter
        input text                          css:#sleet-component-1187 > div > div > div.styles__sql-worksheet___RPnn_ > div.styles__context-menu___KOw8b > span > div > div > div > div > form > div:nth-child(1) > div > div.styles__line-item-value___Jp_wv > span > div > div.stylesSelectDropdown__select-wrapper___h3D2f > div > div > div.react-selectize-search-field-and-selected-values > input        SNOWFLAKE_READER_DEV
        sleep       2s
        press keys                          css:#sleet-component-1187 > div > div > div.styles__sql-worksheet___RPnn_ > div.styles__context-menu___KOw8b > span > div > div > div > div > form > div:nth-child(1) > div > div.styles__line-item-value___Jp_wv > span > div > div.stylesSelectDropdown__select-wrapper___h3D2f > div > div > div.react-selectize-search-field-and-selected-values > input        RETURN
        sleep       3s
        input text                          css:#sleet-component-1187 > div > div > div.styles__sql-worksheet___RPnn_ > div.styles__context-menu___KOw8b > span > div > div > div > div > form > div:nth-child(2) > div > div.styles__line-item-value___Jp_wv > div > div:nth-child(1) > div.stylesSelectDropdown__select-wrapper___h3D2f > div > div > div.react-selectize-search-field-and-selected-values > input        DEFAULT
        press keys                          css:#sleet-component-1187 > div > div > div.styles__sql-worksheet___RPnn_ > div.styles__context-menu___KOw8b > span > div > div > div > div > form > div:nth-child(2) > div > div.styles__line-item-value___Jp_wv > div > div:nth-child(1) > div.stylesSelectDropdown__select-wrapper___h3D2f > div > div > div.react-selectize-search-field-and-selected-values > input        RETURN


#Test Case_3: Query data in raw and qa layer
open existing worksheet for raw and qa layer and then compare
        sleep       2s
        # open new worksheet and run sql for RAW layer
        # click down arrow icon button to open existing worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        sleep       2s
        # open worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        click element                       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        sleep       2s
        # search worksheet
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        input text                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       weekly_report_stopegeo_raw
        sleep       2s
        # select worksheet
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
        click element                       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
        sleep       2s
        # click on open button
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        sleep       2s
        # click in the worksheet
        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        sleep       2s
        # click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        sleep       2s
        # click on download button
        wait until element is enabled       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        click element                       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        sleep       2s
        # select CSV radio button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[3]/div[2]/div/div[2]/input
        sleep       2s
        # show in dialog
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        sleep       1s
        # click into text area and copy results
        scroll element into view            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        set focus to element                xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        ${raw_results}=                 get text            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        sleep       1s
        # close dialog box
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        click button                        xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        @{raw_results_list}=            create list         ${raw_results}
        ${get_raw_results_lines}=       get line count      @{raw_results_list}
        ${get_raw_results_linenumber}=      get line            @{raw_results_list}     100
        ${get_raw_results_lines_partial}=     get lines containing string     @{raw_results_list}       STOPE_NAME
        ${get_raw_results_lines_partial_1}=     get lines containing string     @{raw_results_list}     032_EMR_314_524_STP
        @{lines_raw_results}=           create list         ${get_raw_results_lines}
        @{linenumber_raw_result}=           create list         ${get_raw_results_linenumber}
        @{multiple_raw_results_partial}=        create list         ${get_raw_results_lines_partial}
        @{multiple_raw_results_partial_1}=  create list     ${get_raw_results_lines_partial_1}
#        log to console                                  ${multiple_raw_results}
        sleep       2s

        # open new worksheet and run sql for QA layer
        # click down arrow icon button to open existing worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        sleep       2s
        # open worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        click element                       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        sleep       2s
        # search worksheet
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        input text                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       weekly_report_stopegeo_qa
        sleep       4s
        # select worksheet
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[1]/label/div[1]
        click element                       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[1]/label/div[1]
        sleep       3s
        # click on open button
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        sleep       2s
        # click in the worksheet
        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        sleep       2s
        # click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        sleep       2s
        # click on download button
        wait until element is enabled       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        click element                       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        sleep       2s
        # select CSV radio button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[3]/div[2]/div/div[2]/input
        sleep       2s
        # show in dialog
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        sleep       2s
        # click into text area and copy results
        scroll element into view            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        set focus to element                xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        sleep   2s
        ${qa_results}=                 get text            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        sleep       1s
        # close dialog box
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        click button                        xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        @{qa_results_list}=            create list         ${qa_results}
        ${get_qa_results_lines}=       get line count      @{qa_results_list}
        ${get_qa_results_linenumber}=      get line            @{qa_results_list}     100
        ${get_qa_results_lines_partial}=     get lines containing string     @{qa_results_list}     STOPE_NAME
        ${get_qa_results_lines_partial_1}=     get lines containing string     @{qa_results_list}   032_EMR_314_524_STP
        @{lines_qa_results}=           create list         ${get_qa_results_lines}
        @{linenumber_qa_result}=           create list         ${get_qa_results_linenumber}
        @{multiple_qa_results_partial}=        create list         ${get_qa_results_lines_partial}
        @{multiple_qa_results_partial_1}=  create list     ${get_qa_results_lines_partial_1}
#        log to console                                  ${multiple_qa_results}

        lists should be equal           ${lines_raw_results}        ${lines_qa_results}
        lists should be equal           ${linenumber_raw_result}       ${linenumber_qa_result}
        lists should be equal           ${multiple_raw_results_partial}     ${multiple_qa_results_partial}
        lists should be equal           ${multiple_raw_results_partial_1}         ${multiple_qa_results_partial_1}
        lists should be equal           ${raw_results_list}       ${qa_results_list}











