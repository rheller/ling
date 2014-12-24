class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :original, class_name: "Word" 
  belongs_to :translation, class_name: "Word" 
end
