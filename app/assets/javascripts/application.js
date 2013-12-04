// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require chosen-jquery
//= require jquery.purr
//= require best_in_place
//= require_tree .
//= require nested_form
//= require jquery.facebox
//= require jquery.validationEngine-en
//= require jquery.validationEngine


(function($){var methods={init:function(options){var defaults={data_selector:'.contenthover',width:0,height:0,overlay_width:0,overlay_height:0,overlay_x_position:'center',overlay_y_position:'bottom',overlay_background:'',overlay_opacity:1,effect:'fade',fade_speed:400,slide_speed:400,slide_direction:'bottom',zindex:2,wrapper_class:'ch_wrapper',normal_class:'ch_normal',hover_class:'ch_hover',onshow:function(){},onhide:function(){}},settings=$.extend({},defaults,options);return this.each(function(){var $this=$(this),w=$this.width()?$this.width():settings.width,h=$this.height()?$this.height():settings.height,overlay_w=settings.overlay_width?settings.overlay_width:w,overlay_h=settings.overlay_height?settings.overlay_height:h,$data=$this.next(settings.data_selector);if($data.length){$data.hide();var $ch_wrapper=$('<div>').addClass('ch_element').addClass(settings.wrapper_class).css({'width':w,'height':h,'position':'relative','overflow':'hidden'}).insertAfter($this);var $ch_normal=$('<div>').addClass(settings.normal_class).css({'width':w,'height':h,'position':'absolute','z-index':settings.zindex}).appendTo($ch_wrapper);$this.clone().appendTo($ch_normal);$this.hide();var $ch_hover=$('<div>').addClass(settings.hover_class).css({'width':overlay_w,'height':overlay_h,'position':'absolute','z-index':settings.zindex-1}).appendTo($ch_wrapper);$data.clone().show().appendTo($ch_hover);var ch_hover_css={};if(settings.overlay_background){ch_hover_css.background=settings.overlay_background;}
if(settings.overlay_opacity<1){ch_hover_css.opacity=settings.overlay_opacity;}
if(settings.overlay_x_position=='left'){ch_hover_css.left=0;}else if(settings.overlay_x_position=='right'){ch_hover_css.left=(w-overlay_w)+'px';}else{ch_hover_css.left=(w/2-overlay_w/2)+'px';}
if(settings.overlay_y_position=='top'){ch_hover_css.top=0;}else if(settings.overlay_y_position=='bottom'){ch_hover_css.top=(h-overlay_h)+'px';}else{ch_hover_css.top=(h/2-overlay_h/2)+'px';}
$ch_hover.css(ch_hover_css);if(settings.effect=='slide'){var initial_css={};if(settings.slide_direction=='top'){initial_css={top:('-'+overlay_h+'px')};}
if(settings.slide_direction=='bottom'){initial_css={top:h+'px'};}
if(settings.slide_direction=='left'){initial_css={left:('-'+overlay_w+'px')};}
if(settings.slide_direction=='right'){initial_css={left:w+'px'};}
$ch_hover.css('z-index',settings.zindex+1).css(initial_css);$ch_wrapper.hover(function(){$ch_hover.stop(true,true).animate({'top':ch_hover_css.top,'left':ch_hover_css.left},settings.slide_speed,settings.onshow());},function(){$ch_hover.stop(true,true).animate(initial_css,settings.slide_speed,settings.onhide());});}else if(settings.effect=='fade'){$ch_hover.css('z-index',settings.zindex+1).hide();$ch_wrapper.hover(function(){$ch_hover.stop(true,true).fadeIn(settings.fade_speed,settings.onshow());},function(){$ch_hover.stop(true,true).fadeOut(settings.fade_speed,settings.onhide());});}else{$ch_hover.css('z-index',settings.zindex+1).hide();$ch_wrapper.hover(function(){$ch_hover.show(0,settings.onshow());},function(){$ch_hover.hide(0,settings.onhide());});}}});},stop:function(){return this.each(function(){var $this=$(this),$data=$this.next('.ch_element');$this.show();$data.remove();$this.unbind('.contenthover');});},destroy:function(){return this.each(function(){$(this).show();$('.ch_element').remove();$(window).unbind('.contenthover');});}};$.fn.contenthover=function(method){if(methods[method]){return methods[method].apply(this,Array.prototype.slice.call(arguments,1));}else if(typeof method==='object'||!method){return methods.init.apply(this,arguments);}else{$.error('Method '+method+' does not exist in contentHover plugin.');}};})(jQuery);

$(document).ready(function(){
  $('[id^=hover_box]').contenthover({
      effect:'slide',
      slide_speed:300,
      overlay_background:'#000',
      overlay_opacity:0.9
  });
  $('.title-box').contenthover({
      effect:'slide',
      slide_speed:300,
      overlay_background:'#000',
      overlay_opacity:0.9
  });
});


jQuery(document).ready(function($) {
  $('.get_cust_iti_request').on('click', function(){
    $('#my-vc-modal').modal("show");
  });
});

jQuery(document).ready(function($) {
  $('.select-vcs').on('click', function() {
      var vc_ids = [];
      $('.search_vc_table tr').filter(':has(:checkbox:checked)').each(function() {
        vc_ids.push($(this).attr("id"));
      });
      $.post('/assign-vcs', {vc_ids: vc_ids, cust_req_id: $('.search_vc_table').attr("id")},
      function(data, status, xhr){
        location.href = '/unwinders/user';
          // $(".assigned-vcs").html(data);
      });
      return false;
    });
});

jQuery(document).ready(function($){
  $("#response_submit").on('click', function() {
    $("#user_response_form").validationEngine({promptPosition : "bottomLeft"});
  });
});

jQuery(document).ready(function($) {
  $('a[rel*=facebox]').facebox()
})

window.setInterval(function(){
   $('.alert').fadeOut();
 }, 5000);


jQuery(document).ready(function($) {
  $('.comment-section').on('click', function(){
    $('#comment-modal').modal("show");
  });
});
jQuery(document).ready(function($) {
  $('.dropdown-toggle').dropdown();

      $('#my-slideshow').bjqs({
          'height' : 300,
          'width' : 550,
          'responsive' : true,
          'showmarkers' : false,
          'usecaptions' : true,
          'animtype' : 'fade',
          'animduration' : 450,
          'animspeed' : 3000,
          'automatic' : true,
      });
  $('[id^=history-poa]').contenthover({
      effect:'slide',
      slide_speed:300,
      overlay_background:'#000',
      overlay_opacity:0.8
  });
});

jQuery(document).ready(function($) {
  $('.send-email').on('click', function(){
    $('#campaign-email-modal').modal("show");
  });
});

jQuery(document).ready(function($) {
  $(".show-more a").on("click", function() {
    var $link = $(this);
    var $content = $link.parent().prev("div.text-content");
    var linkText = $link.text().toUpperCase();
    switchClasses($content);

    $link.text(getShowLinkText(linkText));

    if (linkText === "SEE MORE/ADD COMMENTS"){
      $('html,body').animate({scrollTop: +450},'slow');
    } else{
      $('html,body').animate({scrollTop: '0px'},'slow');
    }

    return false;
  });
});

jQuery(document).ready(function($) {
  $("#personal-information .proceed").on("click", function() {
      var div_id = document.getElementById("progress-bar").style.width = "66%";
      $('#personal-information').hide(300);
      $('#professional-details').show(300);
      return false;
  });

  $("#professional-details .proceed").on("click", function() {
      var div_id = document.getElementById("progress-bar").style.width = "100%";
      $('#professional-details').hide(300);
      $('#contact-information').show(300);
      return false;
  });
 $(".text").focus(function(){
    $(this).parent().addClass("active");

  }).blur(function(){
       $(this).parent().removeClass("active");
  })
});

jQuery(document).ready(function($) {

$("#personal-information .proceed").on("click", function() {
    var div_id = document.getElementById("progress-bar").style.width = "66%";
    $('#personal-information').hide(300);
    $('#professional-details').show(300);
    return false;
});

  $("#professional-details .back").on("click", function() {
      var div_id = document.getElementById("progress-bar").style.width = "33%";
      $('#professional-details').hide(300);
      $('#personal-information').show(300);
      return false;
  });

  $("#contact-information .back").on("click", function() {
      var div_id = document.getElementById("progress-bar").style.width = "66%";
      $('#contact-information').hide(300);
      $('#professional-details').show(300);
      return false;
  });
});

jQuery(document).ready(function($) {
  $('.select-vcs').on('click', function() {
      var vc_ids = [];
      $('.search_vc_table tr').filter(':has(:checkbox:checked)').each(function() {
        vc_ids.push($(this).attr("id"));
      });
      $.post('/assign-vcs', {vc_ids: vc_ids, cust_req_id: $('.search_vc_table').attr("id")},
      function(data, status, xhr){
        location.href = '/unwinders/user';
          // $(".assigned-vcs").html(data);
      });
      return false;
    });

  $('.select-destinations').on('click', function() {
      var selected_destinations = $("#select_destination").chosen().val();
      var destination_ids = [];
      $('.wishlist_table tr').filter(':has(:checkbox:checked)').each(function() {
        destination_ids.push($(this).attr("id"));
      });
      destination_ids.push(selected_destinations);
      location.href = '/request_from_cart?destination_ids='+destination_ids;
      return false;
    });

  $(".remove a").click(function(event) {
    var href = $(this).attr('href');
    var destination_id = $(this).attr('wish_list_item_id');
    $.get('/remove_from_wishlist?id='+destination_id,
      function(data) {
        $(".requests_cart").html(data)
        return false;
      });
      $(this).closest("tr").fadeOut("slow",function() { $(this).remove(); }); // remove row
      rowCountRemove = $('.modal-rec-body tr').length;
      return false; // prevents default behavior
     });
    $('a[rel*=facebox]').facebox()
  })

  window.setInterval(function(){
     $('.alert').fadeOut();
   }, 5000);


  // $('.comment-section').on('click', function(){
  //   $('#comment-modal').modal("show");
  // });

  $('#new-photo').on('click', function(){
    $('#add-image-modal').modal("show");
  });

  $("#element").popover();

  $("#btn-request-now").on('click', function(){
    $("#my-modal1").modal('show');
    $(".modal-rec-body").html("<h3>Loading. Please wait... </h3>");
  });

  function switchClasses($content){
      if($content.hasClass("short-text")){
          $content.switchClass("short-text", "full-text", 400);
      } else {
          $content.switchClass("full-text", "short-text", 400);
      }
  }

  function getShowLinkText(currentText){
      var newText = '';

      if (currentText === "SEE MORE/ADD COMMENTS") {
          newText = "See less";
      } else {
          newText = "See more/Add comments";
      }

      return newText;
  }


  $(function() {
    $(".current_user_requests .pagination a").on("click", function() {
      $.get(this.href, null, null, "script");
      return false;
    });
  });


  $('.add-to-cart').on('click', function () {
    var cart = $('.shopping-cart');
    var imgtodrag = $(this).parent('.item').find("img").eq(0);
    if (imgtodrag) {
        var imgclone = imgtodrag.clone()
            .offset({
            top: imgtodrag.offset().top,
            left: imgtodrag.offset().left
        })
            .css({
            'opacity': '0.5',
                'position': 'absolute',
                'height': '150px',
                'width': '150px',
                'z-index': '100'
        })
            .appendTo($('body'))
            .animate({
            'top': cart.offset().top + 10,
                'left': cart.offset().left + 10,
                'width': 75,
                'height': 75
        }, 1000, 'easeInOutExpo');

        imgclone.animate({
            'width': 0,
                'height': 0
        }, function () {
            $(this).detach()
        });
    }
  });

  $('.carousel').carousel({
    interval: 3000
  })
  $(function ()
  {
    if (($("#slideshow > div").length) > 1)
    {
      $("#slideshow > div:gt(0)").hide();
      setInterval(function() {
        $('#slideshow > div:first')
          .fadeOut(1000)
          .next()
          .fadeIn(1000)
          .end()
          .appendTo('#slideshow');
    },  5000);
  }

  // $('#add-fields-link').on('click', function(){
  //   var sel_dest = $('#cust_iti_header_cust_iti_details_attributes_0_destination_id').val();
  //   if(!sel_dest){
  //     $("#error-msg").show(500);
  //   }
  //   else{
  //     $("#error-msg").hide(500);
  //   }
  // });

  function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).up().insert({
      before: content.replace(regexp, new_id)
    });
  }

  $("#recipient_choice").on('change', function(){
    var choice = $(this).val();

    if(choice == "Manual"){
      $("#csv-upload").hide(200);
      $("#manual-entry").show(200);
    }

    if(choice == "CSV"){
      $("#manual-entry").hide(200);
      $("#csv-upload").show(200);
    }
  });
});

$(document).ready(function(){
  $("input[name='user[start_date]']").datepicker(
    {
      dateFormat: 'dd MM yy',
      minDate: 1,
    });

  $("input[name='user[end_date]']").datepicker(
    {
      dateFormat: 'dd MM yy',
      minDate: 1,
    });
});

var Sessionapp = {};
Sessionapp.Charts = {};
Sessionapp.ChartData = {};
current_node_id="VC";
var JitTree = {};

function split_data(){
  children=[];
  jbClc={"id": Sessionapp.ChartData["infovis"].id,
        "name" : Sessionapp.ChartData["infovis"].name,
        "children":[],
        "data":Sessionapp.ChartData["infovis"].data}

  $.each(Sessionapp.ChartData["infovis"].children, function(index, value) {
      child={"id":value.id,
             "name":value.name,
             "data":value.data,
             "children":[]}
      children_1 = [];
      children_1[0] = jbClc;
      $.each(value.children, function(idx, val) {
          child_1={"id": val.id,
            "name" : val.name,
            "children":val.children,//todo
            "data":val.data}
          children_1_1=[];
            $.each(val.children,function(i,v){
              child_1_1 = {"id": v.id,
                    "name" : v.name,
                    "children":[],
                    "data":v.data}
              children_1_1[i] = child_1_1;
            });
            Sessionapp.ChartData[val.id]={
              "id":val.id,
              "name" : val.name,
            "children":children_1_1,
            "data":val.data};
          children_1[idx+1]=child_1;
      });
      Sessionapp.ChartData[value.id]={
        "id":value.id,
        "name" : value.name,
      "children":children_1,
      "data":value.data};
      children[index] = child;
    });
    console.log(Sessionapp.ChartData["infovis"].id);
    Sessionapp.ChartData["VC"]={"id": Sessionapp.ChartData["infovis"].id,
      "name" : Sessionapp.ChartData["infovis"].name,
      "children":children,
      "data":Sessionapp.ChartData["infovis"].data}
    console.log(Sessionapp.ChartData);
}


JitTree.showJit = function(){
  split_data();
  current_node_id = "VC";
  // console.log(json);
  //id of the visualization container
  var ht = new $jit.Hypertree({
  injectInto: 'infovis',
  //canvas width and height
  width: 390,
  height: 270,
  levelsToShow : 2,
  //Change node and edge styles such as
  //color, width and dimensions.
  Node: {
      overridable: true,
      dim: 9,
      color: "#ccb",
  },
  Edge: {
      lineWidth: 2,
      color: "#088",
      type: 'hyperline'
  },
  duration: 700,
  fps: 30,
  clearCanvas: true,
  withLabels: true,
  onBeforePlotNode:function(node) {

        if(node.selected) {
          //node.setData('color', '#f00');
        } else {
          //node.setData('color','#ccb');
        }
    },
  onBeforeCompute: function(node){
      console.log("centering");
  },
  //Attach event handlers and add text to the
  //labels. This method is only triggered on label
  //creation
  onCreateLabel: function(domElement, node){
      domElement.innerHTML = node.name;
      $jit.util.addEvent(domElement, 'click', function () {
          ht.onClick(node.id, {
              onComplete: function() {
                  ht.controller.onComplete();
              }
          });
      });
  },
  //Change node styles when labels are placed
  //or moved.
  onPlaceLabel: function(domElement, node){
      var style = domElement.style;
      style.display = '';
      style.cursor = 'pointer';
      if (node._depth <= 1) {
          style.fontSize = "0.8em";
          style.color = "#1a1a1a";

      } else if(node._depth == 2){
          style.fontSize = "0.7em";
          style.color = "#555";

      } else {
          style.display = 'none';
      }

      var left = parseInt(style.left);
      var w = domElement.offsetWidth;
      style.left = (left - w / 2) + 'px';
  },

  onComplete: function(){
      console.log("done");

      //Build the right column relations list.
      //This is done by collecting the information (stored in the data property)
      //for all the nodes adjacent to the centered node.
      var node = ht.graph.getClosestNodeToOrigin("current");
      var html = "<h4>" + node.name + "</h4><b>Connections:</b>";
      html += "<ul>";
      node.eachAdjacency(function(adj){
          var child = adj.nodeTo;
          if (child.data) {
              var rel = (child.data.band == node.name) ? child.data.relation : node.data.relation;
              html += "<li>" + child.name + " " + "<div class=\"relation\">(relation: " + rel + ")</div></li>";
          }
      });
      html += "</ul>";
      $jit.id('inner-details').innerHTML = html;
      current_node_id = node.id;
      if (node.data.relation == 'POA'){
        document.location.replace('/points_of_attractions/'+node.id);
      }
      else{
        ht.loadJSON(Sessionapp.ChartData[current_node_id], 1);
        ht.refresh();
      }
  }
});
//load JSON data.
 ht.loadJSON(Sessionapp.ChartData[current_node_id], 1);
  //compute positions and plot.
  ht.refresh();
}
