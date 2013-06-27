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
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

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
});

// var JitTree = {};
// JitTree.showJit = function(){
//   console.log(json);
//   //id of the visualization container
//   var ht = new $jit.Hypertree({
//   injectInto: 'infovis',
//   //canvas width and height
//   width: 500,
//   height: 600,
//   //Change node and edge styles such as
//   //color, width and dimensions.
//   Node: {
//       dim: 9,
//       color: "#f00"
//   },
//   Edge: {
//       lineWidth: 2,
//       color: "#088"
//   },
//   onBeforeCompute: function(node){
//       console.log("centering");
//   },
//   //Attach event handlers and add text to the
//   //labels. This method is only triggered on label
//   //creation
//   onCreateLabel: function(domElement, node){
//       domElement.innerHTML = node.name;
//       $jit.util.addEvent(domElement, 'click', function () {
//           ht.onClick(node.id, {
//               onComplete: function() {
//                   ht.controller.onComplete();
//               }
//           });
//       });
//   },
//   //Change node styles when labels are placed
//   //or moved.
//   onPlaceLabel: function(domElement, node){
//       var style = domElement.style;
//       style.display = '';
//       style.cursor = 'pointer';
//       if (node._depth <= 1) {
//           style.fontSize = "0.8em";
//           style.color = "#ddd";

//       } else if(node._depth == 2){
//           style.fontSize = "0.7em";
//           style.color = "#555";

//       } else {
//           style.display = 'none';
//       }

//       var left = parseInt(style.left);
//       var w = domElement.offsetWidth;
//       style.left = (left - w / 2) + 'px';
//   },

//   onComplete: function(){
//       console.log("done");

//       //Build the right column relations list.
//       //This is done by collecting the information (stored in the data property)
//       //for all the nodes adjacent to the centered node.
//       var node = ht.graph.getClosestNodeToOrigin("current");
//       var html = "<h4>" + node.name + "</h4><b>Connections:</b>";
//       html += "<ul>";
//       node.eachAdjacency(function(adj){
//           var child = adj.nodeTo;
//           if (child.data) {
//               var rel = (child.data.band == node.name) ? child.data.relation : node.data.relation;
//               html += "<li>" + child.name + " " + "<div class=\"relation\">(relation: " + rel + ")</div></li>";
//           }
//       });
//       html += "</ul>";
//       $jit.id('inner-details').innerHTML = html;
//   }
// });
// //load JSON data.
// ht.loadJSON(json);
// //compute positions and plot.
// ht.refresh();
// }
