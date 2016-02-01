<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
<script src="https://www.google.com/jsapi" type="text/javascript"></script>
<script type="text/javascript">
      google.load("search", "1");
      // google.load("search", "1", {"language" : "en"});

      // Call this function when the page has been loaded
      function initialize() {
        var searchControl = new google.search.SearchControl();

    	  // add in a full set of searchers
    	  function webSearch() {
	    	  searchControl.addSearcher(new google.search.WebSearch());
    	  }
    	  searchControl.addSearcher(new google.search.VideoSearch());
    	  searchControl.addSearcher(new google.search.NewsSearch());
    	  searchControl.addSearcher(new google.search.ImageSearch());

    	  // tell the searcher to draw itself and tell it where to attach
    	  // Note that an element must exist within the HTML document with id "search_control"
    	  searchControl.draw(document.getElementById("search_control"));
        
      }
      google.setOnLoadCallback(initialize);
    </script>
  </head>
  
  <body>
    <div id="search_control"></div>
  </body>

</html>