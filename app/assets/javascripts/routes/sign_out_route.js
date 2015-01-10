Ling.SignOutRoute = Ember.Route.extend({
  beforeModel: function() {
    Ember.$.ajax({
      url: '/users/sign_out',
      type: 'DELETE',
      success: function(result) {
        location.reload();
      }
    });
  }
});
