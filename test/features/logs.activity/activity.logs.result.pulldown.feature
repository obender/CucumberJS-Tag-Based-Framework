Feature: Activity Logs Result Pulldown
    As a product manager
    I want our customers to be able to set the total number of rows to display in the grid for Activity log events for a single day or multiple days
    So that they can see more events at one time with fewer pages

    Rules:
    - Changing the total number of results to display per page pull down menu will display the proper matching number of rows for certain date

    Background: Open "Security Logs" page via "Analytics" as logged in user
        Given I am logged in
        When I click Tag "Analytics"
        And I click Tag "Activity Log"

    Scenario: 1) Changing the number or results to display to 100 and 100 rows will display for a large data set
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/05/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        And the grid "activity_logs" has any rows
        When I select option "100" in Tag "~grid:page|size|#activityLog"
        Then Tag "~grid:page|current-size|#activityLog" is displayed
        And  the value of Tag "~grid:page|current-size|#activityLog" is "100"
        When the text in Tag "~grid:page|total-rows|#activityLog" is "5000"
        Then the text in Tag "~grid:page|rows-in-page|#activityLog" is "1 - 100"

    Scenario: 2) Changing the number or results to display to 150 and 150 rows will display for a large data set
        When I select option "150" in Tag "~grid:page|size|#activityLog"
        Then Tag "~grid:page|current-size|#activityLog" is displayed
        And  the value of Tag "~grid:page|current-size|#activityLog" is "150"
        When the text in Tag "~grid:page|total-rows|#activityLog" is "5000"
        Then the text in Tag "~grid:page|rows-in-page|#activityLog" is "1 - 150"

    Scenario: 3) Changing the number or results to display to 200 and 200 rows will display for a large data set
        When I select option "200" in Tag "~grid:page|size|#activityLog"
        Then Tag "~grid:page|current-size|#activityLog" is displayed
        And  the value of Tag "~grid:page|current-size|#activityLog" is "200"
        When the text in Tag "~grid:page|total-rows|#activityLog" is "5000"
        Then the text in Tag "~grid:page|rows-in-page|#activityLog" is "1 - 200"

    Scenario: 4) Changing the number or results to display to 250 and 250 rows will display for a large data set
        When I select option "250" in Tag "~grid:page|size|#activityLog"
        Then Tag "~grid:page|current-size|#activityLog" is displayed
        And  the value of Tag "~grid:page|current-size|#activityLog" is "250"
        When the text in Tag "~grid:page|total-rows|#activityLog" is "5000"
        Then the text in Tag "~grid:page|rows-in-page|#activityLog" is "1 - 250"
