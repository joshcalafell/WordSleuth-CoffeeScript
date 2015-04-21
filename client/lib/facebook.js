Meteor.setInterval((function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=591499857628792";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk')), 2000);