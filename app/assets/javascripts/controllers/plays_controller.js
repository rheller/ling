Ling.PlaysController = Ember.ArrayController.extend({
  actions: {
    updateLang: function() {
      var controller = this;
      controller.transitionToRoute('play', 1);
    }
  }
});
