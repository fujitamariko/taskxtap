FactoryBot.define do
  factory :user do
    name { 'user' }
    email { 'user1@email.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end

  factory :user2, class: User do
    name { 'user2' }
    email { 'user2@email.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end

end
