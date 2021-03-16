require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

When /^(?:|I )click sign up$/ do
    click_link("sign_up_link")
end

When /^(?:I )fill in duplicate information$/ do
  fill_in("username_register", :with =>  "bob")
  fill_in("email_register", :with =>  "kevin@mentre.me")
  fill_in("password_register", :with =>  "Keven1872")
  fill_in("confirmation_register", :with =>  "Keven1872")
end

When /^(?:I )fill in new account information$/ do
  fill_in("username_register", :with =>  "kevin")
  fill_in("email_register", :with =>  "kevin@mentre.me")
  fill_in("password_register", :with =>  "Keven1872")
  fill_in("confirmation_register", :with =>  "Keven1872")
end

When /^(?:|I )click register$/ do
  click_button("submit_register")
end

When /^(?:|I )login into my new account$/ do
    fill_in("username_email_login", :with => "kevin")
    fill_in("password_login", :with => "Keven1872")
    click_button("login_button")
  end
  

When /^(?:|I )change my password$/ do
  click_link("edit_profile_link")
  fill_in("username_edit", :with => "bob")
  fill_in("email_edit", :with => "bob@mentre.me")
  fill_in("password_edit", :with => "newpassword")
  fill_in("password_confirmation_edit", :with => "newpassword")
  fill_in("current_password_edit", :with => "bob1876")
  click_button("confirmation_change_password")
end

Then /^(?:I )should fail the sign up$/ do
  if page.respond_to? :should
      page.should have_content("error")
  else
    assert page.has_content?("error")
  end
end

Then /^(?:I )should fail the login$/ do
    if page.respond_to? :should
        page.should have_content("Log in")
    else
      assert page.has_content?("Log in")
    end
  end