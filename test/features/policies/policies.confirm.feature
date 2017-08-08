
Feature: Policies - IP filtering Acttions

    prerequisite: two rules (in addition to the general rule) exist

    Background: Log in and open the policies pub
        Given I am logged in

    Scenario: change Allow. first - regret, then - approve
        Given Postman collection "policies.confirm" in folder "policies" is Executed successfully 1 time
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has any rows
        When I set Tag "Allow" to "1234"
        Then Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
        And Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I approve the alert
        Then Tag "Show Log" is displayed

    Scenario: change request number first - regret, then - approve (make sure that cancel in IP filtering does not revert the dirty flag of rate limit)
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has any rows
        When I set Tag "requests, every" to "7890"
        And I focus on Tag "Cancel" and I click Tag "Cancel"
        Then Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
        And Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I approve the alert
        Then Tag "Show Log" is displayed

    Scenario: change fromIP, try to run out. first - regret, theen - approve
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has any rows
        When I set Tag "~ipv4:fromIp|1" to "1"
        When I set Tag "~ipv4:fromIp|2" to "1"
        Then Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
        And  Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I approve the alert
        Then Tag "Show Log" is displayed

    Scenario: change toIP. first - regret, theen - approve
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has any rows
        When I set Tag "~ipv4:toIp|4" to "1"
        Then Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
        And Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I approve the alert
        Then Tag "Show Log" is displayed

    Scenario: change description. first - regret, theen - approve
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has any rows
        When I set Tag "description" to "xxx"
        Then Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
        And Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I approve the alert
        Then Tag "Show Log" is displayed

    Scenario: action on last row - deny all
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has 3 rows
        When I focus on Tag "~grid:row|3" and I Click Tag "~grid:menu|3" and I click on text "Change to Deny All"
        Then Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
        And Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I approve the alert
        Then Tag "Show Log" is displayed

    Scenario: action on last row + revert, does not require confirmation
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has 3 rows
        When I focus on Tag "~grid:row|3" and I Click Tag "~grid:menu|3" and I click on text "Change to Deny All"
        Then the value of Tag "~grid:row|3" is "Deny|Any|Any"
        When I focus on Tag "Cancel" and I click Tag "Cancel"
        Then the value of Tag "~grid:row|3" is "Allow|Any|Any"
        When I click Tag "Analytics"
        Then Tag "Show Log" is displayed

    Scenario: action on first row - move down, verify alert is displayed
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has 3 rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Move Down"
        Then the value of Tag "~grid:row|1" is "Allow|1.2.3.4|1.2.3.8"
        And the value of Tag "~grid:row|2" is "Allow|5.6.7.8|5.6.7.9"
        And Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
        When I focus on Tag "Cancel" and I click Tag "Cancel"
        Then the value of Tag "~grid:row|1" is "Allow|5.6.7.8|5.6.7.9"
        And the value of Tag "~grid:row|2" is "Allow|1.2.3.4|1.2.3.8"

    Scenario: (continued) now I delete the 2nd row, verify alert is displayed
        Given Tag "Policies" is clickable
        When I click Tag "Analytics"
        Then Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has 3 rows
        When I focus on Tag "~grid:row|1" and I Click Tag "~grid:menu|1" and I click on text "Delete"
        Then the grid "ipFiltering" has 2 rows
        And Tag "Analytics" is clickable
        When I click Tag "Analytics"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
        When I focus on Tag "Cancel" and I click Tag "Cancel"
        Then the grid "ipFiltering" has 3 rows

    Scenario: change something -> try to log out and get confirmation dialog
        Given Tag "Policies" is clickable
        When I focus on Tag "Policies" and I Click Tag "Policies"
        Then the grid "ipFiltering" has 3 rows
        When I set Tag "Allow" to "1234"
        Then Tag "UserMenu" is clickable
        When I focus on Tag "UserMenu" and I Click Tag "UserMenu" and I click on text "Log Out"
        Then alert containing text "may not be saved" is displayed
        When I reject the alert
        Then Tag "requests, every" is displayed
