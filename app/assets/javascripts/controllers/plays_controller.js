Ling.PlaysController = Ember.ArrayController.extend({
  actions: {
    updatePlay: function() {
      var play = this.get('content');
      play.set('title', this.get('title'));
      play.set('body', this.get('body'));
//       play_id: hidden_val,
  //      original_spelling: 'hobo',
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
