#cucumber features/joinTrip.feature
Feature: User can manually join subway trip
Scenario: Join a subway trip (happy)
Given I am on the Trips page
When I follow "More Info"
And I press "Join"
Then I am on the Trips page
And I see "You have successfully joined 1 this trip."

Senario: Join a subway trip (sad)
Given I am on the Trips page
When I follow "More Info"
And I press "Join"
Then I am on the Trips page
And I see "There are no current trips."