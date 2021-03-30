require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

When /^(?:|I )search for (.+)$/ do | query |
    fill_in("catalog_search", :with => query)
end

When /^(?:|I )click search$/ do
    click_button("catalog_search_button")
end

When /^(?:|I )click more info$/ do
    click_link("more_info_button")
end

When /^(?:|I )click request session$/ do
    click_link("request_session_link")
end

When /^(?:|I )click back to all mentors$/ do
    click_link("back_to_catalog_link")
end

Then /^(?:I )should find (.+) results$/ do |tutor|
    if page.respond_to? :should
        page.should have_content(tutor)
    else
      assert page.has_content?(tutor)
    end
end

Then /^(?:I )should not find (.+) results$/ do |tutor|
    if page.respond_to? :should
        page.should have_no_content(tutor)
    else
      assert page.has_no_content?(tutor)
    end
end
