<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://www.google.com/jsapi?key=ABQIAAAAcBlCkeOPJin8k-qaQXzU7BT2yXp_ZAY8_ufC3CFXhHIE1NvwkxR2nqmQ7b9YsHQnrE5X5lt81xC_8A" type="text/javascript"></script>
<script type="text/javascript">
    google.load('search', '1');
</script>
<script type="text/javascript">

var webSearch;
webSearch = new google.search.WebSearch();
webSearch.setSearchCompleteCallback(this, webSearchComplete, [webSearch]);
 
function webSearchComplete (searcher, searchNum) {
    var contentDiv = document.getElementById('web-content');
    contentDiv.innerHTML = '';
    var results = searcher.results;
 
    var newResultsDiv = document.createElement('div');
    newResultsDiv.id = 'web-content';
    for (var i = 0; i < results.length; i++) {
      var result = results[i];
 
      var resultHTML = '<div>';
      resultHTML += '<a href="' + result.unescapedUrl + '" target="_blank"><b>' +
                        result.titleNoFormatting + '</b></a><br/>' +
                        result.content +
                        '<div/>';
      newResultsDiv.innerHTML += resultHTML;
    }
    contentDiv.appendChild(newResultsDiv);
}
 
var newsSearch;
newsSearch = new google.search.NewsSearch();
newsSearch.setSearchCompleteCallback(this,newsSearchComplete, [newsSearch]);

function newsSearchComplete (searcher, searchNum) {
    var contentDiv = document.getElementById('news-content');
    contentDiv.innerHTML = '';
    var results = searcher.results;
 
    var newResultsDiv = document.createElement('div');
    newResultsDiv.id = 'news-content';
    for (var i = 0; i < results.length; i++) {
      var result = results[i];
 
      var resultHTML = '<div>';
      if(result.image!=undefined){
			resultHTML='<img align="right" src="'+result.image.tbUrl+'"/>';
			}
      resultHTML += '<a href="' + result.unescapedUrl + '" target="_blank"><b>' +
                        result.titleNoFormatting + '</b></a><br/>' +
                        result.content +
                        '<div/>';
      newResultsDiv.innerHTML += resultHTML;
    }
    contentDiv.appendChild(newResultsDiv);
}

function search() {
	
	var query = document.getElementById("searchbox").value;
	
	webSearch.execute(query);
    newsSearch.execute(query);
}

$('#searchbox').on("keyup",function(){
	search();
});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>

<input type="text" title="Real Time Search" name="searchbox" id="searchbox"/>
<input type="button" id="searchbtn" value="Search" onclick="search()"/>
 
<div class="data" id="web-content"></div>
<div class="data" id="news-content"></div>

</body>
</html>