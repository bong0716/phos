  jQuery.noConflict();
  (function($) {
    $(document).ready(function() {
      $('.slide_div').slick({
    	  centerMode: true,
		  centerPadding: '90px',
		  slidesToShow: 5,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  responsive: [
		    {
		      breakpoint: 1200,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '140px',
		        slidesToShow: 2
		      }
		    },
		    {
		      breakpoint: 800,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '90px',
		        slidesToShow: 1
		      }
		    }
		  ]
      });
    });
  })(jQuery);
