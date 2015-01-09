Ling.PlaysController = Ember.ArrayController.extend({
  actions: {
    choose: function() {
console.log("tk2 choose in play controller");
      var play = this.store.createRecord('play', {
        play_id: this.get('play_id'),
      });
      var self = this;
      play.save().then(function() {
        console.log('play created!');
        self.transitionTo('play', play_id + 1);
      }, function() {
        alert('failed to create card!');
      });
    }
  }
});
