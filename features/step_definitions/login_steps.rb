
############## FUNCTIONS TO KILL ##############################

When /^(?:|I )(?:sign in|login) as temporary mentor$/ do
  fill_in("username_email_login", :with => "bil@mentr.me")
  fill_in("password_login", :with => "PoPcornHorse")
  click_button("login_button")
end

When /^(?:|I )register a temporary mentor in (.+)$/ do |subject|
    fill_in("username_email_login", :with => "bil@mentr.me")
    fill_in("password_login", :with => "PoPcornHorse")
    click_button("login_button")
    click_link("new_mentor_profile_link")
    fill_in("profile_edit", :with => "hewoooo")
    select2("Psychology", xpath: '/html/body/div[1]/form/div[7]/span', search: true)
    click_button("submit_mentor_register")
    click_link("logout_link")
    click_link("login_link")
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

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

###############################


When /^(?:|I )(?:sign in|login) as testuser (\d+)$/ do |n|
  fill_in("username_email_login", :with => test_username(n.to_i))
  fill_in("password_login", :with => test_userpassword(n.to_i))
  click_button("login_button")
end

When /^(?:|I )(?:|click )(?:sign in|login)$/ do
  click_button("login_button")
end

When /^(?:|I )(?:|click )(?:sign out|logout)$/ do
  click_link("logout_link")
end

When /^(?:|I )(?:sign in|login) with (username|password) for testuser (\d+)$/ do |param, n|
  if param == :username
    fill_in("username_email_login", :with => test_username(n.to_i))
  elsif param == :password
    fill_in("password_login", :with => test_userpassword(n.to_i))
  end
end

When /^(?:|I am )(?:signed|logged) in as testuser (\d+)$/ do |n|
  login_as test_user n.to_i
end

When /^(?:|I am )(?:signed|loged) in$/ do
  logout(:user)
end

Then /^(?:|I )should be (?:logged|signed) (?:in|on) as testuser (\d+)$/ do |n|
  expect(page).to have_text("Logged in as #{test_username n.to_i}")
end

Then /^(?:|I )should be (?:logged|signed) (?:in|on)$/ do
  has_link?('Loggout')
end

Then /^(?:|I )should be (?:logged|signed) (?:off|out)$/ do
  has_link?('Login')
end