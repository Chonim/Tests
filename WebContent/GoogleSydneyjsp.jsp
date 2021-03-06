<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Custom Save Widget</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
      #save-widget {
        width: 300px;
        box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px;
        background-color: white;
        padding: 10px;
        font-family: Roboto, Arial;
        font-size: 13px;
        margin: 15px;
      }

    </style>
  </head>
  <body>
    <div id="map"></div>
    <div id="save-widget">
      <strong>Google Sydney</strong>
      <p>We��re located on the water in Pyrmont, with views of the Sydney Harbour Bridge, The
          Rocks and Darling Harbour. Our building is the greenest in Sydney. Inside, we have a
          "living wall" made of plants, a tire swing, a library with a nap pod and some amazing
          baristas.</p>
    </div>
    <script>
/*
 * This sample uses a custom control to display the SaveWidget. Custom
 * controls can be used in place of the default Info Window to create a
 * custom UI.
 * This sample uses a Place ID to reference Google Sydney. Place IDs are
 * stable values that uniquely reference a place on a Google Map and are
 * documented in detail at:
 * https://developers.google.com/maps/documentation/javascript/places#placeid
 */

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: {lat: -33.8666, lng: 151.1958},
    mapTypeControlOptions: {
      mapTypeIds: [
        google.maps.MapTypeId.ROADMAP,
        google.maps.MapTypeId.SATELLITE
      ],
      position: google.maps.ControlPosition.BOTTOM_LEFT
    }
  });

  var widgetDiv = document.getElementById('save-widget');
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(widgetDiv);

  // Append a Save Control to the existing save-widget div.
  var saveWidget = new google.maps.SaveWidget(widgetDiv, {
    place: {
      // ChIJN1t_tDeuEmsRUsoyG83frY4 is the place Id for Google Sydney.
      placeId: 'ChIJN1t_tDeuEmsRUsoyG83frY4',
      location: {lat: -33.866647, lng: 151.195886}
    },
    attribution: {
      source: 'Google Maps JavaScript API',
      webUrl: 'https://developers.google.com/maps/'
    }
  });

  var marker = new google.maps.Marker({
    map: map,
    position: saveWidget.getPlace().location
  });
}

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=<var class="apiparam replaceable-credential">YOUR_API_KEY</var>&callback=initMap&signed_in=true" async defer>
    </script>
  </body>
</html>