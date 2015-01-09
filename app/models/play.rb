class Play < ActiveRecord::Base
  belongs_to :user
  belongs_to :original, class_name: "Word" 
  belongs_to :translation, class_name: "Word" 
  belongs_to :distractor1, class_name: "Word" 
  belongs_to :distractor2, class_name: "Word" 
 #virtual fields returned by ember
 attr_accessor :play_id, :success_rate, :original_spelling, :choice0, :choice1, :choice2
end
