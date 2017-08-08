Feature: Activity Logs Sort By Header
    As a product manager
    I want our customers to be able to sort the column headings Ascending and Descending for Activity log events for a single day or multiple days
    So that they can quickly find the event they are looking for

    Rules:
    - Clicking on the column Heading Ascending and Descending for Activity Log Grid will sort the columns properly for certain date

    Background: Open "Activity Logs" page via "Analytics" as logged in user
        Given I am logged in
        When I click Tag "Analytics"
        And I click Tag "Activity Log"

    Scenario: 1) All columns of the grid are displayed in correct order
        When I select date "06/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "06/02/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        And the grid "activity_logs" has any rows
        And the value of Tag "~grid:cell|1;;Invocation Time" contains "6/2/2017"
        Then Tag "~grid:validateColumns|API Name;API URL;Type;Resource Path;Method;HTTP Response;Consumer IP;Username;Latency;Invocation Time|#activityLog" is displayed

    Scenario: 2) Clicking on the "Invocation Time" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|Invocation Time"
        And the value of Tag "~grid:cell|1;;Invocation Time" contains "6/1/2017"
        And the value of Tag "~grid:cell|1;;Invocation Time" contains "3:00:00 AM"
        When I click Tag "~grid:header|Invocation Time"
        Then the utc time in Tag "~grid:cell|1;;Invocation Time" is "6/1/2017 23:58:53 PM"

    Scenario: 3) Clicking on the "API URL" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|API URL"
        And the value of Tag "~grid:cell|1;;API URL" is "/t/0000s7.com/Anonymous/1.0.0?Swagger"
        When I click Tag "~grid:header|API URL"
        Then the value of Tag "~grid:cell|1;;API URL" is "/t/0000s7.com/Employee6A/1.0.0?id=01"

    Scenario: 4) Clicking on the "HTTP Response" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|HTTP Response"
        And the value of Tag "~grid:cell|1;;HTTP Response" is "200 OK"
        When I click Tag "~grid:header|HTTP Response"
        Then the value of Tag "~grid:cell|1;;HTTP Response" is "500 Internal Server Error"

    Scenario: 5) Clicking on the "Username" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|Username"
        And the value of Tag "~grid:cell|1;;Username" is "Anonymous"
        When I click Tag "~grid:header|Username"
        Then the value of Tag "~grid:cell|1;;Username" is "Employee6A"

    Scenario: 6) Clicking on the "Consumer IP" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|Consumer IP"
        And the value of Tag "~grid:cell|1;;Consumer IP" is "10.0.2.2"
        When I click Tag "~grid:header|Consumer IP"
        Then the value of Tag "~grid:cell|1;;Consumer IP" is "14.0.2.2"

    Scenario: 7) Clicking on the "API Name" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|API Name"
        And the value of Tag "~grid:cell|1;;API Name" is "Anonymous"
        When I click Tag "~grid:header|API Name"
        Then the value of Tag "~grid:cell|1;;API Name" is "Employee6A"

    Scenario: 8) Clicking on the "Resource Path" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|Resource Path"
        And the value of Tag "~grid:cell|1;;Resource Path" is "id=0"
        When I click Tag "~grid:header|Resource Path"
        Then the value of Tag "~grid:cell|1;;Resource Path" is "swagger"

    Scenario: 9) Clicking on the "Method" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|Method"
        And the value of Tag "~grid:cell|1;;Method" is "GET"
        When I click Tag "~grid:header|Method"
        Then the value of Tag "~grid:cell|1;;Method" is "POST"

    Scenario: 10) Clicking on the "Type" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|Type"
        And the value of Tag "~grid:cell|1;;Type" is "REST"
        When I click Tag "~grid:header|Type"
        Then the value of Tag "~grid:cell|1;;Type" is "REST"

    Scenario: 11) Clicking on the "Latency" column will sort Ascending and clicking on it again will sort Descending
        When I click Tag "~grid:header|Latency"
        And the value of Tag "~grid:cell|1;;Latency" is "111"
        When I click Tag "~grid:header|Latency"
        Then the value of Tag "~grid:cell|1;;Latency" is "6662"
