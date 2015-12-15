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
    $(document).on("click", ".hamburger", function() {
      if( $('.hb-menu').css('display') === 'none'){
        $('.hb-menu').show();
      }else{
        $('.hb-menu').hide();
      }
    });
    if( $('.order')){
      var i = 0;
      $( ".order" ).each(function( index ) {
        i++;
        $(this).html(i);
      });
    }
    $(document).on("click", ".link", function() {
        if($(this).data("href") !== undefined) {
          window.document.location = $(this).data("href");
        }
    });
    $(document).on("click", ".close-alert", function() {
        $('.alert').fadeOut();
    });
    $(document).on("click", ".arrow", function() {
        if($(this).data("href") !== undefined) {
          window.document.location = $(this).data("href");
        }
    });


    $(document).on("click", ".add-btn", function() {
      var attr = $(this).attr('action');
      if (typeof attr !== typeof undefined && attr !== false) {
        $('.black-background[action='+attr+']').css("display", "block");
        $('.new-form[action='+attr+']').css("display", "block");
      } else {
        $('.black-background').css("display", "block");
        $('.new-form').css("display", "block");
      }
    });
    $(document).on("click", ".black-background", function() {
      $('.black-background').css("display", "none");
      $('.new-form').css("display", "none");
    });
    $(document).on("click", ".cancel", function() {
      $('.black-background').css("display", "none");
      $('.new-form').css("display", "none");
    });

});

$(document).on("click", ".delete-item", function() {
  var attr = $(this).attr('action');
  $('.black-background[action='+attr+']').css("display", "block");
  $('.new-form[action='+attr+']').css("display", "block");
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
