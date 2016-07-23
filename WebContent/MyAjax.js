function myAjax(url, params, fun) {
		var xmlHttp;

		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) { //如果已完成解析
				if (xmlHttp.status == 200) { //如果请求成功，并得到响应
					fun(xmlHttp.responseText);
				}
			}

		};
		xmlHttp.open("POST", url);
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		if (params == null) {
			xmlHttp.send(null);
		} else {
			var str = "";
			for (var i in params) {
				str+=i+"="+params[i]+"&";
			}
			xmlHttp.send(str);
		}

	}