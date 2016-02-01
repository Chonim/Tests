<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
<style type="text/css">
body {
    font: 75% "Helvetica Neue", sans-serif;
    color: #333;
}
input {
    font-size: 100%;
}
input[type="text"] {
    border: 1px solid #ccc;
    padding: 4px 8px;
}
img {
</style>
</head>
<body>

<form id="tagsearch">
    <p>
        <label for="tag">Hashtag:</label>
        <input type="text" id="tag" name="tag" placeholder="unicorn" />
        <input type="submit" value="Search" />
    </p>
</form>

<div id="target"></div>

</body>
<script type="text/javascript">

var access_token = "16384709.6ac06b4.49b97800d7fd4ac799a2c889f50f2587",
access_parameters = {
    access_token: access_token
};

var form = $('#tagsearch');
form.on('submit', function(ev) {
var q = this.tag.value; // 파라미터 function(keyword)

if(q.length) {
    //console.log(q);
    grabImages(q, 40, access_parameters);
}
ev.preventDefault();
});



function showInstagram(tag) {
var instagramUrl = 'https://api.instagram.com/v1/tags/' + tag + '/media/recent/?access_token=16384709.6ac06b4.49b97800d7fd4ac799a2c889f50f2587&callback=?&count=50';

$.getJSON(instagramUrl, onDataLoaded);
}

function onDataLoaded(instagram_data) {
	var target = $("#target");
	console.log(instagram_data);
	if (instagram_data.meta.code == 200) {
	    var photos = instagram_data.data;
	    console.log(photos);
	    if (photos.length > 0) {
	        target.empty();
	        var dt = new Date();
	        var currentTime = parseInt(dt.getTime()/1000);
	        for (var key in photos) {
	            var photo = photos[key];
	            var howLongBefore = currentTime - photo.created_time;
	            if (howLongBefore > 60*60*24*7*30) {
	            	howLongBefore = parseInt(howLongBefore/30/7/24/60/60) + "개월 전";
	            } else if (howLongBefore > 60*60*24*7) {
	            	howLongBefore = parseInt(howLongBefore/7/24/60/60) + "주 전";
	            } else if (howLongBefore > 60*60*24) {
	            	howLongBefore = parseInt(howLongBefore/24/60/60) + "일 전";
	            } else if (howLongBefore > 60*60) {
	            	howLongBefore = parseInt(howLongBefore/60/60) + "시간 전";
	            } else if (howLongBefore > 60) {
	            	howLongBefore = parseInt(howLongBefore/60) + "분 전";
	            } else {
	            	howLongBefore = parseInt(howLongBefore) + "초 전";
	            }
	            
	            var createdTime = new Date(parseInt(photo.created_time) * 1000);
	            target.append('<div><a href="' + photo.link + '"><img src="' + photo.images.thumbnail.url + '"></div><div>' + photo.caption.text + '</a></div>' + howLongBefore)
	        }
	    } else {
	        target.html("인스타그램 검색 결과가 없습니다.");
	    }
	} else {
	    var error = instagram_data.meta.error_message;
	    target.html(error);
	}
}

showInstagram('초아');
</script>
</html>