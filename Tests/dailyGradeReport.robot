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
Library     DiffLibrary
Resource    resourcefile.robot
#Test Teardown       Close Browser


*** Test Cases ***
Test Case_1: Validate successful login
    open the browser with snowflake URL
    wait until element is visible and sign in

Test Case_2: Change role to SNOWFLAKE_READER_DEV
    click on the user and switch role to SNOWFLAKE_READER_DEV

Test Case_3: Query data in conformed layer
    open existing worksheet
#    enter SQL statement
    click on Run button to execute SQL
#    open report in Power BI
#    browse the report



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


#Test Case_3: Query data in conformed layer
open existing worksheet
        sleep       2s
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
        input text                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       DailyGradeReport_TC_1
        sleep       2s
        # select worksheet
        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
        click element                       xpath://*[@id="ext-element-1"]/div[3]/div/div/div/div[2]/div/div/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[1]/div/div/div/div/div/div/div/span
#        press keys                          css:#ext-element-1 > div:nth-child(3) > div > div > div > div:nth-child(2) > div > div > div.SideTabPanel__container____Dek6.styles__container___oj4Qq > div.SideTabPanel__active-panel___nHvuD.styles__active-panel____TVAp > div > div > div > div.DataTable__table-config-no-edge___eAdpq > div.DataTable__input-container___xSdJ5 > input       RETURN
        sleep       2s
        # click on open button
        wait until element is enabled       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        click element                       css:#ext-element-1 > div:nth-child(3) > div > div > div > div.footer_1g8ixvv-o_O-absoluteFooter_ay4wjb-o_O-footer_d1fb1e > div:nth-child(1) > div:nth-child(1) > button
        sleep       3s
        # click in the worksheet
        wait until element is enabled       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div/pre
        sleep       2s
click on Run button to execute SQL
        wait until element is visible       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        click element                       xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div[2]/button/img
        sleep       2s
#enter SQL statement
#        press keys                          xpath://*[@id="sleet-component-1187"]/div/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div[6]/div[1]/div/div/div/div[5]/div[1]/pre         ${SQL-RAW-COLLAR_TC_3}
#        sleep       2s

#open report in Power BI
#        Create Webdriver  Edge
#        go to       ${Power_BI}
#        maximize browser window
#        wait until page contains element        xpath://*[@id="navBar"]/header/div[1]/modern-breadcrumbs/nav/ul/li/a        10s
#        sleep       5s
#        capture page screenshot                 ${Screenshots}/PBI_Home_Page.png
#        sleep   2s
#        # open mineral table menu
#        open context menu                       css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(18) > transform > div > div.visualContent > div > visual-modern > div > div > div.slicer-content-wrapper > div > i
#        sleep   3s
#        wait until element is visible           xpath://*[@id="0"]
#        click element                           xpath://*[@id="0"]
#        sleep   3s
#        capture page screenshot                 ${Screenshots}/mineral_table_menu.png
#        # show the table
##        wait until element is visible           css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToScreen > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(18) > transform > div > div.visualContent > div > detail-visual > div > visual-modern > div > div > div.pivotTable > div.innerContainer > div.rowHeaders > div > div:nth-child(9) > div
##        sleep   3s
##        capture page screenshot                 ${Screenshots}/mineral_table.png
#        # back to report page
#        wait until element is visible           xpath://*[@id="pvExplorationHost"]/div/div/exploration/div/explore-canvas/div/div[2]/div/div[2]/div[2]/visual-container-repeat/visual-container[18]/transform/div/div[2]/visual-container-pop-out-bar/div/div/button/span
#        click element                           xpath://*[@id="pvExplorationHost"]/div/div/exploration/div/explore-canvas/div/div[2]/div/div[2]/div[2]/visual-container-repeat/visual-container[18]/transform/div/div[2]/visual-container-pop-out-bar/div/div/button/span
#        sleep   3s
##        capture element screenshot              xpath://*[@id="pvExplorationHost"]/div/div/exploration/div/explore-canvas/div/div[2]/div/div[2]/div[2]/visual-container-repeat/visual-container[18]/transform/div/div[2]/visual-container-pop-out-bar/div/div/button/span       ${Screenshots}/back_to_report.png
#        # open & close Mineral Name drop  down
#        wait until element is visible           css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(18) > transform > div > div.visualContent > div > visual-modern > div > div > div.slicer-content-wrapper > div > i
#        click element                           css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(18) > transform > div > div.visualContent > div > visual-modern > div > div > div.slicer-content-wrapper > div > i
#        sleep   3s
#        capture page screenshot                 ${Screenshots}/mineral_name_dropdown.png
#        click element                           css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(18) > transform > div > div.visualContent > div > visual-modern > div > div > div.slicer-content-wrapper > div > i
#        ${variable} =   get title
#        run keyword if  '${variable}' == 'OD Daily Grade Report - Power BI'     return from keyword      title is correct
#        ...  ELSE       fail     title is not correct
#
##        run keyword if  '${variable}' == 'OD Daily Grade Report - Powe BI'     log to console      title is correct
##        ...  ELSE       log to console      title is not correct
#
#browse the report
#        # Information icon
#        element should be visible           css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(4) > transform > div > div.visualContent > div > visual-modern > div > svg
#        capture element screenshot          css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(4) > transform > div > div.visualContent > div > visual-modern > div > svg     ${Screenshots}/info.png
#        click element                       css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(4) > transform > div > div.visualContent > div > visual-modern > div > svg
#        sleep       3s
#        capture page screenshot             ${Screenshots}/info_details.png
#        sleep   3s
#        # Report heading showing test environment
#        element text should be              xpath://*[@id="navBar"]/header/div[1]/modern-breadcrumbs/nav/ul/li/a        OD-Geoscience-TDM-All-Dev
#        sleep       3s
#        capture element screenshot          xpath://*[@id="navBar"]/header/div[1]/modern-breadcrumbs/nav/ul/li/a        ${Screenshots}/report_heading.png
#        # Verify name of the report
#        element text should be              xpath://*[@id="navBar"]/header/artifact-info/button/span[1]                 OD Daily Grade Report
#        sleep       3s
#        capture element screenshot              xpath://*[@id="navBar"]/header/artifact-info/button/span[1]                 ${Screenshots}/report_name.png
#        # Cu:S Ratio button
#        wait until element is visible       css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(13) > transform > div > div.visualContent > div > visual-modern > div > svg
#        click element                       css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(13) > transform > div > div.visualContent > div > visual-modern > div > svg
#        sleep       3s
#        capture page screenshot             ${Screenshots}/CUS_Page.png
#        # Fe:SO2 Ratio button
#        wait until element is visible       css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(16) > transform > div > div.visualContent > div > visual-modern > div > svg
#        click element                       css:#pvExplorationHost > div > div > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(16) > transform > div > div.visualContent > div > visual-modern > div > svg
#        sleep       3s
#        capture page screenshot             ${Screenshots}/FESO2_Page.png
#        # Edit mode
#        wait until element is visible       css:#editBtn > pbi-office-icon
#        click element                       css:#editBtn > pbi-office-icon
#        sleep       3s
#        # Daily Grade Report tab
#        wait until element is visible       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration-footer-modern > div > ul > carousel > div > div.carouselScrollPane > li:nth-child(1) > exploration-navigation-tab > div > pbi-text-label > div
#        click element                       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration-footer-modern > div > ul > carousel > div > div.carouselScrollPane > li:nth-child(1) > exploration-navigation-tab > div > pbi-text-label > div
#        sleep       3s
#        # Cu:S Page tab
#        wait until element is visible       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration-footer-modern > div > ul > carousel > div > div.carouselScrollPane > li:nth-child(2) > exploration-navigation-tab > div > pbi-text-label > div
#        click element                       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration-footer-modern > div > ul > carousel > div > div.carouselScrollPane > li:nth-child(2) > exploration-navigation-tab > div > pbi-text-label > div
#        sleep       3s
#        capture page screenshot             ${Screenshots}/CUS_tab.png
#        # Fe:SiO2 Page tab
#        wait until element is visible       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration-footer-modern > div > ul > carousel > div > div.carouselScrollPane > li:nth-child(3) > exploration-navigation-tab > div > pbi-text-label > div
#        click element                       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration-footer-modern > div > ul > carousel > div > div.carouselScrollPane > li:nth-child(3) > exploration-navigation-tab > div > pbi-text-label > div
#        sleep       3s
#        capture page screenshot             ${Screenshots}/FESO2_tab.png
#        # Detailed Table tab
#        wait until element is visible       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration-footer-modern > div > ul > carousel > div > div.carouselScrollPane > li:nth-child(4) > exploration-navigation-tab > div > pbi-text-label > div
#        click element                       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration-footer-modern > div > ul > carousel > div > div.carouselScrollPane > li:nth-child(4) > exploration-navigation-tab > div > pbi-text-label > div
#        sleep       3s
#        capture page screenshot             ${Screenshots}/detailed_table_tab.png
#        # Open File menu
#        wait until element is visible       css:#exploration-container-app-bars > exploration-app-bar-wrapper > exploration-app-bar > div > div.appBarSection.left > ul > li:nth-child(1) > button
#        click element                       css:#exploration-container-app-bars > exploration-app-bar-wrapper > exploration-app-bar > div > div.appBarSection.left > ul > li:nth-child(1) > button
#        sleep       3s
#        capture page screenshot             ${Screenshots}/open_file_menu.png
#        # Close File menu
#        wait until element is visible       css:#exploration-container-app-bars > exploration-app-bar-wrapper > exploration-app-bar > div > div.appBarSection.left > ul > li:nth-child(1) > button
#        click element                       css:#exploration-container-app-bars > exploration-app-bar-wrapper > exploration-app-bar > div > div.appBarSection.left > ul > li:nth-child(1) > button
#        sleep       3s
#        # Select dates
#        wait until element is visible       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(7) > transform > div.visualContainer.unselectable.editMode.noVisualTitle.visualHeaderAbove.droppableElement.ui-droppable > div.visualContent > div > visual-modern > div > div > div.slicer-content-wrapper > div > div.date-slicer-head.wrap > div > div:nth-child(1)
#        click element                       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(7) > transform > div.visualContainer.unselectable.editMode.noVisualTitle.visualHeaderAbove.droppableElement.ui-droppable > div.visualContent > div > visual-modern > div > div > div.slicer-content-wrapper > div > div.date-slicer-head.wrap > div > div:nth-child(1)
#        sleep       2s
#        mouse over                          css:.table-row:nth-child(6) > .table-cell:nth-child(3) > .date-cell
#        click element                       css:.table-row:nth-child(6) > .table-cell:nth-child(3) > .date-cell
#        sleep       2s
#        wait until element is visible       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(7) > transform > div.visualContainer.unselectable.editMode.noVisualTitle.visualHeaderAbove.droppableElement.ui-droppable > div.visualContent > div > visual-modern > div > div > div.slicer-content-wrapper > div > div.date-slicer-head.wrap > div > div:nth-child(1)
#        click element                       css:#pvExplorationHost > div > div.horizontalItemsContainer.ng-star-inserted > exploration > div > explore-canvas > div > div.canvasFlexBox > div > div.displayArea.disableAnimations.fitToPage > div.visualContainerHost.visualContainerOutOfFocus > visual-container-repeat > visual-container:nth-child(7) > transform > div.visualContainer.unselectable.editMode.noVisualTitle.visualHeaderAbove.droppableElement.ui-droppable > div.visualContent > div > visual-modern > div > div > div.slicer-content-wrapper > div > div.date-slicer-head.wrap > div > div:nth-child(1)
#        mouse over                          css:.table-row:nth-child(3) > .table-cell:nth-child(3) > .date-cell
#        click element                       css:.table-row:nth-child(3) > .table-cell:nth-child(3) > .date-cell







#show results as CSV format and compare it with local CSV file
#        sleep       2s
#        # click on download button
#        wait until element is enabled       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
#        click element                       xpath://*[@id="sql-worksheet-result-pane-content"]/div[3]/div/div[1]/div[2]/button
#        sleep       2s
#        # select CSV radio button
#        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[3]/div[2]/div/div[2]/input
#        sleep       2s
##        # Export
##        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
##        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div[1]/div[1]/button
#        # show in dialog
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
#        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div/div[1]/button
#        sleep       1s
#        # click into text area and copy results
#        scroll element into view            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
#        set focus to element                xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
#        click element                       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
#        ${results}=                 get text            xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[2]/div
#        sleep       1s
#        # close dialog box
#        wait until element is enabled       xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
#        click button                        xpath://*[@id="ext-element-1"]/div[5]/div/div/div/div[3]/div/div[1]/button
#        @{results_list}=            create list         ${results}
#        ${results_split}=           split to lines      ${results}
#        ${get_results_lines}=       get line count      @{results_list}
#        ${get_results_line_header}=     get lines containing string     @{results_list}       PROJECTCODE
#        ${get_results_linenumber}=      get line            @{results_list}     9
#        ${get_results_lines_all}=     get lines containing string     @{results_list}     DRILLHOLE
#        @{lines_results}=           create list         ${get_results_lines}
#        @{verify_columns_results}=          create list         ${get_results_line_header}
#        @{line_9_result}=           create list         ${get_results_linenumber}
#        @{multiple_results}=        create list         ${get_results_lines_all}
##        log to console                                  ${multiple_results}
#        # Get CSV file with same data from your local machine
#        ${csv_file}=                Get file            collar_test.csv
#        @{collar_rig}=              create list         ${csv_file}
#        ${collar_split}=            split to lines      ${csv_file}
#        ${get_collar_lines}=        get line count      @{collar_rig}
#        ${get_collar_line_header}=     get lines containing string     @{results_list}       PROJECTCODE
#        ${get_collar_linenumber}=       get line            @{collar_rig}      9
#        ${get_collar_lines_all}=      get lines containing string     @{collar_rig}       DRILLHOLE
#        @{lines_collar}=            create list         ${get_collar_lines}
#        @{verify_columns_csv}=      create list         ${get_collar_line_header}
#        @{line_9_collar}=           create list         ${get_collar_linenumber}
#        @{multiple_collar}=         create list         ${get_collar_lines_all}
##        log to console                                  ${multiple_collar}
#        # Compare snowflake CSV results with external CSV file
#        lists should be equal       ${lines_results}        ${lines_collar}
#        lists should be equal       ${verify_columns_results}       ${verify_columns_csv}
#        lists should be equal       ${line_9_result}        ${line_9_collar}
#        lists should be equal       ${multiple_results}     ${multiple_collar}
##        should be equal as strings      ${results_split}        ${collar_split}






