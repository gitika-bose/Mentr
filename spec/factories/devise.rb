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

FactoryBot.define do
  factory :user do
    id {1}
    username {"testuser"}
    email {"test@user.com"}
    password {"qwerty"}
  end

  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end
