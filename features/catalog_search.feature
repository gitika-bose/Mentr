Feature: users can find the catalog page and search through tutors

  As a new mentee who is easily overwhelmed by cumbersome UI
  I would like to easily search for a tutor in a catalog
  So that I can find a mentor that suits my need as efficiently as possible

Background: a few mentors and mentees are using the site
  Given there are 5 users
  And  I am on the catalog page
  Then 5 seed users should exist
  And I should be logged out

Scenario: user can become tutor and view tutor info
  When I login as testuser 1
  And I am on the become a mentor page
  And I add mentor info for Psychology
  And I click sign up as mentor button
  And I click catalog
  And I search for bob
  And I click search
  And I click more info
  Then I should find bob results

Scenario: user can't search for other mentees
  When I login
  And I click catalog
  And I search for potato
  And I click search
  Then I should not find potato results

Scenario: user can search for mentor, view mentor info, and go back to catalog
  When I register a temporary mentor in Statistics
  And I login
  And I click catalog
  And I search for bil
  And I click search
  And I click more info
  And I click back to all mentors
  Then I should find bil results

Scenario: user can navigate to all mentors from the categories page
  When I register a temporary mentor in Statistics
  And I login
  And I click catalog
  And I click All categories
  Then I should find bil results
  Then I should find bob results

Scenario: user can navigate from the categories page to find subject specific mentors
  When I register a temporary mentor in Statistics
  And I login
  And I click catalog
  And I click Statistics categories
  Then I should find bil results
  Then I should not find bob results
