Feature: users can find the login in page and sign into their accounts

  As a time-constrained mentor I would to very quickly and easily
  be able to login into my account and see all my current mentee's
  
Background: a few mentors and mentees are using the site
  Given the following users exists

    | email                   | password            |
    | bob@mentr.me            | bob1876             |
    | bil@mentr.me            | PoPcornHorse        |
    | eric@mentr.me           | 12334567772         |
    | john23@mentr.me         | QWERTY              |
    | dillen@mentr.me         | PassWord            |

  And  I am on the login page
  Then 5 seed users should exist

Scenario: mentor can login
  When I sign in with correct credentials
  Then I should be on the user page

Scenario: user can logout
  When I logout
  Then I should be on login page