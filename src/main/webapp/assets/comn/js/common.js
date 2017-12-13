$(document).ready(function() {

  function retwid(){
  	var w = $(window).width();
  	return w;
  }

  var pcMenu = function() {
    $('.main_nav').mouseenter(function() {
      if(retwid() < 1024) return false
      $('header').stop().animate({
        height: 340
      }, 300)
      if($('.search_section').css('display') == 'block'){
        $('.search_section').hide()
      }
    }).mouseleave(function() {
      $('header').stop().animate({
        height: 80
      }, 300)
    })
  }

  var mobileMenu = function() {
	  $('.main_nav > ul > li > a.on + ul').stop().slideDown('fast')
      $('.main_nav > ul > li > a').on('click', function() {
        if(retwid() >= 1024) return false
        $(this).attr('href', '#a');
        $('.main_nav > ul > li > a').removeClass('on');
        $('.depth_menu').stop().slideUp('fast');
        $(this).addClass('on');

        var sub_menu = $(this).parent().find('ul');
        if ($(this).hasClass('on')) {
          $(this).parent().find('ul').stop().slideDown('fast')
        } else {
          $(this).parent().find('ul').stop().slideUp('fast')
        }
      })
  }




  var toggleMenu = function() {
    $('#toggle').on('click', function() {
      $(this).toggleClass('on')
      if ($('#toggle').hasClass('on')) {
        $('.main_nav').animate({
          'right': 0
        })
        $('.bg_black').show()
        $('header').css('overflow', 'inherit')
      } else {
        $('.main_nav').animate({
          'right': -250
        })
        $('.bg_black').hide()
        $('header').css('overflow', 'hidden')
      }
    })
  }
  toggleMenu()

  if($(window).width() > 1024){
    pcMenu()
  } else {
    mobileMenu()
  }

  $(window).on('resize',function(){
    if( retwid() > 1024){
      pcMenu()
      $('.bg_black').css('display','none')
    } else {
      mobileMenu()
    }
  })

  var gnb_menu = function(){
    $('.first_gnb').on('click',function(){
      if($('.first_gnb_depth').css('display') == 'none'){
        $('.first_gnb_depth').stop().slideDown(300)
      } else {
        $('.first_gnb_depth').stop().slideUp(300)
      }
    })

    $('.second_gnb').on('click',function(){
      if($('.second_gnb_depth').css('display') == 'none'){
        $('.second_gnb_depth').stop().slideDown(300)
      } else {
        $('.second_gnb_depth').stop().slideUp(300)
      }
    })
  }
  gnb_menu()



  var search_layout = function(){
    $('.main_search').on('click', function(){
      if($('.search_section').css('display') == 'block'){
        $('.search_section').fadeOut()
      } else {
        $('.search_section').fadeIn()
      }
    })
    $('.search_close').on('click', function(){
      $('.search_section').fadeOut()
    })
  }
  search_layout()

  var nav_text = function(){
    var view_text = $('#view_text');
    var select_sec = $('.main_nav > ul > li');
    var select_text = $('.main_nav > ul > li > a');
    $(select_sec).on('mouseenter',function(){
      var this_text = $(this).find('a:first').text().replace('>','')
      $(view_text).html(this_text)
    })
  }
  nav_text()

  var bottom_banner = function(){
    $('.banner_list ul').slick({
    dots: false,
    infinite: true,
    slidesToShow: 6,
    slidesToScroll: 1,
    speed: 500,
    cssEase: 'linear',
    autoplay: true,
    autoplaySpeed: 5000,
    responsive: [{
      breakpoint: 1025,
      settings: {
      slidesToShow: 4,
      slidesToScroll: 1}
    },{
      breakpoint: 700,
      settings: {
      slidesToShow: 3,
      slidesToScroll: 1}
    },{
      breakpoint: 480,
      settings: {
      slidesToShow: 2,
      slidesToScroll: 1}
    }]
    });
  }
  bottom_banner()


})

$(document).ready(function() {
    (function($) {
      $.QueryString = (function(a) {
        if (a == "") return {};
        var b = {};
        for (var i = 0; i < a.length; ++i) {
          var p = a[i].split('=');
          if (p.length != 2) continue;
          b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
        }
        return b;
      })(window.location.search.substr(1).split('?'))
      var num = $.QueryString["num"]

      if (num == null) {
        num = 0;
      };

      var tabBtn = $('.tab_menu > li')
      var tabCon = $('.tab_content')

      tabCon.hide();
      tabCon.eq(num).show();
      tabBtn.removeClass('on');
      tabBtn.eq(num).addClass('on');

      tabBtn.click(function() {
        var num = tabBtn.index(this);
        tabCon.each(function(i) {
          if (num == i) {
            tabCon.hide();
            tabCon.eq(i).show();
            tabBtn.removeClass('on');
            tabBtn.eq(i).addClass('on');
            num = i;
          };
        });
      });

      var tabBtn2 = $('.tab_menu2 > li')
      var tabCon2 = $('.tab_content2')

      tabCon2.hide();
      tabCon2.eq(num).show();
      tabBtn2.removeClass('on');
      tabBtn2.eq(num).addClass('on');

      tabBtn2.click(function() {
        var num = tabBtn2.index(this);
        tabCon2.each(function(i) {
          if (num == i) {
            tabCon2.hide();
            tabCon2.eq(i).show();
            tabBtn2.removeClass('on');
            tabBtn2.eq(i).addClass('on');
            num = i;
          };
        });
      });

    })(jQuery);
})
