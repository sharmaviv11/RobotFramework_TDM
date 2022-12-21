*** Settings ***
Documentation   Snowflake Testing
Library     OperatingSystem
Library     CSVLib
Library     String
Library     SeleniumLibrary
Library     BuiltIn
Library     pandas
Library     Collections
Library     DatabaseLibrary
Library     JSONLibrary
Library     DiffLibrary
#Library     DataDriver      file=("file location")      encoding=utf_8
Resource    resourcefile.robot

#Test Teardown       Close Browser


*** Test Cases ***

Test Case_5: Read CSV file
    read CSV file

#Test Case_6: choose file
#    compare files

#Test Case_7: choose file
#    compare file



*** Keywords ***




#Test Case_5: Read CSV file
read CSV file
#    ${df1}=     pd.read_csv(r"C:\Users\sharvive\BHP\Nonabur, Navin - ShareVivek\Centric\FACT_HAULAGE\RAW Data\HAULAGE_27 July_50481.csv")
#        pandas.read_csv(r"C:\Users\sharvive\BHP\Nonabur, Navin - ShareVivek\Centric\FACT_HAULAGE\RAW Data\HAULAGE_27 July_50481.csv")
        ${csv}=         Get file            dest.csv
        log to console    ${csv}
#        ${csv}=         Get file            raw_collar_rig.csv
#        @{read}=        create list         ${csv}
#
#
#        FOR     ${line}     IN      @{read}
#                log to console      ${line}
#        END

#        ${csv}=         Get file            Raw_Collar_Rig_MD_19 May_05_30_00.csv
#        @{read}=        create list         ${csv}
#        @{lines}=       split to lines      @{read}
#        ${get_line}=    get line    @{read}     0
#        ${get_line_count}=      get line count      @{read}
#        ${get_lines}=   get lines containing string     @{read}     RU5
#        @{show_lines}=   create list         ${get_lines}
#        log to console      ${show_lines}

#        FOR     ${line}     IN      @{show_lines}
#                log to console      \n${line}
#        END



#Test Case_6: choose file
compare files
        # Get RAW COLLAR FILE
        ${csv1}=                        read csv as list        result_raw_num.csv
        ${csv2}=                        read csv as list        result_qa_num (1).csv
        lists should be equal           ${csv1}                 ${csv2}
#        log to console                  ${csv1}
#        log to console                  ${csv2}
#        @{raw_read}=                    create list         ${raw_csv}
#        @{lines}=                       split to lines      \n${raw_csv}
#        ${raw_get_line}=                    get line    ${raw_csv}      1
#        ${raw_get_line_count}=              get line count      ${raw_csv}
#        ${raw_get_lines}=                   get lines containing string     ${raw_csv}     DRILLED
#        @{raw_show_line}=                   create list         ${raw_get_line}
#        @{raw_show_line_count}=             create list         ${raw_get_line_count}
#        @{raw_show_lines}=                  create list         ${raw_get_lines}
#        log                                 ${raw_csv[4]}
#        log to console                      ${raw_csv[4]}
#        log                                 ${raw_csv[5]}
#        log to console                      ${raw_csv[5]}
#        log to console                      ${raw_csv}
#        log to console                      @{raw_show_line}
#        log to console                      @{raw_show_line_count}
#        log to console                      @{raw_show_lines}

        # Get QA COLLAR FILE

#        ${qa_csv}=                     Get file        QA_Collar_ rows.csv
#        @{qa_read}=                    create list         ${qa_csv}
##        @{lines}=                      split to lines      @{read}
#        ${qa_get_line}=                    get line    @{qa_read}     15
#        ${qa_get_line_count}=              get line count      @{qa_read}
#        ${qa_get_lines}=                   get lines containing string     @{qa_read}     DRILLED
#        @{qa_show_line}=                   create list         ${qa_get_line}
#        @{qa_show_line_count}=             create list         ${qa_get_line_count}
#        @{qa_show_lines}=                  create list         ${qa_get_lines}
#        log to console                      @{qa_show_line}
#        log to console                      @{qa_show_line_count}
#        log to console                      @{qa_show_lines}

        # Compare RAW with QA

#        lists should be equal               ${raw_show_line}        ${qa_show_line}
#        lists should be equal               ${raw_show_line_count}  ${qa_show_line_count}
#        lists should be equal               ${raw_show_lines}       ${qa_show_lines}



#Test Case_7: choose file
#compare file
#        # Get RAW COLLAR FILE
#        ${raw_csv}=                     Get file        source.csv
#        ${raw_csv_split}=                     split to lines      ${raw_csv}
##        log to console                  ${raw_csv_split}
#        @{raw_read}=                    create list         ${raw_csv}
#        ${lines}=                      split to lines      @{raw_read}
#        @{lines1}=                      create list     ${lines}
#        ${raw_get_line}=                    get line    @{raw_read}     10
#        ${raw_get_line_count}=              get line count      @{raw_read}
#        ${raw_get_cols}=                   get lines containing string     @{raw_read}      Waio
#        @{raw_show_line}=                   create list         ${raw_get_line}
#        @{raw_show_line_count}=             create list         ${raw_get_line_count}
#        @{raw_show_cols}=                  create list         ${raw_get_cols}
##        log to console                      @{raw_show_line}
##        log to console                      @{raw_show_line_count}
##        log to console                      ${lines}
##        log to console                      @{raw_show_lines}
#
#        # Get QA COLLAR FILE
#
#        ${qa_csv}=                     Get file        dest.csv
#        ${qa_csv_split}=                      split to lines      ${qa_csv}
##        log to console                  ${qa_csv_split}
#        @{qa_read}=                    create list         ${qa_csv}
#        ${s_lines}=                      split to lines      @{qa_read}
#        @{lines2}=                  create list     ${s_lines}
#        ${qa_get_line}=                    get line    @{qa_read}     10
#        ${qa_get_line_count}=              get line count      @{qa_read}
#        ${qa_get_cols}=                   get lines containing string     @{qa_read}          Waio
#        @{qa_show_line}=                   create list         ${qa_get_line}
#        @{qa_show_line_count}=             create list         ${qa_get_line_count}
#        @{qa_show_cols}=                  create list         ${qa_get_cols}
#        log to console                      @{qa_show_line}
#        log to console                      @{qa_show_line_count}
#        log to console                      ${s_lines}
#        log to console                      @{qa_show_lines}

        # Compare RAW with QA

#        lists should be equal               ${raw_show_line}        ${qa_show_line}
#        lists should be equal               ${raw_show_line_count}  ${qa_show_line_count}
#        lists should be equal               ${lines1}               ${lines2}
#        lists should be equal               ${raw_read}             ${qa_read}
#        lists should be equal               ${raw_show_cols}       ${qa_show_cols}
#        ${raw_sort}=                         sort list              ${raw_csv_split}
#        ${qa_sort}=                          sort list              ${qa_csv_split}
#        should be equal as strings          ${raw_sort}                         ${qa_sort}
#        should be equal as strings          ${raw_csv_split}        ${qa_csv_split}

#        diff files          source.csv        dest.csv










