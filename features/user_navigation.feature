Feature: user can navigate to and edit their profile

    As a very meticulous and renowned mentor I would like to
    create a profile that I can personalize.

Background: one mentor is using the site
  Given the following users exists

    | email                   | password            |
    | bob@mentr.me            | bob1876             |
    | bil@mentr.me            | PoPcornHorse        |
    | eric@mentr.me           | 1234567             |
    | john23@mentr.me         | QWERTY              |
    | dillen@mentr.me         | PassWord$           |

  And  I am on the login page

Scenario: mentor can access profile
  When I click "profile"
  Then I should be on the profile page
