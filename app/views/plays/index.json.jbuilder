json.play do #tk
  json.id @play.id
  json.play_id @play.id

  if current_user.premium?
     json.success_rate success_rate(@original.history_for(current_user)) 
  end
   
  json.original_spelling @original.spelling
  json.choice0 @choices[0].spelling
  json.choice1 @choices[1].spelling
  json.choice2 @choices[2].spelling
end
