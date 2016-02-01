<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
html {
  margin:0;
  padding:0;
} 

body {
  background-repeat: no-repeat;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  margin:0;
  padding:0;
}

h1, h2, h3, h4 {
  color: black;
}

h1 {
  margin-top: 0;
  padding-top: 40px;
}

.black-opacity{
  background-color: rgba(255,255,255,0.5);
  height: 1000px;
  padding-top: 0;
  margin-top: 0;
  
}

#wunderground-logo {
  width: auto;
  max-height: 20px;
}

#weather-icon {
  width: auto;
  height: 90px;
}

.toggle-text-left{
  display: none;
  text-align: center;
  vertical-align:middle;
  padding-bottom: 15px;
  padding-left: 5px;
  padding-right: 5px;
}

.toggle-text-right{
  display: none;
  text-align: center;
  vertical-align:middle;
  padding-bottom: 15px;
  padding-left: 0px;
  padding-right: 5px;
}

.toggle-switch {
  display: none;
}

.container-flex {
  display: flex;
  height: 70px;
  justify-content: center;
  align-items: center;
}

.credits {
  padding: 50px 0 0 0;
}

/* Toggle Switch from http://callmenick.com/post/css-toggle-switch-examples */
.cmn-toggle {
  position: fixed;
  margin-left: -9999px;
  visibility: hidden;
}

.cmn-toggle + label {
  display: block;
  position: relative;
  cursor: pointer;
  outline: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

input.cmn-toggle-round-flat + label {
  padding: 2px;
  /* size of switch */
  width: 40px;
  height: 20px;
  /*----------------*/
  background-color: #000000;
  border-radius: 60px;
  transition: background 0.4s;
}

input.cmn-toggle-round-flat + label:before,
input.cmn-toggle-round-flat + label:after {
  display: block;
  position: absolute;
  content: '';
}

input.cmn-toggle-round-flat + label:before {
  top: 2px;
  left: 2px;
  bottom: 2px;
  right: 2px;
  background-color: #fff;
  border-radius: 60px;
  transition: background 0.4s;
}

input.cmn-toggle-round-flat + label:after {
  top: 4px;
  left: 4px;
  bottom: 4px;
  width: 12px; /* size of switch circle */
  background-color: #000000;
  border-radius: 52px;
  transition: margin 0.4s, background 0.4s;
}

input.cmn-toggle-round-flat:checked + label {
  background-color: #000000;
}

input.cmn-toggle-round-flat:checked + label:after {
  margin-left: 20px; /* how much switch slides to right */
  background-color: #000000;
}
</style>
<script type="text/javascript">
jQuery(document).ready(function ($) {
	  getLocation();
	});

	// Get user location
	var locationName = document.getElementById("location-name");
	var temp_f = 0;
	var temp_c = 0;

	function getLocation() {
	  // Call showPosition function and pass it position
	  // On error, call showError function
	  navigator.geolocation.getCurrentPosition(showPosition, showError);
	}

	// Get lat and long coords from browser and then call weather API
	function showPosition(position) {
	  var latCoord = position.coords.latitude;
	  var longCoord = position.coords.longitude;


	  // API call to Weather Underground
	  $.ajax({
	    url: "http://api.wunderground.com/api/079983eb38969753 /geolookup/conditions/lang:KR/q/" + latCoord + "," + longCoord + ".json",
	    dataType: "jsonp",
	    success: function (parsed_json) {
	      var location = parsed_json['location']['city'];
	      //console.log(location);
	      temp_f = parsed_json['current_observation']['temp_f'];
	      temp_c = parsed_json['current_observation']['temp_c'];

	      var weather = parsed_json['current_observation']['weather'];
	      var icon = parsed_json['current_observation']['icon'];

	      $('#location-name').text(location);
	      $('#location-temp').html(temp_c + ' &deg;C');
	      $('i').remove();
	      $('#location-icon').prepend("<img id='weather-icon' src='http://icons.wxug.com/i/c/i/" + icon + ".gif' />")
	      $('#location-weather').text(weather);
	      $('.toggle-text-left').css('display', 'flex');
	      $('.toggle-text-right').css('display', 'flex');
	      $('.toggle-switch').css('display', 'flex');

	      // Different icon name possibilities
	      var snowArray = ["chanceflurries", "chancesnow", "chancesleet", "flurries", "sleet", "snow"];
	      var rainArray = ["rain", "chancerain", "tstorms", "chancestorms"];
	      var sunnyArray = ["clear", "hazy", "mostlysunny", "sunny", "partlycloudy"];
	      var cloudyArray = ["cloudy", "fog", "mostlycloudy"];

	      // Find which array the icon belongs to and display that background image
	      if ($.inArray(icon, snowArray) > -1) {
	        $('body').css('background-image', 'url("http://cache.desktopnexus.com/thumbseg/205/205327-bigthumbnail.jpg")');
	      } 
	      else if ($.inArray(icon, rainArray) > -1) {
	        $('body').css('background-image', 'url("http://cache.desktopnexus.com/thumbseg/92/92240-bigthumbnail.jpg")');
	      } 
	      else if ($.inArray(icon, sunnyArray) > -1) {
	        $('body').css('background-image', 'url("http://images.fineartamerica.com/images-medium-large/sunny-spring-landscape-michal-bednarek.jpg")');
	      } 
	      else if ($.inArray(icon, cloudyArray) > -1) {
	        $('body').css('background-image', 'url("https://c1.staticflickr.com/7/6023/5975465375_9c089b6085_b.jpg")');
	      }      

	      // Change from fahrenheit to celsius and vice versa
	      $("#toggle").click(function () {
	        if (this.checked) {
	          $('#location-temp').html(temp_c + ' &deg;C');
	        } else {
	          $('#location-temp').html(temp_f + ' &deg;F');
	        }
	      });
	    }
	  });
	}

	// If getCurrentPosition method in getLocation() function throws error, handle it
	function showError(error) {
	  switch (error.code) {
	  case error.PERMISSION_DENIED:
	    locationName.innerHTML = "User denied the request for Geolocation."
	    break;
	  case error.POSITION_UNAVAILABLE:
	    locationName.innerHTML = "Location information is unavailable."
	    break;
	  case error.TIMEOUT:
	    locationName.innerHTML = "The request to get user location timed out."
	    break;
	  case error.UNKNOWN_ERROR:
	    locationName.innerHTML = "An unknown error occurred."
	    break;
	  }
	}
	
</script>
</head>
<body>
<div class='black-opacity'>

    <h1 class='text-center'>ÇöÀç ³¯¾¾</h1>

    <!--City-->
    <h3 id='location-name' class='text-center'></h3>

    <!--Temperature-->
    <h3 id='location-temp' class='text-center'></h3>

    <!--Weather Icon-->
    <h3 id='location-icon' class='text-center'><i class='fa fa-circle-o-notch fa-spin'></i></h3>

    <!--Weather Text-->
    <h4 id='location-weather' class='text-center'></h4>


    <div class='credits text-center'>
      <a href='http://www.wunderground.com/'><img alt='Weather Underground Logo' id='wunderground-logo' src='http://icons.wxug.com/logos/JPG/wundergroundLogo_4c_horz.jpg' /></a>
    </div>
  
  </div>
</body>
</html>