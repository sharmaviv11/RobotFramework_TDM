*** Settings ***
Documentation       A resource file is where global keywords or variables are defined
...                 and can be called from the test file
Library             SeleniumLibrary


*** Variables ***
${url}                      https://bhp-sydney.privatelink.snowflakecomputing.com/console/login#/
${url1}                     https://dig2design.bhp.com/portal-scene/c20c0962fc634391959034247a6e6951
${Power_BI}                 https://app.powerbi.com/groups/me/reports/b9d92d83-bbf4-49a5-8c31-e4c673878a26/ReportSection03687e4ea68b2a3f022c?ctid=4f6e1565-c2c7-43cb-8a4c-0981d022ce20
${OD_report_name}                  OD Daily Grade Report
${OD_main_heading}                 OD-Geoscience-TDM-All-Dev
${Screenshots}              C:/Users/sharvive/PycharmProjects/pythonProject/RobotFramework/Screenshots
${Activity_Screenshots}            C:/Users/sharvive/PycharmProjects/pythonProject/RobotFramework/Tests/PH/Activity_Screenshots
${Destination_Screenshots}         C:/Users/sharvive/PycharmProjects/pythonProject/RobotFramework/Tests/PH/Destination_Screenshots
${Movement_Screenshots}          C:/Users/sharvive/PycharmProjects/pythonProject/RobotFramework/Tests/PH/Movement_Screenshots
${Screenshots_UAT}          C:/Users/sharvive/PycharmProjects/pythonProject/RobotFramework/Tests/PH/Screenshots_UAT
${Screenshots_PROD}          C:/Users/sharvive/PycharmProjects/pythonProject/RobotFramework/Tests/PH/Screenshots_PROD
${PH_DIM_ACTIVITY_QA_UAT}               PH_DIM_ACTIVITY_QA_UAT
${PH_DIM_ACTIVITY_Conformed_UAT}        PH_DIM_ACTIVITY_Conformed_UAT
${PH_DESTINATION_QA_UAT}                PH_DESTINATION_QA_UAT
${PH_DESTINATION_Conformed_UAT}         PH_DESTINATION_Conformed_UAT
${PH_MOVEMENT_QA_UAT}                   PH_MOVEMENT_QA_UAT
${PH_MOVEMENT_Conformed_UAT}            PH_MOVEMENT_Conformed_UAT
${PH_OPERATOR_QA_UAT}                   PH_OPERATOR_QA_UAT
${PH_OPERATOR_Conformed_UAT}            PH_OPERATOR_Conformed_UAT
${PH_PLAN_QA_UAT}                       PH_PLAN_QA_UAT
${PH_PLAN_Conformed_UAT}                PH_PLAN_Conformed_UAT
${PH_PRODUCT_QA_UAT}                    PH_PRODUCT_QA_UAT
${PH_PRODUCT_Conformed_UAT}             PH_PRODUCT_Conformed_UAT
${PH_RESOURCE_QA_UAT}                   PH_RESOURCE_QA_UAT
${PH_RESOURCE_Conformed_UAT}            PH_RESOURCE_Conformed_UAT
${PH_SOURCE_LOCATION_QA_UAT}            PH_SOURCE_LOCATION_QA_UAT
${PH_SOURCE_LOCATION_Conformed_UAT}     PH_SOURCE_LOCATION_Conformed_UAT

${PH_DIM_ACTIVITY_QA_PROD}              PH_DIM_ACTIVITY_QA_PROD
${PH_DIM_ACTIVITY_Conformed_PROD}       PH_DIM_ACTIVITY_Conformed_PROD
${PH_DESTINATION_QA_PROD}               PH_DESTINATION_QA_PROD
${PH_DESTINATION_Conformed_PROD}        PH_DESTINATION_Conformed_PROD
${PH_MOVEMENT_QA_PROD}                  PH_MOVEMENT_QA_PROD
${PH_MOVEMENT_Conformed_PROD}           PH_MOVEMENT_Conformed_PROD
${PH_OPERATOR_QA_PROD}                  PH_OPERATOR_QA_PROD
${PH_OPERATOR_Conformed_PROD}           PH_OPERATOR_Conformed_PROD
${PH_PLAN_QA_PROD}                      PH_PLAN_QA_PROD
${PH_PLAN_Conformed_PROD}               PH_PLAN_Conformed_PROD
${PH_PRODUCT_QA_PROD}                   PH_PRODUCT_QA_PROD
${PH_PRODUCT_Conformed_PROD}            PH_PRODUCT_Conformed_PROD
${PH_RESOURCE_QA_PROD}                  PH_RESOURCE_QA_PROD
${PH_RESOURCE_Conformed_PROD}           PH_RESOURCE_Conformed_PROD
${PH_SOURCE_LOCATION_QA_PROD}           PH_SOURCE_LOCATION_QA_PROD
${PH_SOURCE_LOCATION_Conformed_PROD}    PH_SOURCE_LOCATION_Conformed_PROD




*** Keywords ***

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
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
        click element                       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
#        press keys                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       RETURN
        sleep       2s
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        sleep       5s
        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        sleep       2s
click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element

navigate to worksheet
        sleep       2s
        # open new worksheet and run sql for RAW layer
        # click down arrow icon button to open existing worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        click element                       css:#sleet-component-1187 > div > div > div.style__tab-bar___gp1ot > div.style__control___WWaOg > div.style__control-child___KuDMk.style__control-dropdown___NkvU2 > div.inline-icon-button
        sleep       2s
        # open worksheet
        wait until element is enabled       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        click element                       css:#sleet-component-1187 > div > span > div > div > div > div > div:nth-child(1)
        sleep       6s


#        # search worksheet
#        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
#        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input
#        input text                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       weekly_report_stopegeo_raw
#        sleep       2s
#        # select worksheet
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
#        click element                       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
#        sleep       2s
#        # click on open button
#        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
#        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
#        sleep       2s
#        # click in the worksheet
#        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
#        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
#        sleep       2s

run query and save data into list for RAW layer
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
        set global variable     ${raw_results_list}
        ${get_raw_results_lines}=       get line count      @{raw_results_list}
        ${get_raw_results_linenumber}=      get line            @{raw_results_list}     100
        ${get_raw_results_lines_partial}=     get lines containing string     @{raw_results_list}       STOPE_NAME
        ${get_raw_results_lines_partial_1}=     get lines containing string     @{raw_results_list}     032_EMR_314_524_STP
        @{lines_raw_results}=           create list         ${get_raw_results_lines}
        set global variable     ${lines_raw_results}
        @{linenumber_raw_result}=           create list         ${get_raw_results_linenumber}
        set global variable     ${linenumber_raw_result}
        @{multiple_raw_results_partial}=        create list         ${get_raw_results_lines_partial}
        set global variable     ${multiple_raw_results_partial}
        @{multiple_raw_results_partial_1}=  create list     ${get_raw_results_lines_partial_1}
        set global variable     ${multiple_raw_results_partial_1}
#        log to console                                  ${multiple_raw_results}
        sleep       2s

run query and save data into list for QA layer
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

        ${raw}=     get variable value      ${lines_raw_results}







#Close Browser Session
#    close browser
