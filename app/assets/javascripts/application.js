// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.jqzoom
//= require jquery_ujs
//= require jquery_ui
//= require jquery.facebox
//= require bootstrap


// facebox and bootstrap
jQuery(document).ready(function() {

    jQuery('a[rel*=facebox]').facebox();
    jQuery('#facebox').draggable({
        handle: ".header"
    });

    //    $('.combobox').combobox();

    var $win = $(window), $nav = $('.subnav'), navTop = $('.subnav').length && $('.subnav').offset().top - 40, isFixed = 0;
    jQuery(window).on('scroll', function(){
        var i, scrollTop = $win.scrollTop()
        if (scrollTop >= navTop && !isFixed) {
            isFixed = 1
            $nav.hide('fade', {}, 500)
            $nav.show('fade', {}, 500)
            $nav.addClass('subnav-fixed')
        } else if (scrollTop <= navTop && isFixed) {
            isFixed = 0
            $nav.removeClass('subnav-fixed')
        }
    });

    $brand = $('.brand');
    $brand.hover(function(){
        $brand.addClass('brand-hover');
        $brand.animate({fontSize: 30}, 200);
    },function(){
        $brand.removeClass('brand-hover');
        $brand.animate({fontSize: 20}, 200);
    });


    //carousel just for home_controller
    $('.carousel').carousel();

    //just for show action in products_controller
    jQuery('.jqzoom').jqzoom({
        zoomType: 'standard',
        lens:true,
        preloadImages: false,
        alwaysOn:false,
        showEffect:'fadein',
        hideEffect:'fadeout'
    });
});

// Popup window code for print
function newPopup(url) {
    popupWindow = window.open(
        url,'popUpWindow','height=700,width=800,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,status=yes')
}

//// fix sub nav on scroll
//var $win = $(window), $nav = $('.subnav'), navTop = $('.subnav').length && $('.subnav').offset().top - 40, isFixed = 0;
//processScroll();
//// hack sad times - holdover until rewrite for 2.1
////$nav.on('click', function () {
////    if (!isFixed) setTimeout(function () {
////        $win.scrollTop($win.scrollTop() - 47)
////    }, 10)
////});
//$win.on('scroll', processScroll);
//function processScroll() {
//    var i, scrollTop = $win.scrollTop()
//    if (scrollTop >= navTop && !isFixed) {
//        isFixed = 1
//        $nav.addClass('subnav-fixed')
//    } else if (scrollTop <= navTop && isFixed) {
//        isFixed = 0
//        $nav.removeClass('subnav-fixed')
//    }
//} 