Ling.ApplicationRoute = Ember.Route.extend({
  beforeModel: function() {
    this.transitionTo('plays');
  }
});
