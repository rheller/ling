class Word < ActiveRecord::Base
  belongs_to :language
  belongs_to :meaning
  has_many :originals, :class_name => "Card", :foreign_key => "original_id"
  has_many :translations, :class_name => "Card", :foreign_key => "translation_id"
end
