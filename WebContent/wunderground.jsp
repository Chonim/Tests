<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="description" content="Stephen Mayeux's Local Weather Report">
<meta name="author" content="Stephen Mayeux">

<title>Local Weather</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" ></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style type="text/css">
.bg-desert {
  background: url(http://eslhiphop.com/images/fcc/desert.jpeg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.bg-summer {
  background: url(http://eslhiphop.com/images/fcc/summer.jpg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.bg-spring {
  background: url(http://eslhiphop.com/images/fcc/spring.jpg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.bg-autumn {
  background: url(http://eslhiphop.com/images/fcc/autumn.jpg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.bg-snow {
  background: url(http://eslhiphop.com/images/fcc/snow.jpeg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

body,
h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-weight: 700;
}

.container {
  text-align: center;
  padding-top: 50px;
  color: #f8f8f8;
}

.container h1 {
  text-shadow: 2px 2px 3px rgba(0, 0, 0, 0.6);
  font-size: 4em;
}

.weather-box {
  background-color: black;
  padding-top: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
  padding-right: 10px;
  margin-bottom: 15px;
  opacity: 0.7;
  border-radius: 15px;
  -moz-border-radius: 15px;
}

p {
  font-size: 24px;
}
</style>
<script type="text/javascript">
/*
Weather Underground API
Documentation can be found at http://www.wunderground.com/weather/api/d/docs?MR=1
*/

$(document).ready(function() {
  var location = '';
  var weather = '';
  var temps = '';
  $.ajax({
    url: "http://api.wunderground.com/api/691f03fcd942d61a/conditions/lang:KR/q/autoip.json",
    dataType: "jsonp",
    success: function(apiResponse) {
      location = apiResponse.current_observation.display_location.city;
      weather = apiResponse.current_observation.weather;
      var tempForBackground = apiResponse.current_observation.temp_f;
      // temps = apiResponse.current_observation.temperature_string;
      temps = apiResponse.current_observation.temp_c;
      var weatherIcon = apiResponse.current_observation.icon_url;

      if (tempForBackground >= 85) {
        $('body').addClass('bg-desert');
      } else if (tempForBackground < 85 && tempForBackground >= 75) {
        $('body').addClass('bg-summer');
      } else if (tempForBackground < 75 && tempForBackground >= 60) {
        $('body').addClass('bg-spring');
      } else if (tempForBackground < 60 && tempForBackground >= 35) {
        $('body').addClass('bg-autumn');
      } else if (tempForBackground < 35) {
        $('body').addClass('bg-snow');
      }

      $('.weather_temps').html(location + "의 현재 기온은 " + temps + "도 입니다.");
      $('.weather_conditions').html(weather);
    }
  });
  $('.share-weather').click(function() {
    window.open("https://twitter.com/intent/tweet?text=" + encodeURIComponent("It is currently " + temps + " in " + location + ". This report is powered by @wunderground!"));
  });
});
</script>
</head>
<body>
  <div class='container'>
    <div class='row'>
      <div class='col-lg-12'>
        <h1>현재 기온</h1>
      </div>
    </div>
    <div class='row'>
      <div class='col-xs-6 col-xs-offset-3'>
        <div class='weather-box'>
          <p class='weather_temps'></p>
          <p class='weather_conditions'></p>
        </div>
        <ul class='inline'>
          <a href='#' class='btn btn-default btn-lg share-weather'><i class='fa fa-twitter fa-fw'></i>Share Weather</a></ul>
      </div>
    </div>
  </div>
</body>
</html>