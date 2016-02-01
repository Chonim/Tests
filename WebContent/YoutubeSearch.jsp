<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" />
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Open+Sans);

* {
	margin: 0;
	padding: 0;
}

#container {
	box-sizing: border-box;
	background: #ffffff;
	width: 100%;
	margin: 0 auto;
	padding: 25px 40px;
}

header {
	padding: 0 0 10px 0;
	margin: 0 0 20px 0;
	border-bottom: 1px solid #000000;
}


.field-container {
	position: relative;
	width: 100%;
	display: block;
}

ul li {
	display: inline-block;
	margin-top: 5px;
	overflow: auto;
}

.list-left {
	float: left;
	width: 20%;
	
	img {
		width: 100%;
		padding: 3px;
		border: 1px solid #000000;
	}
}

.list-right {
	float: right;
	width: 78%;
}
.cTitle {
	color: red;
}

#next-button,
#prev-button {
	padding: 10px;
	background: #cccccc;
	border: 1px solid #999;
	border-radius: 5px;
	margin-right: 10px;
}

.tooltip-inner {
    max-width: 350px;
    /* If max-width does not work, try using width instead */
    width: 350px; 
}

</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">

$('.fancybox').fancybox();
$('[data-toggle="tooltip"]').tooltip(); 

$(function() {
	
	var $searchField = $('#query'),
			$button = $('#search-btn');

	$('#search-form').submit(function(e){
		e.preventDefault();
		search('설현');
	});
	
});

function search(keyword) {

	// Clear Results
	$('#results').html('');
	$('#buttons').html('');
	
	// Get Form Input
	q = keyword;
	
	// Run Get request on API
	$.get(
		"https://www.googleapis.com/youtube/v3/search", {
			part: 'snippet, id',
			q: q,
			type: 'video',
			key: 'AIzaSyDKJYxyWUDZhykA8DUVOorUbmC7J7QAAUg' },
			function(data) {
				var nextPageToken = data.nextPageToken;
				var prevPageToken = data.prevPageToken;
					
				$.each(data.items, function(i, item) {
					// Get Output
					var output = getOutput(item);
					
					// Display Resluts
					$('#results').append(output);
				});
				
				var buttons = getButtons(prevPageToken, nextPageToken);
				
				// Display Buttons
				$('#buttons').append(buttons);
	
			}
	);
}

// Next Button
function nextPage(keyword) {
	
	var token = $('#next-button').data('token'),
			q = $('#next-button').data('query');
	
	// Clear Results
	$('#results').html('');
	$('#buttons').html('');
	
	// Get Form Input
	q = keyword;
	
	// Run Get request on API
	$.get(
		"https://www.googleapis.com/youtube/v3/search", {
			part: 'snippet, id',
			pageToken: token,
			q: q,
			type: 'video',
			key: 'AIzaSyDKJYxyWUDZhykA8DUVOorUbmC7J7QAAUg' },
			function(data) {
				var nextPageToken = data.nextPageToken;
				var prevPageToken = data.prevPageToken;
					
				$.each(data.items, function(i, item) {
					// Get Output
					var output = getOutput(item);
					
					// Display Resluts
					$('#results').append(output);
				});
				
				var buttons = getButtons(prevPageToken, nextPageToken);
				
				// Display Buttons
				$('#buttons').append(buttons);
	
			}
	);
}

// Prev Button
function prevPage(keyword) {

	var token = $('#prev-button').data('token'),
			q = $('#prev-button').data('query');
	
	// Clear Results
	$('#results').html('');
	$('#buttons').html('');
	
	// Get Form Input
	q = keyword;
	
	// Run Get request on API
	$.get(
		"https://www.googleapis.com/youtube/v3/search", {
			part: 'snippet, id',
			pageToken: token,
			q: q,
			type: 'video',
			key: 'AIzaSyDKJYxyWUDZhykA8DUVOorUbmC7J7QAAUg' },
			function(data) {
				var nextPageToken = data.nextPageToken;
				var prevPageToken = data.prevPageToken;
					
				$.each(data.items, function(i, item) {
					// Get Output
					var output = getOutput(item);
					
					// Display Resluts
					$('#results').append(output);
				});
				
				var buttons = getButtons(prevPageToken, nextPageToken);
				
				// Display Buttons
				$('#buttons').append(buttons);
	
			}
	);
}

// Build Output
function getOutput(item) {
	var videoId = item.id.videoId;	// 비디오 ID
	var title = item.snippet.title;	// 제목
	var description = item.snippet.description;	// 설명
	var thumb = item.snippet.thumbnails.medium.url;	// 썸네일
	var channelTitle = item.snippet.channelTitle;	// 채널 제목
	var videoDate = item.snippet.publishedAt;	// 날짜
	
	var output = '<li>' +
			'<a class="fancybox fancybox.iframe" title="' + 
			title + '\n' +
			channelTitle + '\n' + 
			videoDate + '\n' +
			description +
			'" href="http://www.youtube.com/embed/'+ videoId +'">' +
			'<img src="'+thumb+'" /></a>' 
			
			/* +
			'<h3><a class="fancybox fancybox.iframe" href="http://www.youtube.com/embed/'+videoId+'">'+title+'</a></h3>' +
			'<small>By <span class="cTtile">'+channelTitle+'</span> on '+videoDate+'</small>' +
			'<p>'+description+'</p>' +
			'</li>' +
			'<div class="clearfix"></div>' +
			''; */
	
	return output;
}

// Build the Buttons
function getButtons(prevPageToken, nextPageToken){
	if(!prevPageToken){
		var btnOutput = '<div class="btn-container">' +
				'<button id="next-button" class="btn" data-query="'+ q +'"' +
				'data-token="'+ nextPageToken +'" onclick="nextPage('+q+')">다음 페이지</button></div>'
	} else {
				var btnOutput = '<div class="button-container">' +
				'<button id="prev-button" class="btn" data-query="'+ q +'"' +
				'data-token="'+ prevPageToken +'" onclick="prevPage();">이전 페이지</button>' +
				'<button id="next-button" class="btn" data-query="'+ q +'"' +
				'data-token="'+ nextPageToken +'" onclick="nextPage();">다음 페이지</button></div>'
	}
	return btnOutput;
}

</script>
</head>
<body>
<div id="container">
	<form id="search-form" name="search-form" onsubmit="return search()">
		<div class="field-container">
			<input type="submit" name="search-btn" id="search-btn" value="">
		</div>
	</form>
	<ul id="results" class="list-inline"></ul>
	<div id="buttons"></div>
</div>

</body>
</html>