<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kdn.model.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="noticePageBean"
	class="com.kdn.model.domain.NoticePageBean" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>location.hash="news";</script>
<script type="text/javascript">
	function noticePagelist(cpage) {
		document.getElementById("noticePageNo").value = cpage;
		var nfrm = document.getElementById("nfrm");
		nfrm.action = "listNoticeBoard.do";
		nfrm.submit();
	}
	function getNoticeBoard(nno) {
		document.getElementById("nno").value = nno;
		var nfrm = document.getElementById("nfrm");
		nfrm.action = "searchNoticeBoard.do";
		nfrm.submit();
	}
	function updateNoticeBoardForm(nno){
		document.getElementById("nno").value = nno;
		var nfrm = document.getElementById("nfrm");
		nfrm.action = "updateNoticeBoardForm.do";
		nfrm.submit();
	}
	function deleteNoticeBoard(nno){
		document.getElementById("nno").value = nno;
		var nfrm = document.getElementById("nfrm");
		nfrm.action = "deleteNoticeBoard.do";
		nfrm.submit();
	}
</script>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
</head>
<body>
	<div class="main">
		<div class="check_member_grade">
			<c:if test="${!empty grade and grade=='Y' }">
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<a href="insertNoticeBoardForm.do"  class="btn btn-primary">등록</a>
			</c:if>
		</div>
		<form id="nfrm">
			<input type="hidden" id="noticePageNo" name="noticePageNo" value="1" />
			<input type="hidden" id="nno" name="nno" />
			<c:forEach var="noticeBoard" items="${noticeList}">
				<div class="col-md-2 text-center">
					<br/>
					<p class="update_delete_option">
						<c:choose>
							<c:when test="${!empty grade and grade=='Y'}">
								<a href="#news" class="btn btn-default"
									onclick="updateNoticeBoardForm(${noticeBoard.nno})"> <em
									class="fa fa-pencil"></em>
								</a>
								<a href="#news" class="btn btn-danger"
									onclick="deleteNoticeBoard(${noticeBoard.nno})"> <em
									class="fa fa-trash" data-target="#deleteReviewModal"></em>
								</a>
							</c:when>
							<c:otherwise>
								<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
				<div class="col-md-10 text-justify">
					<h3>${noticeBoard.title}</h3>
					<p>${noticeBoard.ndate}</p>
					<br />
					<p>${noticeBoard.contents }</p>
				</div>
			</c:forEach>
			<div class="bottom">
				<center>${noticePageBean.pagelink }</center>
			</div>
		</form>
	</div>
</body>
</html>













