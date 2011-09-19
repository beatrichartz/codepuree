NavigationFunc = function() {
	var nav = this;
	nav.container = nav.header.find('nav');
	nav.links = nav.container.children('a');
	nav.main_links = nav.links.filter('.top');

  var randomColor = function() {
    var color = ['#'];
    for (var i = 6; i >= 0; i--){
		  color.push(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'][Math.floor(Math.random() * 16)]);
		}
		return color.join('');
  }

	var initialize = function() {
	  nav.links.mouseenter(function() {
	    $(this).stop(true).animate({
				color: randomColor()
			},
			5000);
	  });

		nav.container.hover(function() {
			var that = this;
			that.element = $(this);
			that._initHeight = that.element.height();
			that._subLinks = that.element.children('a.sub');
			that.element.css({
				height: that._initHeight,
				borderBottom: '1px solid black'
			});
			that._subLinks.css('display', 'inline-block');
			that.element.stop(true).animate({
				height: (that._subLinks.length + 1) * (that._subLinks.first().outerHeight()),
				borderBottomColor: '#000000'
			},
			250, 'easeOutSine');
		},
		function() {
			var that = this;
			that.element.stop(true).delay(250).animate({
				height: that._initHeight,
				borderBottomColor: '#FFFFFF'
			},
			250, 'easeInSine', function() {
				that._subLinks.hide();
			});
		});
	};
	initialize();
}
