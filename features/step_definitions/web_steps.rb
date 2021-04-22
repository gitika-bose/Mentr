require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )(?:am on) (?:|the )"([^"]*)"(?:| page)$/ do |page_name|
  visit path_to(page_name)
end

Given /^(?:|I )(?:navigate|return) to (?:|the )"([^"]*)"(?:| page)$/ do |page_name|
  case page_name
    when /^home$/ then click_link("home_link")
    when /^user (.*)$/ then 
      username = page_name[5,page_name.size]
      click_link("catalog_link")
      fill_in("catalog_search", :with => username)
      click_button("catalog_search_button")
      page.find('div', text: username).find("more_info_button").click
    when /^(sign\sup|register)$/ then click_link("sign_up_link")
    when /^(sign\sin|login)$/ then click_link("login_link")
    when /^catalog$/ then click_link("catalog_link")
    when /^edit\sprofile$/ then click_link("edit_profile_link")
    when /^become\smentor$/ then click_link("new_mentor_profile_link")
    when /^(update\smentor|edit\smentor\sprofile)$/ then click_link("edit_profile_link")
    when /^edit\s(user)?\spassword$/ then click_link("edit_profile_link")
    when /^delete\s(user|account)$/ then click_link("edit_profile_link")
    when /^sessions$/ then click_link("sessions_link")
    when /^edit\ssubjects$/ then click_link("edit_profile_link")
  else
    raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
              "Now, go and add a mapping in #{__FILE__}"
  end
end

Then /^(?:|I )should be on (?:|the )"([^"]*)"(?:| page)$/ do |page_name|
  current_path = URI.parse(current_url).path
  case page_name
    when /^catalog$/ then 
      expect(current_path.to_s).to include("catalog")
    when /^edit\sprofile$/ then
      expect(current_path.to_s).to include("edit")
  else
    if current_path.respond_to? :should
      current_path.should == path_to(page_name)
    else
      assert_equal path_to(page_name), current_path
    end
  end
end

Then /^(?:I )should (?:get|see) error "(.*)"$/ do |error_name|
  error_message = "@NOT IMPLEMENTED"
  if ["blank password", "incorrect password", "user not found"].include? error_name
    error_message = "Invalid Login or password."
    find(:css, '.flash.text-danger').should have_content(error_message)
  elsif error_name == "user already in database"
    expect(page).to have_text("Username has already been taken")
  elsif error_name == "email already in database"
    expect(page).to have_text("Email has already been taken")
  end
#  find(:css, '.flash.text-danger').should have_content(error_message) 
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