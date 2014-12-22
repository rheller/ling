Fabricator(:word) do
  spelling {Faker::Lorem.word}
  meaning
  language
end
