Feature: A user can access their own account information 
Scenario: View users account (happy)
Given I am on the Lines page
When I follow "Account"
Then I am on the Account page
And I see "MY ACCOUNT"

Scenario: View users account (sad)
Given I am on the Lines page
When I follow "Account"
Then I am on the Account page
And I see "User does not exist."