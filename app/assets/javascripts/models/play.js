Ling.Play = DS.Model.extend({
  play_id: DS.attr('number'),
  success_rate: DS.attr('string'),
  original_spelling: DS.attr('string'),
  translation_spelling: DS.attr('string'),
  choice0 : DS.attr('string'),
  choice1 : DS.attr('string'),
  choice2 : DS.attr('string'),
});

