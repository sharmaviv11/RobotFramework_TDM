*** Settings ***
Documentation   Centric Raw Dimension Tables Testing
Library     OperatingSystem
Library     String
Library     SeleniumLibrary
Library     BuiltIn
Library     Collections
Library     DatabaseLibrary
#Library     DataDriver      file=("file location")      encoding=utf_8
Resource    resourcefile.robot
#Test Teardown       Close Browser


*** Test Cases ***
Test Case_1: Validate successful login
    open the browser with snowflake URL
    wait until element is visible and sign in

Test Case_2: Change role to SNOWFLAKE_READER_DEV
    click on the user and switch role to SNOWFLAKE_READER_DEV

Test Case_3: DIM ACTIVITY - show results as CSV format in snowflake and compare it with API source CSV file for rows count and data validation
    resourcefile.open new worksheet
    enter SQL statement
    resourcefile.click on Run button to execute SQL
    show results as CSV format and compare it with API source CSV file

Test Case_4: DIM ACTIVITY - Compare QA data with RAW data
    open new worksheet and run sqls for DIM ACTIVITY RAW and QA layer and then compare

Test Case_5: DIM PRODTRAKLOCATION - Compare QA data with RAW data
    open new worksheet and run sqls for DIM PRODTRAKLOCATION RAW and QA layer and then compare

#Test Case_6: DIM PRODTRAKLOCATION - Data quality check when data is transformed from RAW to QA
#    open new worksheet and run sqls for DIM PRODTRAKLOCATION


*** Keywords ***

# Test Case_1: Validate successful login
Open the browser with snowflake URL
    Create Webdriver  Chrome
    go to       ${url}
    maximize browser window

wait until element is visible and sign in
    wait until element is visible   css:.sso-login-button
    click element   css:.sso-login-button
    set selenium timeout    30s

# Test Case_2: Change role to SNOWFLAKE_READER_DEV
click on the user and switch role to SNOWFLAKE_READER_DEV
        sleep       2s
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


#Test Case_3: DIM ACTIVITY - show results as CSV format in snowflake and compare it with API source CSV file for rows count and data validation
enter SQL statement
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-RAW-DIM-ACTIVITY_TC_3}
        sleep       2s

show results as CSV format and compare it with API source CSV file
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
        @{list_sf}=            create list         ${results}
        ${split_sf}=            split to lines      ${results}
        log to console                              ${split_sf}
        ${get_line_count_sf}=       get line count      @{list_sf}
        ${get_cols_sf}=     get lines containing string     @{list_sf}       ACTIVITYID
        ${get_linenumber_sf}=      get line            @{list_sf}     14
        ${get_lines_sf}=     get lines containing string     @{list_sf}     Mine
        @{compare_line_count_sf}=           create list         ${get_line_count_sf}
        @{compare_cols_sf}=          create list         ${get_cols_sf}
        @{compare_linenumber_sf}=           create list         ${get_linenumber_sf}
        @{compare_lines_sf}=        create list         ${get_lines_sf}

        # Get CSV file with same data from your local machine
        ${csv_file}=                Get file            S3_activity.csv
        @{csv_source}=              create list         ${csv_file}
        ${split_source}=            split to lines      ${csv_file}
        log to console                                  ${split_source}
        ${get_line_count_source}=        get line count      @{csv_source}
        ${get_cols_source}=     get lines containing string     @{csv_source}       ACTIVITYID
        ${get_linenumber_source}=       get line            @{csv_source}      14
        ${get_lines_source}=      get lines containing string     @{csv_source}       Mine
        @{compare_line_count_source}=            create list         ${get_line_count_source}
        @{compare_cols_source}=      create list         ${get_cols_source}
        @{compare_linenumber_source}=           create list         ${get_linenumber_source}
        @{compare_lines_source}=         create list         ${get_lines_source}

        # Compare snowflake CSV results with external CSV file
        lists should be equal       ${compare_line_count_sf}        ${compare_line_count_source}
        lists should be equal       ${compare_cols_sf}       ${compare_cols_source}
        lists should be equal       ${compare_linenumber_sf}        ${compare_linenumber_source}
        lists should be equal       ${compare_lines_sf}     ${compare_lines_source}
        should be equal as strings      ${split_sf}     ${split_source}


#Test Case_4: DIM ACTIVITY - Compare QA data with RAW data
open new worksheet and run sqls for DIM ACTIVITY RAW and QA layer and then compare
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
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-RAW-DIM-ACTIVITY_TC_4}
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
        ${get_raw_results_linenumber}=      get line            @{raw_results_list}     240
        ${get_raw_results_lines_partial}=     get lines containing string     @{raw_results_list}       ACTIVITYID
        ${get_raw_results_lines_partial_1}=     get lines containing string     @{raw_results_list}     Rad
        @{lines_raw_results}=           create list         ${get_raw_results_lines}
        @{linenumber_raw_result}=           create list         ${get_raw_results_linenumber}
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
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-QA-DIM-ACTIVITY_TC_4}
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
        ${get_qa_results_linenumber}=      get line            @{qa_results_list}     240
        ${get_qa_results_lines_partial}=     get lines containing string     @{qa_results_list}     ACTIVITYID
        ${get_qa_results_lines_partial_1}=     get lines containing string     @{qa_results_list}   Rad
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


#Test Case_5: DIM PRODTRAKLOCATION - Compare QA data with RAW data
open new worksheet and run sqls for DIM PRODTRAKLOCATION RAW and QA layer and then compare
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
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-RAW-DIM-PRODTRAKLOCATION_TC_5}
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
        ${get_raw_results_linenumber}=      get line            @{raw_results_list}     356
        ${get_raw_results_lines_partial}=     get lines containing string     @{raw_results_list}       ISSTOPE
        ${get_raw_results_lines_partial_1}=     get lines containing string     @{raw_results_list}     045
        @{lines_raw_results}=           create list         ${get_raw_results_lines}
        @{linenumber_raw_result}=           create list         ${get_raw_results_linenumber}
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
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-QA-DIM-PRODTRAKLOCATION_TC_5}
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
        ${get_qa_results_linenumber}=      get line            @{qa_results_list}     356
        ${get_qa_results_lines_partial}=     get lines containing string     @{qa_results_list}     ISSTOPE
        ${get_qa_results_lines_partial_1}=     get lines containing string     @{qa_results_list}   045
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


#Test Case_6: DIM PRODTRAKLOCATION - Data quality check when data is transformed from RAW to QA
open new worksheet and run sqls for DIM PRODTRAKLOCATION
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
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-RAW-DIM-PRODTRAKLOCATION_TC_6}
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
        ${get_raw_results_linenumber}=      get line            @{raw_results_list}     5
        ${get_raw_results_lines_partial}=     get lines containing string     @{raw_results_list}       ISSTOPE
        ${get_raw_results_lines_partial_1}=     get lines containing string     @{raw_results_list}     Reconcilor Digblock
        @{lines_raw_results}=           create list         ${get_raw_results_lines}
        @{linenumber_raw_result}=           create list         ${get_raw_results_linenumber}
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
        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-QA-DIM-PRODTRAKLOCATION_TC_6}
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
        ${get_qa_results_linenumber}=      get line            @{qa_results_list}     5
        ${get_qa_results_lines_partial}=     get lines containing string     @{qa_results_list}     ISSTOPE
        ${get_qa_results_lines_partial_1}=     get lines containing string     @{qa_results_list}   Reconcilor Digblock
        @{lines_qa_results}=           create list         ${get_qa_results_lines}
        @{linenumber_qa_result}=           create list         ${get_qa_results_linenumber}
        @{multiple_qa_results_partial}=        create list         ${get_qa_results_lines_partial}
        @{multiple_qa_results_partial_1}=  create list     ${get_qa_results_lines_partial_1}
#        log to console                                  ${multiple_qa_results}


        lists should be equal           ${lines_raw_results}        ${lines_qa_results}
        lists should be equal          ${linenumber_raw_result}       ${linenumber_qa_result}
        lists should be equal           ${multiple_raw_results_partial}     ${multiple_qa_results_partial}
        lists should be equal           ${multiple_raw_results_partial_1}         ${multiple_qa_results_partial_1}
        lists should be equal           ${raw_results_list}       ${qa_results_list}

