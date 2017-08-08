Feature: Activity Logs Error
    As a product manager
    I want our customers to be able to see proper activity logs of the recent dates

    Rules:
    - Return Error messages for Invalid Date Ranges and Formats

    Background: Open "Activity Logs" page via "Analytics" as logged in user
        Given I am logged in
        When I click Tag "Analytics"
        And I click Tag "Activity Log"

    Scenario: 1) Changing From date to 2/14/2017 and To date to 2/03/2017 will return error message To Date should be before From Date
        When I select date "07/07/2017" in Tag "Activity From Date infaCalendar"
        And  I select date "07/01/2017" in Tag "Activity To Date infaCalendar"
        Then the value of Tag "Activity Date Message" is "To date should not come before From date."

    Scenario: 2) Changing From date to 3/12/2018 and To date to 2/26/2017 will return error message From Date should be after To Date
        When I select date "07/26/2017" in Tag "Activity To Date infaCalendar"
        And  I select date "07/12/2018" in Tag "Activity From Date infaCalendar"
        Then the value of Tag "Activity Date Message" is "From date should not come after To date."
