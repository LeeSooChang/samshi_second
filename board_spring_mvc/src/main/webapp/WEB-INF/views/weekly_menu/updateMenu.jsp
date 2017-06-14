<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	var count = 100;
	$(document).ready(function(){
		$("#addButton").click(function(){
			var html = "<div id = sideDish" + count + "><input type = 'text'  name = 'tempSide' ><a href = 'javascript:void(0);' class = 'btn btn-sm btn-primary btn-create' onclick = deleteAttr('sideDish" + count + "')>-</a><br/></div>";
			$("#foodDiv").append(html);
			count++;
		});
	});
	
	function deleteAttr(attr){
		console.log(attr);
		var item = document.getElementById(attr);
		item.remove();
		return false;
	}
	
	function mergeMenu(){
		var items = document.getElementsByName('tempSide');
		var dishes = " ";
		for(var i=0,item; item=items[i]; i++) {
			dishes += (item.value + '<br/>' );
		}
		console.log(dishes);
		document.getElementById('sideDish').value = dishes;
		
		if(document.getElementById('mainDish').value == ""){
			alert('메인음식을 입력하세요.');
			location.href= 'http://localhost:8088/board/searchUpdateMenu.do#services';
			return false;
		}

		
		$('#updateMenufrm').submit();
	}
	
	function addMenuBack(){
		history.back();
	}
</script>
</head>
<body>
	<div class="col-md-4 col-md-offset-4">
      <form class="form-horizontal" id = "updateMenufrm" action = "updateMenu.do" method = "POST">
        <fieldset>
          <input type = "hidden" name = "sideDish" id = "sideDish">
		  <input type ="hidden" name = "dietNo" id = "dietNo" value = "${oneDiet.dietNo }">
		  <input type = "hidden" name = "dietDate" id = "dietDate" color = "white" value = "${oneDiet.dietDate }" >
          <input type = "hidden" name = "scode" id = "scode" color = "white" value = "${oneDiet.scode }" >
          <!-- Form Name -->
          <legend style = "color:white;">Update Weekly Menu</legend>

          <!-- Date input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">날짜</label>
            <div class="col-sm-10  blackColor">
              	<div style = "color : white;">${oneDiet.dietDate }</div>
            </div>
          </div>

		  <!-- foodTime input-->
		    <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">시간</label>
            <div class="col-sm-10  blackColor" style ="color:white;">
				<c:choose>
					<c:when test = "${oneDiet.scode == 1}">
						아침
					</c:when>
					<c:when test = "${oneDiet.scode == 2}">
						일품
					</c:when>
					<c:when test = "${oneDiet.scode == 3}">
						한식
					</c:when>
					<c:when test = "${oneDiet.scode == 4}">
						저녁
					</c:when>
				</c:choose>
            </div>
          </div>
          
          <!-- mainDish input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">메인</label>
            <div class="col-sm-10 blackColor">
              <input type = "text" name = "mainDish" id = "mainDish" value ="${oneDiet.mainDish }" required/>
            </div>
          </div>
          
          <div class="form-group" >
	         <label class="col-sm-2 control-label" for="textinput">서브</label>
          </div>
          
		  <% int i = 1; %>
          <!-- sideDish input-->
          <div class="form-group" >
          	<label class="col-sm-2 control-label" for="textinput">
            	<a href = "javascript:void(0);" class = "btn btn-sm btn-default btn-create" id = "addButton">+</a>
            </label>
            <div class="col-sm-10 blackColor" id = "foodDiv">
              <c:forTokens var = "item" items="${oneDiet.sideDish}" delims="<br/>">
	              <div id = "sideDish<%=i%>"><input type = "text" name = "tempSide" value ="${item}"/>
	              <a href = "javascript:void(0);" class = "btn btn-sm btn-primary" onclick = "deleteAttr('sideDish<%= i %>')">-</a><br/></div>	
			   	  <% i++; %>
			  </c:forTokens>
            </div>
          </div>

			
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class = "blackColor">
                <a href = "javascript:void(0);" class = "btn btn-primary btn-create" onclick = "mergeMenu()">수정</a>
                <a href = "javascript:void(0);" class="btn btn-danger btn-filter"  onclick = "addMenuBack()">취소</a>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div>
</body>
</html>
