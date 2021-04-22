Feature: Users should be able to sign up
  
  As a person seeking advice and learning
  I would like to register with mentre me
  So that the experience is fast and painfree

Background: a few users are on the site and a new user wants to sign up
  Given there are 5 users
  And  I am on the "sign up" page
  Then 5 users should exist
  And I should be logged out

Scenario: A user should be able to successfully sign up for an account
  When I sign up as testuser 6
  Then I should be logged in as testuser 6
  And testuser 6 should be registered
  And 6 users should exist

Scenario: A user who is already signed up up tries to sign up
  When testuser 1 is registered
  And I sign up as testuser 1
  Then I should get error "user already in database"

Scenario: A user should sign up only as a mentee
  When I sign up as testuser 6
  Then testuser 6 should not be a mentor

Scenario: A user should be able to update their password
  When I sign up as testuser 6
  And I navigate to the "edit user password" page
  And I change my password to testpassword 1 as testuser 6
  Then testuser 6 should have testpassword 1

Scenario: A user should be able to cancel their account
  When I sign up as testuser 6
  And I navigate to the "delete account" page
  And I delete my account
  Then testuser 6 should not be registered
  And 5 users should exist