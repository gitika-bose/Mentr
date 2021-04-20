Feature: users can become mentors and update mentor info

  I am a user that would like to become a mentor. However,
  this involves a lot of complicated communication to get
  approved, and I want an easier way to sign up.

Background: a few mentors and mentees are using the site
  Given there are 5 users
  And  I am on the catalog page
  Then 5 seed users should exist
  And I should be logged out

Scenario: user can become mentor
  When I login
  And I click become mentor
  And I add mentor info for Psychology
  And I click sign up as mentor button
  And I click catalog
  And I search for bob
  And I click search
  And I click more info
  Then I should find bob results

Scenario: user can update mentor data
  When I login
  And I click become mentor
  And I add mentor info for Psychology
  And I click sign up as mentor button
  And I click update mentor
  And I add mentor info
  And I click save mentor button
  And I click catalog
  And I search for bob
  Then I should find changed results

Scenario: user can delete mentor data
  When I login
  And I click become mentor
  And I add mentor info for Psychology
  And I click sign up as mentor button
  And I click update mentor
  And I click quit mentor button
  And I click catalog
  And I search for bob
  Then I should not find changed results
