module CardsHelper
  def success_rate(histories)
    if histories.empty?
      "New Word!"
    else
      "Answered correctly " + histories[0].successes.to_s + " out of " +  pluralize(histories[0].tries, 'try')
    end  
  end
end
