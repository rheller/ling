class Word < ActiveRecord::Base
  belongs_to :language
  belongs_to :meaning
end
