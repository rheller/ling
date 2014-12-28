class Word < ActiveRecord::Base
  belongs_to :language
  belongs_to :meaning
  has_many :originals, :class_name => "Card", :foreign_key => "original_id"
  has_many :translations, :class_name => "Card", :foreign_key => "translation_id"
  has_many :histories
  has_many :users, through: :histories


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      process_imported(row)
    end    
  end

  def self.process_imported(row)
    row_hash = row.to_hash

    spelling = row_hash['SPELLING']
    meaning = row_hash['MEANING']
    language = row_hash['LANGUAGE']


    if language.present?
    #don't add langauges on the fly
      language_id = Language.where(name: language).first
    end


    if language_id.present? && meaning.present? && spelling.present?
    #add on the fly
      meaning_id = Meaning.where(denotation: meaning.capitalize).first_or_create.id
      Word.where(language_id: language_id, meaning_id: meaning_id, spelling: spelling.capitalize).first_or_create
    end
 end

end
