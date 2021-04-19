Feature: users can find the catalog page and search through tutors

  I am a mentee that would like to be tutored however I am easily
  overwhelmed by searching for a tutor. I would like to easily
  search for a tutor in a catalog.

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

Scenario: user can become tutor and view tutor info
  When I login
  And I click become mentor
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
