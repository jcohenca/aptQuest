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
  var searchIcon;
  var map;
  var infowindow;
  var geocoder;
  var service;
  var marker;
  var markers = [];

  function initialize() {

    var currentLocation   = new google.maps.LatLng(40.740289, -73.981314);
    geocoder              = new google.maps.Geocoder();
    map                   = new google.maps.Map(document.getElementById('map-canvas'), {

    center:       currentLocation,
    zoom:         15,
    mapTypeId:    google.maps.MapTypeId.ROADMAP 
    });

    infowindow            = new google.maps.InfoWindow();
    service               = new google.maps.places.PlacesService(map);
    findNearbyPlaces(currentLocation);
  }

  function findNearbyPlaces(searchLocation, type) {
    var request = {
      location: searchLocation,
      radius: 500,
      types: [type]
    };
   service.nearbySearch(request, handleResults); 
  }

  function handleResults(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      for (var i = 0; i < results.length; i++) {
        createMarker(results[i]);
        markers.push(marker);
      }
    }
 
  function createMarker(place) {
    var image           =  '/assets/' + searchIcon;
    var placeLoc        = place.geometry.location;
    marker              = new google.maps.Marker({
      map: map,
      title: place.name,
      icon: image,
      animation: google.maps.Animation.DROP,
      position: place.geometry.location,
    });
    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(place.name);
      infowindow.open(map, this);
      });
    }
  }

 function clearMarkers() {
    setAllMap(null);
  }

  function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
    }
  }

  var address;
  function updateMapAddress() {
    $('#container').show();
    address = document.getElementById('address').value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        newLocation = results[0].geometry.location;
        map.setCenter(newLocation);

        var marker = new google.maps.Marker({
            map: map,
            animation: google.maps.Animation.BOUNCE,
            position: newLocation,
        });
       $('.select-search').click(function(){
          searchIcon = $(this).text() + ".png"
          var searchType = $(this).val();
          findNearbyPlaces(newLocation, searchType);
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

$(document).ready(function(){
  $('#container').hide();
  // $("#map-canvas").hide()
  google.maps.event.addDomListener(window, 'load', initialize);

});



