Ling.PlaysRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('play');
  }
});
