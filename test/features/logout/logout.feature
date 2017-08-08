Feature: Logout feature
    As a user
    I want to be able to click on "Settings" button and do Logout from list-api page
    Pre-requisite:  Run postman collection "features.postman_collection"

    Background: Open the "login" page
        Given I am logged in
        And Tag "Explore" is clickable

    Scenario:  Logout successfully
        When I log out
        Then Tag "Log In" is clickable

    Scenario:  Logout successfully from policies
        Given Tag "Policies" is clickable
        When I click Tag "Policies"
        And I log out
        Then Tag "Log In" is clickable

    Scenario:  Logout successfully from logs
        Given Tag "Analytics" is clickable
        When I click Tag "Analytics"
        And I log out
        Then Tag "Log In" is clickable

    Scenario:  Emulate auto logout
        When I emulate auto logout
        Then Tag "Policies" is clickable
        When I click Tag "Policies"
        Then Tag "Login to API Manager." is clickable



