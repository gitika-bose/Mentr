Feature: Users should be able to sign up
  
  I am a mentee that would like to be tutored however I am easily
  overwhelmed by complicated websites and often make mistakes. I 
  would like to quickly and effortlessly create an account.

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

Scenario: A duplicate account is created
  When I click sign up
  And I fill in duplicate information
  And I click register
  Then I should fail the sign up

Scenario: A user should be able to sucessfully sign up
  When I click sign up
  And I fill in new account information
  And I click register
  Then 6 users should exist

Scenario: A user should be able to update their password
  When I login
  And I change my password
  And I logout
  And I login
  Then I should fail the login

Scenario: A user should be able to cancel their account
  When I log into my new account
  And I delete my account
  Then 5 users should exist