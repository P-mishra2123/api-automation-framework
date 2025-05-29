*** Settings ***
Library           utils/APIKeywords.py
Resource        resources/List_users_variables.robot
Library           Collections

*** Test Cases ***
TC01 Validate Response and Status Code
    ${params}=    Create Dictionary    ${PAGE_PARAM}=${PAGE_VALUE}
    ${response}=    Send Get Request    ${BASE_URL}    ${LIST_USERS_EP}    params=${params}    expected_status_code=200
    Should Not Be Empty    ${response}
    Log To Console    Response: ${response}

TC02 Validate Page Number
    ${params}=    Create Dictionary    ${PAGE_PARAM}=${PAGE_VALUE}
    ${response}=  Send Get Request    ${BASE_URL}    ${LIST_USERS_EP}    params=${params}
    Should Be Equal As Integers    ${response['page']}    2

TC03 Validate Number of Users Returned
    ${params}=    Create Dictionary    ${PAGE_PARAM}=${PAGE_VALUE}
    ${response}=  Send Get Request    ${BASE_URL}    ${LIST_USERS_EP}    params=${params}
    Length Should Be    ${response['data']}    6

TC04 Validate All User Fields Exist
    ${params}=    Create Dictionary    ${PAGE_PARAM}=${PAGE_VALUE}
    ${response}=  Send Get Request    ${BASE_URL}    ${LIST_USERS_EP}    params=${params}
    FOR    ${user}    IN    @{response['data']}
        Dictionary Should Contain Key    ${user}    id
        Dictionary Should Contain Key    ${user}    email
        Dictionary Should Contain Key    ${user}    first_name
        Dictionary Should Contain Key    ${user}    last_name
        Dictionary Should Contain Key    ${user}    avatar
    END

TC05 Validate Specific User Data - ID 7
    ${params}=    Create Dictionary    ${PAGE_PARAM}=${PAGE_VALUE}
    ${response}=  Send Get Request    ${BASE_URL}    ${LIST_USERS_EP}    params=${params}
    ${user}=    Get From List    ${response['data']}    0
    Should Be Equal As Integers    ${user['id']}           7
    Should Be Equal    ${user['email']}        michael.lawson@reqres.in
    Should Be Equal    ${user['first_name']}   Michael
    Should Be Equal    ${user['last_name']}    Lawson

TC06 Validate Support Block
    ${params}=    Create Dictionary    ${PAGE_PARAM}=${PAGE_VALUE}
    ${response}=  Send Get Request    ${BASE_URL}    ${LIST_USERS_EP}    params=${params}
    Dictionary Should Contain Key    ${response['support']}    url
    Dictionary Should Contain Key    ${response['support']}    text
