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

Then /^(?:I )should find tutor results$/ do
    if page.respond_to? :should
        page.should have_content("XYZ")
    else
      assert page.has_content?("XYZ")
    end
end

Then /^(?:I )should not find tutor results$/ do
    if page.respond_to? :should
        page.should have_no_content("XYZ")
    else
      assert page.has_no_content?("XYZ")
    end
end

Then /^(?:I )should find all tutor results$/ do
    if page.respond_to? :should
        page.should have_content("bob")
        page.should have_content("bil")
        page.should have_content("eric")
        page.should have_content("john")
        page.should have_content("dillen")
    else
      assert page.has_content?("bob")
      assert page.has_content?("bil")
      assert page.has_content?("eric")
      assert page.has_content?("john")
      assert page.has_content?("dillen")
    end
end
