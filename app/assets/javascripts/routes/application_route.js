Ling.ApplicationRoute = Ember.Route.extend({
  beforeModel: function() {
    var route = this;

    //only show ember on certain pages
    if (  $('#show-ember').length > 0) {
      route.controllerFor('application').set('showEmber', true);

      //the purpose of this is to ping the server to determine whether
      //the user is signed in or not
      Ember.$.post('/users/sign_in', function() {
        route.controllerFor('application').set('signedIn', true);
        //default transition (but only works if logged in)
        route.transitionTo('play', 1);
      }).fail(function() {
        route.controllerFor('application').set('signedIn', false);
      });
    }
    else {
      route.controllerFor('application').set('showEmber', false);
    }
  }
});
