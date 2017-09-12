Feature: Organization name
    As a user
    I want to be able to check that the organization name is correct and in palce

    Pre-requisite:  Organization 0000s7 exist


    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable


    Scenario: init) Get organization details
        Given Postman collection "load.organization" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then Tag "Organization" is displayed


    Scenario: 1) "Explore" page - user info (example: find if exist "Organization: Informatica7 (0000s7)")
        Then Tag "~grid:validateColumns|Name;Type;Status;Authentication;Description" is displayed
        When Tag "Organization" is displayed
        Then the text in Tag "Organization" is "Organization: Informatica7 (0000s7)"


    Scenario: 2) "Policies" page - user info (example: find if exist "Organization: Informatica7 (0000s7)")
        When I focus on Tag "policies" and I click Tag "Policies"
        Then Tags "fromIp|toIp|description|description|Update|Cancel|Add|ipFiltering|accessType" are displayed
        And Tag "~grid:validateColumns|Access Type;From IP Address;To IP Address;Description" is displayed
        When Tag "Organization" is displayed
        Then the text in Tag "Organization" is "Organization: Informatica7 (0000s7)"


    Scenario: 3) "Security Logs" page - user info (example: find if exist "Organization: Informatica7 (0000s7)")
        When I click Tag "Analytics"
        And I click Tag "Security Log"
        Then Tag "~grid:validateColumns|Timestamp;API URL;HTTP Response;Description;Username;Consumer IP" is displayed
        When Tag "Organization" is displayed
        Then the text in Tag "Organization" is "Organization: Informatica7 (0000s7)"
