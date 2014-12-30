class Word < ActiveRecord::Base
  belongs_to :language
  belongs_to :meaning
  has_many :originals, :class_name => "Card", :foreign_key => "original_id"
  has_many :translations, :class_name => "Card", :foreign_key => "translation_id"
  has_many :histories
  has_many :users, through: :histories


  GRACE_PERIOD = 5 # defines user just getting started
  HIGH_SUCCESS_RATE = 0.8
  NEW_WORD_RATE = 10
  


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


  def self.next_word_for(user)
    if !user.premium?
      random_word_for(user)
    else
      histories = user.histories
      if (histories.count < GRACE_PERIOD)
         random_word_for(user)
      else
        overall_success_rate = histories.map(&:successes).sum.to_f / histories.map(&:tries).sum.to_f

        #if user has a high success rate, pick a word at random,
        #which most likely (but not always) will be a new word
        #for use with a low success rate, mostly go back to words
        #alreadty seen, but throw in new word on random occasions

        if (overall_success_rate > HIGH_SUCCESS_RATE) || (rand(NEW_WORD_RATE) == 0)  
          random_word_for(user)
        else
          pick_word_from(histories)
        end
      end    
    end
  end

  def self.pick_word_from(histories)
    #create an array with the words frequency based on its repeat rate
    weighted = []
    histories.each do |h|
      h.repeat_rate.times do
        weighted << h.word
      end
    end
    weighted[rand(weighted.count)]
  end

  def self.random_word_for(user)
#tk need algorithm, make efficient 'RAND()' in postgres
    Word.where(language_id: user.from_language_id).order('Random()').first   
  end

  def history_for(user)
    History.where(word_id: id, user_id: user.id)
  end

end
