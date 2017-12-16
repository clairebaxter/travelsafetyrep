#cucumber features/ addTrain.feature
Feature: User can manually add subway line
Scenario: Add a subway line
Given I am on the Urban Pancake home page
When I follow "Train Info"
Then I am on the Lines page
When I select "N" from "Train" column
And I select "Yellow" from "Color" column
And I select "Brooklyn" from "Borough" column
And I press "Save Changes"
Then I am on the Lines page
And I see "N was successfully created."
