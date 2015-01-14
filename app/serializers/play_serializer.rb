class PlaySerializer < ActiveModel::Serializer
  attributes :id, :play_id, :success_rate, :original_spelling, :translation_spelling, :choice0, :choice1, :choice2
end
