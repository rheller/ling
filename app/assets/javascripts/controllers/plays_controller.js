Ling.PlaysController = Ember.ArrayController.extend({
  actions: {
    updateLang: function() {
      var controller = this;
      controller.transitionTo('play', 1);
    }
  }
});
