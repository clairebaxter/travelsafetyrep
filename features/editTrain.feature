Feature: User can edit a subway line’s information
Scenario: Edit a subway line’s information
	Given I am on the UrbanPancake home page
	When I follow “More About the L”
	Then I should be on the Details About L page
	When I follow “Edit Info”
	Then I should be on the Edit Line page
	When I fill in the “Train” with “L”
	And I select “Yellow” from “Color”
	And I select “The Bronx” from “Borough”
	And I press “Save Changes”
	Then I should be on the UrbanPancake home page
	And I should see “L,” “Yellow,” “The Bronx”