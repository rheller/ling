Fabricator(:history) do
  successes {Faker::Number.digit}
  tries {Faker::Number.digit}
  user
  word  
end

