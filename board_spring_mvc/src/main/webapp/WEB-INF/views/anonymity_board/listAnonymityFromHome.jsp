<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kdn.model.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="anonymityPageBean"
	class="com.kdn.model.domain.AnonymityPageBean" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="css/kdn-table.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
//조건 검색, 페이지 번호로 게시글 요청을 위한 메서드  
function anonymityPagelist(cpage) {
	//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
	document.getElementById("anonymityPageNo").value = cpage;
	var afrm = document.getElementById("afrm");
	afrm.action = "listAnonymity.do";
	afrm.submit();
}
//게시글 번호나 타이틀을 클릭하면 해당 게시글 요청을 위한 메서드 
function getReivewBoard(ano) {
	//input 양식의 hidden으로 선언된 no(게시글 번호)에 요청된 게시글 번호를 셋팅
	document.getElementById("ano").value = ano;
	var afrm = document.getElementById("afrm");
	afrm.action = "searchReview.do";
	afrm.submit();
}

	function removeanoform(ano, anopw, mno){
	$('#rano').val(ano);	
	$('#ranopw').val(anopw);	
	$('#checkAnonymityForm').modal();
} 
	
	function updateanoform(ano, mno, uanotitle, uanocontents){
		console.log('ano updateForm');
		$("#uano").val(ano);
		$("#uanotitle").val(uanotitle);
		$("#uanocontents").val(uanocontents);
		$('#updateAnonymityForm').modal();
	
}

function insertanoform(){
	console.log('ano insertForm');
	$('#insertAnonymityForm').modal();
	
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
<!-- 익명게시글 작성 모달 -->
	<div style="overflow: hidden" id="insertAnonymityForm"
		class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: green">
						<span class="glyphicon glyphicon-lock"></span>
						<label id="modal-title">익명게시글 작성</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form method="post" action="insertAnonymity.do">
					<table align="center" width="300">
							<tr height="50">
								<td><label for="title">비밀번호</label></td>
								<td><input type="text" name="anopw" id="anopw" required/></td>
							</tr>
							<tr height="50">
								<td><label for="title">제목</label></td>
								<td><input type="text" name="anotitle" id="anotitle" required/></td>
							</tr>
							<tr>
								<td colspan="2"><label for="contents">코멘트</label></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><textarea name="anocontents"
										id="anocontents" cols="30" rows="5" style="resize:none;"></textarea></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" class="close" data-dismiss="modal">
										<span class="glyphicon glyphicon-remove"></span>취소
									</button>
									<button type="submit" class="close">
										<span class="glyphicon glyphicon-ok"></span>작성
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<!-- 익명게시판 글 수정  -->
	<div style="overflow: hidden" id="updateAnonymityForm"
		class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: red">
						<span class="glyphicon glyphicon-lock"></span>
						<label id="modal-title">익명게시글 수정</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">

					<form method="post" action="updateAnonymity.do"
						enctype="multipart/form-data">
						<input type="hidden" name="ano" id="uano" />
						<input type="hidden" name="mno" id="umno" value="${mno }"/>
						<table align="center" width="300">
							<tr height="50">
								<td><label for="title">비밀번호</label></td>
								<td><input type="text" name="anopw" id="uanopw" placeholder="불일치 시 수정불가"/></td>	
							</tr>
							<tr height="50">
								<td><label for="title">제목</label></td>
								<td><input type="text" name="anotitle" id="uanotitle"
								     value="${anonymity.anotitle}"/></td>
							</tr>
							<tr>
								<td colspan="2"><label for="contents">코멘트</label></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<textarea name="anocontents" id="uanocontents" 
								cols="30" rows="5" style="resize:none;">${anonymity.anocontents}</textarea></td>
							</tr>
							<tr align="center">
								<td colspan="2">
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
	
<!-- 삭제 경고 모달 -->
	<div style="overflow: hidden" id="checkAnonymityForm"
		class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="color: red">
						<span class="glyphicon glyphicon-exclamation-sign"></span>
						<label id="modal-title">삭제 경고</label>
					</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<form role="form" method="post" action="deleteAnonymity.do">
						<input type="hidden" id="rano" name="ano" value="${ano }" />비밀번호
						<input type="hidden" id="rmno" name="mno" value="${mno }" />
						<input type="password" id="ranopw" name="anopw" placeholder="불일치 시 수정불가" required/>
						<button type="submit" class="close">
							<span class="glyphicon glyphicon-ok"></span>삭제
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- 익명게시판 메인  -->
	<div class="main">
		<form id="afrm">
			<input type="hidden" id="anonymityPageNo" name="anonymityPageNo"
				value="1" /> <input type="hidden" id="no" name="no" />

			<div class="container">
				<div class="row">

					<div class="col-md-12">

						<div class="panel panel-default panel-table">
							<div class="panel-heading">
								<div class="row">
									<div class="col col-xs-6">
										<select name="key" id="key">
											<option value="all">-----선택-----</option>
											<option value="ano" <%=anonymityPageBean.getKey("ano")%>>게시번호</option>
											<option value="anotitle"
												<%=anonymityPageBean.getKey("anotitle")%>>제목</option>
											<option value="anocontents"
												<%=anonymityPageBean.getKey("anocontents")%>>내용</option>
										</select> <input type="text" id="word" name="word"
											value="${anonymityPageBean.word}"> <a href="#"
											onclick="anonymityPagelist(1)"
											class="btn btn-danger btn-filter">검색</a>

									</div>
									<div class="col col-xs-6 text-right">
										<a href="#" class="btn btn-primary btn-create"
											onclick="insertanoform()">글쓰기</a>
									</div>
								</div>
							</div>

							<div class="panel-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th><em class="fa fa-cog"></em></th>
											<th class="hidden-xs" style="width: 60px">번호</th>
											<th>제목</th>
											<th>내용</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="anonymity" items="${anonymityList}">
											<tr id=${anonymity }>
												<td><a href="#" class="btn btn-default"
													onclick="updateanoform(${anonymity.ano}, ${anonymity.mno}, '${anonymity.anotitle}', '${anonymity.anocontents}')"> <em
														class="fa fa-pencil"></em></a> <a href="#"
													class="btn btn-danger"
													onclick="removeanoform(${anonymity.ano})"><em
														class="fa fa-trash"></em></a></td>

												<td class="hidden-xs">${anonymity.ano}</td>
												<td>${anonymity.anotitle}</td>
												<td>${anonymity.anocontents}</td>
												<td>${anonymity.anodate }</td>

												<td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
							<div class="panel-footer">
								<div class="row">
									<center>${anonymityPageBean.pagelink }</center>
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

