*** Settings ***
Documentation   Snowflake Testing
Library     OperatingSystem
Library     String
Library     SeleniumLibrary
Library     RequestsLibrary
#Library     RESTinstance
Library     JSONLibrary
Library     BuiltIn
Library     Collections
#Library     DataDriver      file=("file location")      encoding=utf_8
Resource    resourcefile.robot
#Test Teardown       Close Browser


*** Variables ***
${url_activity} =        https://odcentric.apac.ent.bhpbilliton.net/Centric/api/DataService/Data?dataServiceId=340&isJson=true&parameters=
${base_url_material} =        https://odcentric.apac.ent.bhpbilliton.net/Centric/api/DataService/Data?dataServiceId=338&isJson=true&parameters=
${base_url} =        https://odcentric.apac.ent.bhpbilliton.net
${base_url_1}  =        https://nominatim.openstreetmap.org/city=taipei&format=jsonv2
${base_url_2} =         https://www.boredapi.com
${city}     =           city=taipei&format=jsonv2
#https://www.boredapi.com/api/activity
#/search.php?city=taipei&format=jsonv2
#/api/markets
#/api/activity

*** Test Cases ***

#Test Case:1_Dictionary
#    How to create dictionary

Test Case:2_GET method
    call get response

#Test Case:3_Read json file
#    Read JSON


*** Keywords ***
#How to create dictionary
#    &{data}=    create dictionary       name=vivek      lastname=sharma     job=tester
#    log     ${data}
#    dictionary should contain key       ${data}     job
#    log     ${data}[job]
#    ${name}=    get from dictionary                 ${data}     name
#    log     ${name}

#Test Case:2_GET method
call get response
#    create client cert session          auth        client_certs        proxies        verify
#    ${get_response}=    GET         ${url_weather}
    create session      mysession               ${base_url_2}
    ${get_response}=    get on session      mysession        ${base_url_2}        params=activity
#    log                             ${get_response.status_code}
#    log                             ${get_response.content}
#    log                             ${get_response.headers}


#Test Case:3_Read json file
#Read JSON
#    ${file}=    LOAD JSON FROM FILE     C:/Users/sharvive/Documents/Access_Analytics Project/CENTRIC/Source_API/PRODTRAKLOCATION/APICALL.json
#    log      ${file}
#    &{dict}=    create dictionary       ${file}
##    log to console      &{dict}
