<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="header.jsp"%>
<link type="image/x-icon" rel="shortcut icon" href="yclogo.png">

<script type="text/javascript" src="jquery-1.8.2.js"></script>


</head>


<script>
	var xmlHttp;
	function createXMLHttpRequest() {
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	//发送请求
	function startRequest(val) {
		createXMLHttpRequest();
		xmlHttp.onreadystatechange = function(){
			if (xmlHttp.readyState ==4) { //如果已完成解析
				if (xmlHttp.status == 200) { //如果请求成功，并得到响应
					var flag = $.trim(xmlHttp.responseText);
					if (flag == "true") {
						$("#myh").text("该用户已经登录").css("color", "red");
					//	$("#mybtn").attr("disabled",true);
						
					} else {
						$("#myh").text("该用户可以登录").css("color", "green");
					}
				}
			}
			
		};
		xmlHttp.open("POST", "doinfo.jsp");
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xmlHttp.send("name=" + val);

	}



	$(function() {
		$("#uname").on({
			blur : function() {
				var val2 = $.trim($(this).val());
				if (val2 == "") {
					$("#myh").css("color", "red");
				} else {
					$("#myh").css("color", "#000");
					startRequest(val2);
				}
			},
			focus : function() {
				$(this).select();
				$("#myh").css("color", "#000");
				
			}
		})
	});

	// submit提交方式
	function checkInfo() {
		var val = $.trim($("#uname").val());
		if (val == "") {
			$("#myh").css("color", "red");
			return false;
		} else {
			//提交
			return true;
		}
	}

	/* 	function checkInfo(){
	 var val=$.trim($("#uname").val());
	 if(val==""){
	 $("#myh").css("color","red");
	 return false;
	 }else{
	 //提交
	 $("#myform").submit();
	 }
	 } */
</script>

<script>
	
</script>

<body>
	<center>
		<h1>我要进去聊天</h1>
		<form action="dologin.jsp" method="post" id="myform"
			onsubmit="return checkInfo()">
			用户名：<input type="text" name="uname" id="uname"  />
			 <input  type="submit" value="进入"  id="mybtn"  />
		</form>
		<h1 id="myh">请输入您的用户名...</h1>
	</center>

	<!-- <center>
  		<h1>我要进去聊天</h1>
    	<form action="talk.jsp" method="post" id="myform" >
    		用户名：<input type="text" name="uname" id="uname"/>
    		<input type="button" value="进入"  onclick="checkInfo()" />
    	</form>
    	<h1 id="myh">请输入您的用户名...</h1>
    </center> -->

</body>
</html>
