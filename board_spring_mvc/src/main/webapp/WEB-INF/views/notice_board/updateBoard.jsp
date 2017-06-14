<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" type="text/css" href="css/basic.css"  />
<script>location.hash="news";</script>
<script type="text/javascript">
	function init(){
		var writeNoticeBoard = document.getElementById("writeNoticeBoard");
		writeNoticeBoard.style.display="";
	}
	function updateNoticeBoard(){
		var nfrm = document.getElementById("updatenfrm");
		nfrm.action="updateNoticeBoard.do";
		nfrm.submit();
	}
	function deleteNoticeBoard(){
		var nfrm = document.getElementById("nfrm");
		nfrm.action="deleteNoticeBoard.do";
		nfrm.submit();
	}
	function listNoticeBoard(){
		location.href="listNoticeBoard.do?<%=request.getQueryString()%>";
	}
	function resetNoticeBoard(){
		var nfrm = document.getElementById("updatenfrm");
		nfrm.title.value="";
		nfrm.content.value="";
	}
</script>
</head>
<body onload="init()">
    <c:if test="${msg != null }"> 
    	<script type="text/javascript">  alert('${msg}');</script>
    </c:if>
    
    <form method="post" action="updateNoticeBoard.do" enctype="multipart/form-data">
		<div class="container-noticeboardinsert">
			<div class="container">
				<div class="row" id="updateNoticeBoardRow">
					<div class="col-md-8">
						<form>
							<div class="row">
								<div class="page-header" id="insertBoard">
									<h3 class="text-center">Edit Announcement</h3>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="hidden" class="form-control" name="mno" id="mno"
											value="${mno}" placeholder="관리자번호" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="hidden" class="form-control" name="nno" id="nno"
											value="${noticeBoard.nno}" placeholder="관리자번호" />
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" name="title" value="${noticeBoard.title }"
											id="title" placeholder="제목" />
									</div>
								</div>
								<div class="col-md-12 text-center">
									<div class="form-group">
										<textarea class="form-control" name="contents" id="contents"
											placeholder="내용" rows="6">${noticeBoard.contents}</textarea>
									</div>
									<button type="submit"  class="btn btn-danger">수정</button>
									<a href="listNoticeBoard.do" class="btn btn-default">취소</a>
									<br/><br/>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>