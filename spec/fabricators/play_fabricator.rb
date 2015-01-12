Fabricator(:play) do
  original_id { Fabricate(:word).id }
  translation_id { Fabricate(:word).id }
  distractor1_id { Fabricate(:word).id }
  distractor2_id { Fabricate(:word).id }
end

