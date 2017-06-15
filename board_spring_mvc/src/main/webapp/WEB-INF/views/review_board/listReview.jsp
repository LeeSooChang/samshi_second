<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kdn.model.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="reviewPageBean"
	class="com.kdn.model.domain.ReviewPageBean" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="css/kdn-table.css" rel="stylesheet">
<title>Insert title here</title>
<script>location.hash="about";</script> 
<script type="text/javascript">
	//조건 검색, 페이지 번호로 게시글 요청을 위한 메서드  
	function reviewPagelist(cpage) {
		//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
		document.getElementById("reviewPageNo").value = cpage;
		var rfrm = document.getElementById("rfrm");
		rfrm.action = "listReview.do";
		rfrm.submit();
	}
	//게시글 번호나 타이틀을 클릭하면 해당 게시글 요청을 위한 메서드 
	function getReivewBoard(rno) {
		//input 양식의 hidden으로 선언된 no(게시글 번호)에 요청된 게시글 번호를 셋팅
		document.getElementById("rno").value = rno;
		var rfrm = document.getElementById("rfrm");
		rfrm.action = "searchReview.do";
		rfrm.submit();
	}
	
 	function removeForm(rno){
		$('#rno').val(rno);	
		$('#checkForm').modal();
	} 
 	
 	
	function updateform(urno, umno, ufname, uspoint, ucomments){
		console.log('updateForm');
		console.log('rno:'+urno);
		console.log('mno:'+umno);
		console.log('fname:'+ufname);
		console.log('spoint:'+uspoint);
		console.log('comments:'+ucomments);
		$("#urno").val(urno);
		$("#umno").val(umno);
		$("#ufname").val(ufname);
		$("#uspoint").val(uspoint);
		$("#ucomments").val(ucomments);
		$('#updateForm').modal();
		
	}
</script>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<style type="text/css">
</style>
</head>
<body>
<!-- 리뷰게시판 수정 모달 -->
	<div style="overflow: hidden" id="updateForm" class="modal fade"
		tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width:400px">
				<div class="modal-header" align="left">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: red">
						<span class="glyphicon glyphicon-envelope"></span>
						<label id="modal-title">리뷰 수정</label>
					</h4>
					<small>식사하신 메뉴에 대한 평점과 의견을 남겨주세요.</small>
					<br/>
				</div>
				<div class="modal-body" id="modal-body">
					<form method="post" action="updateReview.do"
						enctype="multipart/form-data">
						<table align="center" width="300">
								<td colspan="2"><input type="hidden" name="rno" id="urno"
									value="${urno }" /></td>
							<tr height="50">
								<td><label for="title">아이디</label></td>
								<td><input type="text" name="mno" id="mno"
									value="${mno }"/></td>
							</tr>
							<tr height="50">
								<td><label for="title">별점</label></td>
								<td><select name="spoint" id="spoint" >
										<option value="5">5</option>
										<option value="4">4</option>
										<option value="3">3</option>
										<option value="2">2</option>
										<option value="1">1</option>
									</select>	
								</td>
							</tr>
							<tr height="50">
								<td><label for="title">메뉴</label></td>
								<td><input type="text" name="fname" id="ufname" value="${ufname }"/></td>
							</tr>
							<tr>
								<td colspan="2"><label for="contents">코멘트</label></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><textarea name="comments" value="${ucomments }"
										id="ucomments" cols="30" rows="5" style="resize:none;"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<button type="button" class="close" data-dismiss="modal">
										<span class="glyphicon glyphicon-remove"></span> 취소
									</button>
									<button type="submit" class="close">
										<span class="glyphicon glyphicon-ok"></span>수정
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 리뷰 삭제 경고 모달 -->
	<div style="overflow: hidden" id="checkForm" class="modal fade"
		tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width:400px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: red">
						<span class="glyphicon glyphicon-exclamation-sign"></span><label
							id="modal-title">삭제 경고</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form role="form" method="post" action="deleteReview.do">
						정말 삭제하시겠습니까? 
						<input type="hidden" id="rno" name="rno" />
						<button type="submit" class="close">
							<span class="glyphicon glyphicon-ok"></span>삭제
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- 리뷰게시판 메인 -->
	<div class="main">
		<form id="rfrm">
			<input type="hidden" id="reviewPageNo" name="reviewPageNo" value="1" />
			<input type="hidden" id="no" name="no" />

			<div class="container">
				<div class="row">

					<div class="col-md-10 col-md-offset-1">

						<div class="panel panel-default panel-table">
							<div class="panel-heading">
								<div class="row">
									<div class="col col-xs-6">
										<select name="key" id="key">
											<option value="all">-----선택-----</option>
											<option value="rno" <%=reviewPageBean.getKey("rno")%>>번호</option>
											<option value="mno" <%=reviewPageBean.getKey("mno")%>>사번</option>
											<option value="fname" <%=reviewPageBean.getKey("fname")%>>메뉴</option>
											<option value="spoint" <%=reviewPageBean.getKey("spoint")%>>별점</option>
											<option value="comments"
												<%=reviewPageBean.getKey("comments")%>>코멘트</option>
										</select> <input type="text" id="word" name="word"
											value="${reviewPageBean.word}"> <a href="#"
											onclick="reviewPagelist(1)" class="btn btn-danger btn-filter">검색</a>

									</div>
									<div class="col col-xs-6 text-right">
										<c:if test="${ !empty mno }">
											<a href="#" class="btn btn-primary btn-create"
												data-toggle="modal" data-target="#reviewModal">글쓰기</a>
										</c:if>
									</div>
								</div>
							</div>



							<div class="panel-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th><em class="fa fa-cog"></em></th>
											<th class="hidden-xs" style="width:60px">번호</th>
											<th>사번</th>
											<th>메뉴</th>
											<th>별점</th>
											<th>코멘트</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="reviewBoard" items="${list}">
											<tr id=${reviewBoard.rno }>
												<td align="center"><c:if
														test="${ mno == reviewBoard.mno || grade == 'Y' }">
														<a href="#" class="btn btn-default" data-toggle="modal"
															data-target="#updateReviewModal"
															onclick="updateform(${reviewBoard.rno },${reviewBoard.mno },'${reviewBoard.fname }', ${reviewBoard.spoint },'${reviewBoard.comments}')">
															<em class="fa fa-pencil"></em>
														</a>
														<a href="#" class="btn btn-danger"
															onclick="removeForm(${reviewBoard.rno})"><em
															class="fa fa-trash"></em></a>
												</c:if></td>

												<td class="hidden-xs">${reviewBoard.rno}</td>
												<td>${reviewBoard.mno }</td>
												<td>${reviewBoard.fname }</td>
												<td>
												<c:forEach begin="1" end="${reviewBoard.spoint }">
													<c:out value="★"/>
												</c:forEach>
												</td>
												<td>${reviewBoard.comments}</td>
												<td>${reviewBoard.regdate }</td>

												<td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="panel-footer">
								<div class="row">
									<center>${reviewPageBean.pagelink }</center>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>
	</div>



	<script type="text/javascript">
		$(document).ready(
				function() {

					$('.star').on('click', function() {
						$(this).toggleClass('star-checked');
					});

					$('.ckbox label').on('click', function() {
						$(this).parents('tr').toggleClass('selected');
					});

					$('.btn-filter').on(
							'click',
							function() {
								var $target = $(this).data('target');
								if ($target != 'all') {
									$('.table tr').css('display', 'none');
									$(
											'.table tr[data-status="' + $target
													+ '"]').fadeIn('slow');
								} else {
									$('.table tr').css('display', 'none')
											.fadeIn('slow');
								}
							});

				});
	</script>
</body>
</html>













