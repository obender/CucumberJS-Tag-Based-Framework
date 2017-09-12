Feature: Activity Logs Day or Range
    As a product manager
    I want our customers to be able to see Activity log events for a single day or multiple days

    Rules:
    - Return some or no Activity Log events for 1 day or multiple days (no more than 5000)

    Background: Open "Activity Logs" page via "Analytics" as logged in user
        Given I am logged in
        When I click Tag "Analytics"
        And I click Tag "Activity Log"

    Scenario: 1) 5 days of logs(no more than 5000), From date to 07/01/2017 and To date to 07/05/2017
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/05/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        Then the grid "activity_logs" has any rows
        And the value of Tag "~grid:cell|1;;Timestamp" is "7/5/2017 11:58:54 PM"

    Scenario: 2) 1 day of logs (no logs in it), From date to 06/01/2017 and To date to 06/01/2017
        When I select date "05/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "05/01/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        Then the grid "activity_logs" has 0 rows

    Scenario: 3) 5 days of logs (no logs in it), From date to 06/01/2017 and To date to 06/05/2017
        When I select date "05/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "05/05/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        Then the grid "activity_logs" has 0 rows

    Scenario: 4) 1 day of logs(1950 entries), select To and From Date is 07/07/2017
        When I select date "07/07/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/07/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        Then the grid "activity_logs" has any rows
        And the value of Tag "~grid:cell|1;;Timestamp" is "7/7/2017 11:58:54 PM"



