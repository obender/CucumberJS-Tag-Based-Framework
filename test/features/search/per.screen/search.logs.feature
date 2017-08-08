Feature: Search the Security logs

    Background: User is logged in and have a managed api with few security log records
        Given I am logged in
        When I click Tag "Analytics"
        Then I click Tag "Security Log"

    Scenario: Execute Preparation postman
        When Postman collection "search.logs" in folder "search" is Executed successfully 1 time

    Scenario: Get security logs for the specified date
        When I select date "02/01/2017" in Tag "From Date infaCalendar"
        And  I select date "02/02/2017" in Tag "To Date infaCalendar"
        And I click Tag "Show Log"
        Then the grid "logs" has any rows
        And the utc time in Tag "~grid:cell|1;;Timestamp|#securityLog" is "2/2/2017 16:23:26"

    Scenario: Search logs for time "403" expecting 4 events
        Then the grid "logs" has any rows
        When I set Tag "~grid:search||#securityLog" to "403"
        And I press the "Enter" key
        Then the grid "logs" has 4 rows
        And Tag "~grid:row|*;Endpoint=/t/0000s7.com/thomas3/1.0.0|#securityLog" has 0 row

    Scenario: Search logs for "000yvl" expecting 12 events, all of them containing the same endpoint. to find it out I look at the first and last row (last row: sorting by endpoint reversed)
        Then the grid "logs" has any rows
        When I set Tag "~grid:search||#securityLog" to "000yvl"
        And I press the "Enter" key
        Then the grid "logs" has 12 rows
        And the value of Tag "~grid:cell|1;;Endpoint|#securityLog" is "/t/000yvl.com/000YVL/employee/1.0.0"
        When I click Tag "~grid:header|Timestamp|#securityLog"
        Then the grid "logs" has 12 rows
        And the value of Tag "~grid:cell|1;;Endpoint|#securityLog" is "/t/000yvl.com/000YVL/employee/1.0.0"

    Scenario: Search logs for "@" expecting 4 events
        Then the grid "logs" has any rows
        When I set Tag "~grid:search||#securityLog" to "@"
        And I press the "Enter" key
        Then the grid "logs" has 4 rows
        And Tag "~grid:row|*;Endpoint=/t/000yvl.com/000YVL/employee/1.0.0|#securityLog" has 4 row

    Scenario: Search logs for "zzz" expecting no records
        When I set Tag "~grid:search||#securityLog" to "zzz"
        And I press the "Enter" key
        Then the grid "logs" has no rows
