<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("currentUser")==null){
		out.println("<script>alert('请先登录');location.href='index.jsp';</script>");
	}
%>


<!DOCTYPE HTML>
<html>
<head>
<%@ include file="header.jsp"%>
<link type="image/x-icon" rel="shortcut icon" href="yclogo.png">
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0px;
	font-size: 12px;
	font-family: "微软雅黑";
	line-height: 26px;
}

#bigbox {
	margin: 0px auto;
	padding: 0px;
	width: 906px;
}

#bigbox #left {
	width: 700px;
	height: 600px;
	border: 1px solid red;
	float: left;
	overflow: scroll;
}

#bigbox #right {
	width: 200px;
	float: left;
	border: 1px solid red;
	height: 600px;
	overflow: scroll;
	margin-left: 2px;
}

#bigbox #main {
	clear: both;
	width: 904px;
	border: 1px solid red;
}

#content {
	width: 400px;
	height: 30px;
}
</style>

<script type="text/javascript" src="jquery-1.8.2.js"></script>
<script type="text/javascript"  src="MyAjax.js"  ></script>
<script>


	function loginOut(){
		location.href="doout.jsp";
		
	}
	

	function addContent() {
		var content = $.trim($("#content").val());
		var status = $.trim($("#status").val());

		if (content != "") {
			myAjax("dotalk.jsp",{status:status,content:content},function(data){
				$("#talkInfo").html(data);
				$("#content").val("");
				$("#left").scrollTop($("#info").height()-580);
			});	

		} else {
			$("#content").focus();
		}

	}

	//发送请求
	function startRequest() {
		myAjax("docontent.jsp",null,function(data){
			$("#talkInfo").html(data);
			$("#left").scrollTop( $("#info").height()-580);
		});
	}

	window.setInterval("startRequest()", 2000);
</script>




</head>

<body>
	<div id="bigbox">
		<div id="talkInfo">
			<%@ include file="content.jsp"%>
		</div>
		<div id="main">
			<center>
				<!-- dotalk.jsp -->
				<form action=" " method="post" id="myform">
					您：<select name="status" id="status">
						<option value="快乐地">快乐地</option>
						<option value="悲伤地">悲伤地</option>
						<option value="无聊地">无聊地</option>
						<option value="得瑟地">得瑟地</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 说：<input type="text" name="content"
						id="content" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
						value=" &nbsp;发送&nbsp; " onclick="addContent()" />&nbsp;&nbsp; <input
						type="button" value=" &nbsp;我闪 &nbsp; " onclick="loginOut()" />
				</form>
			</center>
		</div>
	</div>
</body>
</html>
