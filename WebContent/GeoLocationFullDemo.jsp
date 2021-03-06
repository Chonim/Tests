<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <meta name="author" content="Aurelio De Rosa">
      <title>Geolocation API Demo by Aurelio De Rosa</title>
      <style>
         *
         {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
         }
 
         body
         {
            max-width: 500px;
            margin: 2em auto;
            padding: 0 0.5em;
            font-size: 20px;
         }
 
         h1
         {
            text-align: center;
         }
 
         .hidden
         {
            display: none;
         }
 
         .buttons-wrapper
         {
            text-align: center;
         }
 
         .button-demo
         {
            padding: 0.5em;
            margin: 1em auto;
         }
 
         .g-info
         {
            font-weight: bold;
         }
 
         #log
         {
            height: 200px;
            width: 100%;
            overflow-y: scroll;
            border: 1px solid #333333;
            line-height: 1.3em;
         }
 
         .author
         {
            display: block;
            margin-top: 1em;
         }
      </style>
   </head>
   <body>
      <h1>Geolocation API</h1>
      <div class="buttons-wrapper">
         <button id="button-get-position" class="button-demo">Get current position</button>
         <button id="button-watch-position" class="button-demo">Watch position</button>
         <button id="button-stop-watching" class="button-demo">Stop watching position</button>
      </div>
 
      <span id="g-unsupported" class="hidden">API not supported</span>
 
      <h2>Information</h2>
      <div id="g-information">
         <ul>
            <li>
               Your position is <span id="latitude" class="g-info">unavailable</span>�� latitude,
               <span id="longitude" class="g-info">unavailable</span>�� longitude (with an accuracy of
               <span id="position-accuracy" class="g-info">unavailable</span> meters)
            </li>
            <li>
               Your altitude is <span id="altitude" class="g-info">unavailable</span> meters
               (with an accuracy of <span id="altitude-accuracy" class="g-info">unavailable</span> meters)
            </li>
            <li>You're <span id="heading" class="g-info">unavailable</span>�� from the True north</li>
            <li>You're moving at a speed of <span id="speed" class="g-info">unavailable</span>�� meters/second</li>
            <li>Data updated at <span id="timestamp" class="g-info">unavailable</span></li>
         </ul>
      </div>
 
      <h3>Log</h3>
      <div id="log"></div>
      <button id="clear-log" class="button-demo">Clear log</button>
 
      <small class="author">
         Demo created by <a href="http://www.audero.it">Aurelio De Rosa</a>
         (<a href="https://twitter.com/AurelioDeRosa">@AurelioDeRosa</a>)
      </small>
 
      <script>
         window.navigator = window.navigator || {};
         window.navigator.geolocation = window.navigator.geolocation ||
                                        undefined;
         if (navigator.geolocation === undefined) {
            document.getElementById('g-unsupported').classList.remove('hidden');
            ['button-get-position', 'button-watch-position', 'button-stop-watching'].forEach(function(elementId) {
               document.getElementById(elementId).setAttribute('disabled', 'disabled');
            });
         } else {
            var log = document.getElementById('log');
            var watchId = null;
            var positionOptions = {
               enableHighAccuracy: true,
               timeout: 10 * 1000, // 10 seconds
               maximumAge: 30 * 1000 // 30 seconds
            };
 
            function success(position) {
               document.getElementById('latitude').innerHTML = position.coords.latitude;
               document.getElementById('longitude').innerHTML = position.coords.longitude;
               document.getElementById('position-accuracy').innerHTML = position.coords.accuracy;
 
               document.getElementById('altitude').innerHTML = position.coords.altitude ?  position.coords.altitude :
                       'unavailable';
               document.getElementById('altitude-accuracy').innerHTML = position.coords.altitudeAccuracy ?
                       position.coords.altitudeAccuracy :
                       'unavailable';
               document.getElementById('heading').innerHTML = position.coords.heading ? position.coords.heading :
                       'unavailable';
               document.getElementById('speed').innerHTML = position.coords.speed ? position.coords.speed :
                       'unavailable';
 
               document.getElementById('timestamp').innerHTML = (new Date(position.timestamp)).toString();
 
               log.innerHTML = 'Position succesfully retrieved<br />' + log.innerHTML;
            }
 
            function error(positionError) {
               log.innerHTML = 'Error: ' + positionError.message + '<br />' + log.innerHTML;
            }
 
            document.getElementById('button-get-position').addEventListener('click', function() {
               navigator.geolocation.getCurrentPosition(success, error, positionOptions);
            });
 
            document.getElementById('button-watch-position').addEventListener('click', function() {
               watchId = navigator.geolocation.watchPosition(success, error, positionOptions);
            });
 
            document.getElementById('button-stop-watching').addEventListener('click', function() {
               if (watchId !== null) {
                  navigator.geolocation.clearWatch(watchId);
                  log.innerHTML = 'Stopped watching position<br />' + log.innerHTML;
               }
            });
 
            document.getElementById('clear-log').addEventListener('click', function() {
               log.innerHTML = '';
            });
         }
      </script>
   </body>
</html>