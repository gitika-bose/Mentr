Feature: users can find the login in page and sign into their accounts

  As a time-constrained mentor I would to very quickly and easily
  be able to login into my account and see all my current mentee's
  
Background: a few mentors and mentees are using the site
  Given the following users exists

    | username | email                   | password            |
    | bob      | bob@mentr.me            | bob1876             |
    | bil      | bil@mentr.me            | PoPcornHorse        |
    | eric     | eric@mentr.me           | 12334567772         |
    | john     | john23@mentr.me         | QWERTY              |
    | dillen   | dillen@mentr.me         | PassWord            |

  And  I am on the login page
  Then 5 seed users should exist

Scenario: mentor can login
  When I sign in with correct credentials
  And I click sign in
  And I click catalog
  Then I should be on the catalog page

Scenario: mentor can login from homepage
  When I am on the home page
  And I navigate to sign in
  And I sign in with correct credentials
  And I click sign in
  And I click catalog
  Then I should be on the catalog page

Scenario: user can logout
  When I login
  When I logout
  Then I should be on the homepage