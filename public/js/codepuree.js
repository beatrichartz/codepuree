CodepureeDOM = function() {
  var cp      = this;
  cp.doc      = $(document);
  cp.body     = $('body');
  cp.content  = $('#content');
  cp.header   = cp.content.find('header');
  cp.footer   = cp.content.find('footer');
  cp.inner    = $('#inner');
  
  var initialize = function() {
    cp.body.removeClass('no_javascript');
    $.each(['webkit', 'mozilla', 'msie'], function(index, val) {
      if ($.browser[val]) { cp.body.addClass(val); }
    });
  }
  initialize();
}