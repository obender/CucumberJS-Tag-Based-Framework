Feature: Activity Logs Paging
    As a product manager
    I want our customers to be able to page through activity log events
    So that they can easily get to the beginning of the result set or the end

    Rules:
    - Clicking the arrows to go forward or backwards to display total number of results will display the next or previous page of events for 2/27/2017

    Background: Open "Activity Logs" page via "Analytics" as logged in user
        Given I am logged in
        When I click Tag "Analytics"
        And I click Tag "Activity Log"

    Scenario: 1) Click the greater than arrow to proceed to the next page of events
        When I select date "07/06/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/06/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        And the grid "activity_logs" has any rows
        When Tag "~grid:page|next|#activityLog" is clickable
        When I click Tag "~grid:page|next|#activityLog"
        Then the value of Tag "~grid:page|current|#activityLog" is "2"

    Scenario: 2) Click the less than arrow to proceed to the previous page of events
        When the value of Tag "~grid:page|current|#activityLog" is "2"
        And I click Tag "~grid:page|prev|#activityLog"
        Then the value of Tag "~grid:page|current|#activityLog" is "1"
