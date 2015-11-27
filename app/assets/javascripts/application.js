// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function()  {

    $('td').click(function() {
        if($(this).data("href") !== undefined) {
          window.document.location = $(this).data("href");
        }
    });
    $('.arrow').click(function() {
        if($(this).data("href") !== undefined) {
          window.document.location = $(this).data("href");
        }
    });
    if( $('.order')){
      var i = 0;
      $( ".order" ).each(function( index ) {
        i++;
        $(this).html(i);
      });
    }

    $('.add-btn').click(function() {
      var attr = $(this).attr('action');
      if (typeof attr !== typeof undefined && attr !== false) {
        $('.black-background[action='+attr+']').css("display", "block");
        $('.new-form[action='+attr+']').css("display", "block");
      } else {
        $('.black-background').css("display", "block");
        $('.new-form').css("display", "block");
      }
    });

    $('.black-background').click(function() {
      $('.black-background').css("display", "none");
      $('.new-form').css("display", "none");
    });
    $('.cancel').click(function() {
      $('.black-background').css("display", "none");
      $('.new-form').css("display", "none");
    });

});
/// Change tabs ///
var changeTab = function(tab){
  if(tab == 1) {
    $("#nl").show();
    $("#en").hide();
    $("#es").hide();
    $(".tab").removeClass('active');
    $("#tab_nl").addClass('active');
  } else if(tab == 2) {
    $("#nl").hide();
    $("#en").show();
    $("#es").hide();
    $(".tab").removeClass('active');
    $("#tab_en").addClass('active');
  } else if(tab == 3) {
    $("#nl").hide();
    $("#en").hide();
    $("#es").show();
    $(".tab").removeClass('active');
    $("#tab_es").addClass('active');
  }
};
