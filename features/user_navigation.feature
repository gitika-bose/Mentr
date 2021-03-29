Feature: user can navigate to and edit their profile

    As a very meticulous and renowned mentor I would like to
    create a profile that I can personalize.

Background: one mentor is using the site
  Given the following users exists

    | username | email                   | password            |
    | bob      | bob@mentr.me            | bob1876             |
    | bil      | bil@mentr.me            | PoPcornHorse        |
    | eric     | eric@mentr.me           | 12334567772         |
    | john     | john23@mentr.me         | QWERTY              |
    | dillen   | dillen@mentr.me         | PassWord            |

  And  I am on the login page
  Then 5 seed users should exist

Scenario: mentor can access profile
  When I login
  And I click catalog
  Then I should be on the catalog page

Scenario: mentor can access edit profile
  When I login
  And I click edit profile
  Then I should be on the edit profile page
