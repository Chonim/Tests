<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="http://www.google.com/jsapi?key=ABQIAAAAcBlCkeOPJin8k-qaQXzU7BT2yXp_ZAY8_ufC3CFXhHIE1NvwkxR2nqmQ7b9YsHQnrE5X5lt81xC_8A"
	type="text/javascript"></script>
<script type="text/javascript">google.load('search','1');</script>
<TITLE>Real Time Search</TITLE>
<STYLE>
body, input {
	font: 12px Calibri, Arial
}

#page-wrap {
	width: 900px;
	text-align: left;
	height: 90%
}

#logo {
	font-family: Helvetica, sans-serif
}

#searchbox {
	border: 3px solid #fe9;
	font-size: 35px;
	width: 450px;
	-moz-border-radius: 5px;
	font-weight: bold;
	padding-left: 5px
}

#search-content {
	display: none
}

#tweet {
	text-align: center;
	width: 130px;
	position: absolute;
	top: 40px;
	left: 80%;
	display: inline
}

#footer {
	text-align: center;
	font: 12px verdana;
	color: #888;
	clear: both
}

.text-label {
	background-image: url(xreal-time-search.png.pagespeed.ic.45ekxG4Kat.png);
	background-repeat: no-repeat;
	background-position: 80px 0px
}

.content {
	border: 0px solid gray;
	float: left;
	margin: 10px
}

.content .header {
	background-color: #fe9;
	font-size: 18px;
	height: 30px;
	-moz-border-radius: 5px;
	font: bold 18px Cambria;
	margin: 0 -5px 10px -5px;
	padding: 6px 0 0 10px
}

.content .data {
	margin-bottom: 10px
}

.content a {
	font: 13px sans-serif
}

a {
	color: #0075ca
}

#image-content img {
	border: 1px solid #ddd;
	margin: 1px;
	padding: 1px
}
</STYLE>
</HEAD>
<BODY>

	<center>
		<div id="tweet">
			<div style="display: inline;">
				<script type="text/javascript">tweetmeme_style='compact';tweetmeme_source='viralpatelnet';</script>
				<script type="text/javascript"
					src="http://tweetmeme.com/i/scripts/button.js"></script>
			</div>
			<div style="clear: both; margin-top: 5px;">
				<a class="addthis_button"
					href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4ae5ff592f7bba3e"><script
						pagespeed_no_defer="">//<![CDATA[
(function(){var g=this,h=function(b,d){var a=b.split("."),c=g;a[0]in c||!c.execScript||c.execScript("var "+a[0]);for(var e;a.length&&(e=a.shift());)a.length||void 0===d?c[e]?c=c[e]:c=c[e]={}:c[e]=d};var l=function(b){var d=b.length;if(0<d){for(var a=Array(d),c=0;c<d;c++)a[c]=b[c];return a}return[]};var m=function(b){var d=window;if(d.addEventListener)d.addEventListener("load",b,!1);else if(d.attachEvent)d.attachEvent("onload",b);else{var a=d.onload;d.onload=function(){b.call(this);a&&a.call(this)}}};var n,p=function(b,d,a,c,e){this.f=b;this.h=d;this.i=a;this.c=e;this.e={height:window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight,width:window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth};this.g=c;this.b={};this.a=[];this.d={}},q=function(b,d){var a,c,e=d.getAttribute("pagespeed_url_hash");if(a=e&&!(e in b.d))if(0>=d.offsetWidth&&0>=d.offsetHeight)a=!1;else{c=d.getBoundingClientRect();var f=document.body;a=c.top+("pageYOffset"in window?window.pageYOffset:(document.documentElement||f.parentNode||f).scrollTop);c=c.left+("pageXOffset"in window?window.pageXOffset:(document.documentElement||f.parentNode||f).scrollLeft);f=a.toString()+","+c;b.b.hasOwnProperty(f)?a=!1:(b.b[f]=!0,a=a<=b.e.height&&c<=b.e.width)}a&&(b.a.push(e),b.d[e]=!0)};p.prototype.checkImageForCriticality=function(b){b.getBoundingClientRect&&q(this,b)};h("pagespeed.CriticalImages.checkImageForCriticality",function(b){n.checkImageForCriticality(b)});h("pagespeed.CriticalImages.checkCriticalImages",function(){r(n)});var r=function(b){b.b={};for(var d=["IMG","INPUT"],a=[],c=0;c<d.length;++c)a=a.concat(l(document.getElementsByTagName(d[c])));if(0!=a.length&&a[0].getBoundingClientRect){for(c=0;d=a[c];++c)q(b,d);a="oh="+b.i;b.c&&(a+="&n="+b.c);if(d=0!=b.a.length)for(a+="&ci="+encodeURIComponent(b.a[0]),c=1;c<b.a.length;++c){var e=","+encodeURIComponent(b.a[c]);131072>=a.length+e.length&&(a+=e)}b.g&&(e="&rd="+encodeURIComponent(JSON.stringify(s())),131072>=a.length+e.length&&(a+=e),d=!0);t=a;if(d){c=b.f;b=b.h;var f;if(window.XMLHttpRequest)f=new XMLHttpRequest;else if(window.ActiveXObject)try{f=new ActiveXObject("Msxml2.XMLHTTP")}catch(k){try{f=new ActiveXObject("Microsoft.XMLHTTP")}catch(u){}}f&&(f.open("POST",c+(-1==c.indexOf("?")?"?":"&")+"url="+encodeURIComponent(b)),f.setRequestHeader("Content-Type","application/x-www-form-urlencoded"),f.send(a))}}},s=function(){var b={},d=document.getElementsByTagName("IMG");if(0==d.length)return{};var a=d[0];if(!("naturalWidth"in a&&"naturalHeight"in a))return{};for(var c=0;a=d[c];++c){var e=a.getAttribute("pagespeed_url_hash");e&&(!(e in b)&&0<a.width&&0<a.height&&0<a.naturalWidth&&0<a.naturalHeight||e in b&&a.width>=b[e].k&&a.height>=b[e].j)&&(b[e]={rw:a.width,rh:a.height,ow:a.naturalWidth,oh:a.naturalHeight})}return b},t="";h("pagespeed.CriticalImages.getBeaconData",function(){return t});h("pagespeed.CriticalImages.Run",function(b,d,a,c,e,f){var k=new p(b,d,a,e,f);n=k;c&&m(function(){window.setTimeout(function(){r(k)},0)})});})();pagespeed.CriticalImages.Run('/mod_pagespeed_beacon','http://viralpatel.net/realtime/','B6nXayd9mu',true,false,'n2t2laBEbJs');
//]]></script><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif"
					width="125" height="16" alt="Bookmark and Share" style="border: 0"
					pagespeed_url_hash="2120689783"
					onload="pagespeed.CriticalImages.checkImageForCriticality(this);" /></a>
				<script type="text/javascript"
					src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4ae5ff592f7bba3e"></script>
			</div>
		</div>

		<div id="page-wrap">
			<div style="height: 30px"></div>

			<center>

				<input type="text" title="Real Time Search" id="searchbox"
					name="searchbox" />
			</center>
			<br /> <br />
			<div id="search-content">
				<div class="content" style="width: 400px; display: inline">
					<div class="header">Web</div>
					<div class="data" id="web-content"></div>
				</div>

				<div class="content" style="width: 400px; display: inline">
					<div class="header">News</div>
					<div class="data" id="news-content"></div>
				</div>
			</div>

		</div>
	</center>
</BODY>
<SCRIPT>

var imageSearch;
var webSearch;
var newsSearch;
var blogSearch;
var lastSearch=0;

$(function(){
	imageSearch=new google.search.ImageSearch();
	imageSearch.setSearchCompleteCallback(this,imgSearchComplete,null);
	webSearch=new google.search.WebSearch();
	webSearch.setSearchCompleteCallback(this,webSearchComplete,[webSearch,lastSearch]);
	
	newsSearch=new google.search.NewsSearch();
	newsSearch.setSearchCompleteCallback(this,newsSearchComplete,[newsSearch,lastSearch]);
	
	var hash=window.location.hash;
	if(hash!=""&&hash.length>0){
		if(hash.substr(0,3)=='#q='){
			var query=hash.substr(3,hash.length-3);
			$('#searchbox').removeClass('text-label').val(query);search(query);}}
$('#searchbox').focus();});function imgSearchComplete(){
	if(imageSearch.results&&imageSearch.results.length>0){
		var contentDiv=document.getElementById('image-content');
		contentDiv.innerHTML='';
		var results=imageSearch.results;
		for(var i=0;i<results.length;i++){
			var result=results[i];
			var imgContainer=document.createElement('div');
			imgContainer.setAttribute("align","left");
			var newLink=document.createElement('a');
			newLink.href=result.unescapedUrl
newLink.target="_new";
			newLink.title=result.titleNoFormatting;
			var newImg=document.createElement('img');
			newImg.src=result.tbUrl;newImg.setAttribute("align","left");
			newLink.appendChild(newImg);
			imgContainer.appendChild(newLink);contentDiv.appendChild(imgContainer);}}}
			
function webSearchComplete(searcher,searchNum){
	var contentDiv=document.getElementById('web-content');
	contentDiv.innerHTML='';
	var results=searcher.results;
	var newResultsDiv=document.createElement('div');
	newResultsDiv.id='web-content';
	for(var i=0;i<results.length;i++){
		var result=results[i];
		var resultHTML='<div style="height:70px; margin-top:5px;">';
		resultHTML+='<a href="'+result.unescapedUrl+'" target="_blank"><b>'+result.titleNoFormatting+'</b></a><br/>'+result.content+'<div/>';
		newResultsDiv.innerHTML+=resultHTML;}
contentDiv.appendChild(newResultsDiv);}

function newsSearchComplete(searcher,searchNum){
	var contentDiv=document.getElementById('news-content');contentDiv.innerHTML='';
	var results=searcher.results;
	var newResultsDiv=document.createElement('div');
	newResultsDiv.id='news-content';
	for(var i=0;i<results.length;i++){
		var result=results[i];
		var resultHTML='<div style="height:70px; margin-top:5px;">';
		if(result.image!=undefined){
			resultHTML='<img align="right" src="'+result.image.tbUrl+'"/>';
			}
		resultHTML+='<a href="'+result.unescapedUrl+'" target="_blank"><b>'+result.titleNoFormatting+'</b></a><br/>';
		resultHTML+=result.content+'<br/></div>';newResultsDiv.innerHTML+=resultHTML;
		}
		contentDiv.appendChild(newResultsDiv);
	}

$('#searchbox').keyup(function(){
	var query=$(this).val();search(query);
	});
	function search(query){
		if(query.length>0){
			$("#search-content").show();document.title=query+" | Real Time Search - viralpatel.net";
			window.location.hash="q="+query;
		} else {
			document.title="Real Time Search - viralpatel.net";$("#search-content").hide();
		}
	imageSearch.execute(query);webSearch.execute(query);newsSearch.execute(query);
	}

	$('#searchbox').each(function(){
		$(this).addClass('text-label');
		$(this).keyup(function(){
			if(this.value.length==1){
				$(this).removeClass('text-label');
				}
			if(this.value==''){
				$(this).addClass('text-label');
				}});});
	</SCRIPT>

<!-- ADDFREESTATS.COM AUTOCODE V4.0 -->
<span style="display: none"> <script type="text/javascript">var AFS_Account="00814640";var AFS_Tracker="auto";var AFS_Server="www8";var AFS_Page="DetectName";var AFS_Url="DetectUrl";</script>
	<script type="text/javascript"
		src="http://www8.addfreestats.com/cgi-bin/afstrack.cgi?usr=00814640"></script>
	<noscript>
		<a href="http://www.addfreestats.com"> <img
			src="http://www8.addfreestats.com/cgi-bin/connect.cgi?usr=00814640Pauto"
			border=0 alt="Free Web Stats" pagespeed_url_hash="3005996042">Web
			Stats
		</a>
	</noscript>
</span>
<!-- Google Analytics for WordPress | http://yoast.com/wordpress/google-analytics/ -->
<script type="text/javascript">var gaJsHost=(("https:"==document.location.protocol)?"https://ssl.":"http://www.");document.write(unescape("%3Cscript src='"+gaJsHost+"google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));</script>
<script type="text/javascript">try{var pageTracker=_gat._getTracker("UA-5555147-2");pageTracker._trackPageview();}catch(err){}</script>
<!-- End of Google Analytics code -->

</HTML>