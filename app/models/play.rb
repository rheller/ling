class Play < ActiveRecord::Base
 #virtual fields returned by ember
 attr_accessor :play_id, :success_rate, :original_spelling, :choice0, :choice1, :choice2
end
