*** Settings ***
Library           utils/APIKeywords.py
Resource        resources/variables.robot
Library           Collections
Library           OperatingSystem

*** Test Cases ***
GET Users List
    ${response}=    Send Get Request    ${BASE_URL}    ${GET_USERS_EP}
    Length Should Be    ${response}    10
    Dictionary Should Contain Key    ${response[0]}    id

POST Create User
    ${payload}=     Load JSON From File    ././data/test_data.json
    ${response}=    Send Post Request    ${BASE_URL}    ${POST_USERS_EP}    ${payload}
    Dictionary Should Contain Key    ${response}    id

*** Keywords ***
Load JSON From File
    [Arguments]    ${file_path}
    ${json_str}=   Get File    ${file_path}
    ${json_obj}=   Evaluate    json.loads("""${json_str}""")    json
    RETURN       ${json_obj}
