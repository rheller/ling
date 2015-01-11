Ling.ApplicationRoute = Ember.Route.extend({
  beforeModel: function() {
    this.transitionTo('plays');
    var route = this;
    //the purpose of this is to ping the server to determine whether
    //the user is signed in or not
    Ember.$.post('/users/sign_in', function() {
      route.controllerFor('application').set('signedIn', true);
    }).fail(function() {
      route.controllerFor('application').set('signedIn', false);
    });
    //only show ember on certain pages
    if (  $('#show-ember').length > 0) {
      route.controllerFor('application').set('showEmber', true);
    }
    else {
      route.controllerFor('application').set('showEmber', false);
    }
  }
});
