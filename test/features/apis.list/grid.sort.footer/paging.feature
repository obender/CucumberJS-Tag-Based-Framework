Feature: API List paging functionality
    As a user
    I want to be able to check the paging actions that are available to be done in a grid section.

    Pre-requisite:  60 services are in api-list


    Background: Open the "api-list" section and wait for the grid to be loaded
        Given I am logged in
        And Tag "Explore" is clickable


    Scenario: init) Add 16 services and refresh the api.list section
        Given Postman collection "load.60.services" in folder "apis.list" is Executed successfully
        When I do Refresh
        Then the grid "All Services" has any rows


    Scenario: 1)Test if clicking right arrow (from page #1)
                    will advance the view to page 2
        Given Tag "~grid:page|next" is clickable
        When I click Tag "~grid:page|next"
        Then the value of Tag "~grid:page|current" is "2"


    Scenario: 2)Test if clicking left arrow (from page #2)
                    will advance the view to page 1
        Given the value of Tag "~grid:page|current" is "2"
        When I click Tag "~grid:page|prev"
        Then the value of Tag "~grid:page|current" is "1"


    Scenario: 3)Test if input 2 in the current page textbox
                    advance the view to page #2
        Given the value of Tag "~grid:page|current" is "1"
        When I set Tag "~grid:page|current" to "2"
        And I press the "Enter" key
        Then the value of Tag "~grid:page|current" is "2"
        And Tag "~grid:page|prev" is clickable


    Scenario: 4)Test changing page-size to 100
        Given I select option "100" in Tag "~grid:page|size"
        When Tag "~grid:page|current-size" is displayed
        Then  the value of Tag "~grid:page|current-size" is "100"


    # TODO: Fix the cemented issues bugs at Symphony
    # Bug : https://infajira.informatica.com/projects/SYM/issues/SYM-1028
    #    Scenario: 5)Test while page-size is 100, both next and prev page arrows are disabled
    #        When the value of Tag "~grid:page|current-size" is "100"
    #        Then Tag "~grid:page|next" is not clickable
    #        And  Tag "~grid:page|prev" is not clickable


    Scenario: 6)Test checking total-rows and rows-in-page when page-size is set to 100
        Given  the value of Tag "~grid:page|current-size" is "100"
        Then the text in Tag "~grid:page|total-rows" is "60"
        And the text in Tag "~grid:page|rows-in-page" is "1 - 60"


    Scenario: 7)Test changing page-size back to 50
        When I select option "50" in Tag "~grid:page|size"
        Then Tag "~grid:page|next" is clickable
        And  the value of Tag "~grid:page|current-size" is "50"


    Scenario: 8)Test checking total-rows and rows-in-page when page-size is set to 50
        And  the value of Tag "~grid:page|current-size" is "50"
        When the text in Tag "~grid:page|total-rows" is "60"
        Then the text in Tag "~grid:page|rows-in-page" is "1 - 50"




