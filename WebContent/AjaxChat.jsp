<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
var num = 0;
var viewHttpRequest = getXmlHttp();
var sendHttpRequest = getXmlHttp();
var timer;
var count = 0;

function getXmlHttp(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else if(window.ActiveXObject){
		try{
			new ActiveXObject("Microsoft.XMLHTTP");
		}catch(e){
			new ActiveXObject("Msxml2.XMLHTTP");
		}
	}
}


function start(){
	viewHttpRequest.open("GET", "/Chat/chatView.ln?linkCode="+'<%=session.getAttribute("link_code")%>'+"&no="+num, true);
	viewHttpRequest.onreadystatechange = function(){
		if(viewHttpRequest.readyState == 4){
			if(viewHttpRequest.status == 200){
				getChatHandler();
			}
		}
	};
	viewHttpRequest.send();
}

function getChatHandler(){
	var json = JSON.parse(viewHttpRequest.responseText);
	if(json != ""){
		for(var i=0; i<json.length; i++){
			if(json[i].user_code == '<%=session.getAttribute("user_code")%>'){
				document.getElementById("chat-box").innerHTML += "<li class=even>"+json[i].chat_context+"</li>";
				document.getElementById("chat-box").scrollTop = document.getElementById("chat-box").scrollHeight;
			}else{
				document.getElementById("chat-box").innerHTML += "<li class=odd>"+json[i].chat_context+"</li>";
				if(count == 0){
					document.getElementById("chat-box").scrollTop = document.getElementById("chat-box").scrollHeight;
				}else if(document.getElementById("chat-box").scrollHeight-document.getElementById("chat-box").scrollTop == document.getElementById("chat-box").clientHeight){
					document.getElementById("chat-box").scrollTop = document.getElementById("chat-box").scrollHeight;
				}
				
			}
			
			num = json[i].num;
		}
	}
	
	count++;
	timer = setInterval( start(),  5000 );
	 
}

function sendMsg(){
	
	var sendJson = {
			"linkCode" : '<%=session.getAttribute("link_code")%>',
			"userCode" : '<%=session.getAttribute("user_code")%>',
	 		"msg" : document.getElementById("msg").value
	};

	var sendJsonStr = JSON.stringify(sendJson);
	
	sendHttpRequest.open("POST", "/Chat/chatInsert.ln", true);
	sendHttpRequest.onreadystatechange = function(){
		if(sendHttpRequest.readyState == 4){
			if(sendHttpRequest.status == 200){
				sendHandler();
			}
		}
	};
	sendHttpRequest.send(sendJsonStr);
}

function sendHandler(){
	document.getElementById("msg").value = "";
}

function scroll(){
	if(document.getElementById("chat-box").scrollHeight-document.getElementById("chat-box").scrollTop != document.getElementById("chat-box").clientHeight){
		clearInterval(timer);
	}else{
		start();
	}
}
</script>
</head>
<body>
</body>
</html>