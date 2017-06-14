<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kdn.model.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="rankingPageBean"
	class="com.kdn.model.domain.RankingPageBean" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function rankingPagelist(cpage) {
		//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
		document.getElementById("reviewPageNo").value = cpage;
		var rkfrm = document.getElementById("rkfrm");
		rkfrm.action = "listRanking.do";
		rkfrm.submit();
	}
	
</script>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<style>
</style>
</head>
<body>
			<c:forEach var="rankingM" items="${rankingM }">
			<div class="mix dishes col-md-4">
				<a href="images/gallery/${rankingM.img }" class="img-wrapper"> <img
					class="img-responsive" src="images/gallery/${rankingM.img }" width="390px" height="180px"/>
				</a>
			</div>
			</c:forEach>
			<c:forEach var="rankingI" items="${rankingI }">
			<div class="mix garden col-md-4">
				<a href="images/gallery/${rankingI.img }" class="img-wrapper"> <img
					class="img-responsive" src="images/gallery/${rankingI.img }" width="390px" height="180px"/>
				</a>
			</div>
			</c:forEach>
			<c:forEach var="rankingH" items="${rankingH }">
			<div class="mix restaurant col-md-4">
				<a href="images/gallery/${rankingH.img }" class="img-wrapper"> <img
					class="img-responsive" src="images/gallery/${rankingH.img }" width="390px" height="180px"/>
				</a>
			</div>
			</c:forEach>
			<c:forEach var="rankingBoard" items="${rankingList }">
			<div class="mix kids col-md-4">
				<a href="images/gallery/${rankingBoard.img }" class="img-wrapper"> <img
					class="img-responsive" src="images/gallery/${rankingBoard.img}" width="390px" height="180px"/>
				</a>
			</div>
			</c:forEach>
</body>
</html>













