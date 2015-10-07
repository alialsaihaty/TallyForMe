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
//= require jquery-ui
//= require jquery_ujs
//= require selectize
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  $('a[title]').tooltip();

  var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');


    $('#client_id').on("change", function(){
      var id = $(this).val();
      $.ajax({
        type: "GET",
        url: "/addresses/"+id,
        success: function(server_response) {
          console.log(server_response)
          $('#textarea').val(server_response.address)
        }
      });
    });

    $('#item_id').on("change", function(){
      var id = $(this).val();
      $.ajax({
        type: "GET",
        url: "/items/"+id,
        success: function(server_response){
          id = id-1
          price = server_response[id].price
          $('#unit_price').html(price)
        }
      });
    });


    $('#tax1_li').on("change", function(){
      var id = $('#item_id').val();
      var val = $(this).val();
      if (val == "yes") {
        $.ajax({
          type: "GET",
          url: "/items/"+id,
          success: function(server_response){
            id = id-1
            tax1 = server_response[id].tax1
            $('#tax1').html(tax1)
          }
        });
      }
      if (val == "no") {
        $.ajax({
          type: "GET",
          url: "/items/"+id,
          success: function(server_response){
            id = id-1
            tax1 = server_response[id].tax1
            $('#tax1').html(0.00)
          }
        });
      }
    });

    $('#tax2_li').on("change", function(){
      var id = $('#item_id').val();
      var val = $(this).val();
      if (val == "yes") {
        $.ajax({
          type: "GET",
          url: "/items/"+id,
          success: function(server_response){
            id = id-1
            tax2 = server_response[id].tax2
            $('#tax2').html(tax2)
          }
        });
      }
      if (val == "no") {
        $.ajax({
          type: "GET",
          url: "/items/"+id,
          success: function(server_response){
            id = id-1
            tax2 = server_response[id].tax2
            $('#tax2').html(0.00)
          }
        });
      }
    });


  //
  //   update_amounts();
  //   $('.qty').change(function() {
  //      update_amounts();
  //   });
  // });
  //
  //
  // function update_amounts()
  // {
  //    var sum = 0.0;
  //    $('#myTable > tbody  > tr').each(function() {
  //        var qty = $(this).find('option:selected').val();
  //        var price = $(this).find('.price').val();
  //        var amount = (qty*price)
  //        sum+=amount;
  //        $(this).find('.amount').text(''+amount);
  //    });


});
