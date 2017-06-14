<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
<style>
	 #container-register {
		background: url(images/reservation_background.jpg) no-repeat center center fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
		background-color: #434343;
		color: #ffffff;
		padding-top: 30px;
		padding-bottom: 90px;
	}
	
	.form-title {
		font-size: 35px;
		color: #ffffff;
	}
</style>
<script type="text/javascript">
	var pwConfirm = false;
	
	function back(){
		history.back()
	}
	
	function check(){
		var pw = document.getElementById("password_new");
		var pc = document.getElementById("password_confirm");
		var cur_pw = document.getElementById("password");
		
		if(pw.value != "" && pc.value != ""){
			if(pw.value == pc.value ){
				document.getElementById("password").value = pw.value;
				document.getElementById("frm").submit();
			}
			else{
				alert("비밀번호가 일치하지 않습니다.");
				document.getElementById("password_confirm").value = "";
			}
		}
		else{
			document.getElementById("password").value = cur_pw.value;
			document.getElementById("frm").submit();
		}
	}

</script>
</head>
<body>
<div id="container-register">
<div class="container">
<center>
<form class="form-horizontal" action = "updateMember.do?mno=${member.mno}" id = "frm" method = "POST">
<fieldset>
	<legend class="form-title">MY PAGE</legend>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="mno">ID</label>
      <div class="col-lg-8">
        <div class="form-control" id="mno" name = "mno" value = "${member.mno}" align = "left">${member.mno}</div>
      </div>
    </div>
    <input class="form-control" type="hidden" name ="password" id="password" value="${member.password}">
    <div class="form-group">
      <label class="col-lg-2 control-label" for="password">New Password</label>
      <div class="col-lg-8">
        <input class="form-control" type = "password" name = "password_new" id="password_new" >
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="password">Confirm Password</label>
      <div class="col-lg-8">
        <input class="form-control" type = "password" name = "password_confirm" id="password_confirm">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="mname">Name</label>
      <div class="col-lg-8">
        <input class="form-control" id="mname" name = "mname" type="text" value = "${member.mname}">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="phone">Phone</label>
      <div class="col-lg-8">
        <input class="form-control" id="phone" name = "phone" type="text" value = "${member.phone}">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="email">Email</label>
      <div class="col-lg-8">
        <input class="form-control" id="email" name = "email" type="text" value = "${member.email}">
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label" for="prefer">Menu</label>
      <div class="col-lg-8">
        <div class="form-control" id="prefer" name = "prefer" value = "${prefer}" align = "left">${prefer}</div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-8 col-lg-offset-2">
	    <button class="btn btn-primary" type="button" onclick ="check()">Submit</button>
        <button class="btn btn-default" type="button" onclick ="back()">Cancel</button>
      </div>
    </div>
</fieldset>
</form>
</div>
</div>
</center>
</body>
</html>