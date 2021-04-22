Feature: Mentors should be able to relavant information to their profiles for prospective mentees

    As a highly qualified and proud mentor
    I would like to put my credentials and abilities in a profile
    So that potential mentees can find me and know that I am the right fit for them

Background: there are a few users and mentors signed up and I am on the edit mentor profile page
    Given there are 5 users
    And there are 3 mentors
    And testuser 1 is a mentor
    And I am logged in as testuser 1
    And I am on the "home" page
    And I navigate to the "edit mentor profile" page
    Then 5 users should exist
    And I should be logged in

Scenario: Mentor can add professional details on mentor page
    When testuser 1 has mentor profile info 1
    And I enter mentor profile info 2
    Then testuser 1 should have mentor profile info 2

Scenario: Mentor can add or remove subjects they want to teach
    When I navigate to the "edit subjects" page
    And I select subject 1
    And I select subject 2
    And I add subjects
    And I return to the "edit subjects" page
    And I remove subject 1
    And I change subjects
    Then testuser 1 should have subject 2
    And testuser 1 should not have subject 2

Scenario: Mentor can add a profile picture
    When I add profile picture 1
    Then testuser 1 should have profile picture 1

Scenario: Mentor can add a resume (or other establishing documents)
    When I upload resume 1
    And I submit changes
    Then testuser 1 should have submited resume 1

Scenario: Changes to mentor page apply to the catalog
    When I enter mentor profile info 1
    And I navigate to the "edit subjects" page
    And I add subject 1
    And I return to the "edit mentor profile" page
    And I add profile picture 1
    And I navigate to the "catalog" page
    And I search for subject 1
    Then I should see testuser 1 in search results

Scenario: Changes to mentor page apply to mentor profile page
    When I enter mentor profile info 1
    And I navigate to the "mentor professional" page
    And I add subject 1
    And I return to the "edit mentor profile" page
    And I add profile picture 1

#Scenario: Mentor can delete information from their page