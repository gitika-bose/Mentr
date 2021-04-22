Feature: user can navigate to and edit their profile

    As a maticulous user
    I would like to be able to navigate through the website
    So that I could understand all the features available for me

Background: 5 users are using the site
  Given there are 5 users
  And  I am on the "login" page
  Then 5 users should exist
  And I should be logged out

Scenario: user can access catalog
  When I login as testuser 1
  And I navigate to the "catalog" page
  Then I should be on the "catalog" page

Scenario: user can access edit profile
  When I login as testuser 1
  And I navigate to the "edit profile" page
  Then I should be on the "edit profile" page
