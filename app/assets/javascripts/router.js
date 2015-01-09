// For more information see: http://emberjs.com/guides/routing/

Ling.Router.map(function() {
  this.resource('plays');
  this.resource('play', {path: 'play/:play_id'});
});
