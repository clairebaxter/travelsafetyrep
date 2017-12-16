#cucumber features/joinTrip.feature
Feature: User can manually join subway trip (happy)
Scenario: Join a subway trip
Given I am on the Trips page
When I follow "More Info"
And I press "Join"
Then I am on the Trips page
And I see "You have successfully joined 1 this trip."