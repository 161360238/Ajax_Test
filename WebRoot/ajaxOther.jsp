<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'ajaxOther.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<!-- 手动封装的ajax -->
<script type="text/javascript">
	/*
	 method:
	 请求方式，值为get或者post
	 url：请求地址
	 data:没有值需要传入null
	 有请求数据则传入字符串数据，格式为"a=1&b=2";
	 deal200:
	 接受一个带有一个形参的js函数对象，形参接收的实参是ajax引擎对象
	 deal404：接受一个js函数对象
	 deal500：接受一个js函数对象
	 */
	function myAjax(method, url, data, deal200, deal404, deal500, async) {
		//创建ajax引擎对象
		var ajax = getAjax();
		//复写onreadystatement函数
		ajax.onreadystatechange = function() {
			//判断Ajax状态吗
			if (ajax.readyState == 4) {
				//判断响应状态吗
				if (ajax.status == 200) {
					if (deal200) {
						deal200(ajax);
					}
				} else if (ajax.status == 404) {
					if (deal404) {
						deal404();
					}
				} else if (ajax.status == 500) {
					if (deal500) {
						deal500();
					}
				}
			}
		}
		//发送请求
		if ("get" == method) {
			ajax.open("get", url + (data == null ? "" : "?" + data), async);
			ajax.send(null);
		} else if ("post" == method) {
			ajax.open("post", url, async);
			ajax.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			ajax.send(data);
		}

	}
	/* --------------------------------------------------------------------------- */
	function getAjax() {
		var ajax;
		if (window.XMLHttpRequest) {//火狐
			ajax = new XMLHttpRequest();
		} else if (window.ActiveXObject) {//ie
			ajax = new ActiveXObject("Msxml2.XMLHTTP");
		}

		return ajax;
	}
	
	function getData(){
		myAjax("post", "ajax", null, function(a){
			if(a.readyState==4){
				//获取响应数据
				var rs=a.responseText;
				//操作页面
				var showdiv=document.getElementById("showdiv");
				showdiv.innerHTML=rs;	
			}
		});
	}
</script>

<style type="text/css">
	#showdiv{
		border:solid 1px;
		width:200px;
		height:100px; 
	}
</style>
</head>
<body>
	<h3>欢迎登录</h3>
	<hr>
	<input type="button" value="测试 " onclick="getData()"/>
	<div id="showdiv"></div>
</body>
</html>
