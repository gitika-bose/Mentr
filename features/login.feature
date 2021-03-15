Feature: users can find the login in page and sign into their accounts

  As a time-constrained mentor I would to very quickly and easily
  be able to login into my account and see all my current mentee's
  
Background: a few mentors and mentees are using the site
  Given the following users exists

    | email                   | password            |
    | bob@mentr.me            | bob1876             |
    | bil@mentr.me            | PoPcornHorse        |
    | eric@mentr.me           | 1234                |
    | john23@mentr.me         | QWERTY              |
    | dillen@mentr.me         | PassWord$           |

  And  I am on the login page
  Then 5 seed users should exist

Scenario: mentor can find and enter login page
  When I enter "bob@mentr.me" in the "email" feild
  And I enter "bob1876" in the "password" feild
  Then I should be on the "bob@mentr.me" user page