<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
body{background-color: black;}

#pop_top{
	width: 100%;
	height: 150px;
	text-align: center;
	font-size: 20px;
	color: white;
}

#pop_bottom{
	width: 100%;
	height:20px;
	text-align: right;
	color: white;
}
</style>
</head>
<body>
<div id="pop_top">
	<p>${mno}님 축하드립니다.</p>
	<p>이벤트에 당첨 되셨습니다!!</p>
</div>
<div id="pop_bottom">
<form id="form1" name="form1">
<input type="checkbox" name="nopopup" onClick="javascript:set_nopopup('event','checked',1);"> 하루동안 열지 않기
</form>
</div>	
</body>
<script language="JavaScript">
function gourl1(){
	<%
		session.removeValue("win");
	%>
	window.opener.location.href = open2.jsp;   
	window.close();
}

	/* function set_nopopup(name, value, expiredays){
	 todayDate = new Date();
	 todayDate.setDate(todayDate.getDate() + expiredays);
	 if(document.form1.nopopup.checked)
	 {
	  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	  window.close();
	 }
	} */
window.moveTo(0, 0);
</script>
</html>