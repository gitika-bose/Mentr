require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )am on (.+)$/ do |page_name|
    visit path_to(page_name)
  end

When /^(?:|I )sign in as testuser (\d*)$/ do |n|
  fill_in("username_email_login", :with => test_username(n.to_i))
  fill_in("password_login", :with => test_userpassword(n.to_i))
  click_button("login_button")
end

When /^(?:|I )sign in with correct credentials$/ do
    fill_in("username_email_login", :with => "bob@mentr.me")
    fill_in("password_login", :with => "bob1876")
end

When /^(?:|I )register a temporary mentor$/ do
    fill_in("username_email_login", :with => "bil@mentr.me")
    fill_in("password_login", :with => "PoPcornHorse")
    click_button("login_button")
    click_link("new_mentor_profile_link")
    fill_in("profile_edit", :with => "hewoooo")
    click_button("submit_mentor_register")
    click_link("logout_link")
    click_link("login_link")
end

When /^(?:|I )login as temporary mentor$/ do
    fill_in("username_email_login", :with => "bil@mentr.me")
    fill_in("password_login", :with => "PoPcornHorse")
    click_button("login_button")
end

When /^(?:|I )navigate to sign in$/ do
  click_link("login_link")
end


When /^(?:|I )click sign in$/ do
  click_button("login_button")
end

When /^(?:|I )login$/ do
  fill_in("username_email_login", :with => "bob@mentr.me")
  fill_in("password_login", :with => "bob1876")
  click_button("login_button")
end

When /^(?:|I )click catalog$/ do
  click_link("catalog_link")
end

When /^(?:|I )click become mentor$/ do
  click_link("new_mentor_profile_link")
end

When /^(?:|I )click update mentor$/ do
  click_link("edit_mentor_profile_link")
end

When /^(?:|I )click edit profile$/ do
  click_link("edit_profile_link")
end

When /^(?:|I )click sessions$/ do
  click_link("sessions_link")
end

When /^(?:|I )(?:|click )(?:logout|sign out)$/ do
    click_link("logout_link")
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
      current_path.should == path_to(page_name)
    else
      assert_equal path_to(page_name), current_path
    end
end

Then /^(?:|I )should be logged in$/ do
  has_link?('Loggout')
end

Then /^(?:|I )should be logged out$/ do
  has_link?('Login')
end
