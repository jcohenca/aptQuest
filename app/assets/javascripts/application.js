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
//= require jquery.ui.all

//= require turbolinks
//= require_tree .


// var map;
// var geocoder;
// function initializeMap() {

//   var myLatLong = new google.maps.LatLng();
//   var myOptions = {
//                       zoom: 16,
//                       center: myLatLong,
//                       mapTypeId:google.maps.MapTypeId.ROADMAP
//                   };
//   map           = new google.maps.Map(document.getElementById('map-canvas'),myOptions);
//   geocoder      = new google.maps.Geocoder();
// }

// function handleAutocomplete() {
//   $("#autocomplete").autocomplete({
//     source: function(request, response) {
//       geocoder.geocode({'address':request.term}, function(results) {
//         response($.map(results, function(item) {
//             return {
//               label: item.formatted_address, 
//               value: item.formatted_address,
//               latitude: item.geometry.location.lat(),
//               longitude: item.geometry.location.lng(),
//             }
//         }))
//       })
//     },
//     select:function(event, ui) {
//       var location    =   new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
//       marker          =   new google.maps.Marker({
//       map:                map,
//       draggable:          true
//       })

//       var stringValue =   'Latitude: <input type="text" value ="'+ui.item.latitude+'" >Longitude:<input type="text" value="'+ui.item.longitude+'"><br/>';

//       $('#value').append(stringValue);

//       marker.setPosition(location);
//       map.setCenter(location);
//     }
//   })
// }


// // service = new google.maps.places.PlacesService(map);
// // service.textSearch(request, callback);

// $(document).ready(function() {
//   initializeMap();
//   handleAutocomplete();
//   // $('#map-canvas').hide();
//   $('#value').hide()
  

// }); 







//  new variable for places 