require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

When /^(?:|I )add mentor info for (.+)$/ do |subject|
    fill_in("profile_edit", :with => "changed")
    fill_in("company_edit", :with => "Google")
    fill_in("location_edit", :with => "NYC")
    fill_in("website_edit", :with => "https://www.google.com/")
    fill_in("linkedin_edit", :with => "https://www.linkedin.com/")
    select "Probability", :from => "form-tags"
end

When /^(?:|I )register as a (?:|temporary )mentor in "(.*)"$/ do |subject_name|
    fill_in("profile_edit", :with => "changed")
    fill_in("company_edit", :with => "Google")
    fill_in("location_edit", :with => "NYC")
    fill_in("website_edit", :with => "https://www.google.com/")
    fill_in("linkedin_edit", :with => "https://www.linkedin.com/")
    select subject_name, :from => "form-tags"
    click_button("submit_mentor_register")
end

When /^"(.+)" is a subject$/ do |subject|
    Subject.create(:name => subject)
end

When /^(?:|I )click sign up as mentor button$/ do
    click_button("submit_mentor_register")
end

When /^(?:|I )click save mentor button$/ do
    click_button("edit_mentor_profile")
end

When /^(?:|I )click quit mentor button$/ do
    click_button("delete_mentor_account_button")
end
