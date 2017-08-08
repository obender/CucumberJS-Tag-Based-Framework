Feature: Activity Logs Large Data
    As a product manager
    I want our customers to be able to see a large number of events or the max of 5000 Activity log events for a single day or multiple days
    So that they can see the system performance

    Rules:
    - Return a large result set or Max Number of Activity Log events for 1 day or multiple days

    Background: Open "Activity Logs" page via "Analytics" as logged in user
        Given I am logged in
        When I click Tag "Analytics"
        And I click Tag "Activity Log"

    Scenario: 1) Changing From date to 2/24/2017 and To date to 2/24/2017 will return results of more than 1000 events for 1 day
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/01/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        And the grid "activity_logs" has 1734 rows

    Scenario: 2) Changing From date to 2/25/2017 and To date to 2/25/2017 will return results of exactly 2000 events for 1 day
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/02/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
       And the grid "activity_logs" has 3714 rows

    Scenario: 3) Changing From date to 2/24/2017 and To date to 2/26/2017 will return results of more than 1000 events for date range
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/03/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        And the grid "activity_logs" has 3960 rows

    Scenario: 4) Changing From date to 2/27/2017 and To date to 2/27/2017 will return only 5000 events for a month
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "08/01/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        And the grid "activity_logs" has 5000 rows

    Scenario: 5) Changing From date to 2/27/2017 and To date to 2/27/2018 will return all events up to 5000 for small date range
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/04/2018" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        And the grid "activity_logs" has 5000 rows

    Scenario: 6) Changing From date to 2/01/2017 and To date to 2/13/2017 will return all events for date range in the past
        When I select date "07/02/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/03/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        And the grid "activity_logs" has 2226 rows
