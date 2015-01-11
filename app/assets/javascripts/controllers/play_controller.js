Ling.PlayController = Ember.ObjectController.extend({
  actions: {
    updatePlay: function(chosen, play_id, original_spelling, translation_spelling) {
     var play = this.store.createRecord('play', {
        play_id: play_id,
        translation_spelling: translation_spelling,
        success_rate: chosen, //tk
        original_spelling: original_spelling
      });

      trans = "The translation of " + play.get('original_spelling') + ' is ' + play.get('translation_spelling');
      if (play.get('success_rate') == play.get('translation_spelling')){
      $('#feedback-messages').html('correct!!!!' + trans)
    }
      else {
      $('#feedback-messages').html('YOU ARE WRONG' + trans)    
      }

      var controller = this;
      play.save().then(function() {
        console.log('play saved!');
      $('#ember-messages').html('play saved!!!!')
        controller.transitionToRoute('play',play_id + 1);
      }, function() {
        alert('failed to save play!');
      });
    }
  }
});
