CodepureeDOM = function() {
  var cp      = this;
  cp.doc      = $(document);
  cp.content  = $('#content');
  cp.header   = cp.content.find('header');
  cp.footer   = cp.content.find('footer');
  cp.inner    = $('#inner');
}

NavigationFunc = function() {
  var nav     = this;
  nav.links   = nav.header.find('a');
  nav.colors  = [
    '#009ee0',
    '#0FF000',
    '#F99ee0',
    '#8FC000',
    '#0A2AA0',
    '#058BA0',
    '#BA450A',
    '#000000'
  ]
  
  var initialize = function() {
    nav.links.hover(function() {
      $(this).stop(true).animate({color: nav.colors[Math.floor(Math.random()*nav.colors.length)]}, 5000);
    }, function() {
      $(this).stop(true).animate({color: nav.colors[Math.floor(Math.random()*nav.colors.length)]}, 5000);
    });
  };
  initialize();
}