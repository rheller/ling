Ling.PlayController = Ember.ObjectController.extend({
  actions: {
    updatePlay: function(chosen, play_id, original_spelling, translation_spelling) {
      var play = this.get('content');
      play.set('play_id', play_id);
      play.set('translation_spelling', translation_spelling);

      play.set('success_rate', chosen);
      play.set('original_spelling', original_spelling);



      $('#feedback-danger').html('').hide();
      $('#feedback-error').html('').hide();
      $('#feedback-success').html('').hide();
      trans = "The translation of " + play.get('original_spelling') + ' is ' + play.get('translation_spelling');


      if (play.get('success_rate') == play.get('translation_spelling')){
        $('#feedback-success').html('Correct! ' + trans).show();
      }
      else {
        $('#feedback-error').html('Sorry! ' + trans).show();   
      }


      var controller = this;
      play.save().then(function() {
        controller.transitionToRoute('play',play_id + 1);
      }, function() {
        $('#feedback-danger').html('Something has gone wrong! Could not save the data. ').show();    
      });
    }
  }
});

