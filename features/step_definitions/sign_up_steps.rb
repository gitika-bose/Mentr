When /^(?:|I )click sign up$/ do
    click_link("submit_register")
end

When /^(?:|I )sign up as testuser (\d+)$/ do |n|
  user = test_user n.to_i

  fill_in("username_register", :with =>  user.username)
  fill_in("email_register", :with =>  user.email)
  fill_in("password_register", :with =>  user.password)
  fill_in("confirmation_register", :with =>  user.password)
  click_button("submit_register")
end

When /^(?:|I )change my password to testpassword (\d+) as testuser (\d+)$/ do |m, n|
  user = User.find_by_username(test_username n.to_i)
  new_password = test_userpassword m.to_i

  fill_in("username_edit", :with => user.username)
  fill_in("email_edit", :with => user.email)
  fill_in("password_edit", :with => new_password)
  fill_in("password_confirmation_edit", :with => new_password)
  fill_in("current_password_edit", :with => user.password)
  click_button("confirmation_change_password")
end

Then /^testuser (\d+) should have testpassword (\d+)$/ do |n, m|
  logout(:user)
#  user = User.find_by_username(test_username n.to_i)
  visit path_to("login")
  fill_in("username_email_login", :with => test_username(n.to_i))
  fill_in("password_login", :with => test_userpassword(m.to_i))
  click_button("login_button")
  has_link?('Loggout')
  #expect(user.password).to be(test_userpassword m.to_i)
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

When /^(?:|I )delete my account$/ do
    click_link("edit_profile_link")
    fill_in("username_edit", :with => "bob")
    fill_in("email_edit", :with => "bob@mentre.me")
    fill_in("current_password_edit", :with => "bob1876")
    click_button("delete_account_button")
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
        page.should have_content("Login")
    else
      assert page.has_content?("Login")
    end
  end