# API Automation Framework

This is a lightweight and extensible API Automation Framework built using **Python**, **Requests**, and **Robot Framework**, designed and developed by **Prajwal Mishra**.

## 📌 Overview

The framework supports:
- REST API testing (GET, POST, PUT, DELETE)
- JSON-based payloads and response validation
- Status code validation
- Test data separation using external files
- Robot Framework test reporting
- Easy-to-extend architecture for future enhancements

## 📂 Project Structure
api_automation_framework/
├── data/ # Test payloads in JSON format
├── reports/ # Execution reports (HTML/XML/log)
├── tests/ # Robot test suites
├── utils/ # Helper Python classes (keywords)
├── conftest.py # Common test configurations
├── requirements.txt # Project dependencies
└── README.md # Project documentation

## 🚀 Getting Started

### 1. Install Dependencies

```bash
pip install -r requirements.txt
```
### 2. Run Tests
```bash
robot --outputdir reports <filepath/from/content_root>
```
### 3. View Reports
Reports will be available in the reports/ folder:

- log.html<>

- report.html</>

- output.xml<>

### 📑 Example Test Case
```
*** Test Cases ***
TC01 Validate Create User API
    [Documentation]    Validate response status and content for create user
    Create Session    ${BASE_URL}
    ${payload}=    Load Json From File    ${DATA_DIR}/create_user.json
    ${response}=    Send Post Request    ${BASE_URL}    /api/users    json=${payload}    expected_status_code=201
    Should Be Equal    ${response['name']}    ${payload['name']}
    Should Be Equal    ${response['job']}    ${payload['job']}
```
### 👨‍💻 Author
    Prajwal Mishra
    QA Automation Engineer
    📅 Created: May 28, 2025


