Feature: Login Fails
    As a user
    I want to see if login with wrong credentials - fails
    Pre-requisite:  None

    Background: Open the "login" page
        Given I open the section "login"
        And Tags "Username|Password|Log In" are displayed

    Scenario:  1)Login fails when no organization is available BUT the login credentials are correct
        Given Postman collection "login.fail" in folder "login" is Executed successfully 1 time
        When I set Tag "Username" to "gadi@wolfman.com"
        And I set Tag "Password" to "bp3luser"
        Then Tag "Log In" is clickable
        When I click Tag "Log In"
        Then the value of Tag "~error:message" is "Login failed: The API Manager service is not registered for your organization. Contact Informatica Support to add the API Manager service for your organization."

    Scenario:  2)Login fails using the incorrect username
        Given Postman collection "login.success" in folder "login" is Executed successfully 1 time
        When I set Tag "Username" to "incorrect@wolfman.com"
        And  I set Tag "Password" to "bp3luser"
        Then Tag "Log In" is clickable
        And I click Tag "Log In"
        Then the value of Tag "~error:message" is "Login failed: The user credentials are incorrect"


    Scenario:  3)Login fails using the incorrect password
        When I set Tag "Username" to "gadi@wolfman.com"
        And  I set Tag "Password" to "incorrect"
        Then Tag "Log In" is clickable
        And I click Tag "Log In"
        Then the value of Tag "~error:message" is "Login failed: The user credentials are incorrect"


    Scenario:  4)Login fails using empty username
        When I set Tag "Username" to ""
        And  I set Tag "Password" to "bp3luser"
        Then Tag "Log In" is clickable
        And I click Tag "Log In"
        Then the value of Tag "~error:message" is "Enter Username"


    Scenario:  5)Login fails using empty password
        When I set Tag "Username" to "gadi@wolfman.com"
        And  I set Tag "Password" to ""
        Then Tag "Log In" is clickable
        And I click Tag "Log In"
        Then the value of Tag "~error:message" is "Enter Password"


    Scenario:  6)Login fails using empty username and password
        When I set Tag "Username" to ""
        And  I set Tag "Password" to ""
        Then Tag "Log In" is clickable
        And I click Tag "Log In"
        Then the value of Tag "~error:message" is "Enter Username"


    Scenario:  7)User doesn't have an account
        Then Tag "Don't have an account?" is clickable
        When I click Tag "Don't have an account?"
        Then "Don't have an account?" section is fully loaded


    Scenario:  8)The User Forget his/hers password?
        Then Tag "Forget your password?" is clickable
        When I click Tag "Forget your password?"
        Then "Forget your password?" section is fully loaded
