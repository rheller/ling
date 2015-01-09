Ling.PlaysController = Ember.ArrayController.extend({
  actions: {
    updatePlay: function(chosen, play_id) {

     var play = this.store.createRecord('play', {
        play_id: play_id,
        success_rate: chosen
      });

      var controller = this;
      play.save().then(function() {
        console.log('play saved!');
        controller.transitionTo('play');
      }, function() {
        alert('failed to save play!');
      });
    }
  }
});
