Feature: users can request mentors

  I am a user that would like to request a mentor. However,
  this involves a lot of complicated communication to get
  approved, and I want an easier way to get a session.

Background: a few mentors and mentees are using the site
  Given there are 5 users
  And testuser 1 is registered as a mentor
  And testuser 2 is registered as a mentee
  And testuser 3 is registered as a mentor
  And testuser 3 is registered as a mentee
  And I am on the "home" page
  Then 5 seed users should exist

Scenario: user can request a mentor session
  When I register a temporary mentor
  And I login
  And I click catalog
  And I search for bil
  And I click search
  And I click more info
  And I click request session
  Then I should find requested results

Scenario: mentor can request and accept a mentor session
  When I register a temporary mentor
  And I login
  And I click catalog
  And I search for bil
  And I click search
  And I click more info
  And I click request session
  And I logout
  And I navigate to sign in
  And I login as temporary mentor
  And I click sessions
  And I click approve session
  Then I should find accepted results

Scenario: user can request and cancel a mentor session
  When I register a temporary mentor
  And I login
  And I click catalog
  And I search for bil
  And I click search
  And I click more info
  And I click request session
  And I click cancel session
  Then I should find terminated results

Scenario: mentors and mentees can view information about and organize their session