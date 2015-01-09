class PlaySerializer < ActiveModel::Serializer
  attributes :id, :choices, :original_spelling
end
