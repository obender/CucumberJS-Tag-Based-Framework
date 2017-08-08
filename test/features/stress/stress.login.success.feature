
Feature: Login
    As a user
    I want to be able to login successfully
    Pre-requisite:  Have some APIs in the "api-list" section.

    Scenario:  Login Successfully
        Given I open the section "login"
        When I set Tag "Username" to "gadi@wolfman.com"
        And  I set Tag "Password" to "bp3luser"
        And  Tag "Log In" is clickable
        When I click Tag "Log In"
        Then Tag "Explore" is clickable
        And  the value of Tag "Organization" contains "Informatica"
