<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://www.google.com/jsapi" type="text/javascript"></script>
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
 
function search(query) {
    webSearch.execute(query);
}
</script>
</head>
<body>

<input type="text" title="Real Time Search" name="searchbox"/>
<input type="button" id="searchbtn" value="Search" onclick="search(searchbox.value)"/>
 
<div class="data" id="web-content"></div>

</body>
</html>