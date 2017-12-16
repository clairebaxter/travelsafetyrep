#cucumber features/joinTrip.feature
Feature: User can manually join subway trip
Scenario: Join a subway trip
Given I am on the Trips page
When I follow "Create New Trip"
And I select "A" from "Train" 
And I select "2017 December 16 11PM 00" from "Departure Time"
And I press "Save Changes"
Then I am on the Trips page
And I see "Thank you, Ellen Upton, your trip was successfully created."