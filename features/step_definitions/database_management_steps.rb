def test_username (n)
    base_names = ['Bob', 'Bill', 'Erica', 'John_Zimmerman', 'Dillen']
    m = base_names.length()
    if n < m
        "%s" % [base_names[n]]
    else
        "%s%d_%d" % [base_names[n % m], 7^n % 1000, n]
    end
end

def test_useremail (n)
    base_emails = ['bob@mentr.me', 'bill@mentr.me', 'eric@mentr.me', 'john@orange.me', 'dillen@hotmail.me']
    m = base_emails.length()
    if n < m
        base_emails[n]
    else
        "%s@mentr.me" % [test_username(n)]
    end
end

def test_userpassword (n)
    base_passwords = ['bob1876', 'PoPcornHorse', '12334567772', 'QWERTY', 'PassWord']
    m = base_passwords.length()
    base_passwords[n % m]
end

def test_user (n)
    FactoryBot.build(:user, :id => n, :username => test_username(n), :email => test_useremail(n), :password => test_userpassword(n))
end

def add_test_user (n)
    FactoryBot.create(:user, :id => n, :username => test_username(n), :email => test_useremail(n), :password => test_userpassword(n))
end

Given /^the following users exists/ do |user_table|
    user_table.hashes.each do |user|
        User.create(user)
    end
end

Given /^there are (\d+) users$/ do |n|
    for i in 1..n.to_i
        add_test_user i
    end
end

Given /^testuser (\d+) is (?:|registered as )a mentor$/ do |n|
    user = User.find_by_username(test_username n.to_i)
    if not user
        add_test_user n.to_i
        user = User.find_by_username(test_username n.to_i)
    end
    mentor = Mentor.find_by_user_id(user.id)
    if not mentor
        Mentor.create(:user => user)
    end
end

Given /^testuser (\d+) is (?:|registered as )a mentee$/ do |n|
    user = User.find_by_username(test_username n.to_i)
    if not user
        add_test_user n.to_i
        user = User.find_by_username(test_username n.to_i)
    end
    mentor = Mentee.find_by_user_id(user.id)
    if not mentor
        Mentee.create(:user => user)
    end
end

Given /^there are (\d*) mentor(?:|s)$/ do |n|
    for i in 1..n.to_i
        user = User.find_by_username(test_username i)
        Mentor.create(:user => user)
    end
end

Given /^testuser (\d*) is registered$/ do |n|
    if not User.find_by_username(test_username n.to_i)
        add_test_user n.to_i
    end
end

Then /^(.*)(?: seed)? users? should exist$/ do | n_seeds |
    User.count.should be n_seeds.to_i
end

Then /^testuser (\d*) should (|not )be registered$/ do |n, neg|
    if neg == "not "
        expect(User.find_by_username(test_username n.to_i)).to be_nil
    else
        expect(User.find_by_username(test_username n.to_i)).not_to be_nil
    end
end

Then /^testuser (\d*) should (|not )be (?:|registered as )a mentor$/ do |n, neg|
    user = User.find_by_username(test_username n.to_i)
    mentor = (user)? Mentor.find_by_user_id(user.id): nil
    if neg == "not "
        expect(mentor).to be_nil
    else
        expect(mentor).not_to be_nil
    end
end