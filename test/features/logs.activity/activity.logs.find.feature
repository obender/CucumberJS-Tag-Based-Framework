Feature: Activity Logs Find
    As a product manager
    I want our customers to be able to find activity log events for a single day or multiple days by searching
    So that they can quickly find data they are looking

    Rules:
    - Entering text in the Find field will display the event rows that have matching text for a certain date

    Background: Open "Activity Logs" page via "Analytics" as logged in user
        Given I am logged in
        When I click Tag "Analytics"
        And I click Tag "Activity Log"

    Scenario: 1) Enter the text "555" for the date 07/01/2017 and 234 events will be returned
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/01/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        Then the grid "activity_logs" has any rows
        When I set Tag "~grid:search||#activityLog" to "555"
        And I press the "Enter" key
        Then the grid "activity_logs" has 234 rows

    Scenario: 2) Enter the text "400" for the date 07/01/2017 and 3 events will be returned
        When I select date "07/01/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/01/2017" in Tag "Activity To Date infaCalendar"
        And I click Tag "Show Activity Log"
        Then the grid "activity_logs" has any rows
        When I set Tag "~grid:search||#activityLog" to "400"
        And I press the "Enter" key
        Then the grid "activity_logs" has 3 rows

    #Manually tested these features
    #Scenario: 3) Clicking the x after having searched for a term will clear the find field
    #Scenario: 4) Clicking on the Timestamp column in the pull down menu will sort Ascending and clicking on it again will sort Descending
    #Scenario: 5) Clicking on the Endpoint column in the pull down menu will sort Ascending and clicking on it again will sort Descending
    #Scenario: 6) Clicking on the HTTP Response column in the pull down menu will sort Ascending and clicking on it again will sort Descending
    #Scenario: 7) Clicking on the Description column in the pull down menu will sort Ascending and clicking on it again will sort Descending
    #Scenario: 8) Clicking on the Username column in the pull down menu will sort Ascending and clicking on it again will sort Descending
    #Scenario: 9) Clicking on the IP Address column in the pull down menu will sort Ascending and clicking on it again will sort Descending
