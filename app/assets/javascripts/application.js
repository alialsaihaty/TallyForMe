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
          console.log(server_response);
          price = server_response[0].price
          $('#unit_price').html(price)
          var qty = $('#qty').val()
          var p = price * qty
          $('p.total').html(p)
          // $('p.subtotal').html(p)
        },
        // error: function(err) {
        //   console.log("Error calling /items " + id);
        //   console.log(err);
        // }
      });
      console.log($('#unit_price').html());
    });


    $('#tax1_li').on("change", function(){
      var id = $('#item_id').val();
      var val = $(this).val();
      if (val == "yes") {
        $.ajax({
          type: "GET",
          url: "/items/"+id,
          success: function(server_response){
            // id = id-1
            tax1 = server_response[0].tax1
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
            $('#tax1').val(0)//parseInt(variablehere)

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
            // id = id-1
            tax2 = server_response[0].tax2
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
            $('#tax2').val(0)
          }
        });
      }
    });


    update_prices();
    $('#qty').change(function() {
       update_prices();
    });



    var recalculateTaxesAndTotal = function(){
      // Go over price and taxes and calculcate total

      var price = parseInt($("#unit_price").html());
      var tax1  = parseInt($("#tax1").html());
      var tax2  = parseInt($("#tax2").html());
      var qty   = parseInt($("#qty").val());

      var t1 = 1 + (tax1 / 100);
      var t2 = 1 + (tax2 / 100);
      var total = price * qty * t1 * t2;

      $("#ftotal").html(total);
    };

    $("#item_id").on("change", recalculateTaxesAndTotal);
    $("#qty").on("change", recalculateTaxesAndTotal);
    $("#unit_price").on("change", recalculateTaxesAndTotal);
    $("#tax1_li").on("change", recalculateTaxesAndTotal);
    $("#tax2_li").on("change", recalculateTaxesAndTotal);



    $('form').submit(function() {
    var valuesToSubmit =
    $.ajax({
        type: "POST",
        url: $(this).attr('action'),
        data: valuesToSubmit,
        dataType: "JSON"
    }).success(function(json){
        console.log("success", json);
    });

    
});

    // $('#click').on("click", function(){
    //   // console.log(#tax2);
    //   var sub = $('p.total').html()
    //   var t1 = $("#tax1").html();
    //   console.log(t1);
    //   var t2 = $("#tax2").html();
    //   var t1t = t1 / 100
    //   var t2t = t2 / 100
    //   var gst = sub * t1t
    //   var pst = sub * t2t
    //   var total_w_t = gst + pst
    //   // debugger;
    //   $('#ftotal').html(total_w_t);
    // })

    // var $overall = 0;

    // $("tr.sum").each(function(){
    //     var $sub = $(this).find('p.total').html()
    //     console.log($sub);
    //     var $t1 = $(this).find("#tax1").html();
    //     var $t2 = $(this).find("#tax2").html();
    //     var t1t = $t1 / 100
    //     var t2t = $t2 / 100
    //     var $gst = $sub * t1t
    //     var $pst = $sub * t2t
    //     var total_w_t = $gst + $pst
    //     $(this).find("#f_total").html(total_w_t);
    //
    //      $overall+= total_w_t;
    //      console.log($overall);
    // });
    //
    // $("#f_total").html($overall);

    //
    // $('p.total').html().change(function() {
    //   var select1_value = $(this).html();
    //   $('p.subtotal').html(select1_value);
    // });

    // $("p.total").val("p.subtotal").change();

});
  function update_prices() {
     var sum = 0.0;
     $('#myTable > tbody').each(function() {
         var qty = $(this).find('#qty').val();
         var price = $(this).find('#unit_price').html();
         var amount = (qty*price)
         sum+=amount;
         $(this).find('p.total').html(amount);
     });
  }
