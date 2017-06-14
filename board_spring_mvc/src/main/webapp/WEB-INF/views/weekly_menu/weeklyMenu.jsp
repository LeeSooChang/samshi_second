<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kdn.model.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="pageBean" class="com.kdn.model.domain.PageBean"
	scope="request" />
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="./js/bootstrap-toggle.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script>location.hash="services";</script>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/js/bootstrap.min.js"></script>
<link href="css/kdn-table.css" rel="stylesheet">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<style type="text/css">
	glyphicon glyphicon-thumbs-up{
		background-color: white;
	}

	th {
		text-align : center;
		font-size : 12px;
	}
	.menulist a {
		color : red;
	}
	
	.menulist a:hover {
		color : gray;
		text-decoration: none;
	}
	
</style>
<script type="text/javascript">
	function test(){
		var test = document.getElementById("win");
		console.log("test " + test.value);
		if(test.value != ""){			
			alert("축하합니다. 이벤트에 당첨 되셨습니다." + test.value);
			<% session.removeValue("win"); %>
		}
	}

	function writeReviewInMenu(fname,scode){
		console.log(fname);
		$("#fname").val(fname);
		$('#scode').val(scode);
	}
</script>
</head>
<body>
	<c:if test = "${empty win}" >
		<body onload="test();">
	</c:if>
	
	<div align="center">
		<c:if test = "${!empty mno && grade=='Y' }">
			<a href = "addWeeklyMenuForm.do" class="btn btn-default">등록</a>
			<a href = "updateWeeklyMenuForm.do" class="btn btn-danger">수정</a>
    	</c:if>
    <br/><br/>
    </div>
	<div class="menulist">
		<table class="table text-center" id="tableid" width = "1100px">
			<thead>
				<tr>
					<th rowspan = 2></th><th colspan = 2>월</th><th colspan = 2>화</th><th colspan = 2>수</th><th colspan = 2>목</th><th colspan = 2>금</th>
				</tr>
				<tr>
					<th colspan = 2>${dietList[0].dietDate }</th>
					<th colspan = 2>${dietList[4].dietDate }</th>
					<th colspan = 2>${dietList[8].dietDate }</th>
					<th colspan = 2>${dietList[12].dietDate }</th>
					<th colspan = 2>${dietList[16].dietDate }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>아침</td><td colspan = 2>
									<a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[0].mainDish}','${dietList[0].scode}')">${dietList[0].mainDish }</a>
									<br/>${dietList[0].sideDish }<br/>
									<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[0].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[0].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[0].dietNo-1 ].suyoCountAll }
								</td>
							   <td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[4].mainDish}','${dietList[4].scode}')">${dietList[4].mainDish }</a>
							   <br/>${dietList[4].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[4].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[4].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[4].dietNo-1 ].suyoCountAll }
							   </td>
							   
							    <td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[8].mainDish}','${dietList[8].scode}')">${dietList[8].mainDish }</a>
							    <br/>${dietList[8].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[8].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[8].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[8].dietNo-1 ].suyoCountAll }
							    </td>
							    <td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[12].mainDish}','${dietList[12].scode}')">${dietList[12].mainDish }</a>
							    <br/>${dietList[12].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[12].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[12].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[12].dietNo-1 ].suyoCountAll }
							    </td>
							    <td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[16].mainDish}','${dietList[16].scode}')">${dietList[16].mainDish }</a>
							    <br/>${dietList[16].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[16].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[16].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[16].dietNo-1 ].suyoCountAll }
							    </td>
				</tr>
				<tr>
					<td rowspan = 2>점심</td><td>일품</td><td>한식</td>
										   <td>일품</td><td>한식</td>
										   <td>일품</td><td>한식</td>
										   <td>일픔</td><td>한식</td>
										   <td>일품</td><td>한식</td>
				</tr>
				<tr>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[1].mainDish}','${dietList[1].scode}')">${dietList[1].mainDish }</a>
					<br/>${dietList[1].sideDish }<br/><br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[1].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[1].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[1].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[2].mainDish}','${dietList[2].scode}')">${dietList[2].mainDish }</a>
					<br/>${dietList[2].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[2].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[2].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[2].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[5].mainDish}','${dietList[5].scode}')">${dietList[5].mainDish }</a>
					<br/>${dietList[5].sideDish }<br/><br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[5].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[5].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[5].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[6].mainDish}','${dietList[6].scode}')">${dietList[6].mainDish }</a>
					<br/>${dietList[6].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[6].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[6].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[6].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[9].mainDish}','${dietList[9].scode}')">${dietList[9].mainDish }</a>
					<br/>${dietList[9].sideDish }<br/><br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[9].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[9].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[9].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[10].mainDish}','${dietList[10].scode}')">${dietList[10].mainDish }</a>
					<br/>${dietList[10].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[10].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[10].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[10].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[13].mainDish}','${dietList[13].scode}')">${dietList[13].mainDish }</a>
					<br/>${dietList[13].sideDish }<br/><br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[13].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[13].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[13].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[14].mainDish}','${dietList[14].scode}')">${dietList[14].mainDish }</a>
					<br/>${dietList[14].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[14].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[14].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[14].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[17].mainDish}','${dietList[17].scode}')">${dietList[17].mainDish }</a>
					<br/>${dietList[17].sideDish }<br/><br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[17].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[17].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[17].dietNo-1 ].suyoCountAll }
					</td>
					<td><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[18].mainDish}','${dietList[18].scode}')">${dietList[18].mainDish }</a>
					<br/>${dietList[18].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[18].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[18].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[18].dietNo-1 ].suyoCountAll }
					</td>
				</tr>
				<tr>
					<td>저녁</td>
					<td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[3].mainDish}','${dietList[3].scode}')">${dietList[3].mainDish }</a>
					<br/>${dietList[3].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[3].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[3].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[3].dietNo-1 ].suyoCountAll }
					</td>
					<td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[7].mainDish}','${dietList[7].scode}')">${dietList[7].mainDish }</a>
					<br/>${dietList[7].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[7].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[7].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[7].dietNo-1 ].suyoCountAll }
					</td>
					<td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[11].mainDish}','${dietList[11].scode}')">${dietList[11].mainDish }</a>
					<br/>${dietList[11].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[11].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[11].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[11].dietNo-1 ].suyoCountAll }
					</td>
					<td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[15].mainDish}','${dietList[15].scode}')">${dietList[15].mainDish }</a>
					<br/>${dietList[15].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[15].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[15].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[15].dietNo-1 ].suyoCountAll }
					</td>
					<td colspan = 2><a href = "#" data-toggle="modal" data-target="#reviewModal" onclick = "writeReviewInMenu('${dietList[19].mainDish}','${dietList[19].scode}')">${dietList[19].mainDish }</a>
					<br/>${dietList[19].sideDish }<br/>
							   		<c:if test="${ !empty mno }">
										<a href="addSuyo.do?dietNo=${dietList[19].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</a>
										<a href="minusSuyo.do?dietNo=${dietList[19].dietNo}&mno=${mno}">
											<span class="glyphicon glyphicon-thumbs-down"></span>
										</a>
									</c:if>
									<br/>식사인원 : ${suyoCountList[ dietList[19].dietNo-1 ].suyoCountAll }
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>













