require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )(?:am on|navigate to|return to) (?:|the )"([^"]*)" page$/ do |page_name|
    visit path_to(page_name)
end

Then /^(?:I )should (?:get|see) error "(.*)"$/ do |error_name|
  error_message = "@NOT IMPLEMENTED"
  if ["blank password", "incorrect password", "user not found"].include? error_name
    error_message = "Invalid Login or password."
  end
  find(:css, '.flash.text-danger').should have_content(error_message)
end

When /^(?:|I )click catalog$/ do
  click_link("catalog_link")
end

When /^(?:|I )click become mentor$/ do
  click_link("new_mentor_profile_link")
end

When /^(?:|I )navigate to sign in$/ do
  click_link("login_link")
end