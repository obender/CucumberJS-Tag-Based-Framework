Feature: API List grid functionality - create a managed API from ICRT service
    As a user
    I want to be able to create a managed API from an existing ICRT service.

    Pre-requisite:  3 Inactive api in api-list

    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable

    Scenario: init) Add 3 inactive API, 16 services and refresh the api.list section
        Given Postman collection "load.16.services" in folder "apis.list" is Executed successfully
        And Postman collection "create.3.inactive.api" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: 1)Test if all options appears in Kebab menu of "Managed Services" in row 1
        When the grid "All Services" has any rows
        And  I select option "Managed Services" in Tag "Filter"
        Then the grid "Managed Services" has any rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1"

        Then the text in Tag "~grid:menuText|1" contains "View API Details"
        And the text in Tag "~grid:menuText|1" contains "Activate"
        And the text in Tag "~grid:menuText|1" contains "Copy Managed URL"
        And the text in Tag "~grid:menuText|1" contains "Delete Managed API"


    Scenario: 2)Test if all options appears in Kebab menu of "Managed Services"in row 3
        When I select option "Managed Services" in Tag "Filter"
        Then the grid "Managed Services" has any rows
        When I focus on Tag "~grid:row|3" and I Click Tag "~grid:menu|3"

        Then the text in Tag "~grid:menuText|1" contains "View API Details"
        And the text in Tag "~grid:menuText|1" contains "Activate"
        And the text in Tag "~grid:menuText|1" contains "Copy Managed URL"
        And the text in Tag "~grid:menuText|1" contains "Delete Managed API"



    Scenario: 3)Test if all options appears in Kebab menu of "Available Services" in row 1
        When I select option "Available Services" in Tag "Filter"
        Then the grid "Available Services" has any rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1"

        Then the text in Tag "~grid:menuText|1" contains "View Service Details"
        And the text in Tag "~grid:menuText|1" contains "Create Managed API"



    Scenario: 4)Test if all options appears in Kebab menu of "Available Services"in row 3
        When I select option "Available Services" in Tag "Filter"
        Then the grid "Available Services" has any rows
        When I focus on Tag "~grid:row|3" and I Click Tag "~grid:menu|3"

        Then the text in Tag "~grid:menuText|3" contains "View Service Details"
        And the text in Tag "~grid:menuText|3" contains "Create Managed API"



    Scenario: 5) Create a managed API from ICRT service (using kebab)
        When I select option "Available Services" in Tag "Filter"
        Then the grid "Available Services" has any rows
        And  the value of Tag "~grid:row|1" is "Employee1A|REST|Anonymous|Anonymous REST service #1 of 0000s7"
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Create Managed API"
        Then the grid "Available Services" has 16 rows
        When I select option "Managed Services" in Tag "Filter"
        And  I set Tag "~grid:search" to "Employee1A"
        And  I press the "Enter" key
        And  the value of Tag "~grid:cell|1;;Status" is "Active"


    Scenario: 6) Deactivate Managed API (using kebab)
        When the value of Tag "~grid:row|1" is "Employee1A|REST|Active|Anonymous|Anonymous REST service #1 of 0000s7"
        And  I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Deactivate"
        Then the grid "Managed Services" has 1 row
        And  the value of Tag "~grid:cell|1;;Status" is "Inactive"


#TODO: TOFIX
#    Scenario: 7) Activate Managed API (using kebab)
#        When the value of Tag "~grid:row|1" is "Employee1A|REST|Inactive|Anonymous|Anonymous REST service #1 of 0000s7"
#        And  I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Activate"
#        Then the grid "Managed Services" has 1 row
#        And  the value of Tag "~grid:cell|1;;Status" is "Active"

