// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


$(function(){
$('a[title]').tooltip();
// tooltip is when you hover the element with your mouse, the title attribute is displayed in a little box next to the element

  $(".next-step").on("click", function(e){
    var $active = $('.board .nav-tabs li.active');
    $active.next().removeClass('disabled')
    nextTab($active);

    var isValid = 1;
 $('.address-input').each(function(){
     if($(this).val() == ''){
         $(this).css('border','1px solid red');
         isValid = 0;
         }
     else{
         $(this).css('border','1px solid green');
         $('#company-phone').show();
         }
     });

 if(isValid == 0){
    //  alert('Please enter content to all text fields');
      var $active = $(".board .nav-tabs li.active");
      prevTab($active);
      $('#company-phone').hide();
     return false;
     }
  });


  $(".next-step2").on("click", function(e){
    var $active = $('.board .nav-tabs li.active');
    $active.next().removeClass('disabled')
    nextTab($active);

    var isValid = 1;
 $('.phone-input').each(function(){
     if($(this).val() == ''){
         $(this).css('border','1px solid red');
         isValid = 0;
         }
     else{
         $(this).css('border','1px solid green');
         $('#company-email').show();
         }
     });

 if(isValid == 0){
    //  alert('Please enter content to all text fields');
      var $active = $(".board .nav-tabs li.active");
      prevTab($active);
      $('#company-email').hide();
     return false;
     }
  });

  $(".next-step3").on("click", function(e){
    var $active = $('.board .nav-tabs li.active');
    $active.next().removeClass('disabled')
    nextTab($active);

    var isValid = 1;
 $('.email-input').each(function(){
     if($(this).val() == ''){
         $(this).css('border','1px solid red');
         isValid = 0;
         }
     else{
         $(this).css('border','1px solid green');
         }
     });

 if(isValid == 0){
      var $active = $(".board .nav-tabs li.active");
      prevTab($active);
     return false;
     }
  });


  $(".prev-step").on("click", function(e){
    var $active = $(".board .nav-tabs li.active");
    prevTab($active);
  });

});
function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}
