# README

## Team Members
1. Gitika Bose (gb2606)
2. Sharon Jin (sj2846)
3. Jakwanul Safin (js5142)
4. Julio Gomez (jcg2201)

## Instructions To Run The Program 
#### In Production (Heroku) 
1. Visit: https://polar-forest-34288.herokuapp.com/
2. Click "Sign Up" to make a new account 
3. Update to "Mentor" profile
4. View all mentors in the catalog page

#### In Development (Tests) 
1. Run "bundle install" 
2. Run "yarn install"
3. Run "rails webpacker:install"
4. Run "rake db:migrate"
5. Run "rake cucumber" to test all user stories
7. Run "bundle exec rspec" to test all functionality 
8. Run "rails s" to test functionality locally

## Heroku Link 
https://polar-forest-34288.herokuapp.com/

## Github Repo
https://github.com/gitika-bose/Mentr

* Tag (for proj-iter1): v1.0
* Tag (for proj-iter2): v2.0

## Summary

SaaS Product Features 
* Dynamic homepage with "sign up" and "sign in" visible to public
* SaaS product contains a sign up and sign in page, allowing mentors and mentees to make an account
* SaaS product sign up ensures that users are unique
* Each mentor/mentee has a profile with their personal information (eg. username, profile picture) viewable only to themselves
* Users can become a mentor and edit or delete their mentor profile
* Users can search for mentors in the catalog, and click on mentor profiles for more information
* Users can request or cancel a session with a mentor, and receive confirmation emails
* Users can keep track of mentor request/cancellation history via the sessions page
* Users can edit their username, email, or password as needed 
* Users can delete their accounts 
* As a next step, we are working on adding more verification for users to become mentors (eg. background check)

## Coverage

Missing coverage can be attributed to default created files.
