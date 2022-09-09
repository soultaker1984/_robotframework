*** Settings ***
Library     SeleniumLibrary

Documentation       Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//span[contains(@class,'MuiButton')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@name='password']
${PAGELOGO}         xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${REMIND}       xpath=//a
${ELEMENT1}         xpath=//div[contains(@class, "MuiSelect-root")]
${ELEMENT2}         xpath=//li[@data-value='pl']
${PLAYERS}          xpath=//span[contains(text(),'Players')]
${ADDPLAYER}        xpath=//span[text()='Add player']
${NAME}     xpath=//input[@name='name']
${SURNAME}      xpath=//input[@name='surname']
${AGE}      xpath=//input[@name='age']
${POSITION}     xpath=//input[@name='mainPosition']
${SUBMIT}       xpath=//span[contains(text(),'Submit')]
${LOGOUT}       xpath=//span[contains(text(),'Sign out')]
*** Test Cases ***
Login to the system
    Open Login Page
    Type In Email
    Type Password
    Click On The Submit Button
    Assert Dashboard
    [Teardown]  Close Browser
Remind password
    Open login page
    Click on the remind link
    [Teardown]  Close Browser
Switch language
    Open login page
    Click element 1
    Click element 2
    [Teardown]  Close browser
Players
    Open login page
    Type in email
    Type password
    Click on the Submit button
    Click players
    [Teardown]  Close Browser
Add player
    Open login page
    Type in email
    Type password
    Click on the Submit button
    Add Player
    Name
    Surname
    Age
    Position
    Submit
    [Teardown]  Close Browser
Log out
    Open login page
    Type in email
    Type password
    Click on the Submit button
    Logout
    [Teardown]  Close Browser
*** Keywords ***
Logout
    wait until element is visible   ${LOGOUT}
    Click element       ${LOGOUT}
Name
    wait until element is visible  ${NAME}
    Input text      ${NAME}     Dimon
Surname
    wait until element is visible  ${SURNAME}
    Input text      ${SURNAME}      Dimonium
Age
    wait until element is visible  ${AGE}
    Input text      ${AGE}      10031994
Position
    wait until element is visible   ${POSITION}
    Input text      ${POSITION}     Superman
Submit
    Click element       ${SUBMIT}
Add player
    wait until element is visible   ${ADDPLAYER}
    Click element       ${ADDPLAYER}
Click players
    wait until element is visible   ${PLAYERS}
    Click element       ${PLAYERS}
Click element 1
    Click element       ${ELEMENT1}
Click element 2
    Click element       ${ELEMENT2}
Click on the remind link
    Click element       ${REMIND}
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input text      ${EMAILINPUT}       user01@getnada.com
Type password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on the Submit button
    Click element       ${SIGNINBUTTON}
Assert dashboard
    wait until element is visible       ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot      alert.png