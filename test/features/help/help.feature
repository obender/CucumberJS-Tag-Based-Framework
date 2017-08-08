Feature: Help functionality
    As a user
    I want to be able to view online help.
    Pre-requisite:  1. Run postman collection "60ApisCreate"/features.postman_collection

    Background:
        Given I am logged in
        And I open the section "api-list"

    Scenario: Click online help and validate that the proper tab is opened
        When I focus on Tag "Help" and I Click Tag "Help" and I click on text "Help"
        Then a new tab is opened and the url contains:"network.informatica.com/onlinehelp/icrt/current/en/index.htm?contextID=ICRT_API_MANAGER_HELP"

