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
  And I add mentor info
  And I click sign up as mentor button
  And I click catalog
  And I search for bob
  And I click search
  And I click more info
  Then I should find bob results

Scenario: user can't search tutor
  When I login
  And I click catalog
  And I search for potato
  And I click search
  Then I should not find potato results

Scenario: user can search tutor, view tutor info, and book tutor
  When I register a temporary mentor
  And I login
  And I click catalog
  And I search for bil
  And I click search
  And I click more info
  And I click request session

Scenario: user can search tutor, view tutor info, and go back to catalog
  When I register a temporary mentor
  And I login
  And I click catalog
  And I search for bil
  And I click search
  And I click more info
  And I click back to all mentors
  Then I should find bil results
  