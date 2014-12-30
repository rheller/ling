class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :word


  REPEAT_RATE_FOR_ALL_CORRECT = 5
  REPEAT_RATE_FOR_ALL_WRONG = 25
  REPEAT_RATE_AMPLIFIER = 10 

  def repeat_rate
    if successes == tries
      REPEAT_RATE_FOR_ALL_CORRECT
    elsif successes == 0
      REPEAT_RATE_FOR_ALL_WRONG
    else
      ((tries.to_f / successes.to_f) * REPEAT_RATE_AMPLIFIER ).to_i 
    end
  end
end
