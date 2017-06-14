<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>location.hash="services";</script>
<style type="text/css">
	.blackColor {
		color : black;
	}
</style>
<script type="text/javascript">
	function updateMenuBack(){
		history.back();
	}
	
	function submit(){
		if(document.getElementById('dietDate').value == ""){
			alert('날짜를 입력하세요.');
			location.href= 'http://localhost:8088/board/updateWeeklyMenuForm.do#services';
			return false;
		}
		if(document.getElementById('scode').value == ""){
			alert('식사시간을 입력하세요.');
			location.href= 'http://localhost:8088/board/updateWeeklyMenuForm.do#services';
			return false;
		}
		
		$("#updateFrm").submit();
	}
</script>
</head>
<body>
<div class="col-md-4 col-md-offset-4">
      <form class="form-horizontal" id = "updateFrm" action = "searchUpdateMenu.do" method = "POST">
        <fieldset>
		  <input type = "hidden" id = "sideDish" name = "sideDish"/>
          <!-- Form Name -->
          <legend style = "color : white;">Update Weekly Menu</legend>

          <!-- Date input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">날짜</label>
            <div class="col-sm-10  blackColor">
              	<input class="form-control" type = "date" name = "dietDate" id = "dietDate" required>
            </div>
          </div>

		  <!-- foodTime input-->
		    <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">시간</label>
            <div class="col-sm-10  blackColor">
              	<select	class="form-control" id = "scode" name = "scode">
              		<option value = '1'>아 침</option>
              		<option value = '2'>일 품</option>
              		<option value = '3'>한 식</option>
              		<option value = '4'>저 녁 </option>
              	</select>
            </div>
          </div>
          
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class = "blackColor">
                <a href = "javascript:void(0);" class = "btn btn-primary btn-create" onclick = "submit()">검색</a>
                <a href = "javascript:void(0);" class="btn btn-danger btn-filter"  onclick = "updateMenuBack()" >취소</a>
              </div>
            </div>
          </div>
          
        </fieldset>
      </form>
    </div>
    
	<!-- <h2>update weekly menu</h2>
	<form class = "blackColor" id = "updateFrm" action = "searchUpdateMenu.do">
		날짜  <input type = "date" name = "dietDate" id = "dietDate">
		<br/>식단 번호 <select name = "scode" id = "scode">
				<option value = 1> 아침</option>
				<option value = 2> 일품</option>
				<option value = 3> 한식</option>
				<option value = 4> 저녁</option>	
			 </select>
		<br/>
		<button type = "submit" >검색</button>
	</form> -->
</body>
</html>
