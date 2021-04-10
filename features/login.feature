Feature: users can find the login in page and sign into their accounts

  As a time-constrained mentor 
  I want to efficiently and securely login into my account
  So that the experience is fast and painfree
  
Background: a few users are on the site and a returning user wants to log in
  Given there are 5 users
  And  I am on the login page
  Then 5 seed users should exist
  And I should be logged out

Scenario: user can log in
  When I sign in as testuser 1
  Then I should be logged in

Scenario: user can log out
  When I sign in as testuser 1
  And I sign out
  Then I should be logged out

Scenario: user leaves password blank
  When I use username for testuser 1
  And I sign in
  Then I should get error "blank password"

Scenario: user uses incorrect password
  When I use username for testuser 1
  And I use password for testuser 2
  And I sign in
  Then I should get error "incorrect password"

Scenario: user can navigate to the log in from the root
  When I am on the home page
  And I navigate to sign in
  And I sign in as testuser 1
  Then I should be logged in

Scenario: Unregisted users can not log in
  When I sign in as testuser 6
  Then I should get error "user not found"