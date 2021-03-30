Feature: users can request mentors

  I am a user that would like to request a mentor. However,
  this involves a lot of complicated communication to get
  approved, and I want an easier way to get a session.

Background: a few mentors and mentees are using the site
  Given the following users exists

    | username | email                   | password            |
    | bob      | bob@mentr.me            | bob1876             |
    | bil      | bil@mentr.me            | PoPcornHorse        |
    | eric     | eric@mentr.me           | 12334567772         |
    | john     | john23@mentr.me         | QWERTY              |
    | dillen   | dillen@mentr.me         | PassWord            |

  And I am on the catalog page
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
