Fabricator(:user) do
  email {Faker::Internet.email }
  password {"password"}  
  password_confirmation {"password"}  
  full_name {Faker::Lorem.words(2).join(" ")}

  from_language_id { Fabricate(:language).id }
  to_language_id { Fabricate(:language).id }

  plan "basic"
  admin false
end

Fabricator(:admin, from: :user) do
  admin true
end

Fabricator(:premium_user, from: :user) do
  plan "premium"
end
