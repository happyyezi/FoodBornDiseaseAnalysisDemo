 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go() {
		document.getElementById("f1").submit();
		document.getElementById("pro").style.display = "block";
		document.getElementById("prop").style.display = "";
		timer = setInterval("getP()", 50);
	}

	var xmlHttpRequest;
	function getP() {
		if (window.ActiveXObject) {
			xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
		} else {
			xmlHttpRequest = new XMLHttpRequest()
		}
		xmlHttpRequest.onreadystatechange = callBack;
		url = "progressServlet";
		xmlHttpRequest.open("post", url, true);

		xmlHttpRequest.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlHttpRequest.send("&timeStamp=" + (new Date()).getTime());

	}
	//回调函数
	function callBack() {
		if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
			result = xmlHttpRequest.responseText;
			var result = result.replace(/(^\s*)|(\s*$)/g, "");
			var res = result.split(",");
			var flag = res[1];
			var per = parseInt(res[0]);
			var err = res[2];
			document.getElementById("imgpro").style.width = per * 5 + "px";
			document.getElementById("prop").innerHTML = per + "%";
			if (flag == "OK") {
				window.clearInterval(timer);
				alert("上传成功！");
				document.getElementById("pro").style.display = "none";
				document.getElementById("prop").innerHTML = "";
				//f1.reset();
			}
			if (err != "" || err.length > 0) {
				window.clearInterval(timer);
				alert(err);
			}
			if (flag == null) {
				window.clearInterval(timer);
			}
		}
	}
</script>
<style type="text/css">
.pro {
	height: 15px;
	width: 500px;
	background: #FFFFF0;
	border: 1px solid #8FBC8F;
	margin: 0;
	padding: 0;
	display: none;
	position: relative;
	left: 25px;
	float: left;
}
</style>


</head>
<body>
	<form action="uploadServlet" name="f1" id="f1" method="post"
		enctype="multipart/form-data" target="if">
		<input type="file" name="file1" /><br> <br> 
		<input type="reset" name="res1" value="重置" />
		<input type="button" name="but1" value="提交" onclick="go();" />
	</form>
	<br>
	<div id="pro" class="pro" align="left">
		<img alt="" src="img/progress.png" width="0" height="15" id="imgpro">
	</div>
	<span id="prop" style="width: 15px; height: 15px; display: none;">0%</span>
	<iframe id="if" name="if" src="" style="display: none;"></iframe>
</body>
</html>
 
 