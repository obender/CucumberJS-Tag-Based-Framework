Feature: API List grid sort using the sortMenu dropdown
    As a user
    I want to be able to check the functionality of sorting by clicking on the different header column names:

    Pre-requisite:  1  Inactive api is in api-list
                    16 services are in api-list


    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable


    Scenario: init) Add 1 inactive API, 16 services and refresh the api.list section
        Given Postman collection "load.16.services" in folder "apis.list" is Executed successfully
        And Postman collection "create.1.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: 1)Test if the sortMenu is displayed and is clickable
        Then Tag "~grid:sortMenu" is clickable


    Scenario: 2)Test if the sorting by "Name" works
        When I click Tag "~grid:sortMenu" and click text "Name"
        Then the value of Tag "~grid:row|1" is "Employee1|REST|Basic Auth|Secured REST service #1 of 0000s7"


    Scenario: 3)Test if the sorting by "Name" works in descending order
        When I click Tag "~grid:sortMenu" and click text "Name"
        Then the value of Tag "~grid:row|1" is "inactive_1|REST|Inactive - Service not available|Anonymous"


    Scenario: 4)Test if the sorting by "Type" works
        When I click Tag "~grid:sortMenu" and click text "Type"
        Then the value of Tag "~grid:row|1" is "Employee2A|REST|Anonymous|Anonymous REST service #2 of 0000s7"


    Scenario: 5)Test if the sorting by "Status" works
        When I click Tag "~grid:sortMenu" and click text "Status"
        Then the value of Tag "~grid:row|1" is "Employee1|SOAP|Basic Auth|Secured SOAP service #1 of 0000s7"


    Scenario: 6)Test if the sorting by "Authentication" works in descending order
        When I click Tag "~grid:sortMenu" and click text "Authentication"
        And  I click Tag "~grid:sortMenu" and click text "Authentication"
        Then the value of Tag "~grid:row|1" is "Employee1|SOAP|Basic Auth|Secured SOAP service #1 of 0000s7"


    Scenario: 7)Test if the sorting by "Description" works
        When I click Tag "~grid:sortMenu" and click text "Description"
        Then the value of Tag "~grid:row|1" is "inactive_1|REST|Inactive - Service not available|Anonymous"


    Scenario: 8)Test if the sorting by "Description" works in descending order
        When I click Tag "~grid:sortMenu" and click text "Description"
        Then the value of Tag "~grid:row|1" is "Employee4|SOAP|Basic Auth|Secured SOAP service #4 of 0000s7"


    Scenario: 9)Test if the sorting by "API Specific Policy" works
        When I click Tag "~grid:sortMenu" and click text "API Specific Policy"
        Then the value of Tag "~grid:row|1" is "Employee3|SOAP|Basic Auth|Secured SOAP service #3 of 0000s7"


    Scenario: 10)Test if the sorting by "API Specific Policy" works in descending order
        When I click Tag "~grid:sortMenu" and click text "API Specific Policy"
        Then the value of Tag "~grid:row|1" is "Employee4A|SOAP|Anonymous|Anonymous SOAP service #4 of 0000s7"
