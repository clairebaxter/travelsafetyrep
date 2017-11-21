#cucumber features/ addTrain.feature
Feature: User can manually add subway line
Scenario: Add a subway line
Given I am on the UrbanPancake home page
When I follow "Lines"
Then I should be on the Lines page
When I follow "Add New Train"
Then I should be on the Create New Line page
When I fill in "Train" with "N"
And I select "Yellow" from "Color"
And I select "Brooklyn" from "Borough"
And I fill in "Description" with "Great train!"
And I press "Save Changes"
Then I should be on the Lines page
And I should see "N was successfully created."
