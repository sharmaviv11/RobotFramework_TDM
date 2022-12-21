*** Settings ***
Documentation   Automation Testing Demo
Library     OperatingSystem
Library     String
Library     SeleniumLibrary
Library     BuiltIn
Library     Collections
Library     DiffLibrary
#Library     DataDriver      file=("file location")      encoding=utf_8
Resource    resourcefile.robot
#Test Teardown       Close Browser


*** Test Cases ***
Test Case_1: Validate successful login
    open the browser with snowflake URL
    wait until element is visible and sign in

Test Case_2: Change role to SNOWFLAKE_READER_DEV
    click on the user and switch role to SNOWFLAKE_READER_DEV

Test Case_3: qa layer - show results as CSV format in snowflake and compare it with external CSV file for rows count and data validation
    open existing worksheet
#    enter SQL statement
    click on Run button to execute SQL
    show results as CSV format and compare it with local CSV file

Test Case_4: QA layer - Compare QA data with qa data without NULL and BLANK values
    open existing worksheets and run sqls for collar rig qa and QA layer and then compare


#Test Case_5: QA layer rule check for number & date columns
#    null values for number & date columns in the qa layer should be displayed as null in qa layer


#Test Case_6: QA layer rule check for textfield columns
#    null values for textfield columns in the qa layer should be displayed as blank in qa layer


#Test Case_7:
#Conformed layer data check



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


#Test Case_3: qa layer - show results as CSV format in snowflake and compare it with external CSV file for rows count and data validation
open existing worksheet
        sleep       2s
        # click down arrow icon button to open existing worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        sleep       3s
        # open worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        click element                       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        sleep       2s
        # search worksheet
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        input text                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       SQL-RAW-COLLAR_TC_3
        sleep       2s
        # select worksheet
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
        click element                       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
#        press keys                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       RETURN
        sleep       2s
        # click on open button
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        sleep       5s
        # click in the worksheet
        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        sleep       2s
click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
#enter SQL statement
#        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-RAW-COLLAR_TC_3}
#        sleep       2s

show results as CSV format and compare it with local CSV file
        sleep       2s
        # click on download button
        wait until element is enabled       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        click element                       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        sleep       2s
        # select CSV radio button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[3]/div[2]/div/div[2]/input
        sleep       2s
#        # Export
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
#        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
        # show in dialog
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        sleep       1s
        # click into text area and copy results
        scroll element into view            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        set focus to element                xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        ${results}=                 get text            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        sleep       1s
        # close dialog box
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        click button                        xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        @{results_list}=            create list         ${results}
        ${results_split}=           split to lines      ${results}
        ${get_results_lines}=       get line count      @{results_list}
        ${get_results_line_header}=     get lines containing string     @{results_list}       PROJECTCODE
        ${get_results_linenumber}=      get line            @{results_list}     9
        ${get_results_lines_all}=     get lines containing string     @{results_list}     DRILLHOLE
        @{lines_results}=           create list         ${get_results_lines}
        @{verify_columns_results}=          create list         ${get_results_line_header}
        @{line_9_result}=           create list         ${get_results_linenumber}
        @{multiple_results}=        create list         ${get_results_lines_all}
#        log to console                                  ${multiple_results}
        # Get CSV file with same data from your local machine
        ${csv_file}=                Get file            collar_test.csv
        @{collar_rig}=              create list         ${csv_file}
        ${collar_split}=            split to lines      ${csv_file}
        ${get_collar_lines}=        get line count      @{collar_rig}
        ${get_collar_line_header}=     get lines containing string     @{results_list}       PROJECTCODE
        ${get_collar_linenumber}=       get line            @{collar_rig}      9
        ${get_collar_lines_all}=      get lines containing string     @{collar_rig}       DRILLHOLE
        @{lines_collar}=            create list         ${get_collar_lines}
        @{verify_columns_csv}=      create list         ${get_collar_line_header}
        @{line_9_collar}=           create list         ${get_collar_linenumber}
        @{multiple_collar}=         create list         ${get_collar_lines_all}
#        log to console                                  ${multiple_collar}
        # Compare snowflake CSV results with external CSV file
        lists should be equal       ${lines_results}        ${lines_collar}
        lists should be equal       ${verify_columns_results}       ${verify_columns_csv}
        lists should be equal       ${line_9_result}        ${line_9_collar}
        lists should be equal       ${multiple_results}     ${multiple_collar}
#        should be equal as strings      ${results_split}        ${collar_split}



# Test Case_4: QA layer - Compare QA data with RAW data without NULL and BLANK values
open existing worksheets and run sqls for collar rig RAW and QA layer and then compare
        sleep       2s
        # click down arrow icon button to open existing worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        sleep       3s
        # open worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        click element                       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        sleep       2s
        # search worksheet
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        input text                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       SQL-RAW-COLLAR_TC_4
        sleep       2s
        # select worksheet
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[1]/label/div[1]
        click element                       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[1]/label/div[1]
#        press keys                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       RETURN
        sleep       2s
        # click on open button
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        sleep       5s
        # click in the worksheet
        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        sleep       2s
# click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
#open new worksheet and run sqls for collar rig RAW and QA layer and then compare
#        sleep       2s
#        # click + icon button to open new worksheet
#        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-add___tXsVl > div.inline-icon-button
#        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-add___tXsVl > div.inline-icon-button
#        sleep       3s
#        # click in the worksheet
#        scroll element into view            xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
#        set focus to element                xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
#        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
#        # enter SQL statement
#        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-RAW-COLLAR_TC_4}
#        sleep       5s
#        # click on Run button to execute SQL
#        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
#        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        # click on download button
        wait until element is enabled       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        click element                       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        sleep       2s
        # select CSV radio button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[3]/div[2]/div/div[2]/input
        sleep       2s
#        # Export
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
#        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
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
        ${get_raw_results_linenumber}=      get line            @{raw_results_list}     9
        ${get_raw_results_lines_partial}=     get lines containing string     @{raw_results_list}       EAST
        ${get_raw_results_lines_partial_1}=     get lines containing string     @{raw_results_list}     DRILLED
        @{lines_raw_results}=           create list         ${get_raw_results_lines}
        @{line_9_raw_result}=           create list         ${get_raw_results_linenumber}
        @{multiple_raw_results_partial}=        create list         ${get_raw_results_lines_partial}
        @{multiple_raw_results_partial_1}=  create list     ${get_raw_results_lines_partial_1}
#        log to console                                  ${multiple_raw_results}
        sleep       2s

# open existing worksheet
        sleep       2s
        # click down arrow icon button to open existing worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        sleep       3s
        # open worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        click element                       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        sleep       2s
        # search worksheet
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
        input text                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       SQL-QA-COLLAR_TC_4
        sleep       2s
        # select worksheet
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[1]/label/div[1]
        click element                       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[1]/label/div[1]
#        press keys                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       RETURN
        sleep       2s
        # click on open button
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        sleep       5s
        # click in the worksheet
        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        sleep       2s
# click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img

#open new worksheet and run sql for collar rig QA layer
        # click + icon button to open new worksheet
#        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-add___tXsVl > div.inline-icon-button
#        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-add___tXsVl > div.inline-icon-button
#        sleep       3s
#        # click in the worksheet
#        scroll element into view            xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
#        set focus to element                xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
#        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
#        # enter SQL statement
#        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-QA-COLLAR_TC_4}
#        sleep       5s
#        # click on Run button to execute SQL
#        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
#        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
##        sleep       6s
#        # delete SQL statement
##        scroll element into view            xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
##        set focus to element                xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
##        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre        RETURN
##        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre        CTRL+a
##        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre        BACKSPACE
        sleep       2s
        # click on download button
        wait until element is enabled       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        click element                       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        sleep       2s
        # select CSV radio button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[3]/div[2]/div/div[2]/input
        sleep       2s
#        # Export
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
#        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
        # show in dialog
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        sleep       1s
        # click into text area and copy results
        scroll element into view            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        set focus to element                xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        ${qa_results}=                 get text            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        sleep       1s
        # close dialog box
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        click button                        xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        @{qa_results_list}=            create list         ${qa_results}
        ${get_qa_results_lines}=       get line count      @{qa_results_list}
        ${get_qa_results_linenumber}=      get line            @{qa_results_list}     9
        ${get_qa_results_lines_partial}=     get lines containing string     @{qa_results_list}     EAST
        ${get_qa_results_lines_partial_1}=     get lines containing string     @{qa_results_list}   DRILLED
        @{lines_qa_results}=           create list         ${get_qa_results_lines}
        @{line_9_qa_result}=           create list         ${get_qa_results_linenumber}
        @{multiple_qa_results_partial}=        create list         ${get_qa_results_lines_partial}
        @{multiple_qa_results_partial_1}=  create list     ${get_qa_results_lines_partial_1}
#        log to console                                  ${multiple_qa_results}

#        diff files      ${raw_results}      ${qa_results}
        lists should be equal           ${lines_raw_results}        ${lines_qa_results}
        lists should be equal           ${line_9_raw_result}        ${line_9_qa_result}
        lists should be equal           ${multiple_raw_results_partial}     ${multiple_qa_results_partial}
        lists should be equal           ${multiple_raw_results_partial_1}         ${multiple_qa_results_partial_1}
        lists should be equal           ${raw_results_list}        ${qa_results_list}


#Test Case_5: QA layer rule check for number & date columns
null values for number & date columns in the raw layer should be displayed as null in qa layer
        sleep       2s
        # click + icon button to open new worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-add___tXsVl > div.inline-icon-button
        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-add___tXsVl > div.inline-icon-button
        sleep       3s
        # click in the worksheet
        scroll element into view            xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
        set focus to element                xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
        # enter SQL statement
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-RAW-NUMERIC-TC_5}
        sleep       5s
        # click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        # click on download button
        wait until element is enabled       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        click element                       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        sleep       2s
        # select CSV radio button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[3]/div[2]/div/div[2]/input
        sleep       2s
#        # Export
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
#        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
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
        ${get_raw_results_linenumber}=      get line            @{raw_results_list}     9
        ${get_raw_results_lines_partial}=     get lines containing string     @{raw_results_list}       DEPTH
        ${get_raw_results_lines_partial_1}=     get lines containing string     @{raw_results_list}     DRILLHOLE
        @{lines_raw_results}=           create list         ${get_raw_results_lines}
        @{line_9_raw_result}=           create list         ${get_raw_results_linenumber}
        @{multiple_raw_results_partial}=        create list         ${get_raw_results_lines_partial}
        @{multiple_raw_results_partial_1}=  create list     ${get_raw_results_lines_partial_1}
#        log to console                                  ${multiple_raw_results}
        sleep       2s

#open new worksheet and run sql for collar rig QA layer
        # click + icon button to open new worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-add___tXsVl > div.inline-icon-button
        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-add___tXsVl > div.inline-icon-button
        sleep       3s
        # click in the worksheet
        scroll element into view            xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
        set focus to element                xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
        # enter SQL statement
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-QA-NUMERIC-TC_5}
        sleep       5s
        # click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
#        sleep       6s
        # delete SQL statement
#        scroll element into view            xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
#        set focus to element                xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre
#        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre        RETURN
#        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre        CTRL+a
#        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre        BACKSPACE
        sleep       2s
        # click on download button
        wait until element is enabled       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        click element                       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
        sleep       2s
        # select CSV radio button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[3]/div[2]/div/div[2]/input
        sleep       2s
#        # Export
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
#        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
        # show in dialog
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
        sleep       1s
        # click into text area and copy results
        scroll element into view            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        set focus to element                xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        ${qa_results}=                 get text            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
        sleep       1s
        # close dialog box
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        click button                        xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
        @{qa_results_list}=            create list         ${qa_results}
        ${get_qa_results_lines}=       get line count      @{qa_results_list}
        ${get_qa_results_linenumber}=      get line            @{qa_results_list}     9
        ${get_qa_results_lines_partial}=     get lines containing string     @{qa_results_list}     DEPTH
        ${get_qa_results_lines_partial_1}=     get lines containing string     @{qa_results_list}   DRILLHOLE
        @{lines_qa_results}=           create list         ${get_qa_results_lines}
        @{line_9_qa_result}=           create list         ${get_qa_results_linenumber}
        @{multiple_qa_results_partial}=        create list         ${get_qa_results_lines_partial}
        @{multiple_qa_results_partial_1}=  create list     ${get_qa_results_lines_partial_1}
#        log to console                                  ${multiple_qa_results}


        lists should be equal           ${lines_raw_results}        ${lines_qa_results}
        lists should be equal           ${line_9_raw_result}        ${line_9_qa_result}
        lists should be equal           ${multiple_raw_results_partial}     ${multiple_qa_results_partial}
        lists should be equal           ${multiple_raw_results_partial_1}         ${multiple_qa_results_partial_1}
#        lists should be equal           ${line_9_result}        ${line_9_qa_result}

