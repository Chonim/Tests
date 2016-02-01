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

var access_token = "16741082.1b07669.121a338d0cbe4ff6a5e04543158a4f82",
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

function grabImages(tag, count, access_parameters) {
var instagramUrl = 'https://api.instagram.com/v1/tags/' + tag + '/media/recent?callback=?&count=' + count;

$.getJSON(instagramUrl, access_parameters, onDataLoaded);
}

function onDataLoaded(instagram_data) {
var target = $("#target");
//console.log(instagram_data);
if (instagram_data.meta.code == 200) {
    var photos = instagram_data.data;
    //console.log(photos);
    if (photos.length > 0) {
        target.empty();
        for (var key in photos) {
            var photo = photos[key];
            target.append('<a href="' + photo.link + '"><img src="' + photo.images.thumbnail.url + '"></a>')
        }
    } else {
        target.html("nothing found");
    }
} else {
    var error = instagram_data.meta.error_message;
    target.html(error);
}
}

grabImages('unicorn', 40, access_parameters);

/* function showInstagram()
{
	var query = document.getElementById("query");
	var category = document.getElementById("category");
	// var url = "https://api.instagram.com/v1/tags/"+ query.value;
	var url = "https://api.instagram.com/v1/tags/연말정산";
	url += "/media/recent?client_id=0c4a119af8d54538af6061cb3b5ff617&start=0&count=10&callback=json";
	
$.getJSON(url,function(data) {
 		
 		alert(url);
 		alert(data);
 		
 	}).error(function(XMLHttpRequest, textStatus, errorThrown)
 	{          
 		result = "검색어를 입력해주세요.";
 	}).complete(function(){
 		$("#results").html(result).slideDown("normal").fadeIn("normal");                                    
 	});
 } */
</script>
</html>