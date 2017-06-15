<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KDN Restaurant</title>
<!-- Script includes -->
<script src="js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery.mixitup.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/theme.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript"
	src="https://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function getBoard(rno) {
		//input 양식의 hidden으로 선언된 no(게시글 번호)에 요청된 게시글 번호를 셋팅
		document.getElementById("rno").value = rno;
		var frm = document.getElementById("frm");
		frm.action = "test2.do";
		frm.submit();
	}
</script>
<script type="text/javascript">
function getCookie(name)
{
 var nameOfCookie = name + "=";
 var x = 0;
 while (x <= document.cookie.length)
 {
  var y = (x+nameOfCookie.length);
  if ( document.cookie.substring( x, y ) == nameOfCookie )
  {
   if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1)
    endOfCookie = document.cookie.length;
   return unescape(document.cookie.substring( y, endOfCookie ));
  }
  x = document.cookie.indexOf( " ", x ) + 1;
  if ( x == 0 )
   break;
 }
  return "";
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
function openpopup(){
 if (getCookie('event') != 'checked') {
  window.open("open.jsp","openPop", "width=330, height=330");
 }
}
</script>
<!-- CSS includes -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="fonts/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://www.shieldui.com/shared/components/latest/css/light/all.min.css"
	rel="stylesheet" />
<link href="css/theme.css" rel="stylesheet">
<link href="css/magnific-popup.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<style type="text/css">
.text-name {color:#BDBDBD;}
</style>
</head>

<!-- Body Start!! -->
<c:if test = "${!empty mno}">
	<body onload="openpopup();">
</c:if>

<!-- Navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="/board" title="KDN FoodCourt"> <img
				class="img-responsive" src="images/kdn_logo.jpg"
				alt="My Restaurant Bootstrap Theme" />
			</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#news" class="smooth-scroll">공지</a></li>
				<li><a href="#services" class="smooth-scroll">메뉴</a></li>
				<li><a href="#about" class="smooth-scroll">리뷰</a></li>
				<li><a href="#gallery" class="smooth-scroll">랭킹</a></li>
				<li><a href="#dishes" class="smooth-scroll">제안</a></li>
				<c:if test="${empty mno}">
					<li><a href="registerForm.do" class="smooth-scroll">회원가입</a></li>
					<li><a href="" class="smooth-scroll" data-toggle="modal"
						data-target="#myModal"> 로그인 </a></li>
				</c:if>
				<c:if test="${!empty mno}">
					<li><a href="myPage.do" class="smooth-scroll"> 마이페이지 </a></li>
					<li><a href="logout.do" class="smooth-scroll"> 로그아웃 </a></li>
				</c:if>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

<!-- 로그인 모달 팝업 -->
<div class="modal fade forget-modal" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h4>로그인</h4>
				<br />
				<form role="form" action="login.do" method="post" id="login-form"
					autocomplete="off">
					<div class="form-group">
						<label for="email" class="sr-only">Email</label> <input
							type="text" name="mno" id="mno" class="form-control"
							placeholder="사원번호" required>
					</div>
					<div class="form-group">
						<label for="key" class="sr-only">Password</label> <input
							type="password" name="pw" id="pw" class="form-control"
							placeholder="비밀번호" required>
					</div>
					<input type="submit" id="btn-login"
						class="btn btn-custom btn-lg btn-block" value="LOGIN">
				</form>
			    <a href="javascript:;" class="forget" data-toggle="modal"
					data-target=".forget-modal">비밀번호를 잊어버리셨나요?</a>
				<hr>
			</div>
		</div>
	</div>
</div>
<div class="modal fade forget-modal" tabindex="-1" role="dialog"
	aria-labelledby="myForgetModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">X</span> <span class="sr-only">닫기</span>
				</button>
				<h4 class="modal-title">비밀번호 찾기</h4>
			</div>
			<div class="modal-body">
				<p>가입 시 등록한 메일주소를 입력하세요</p>
				<input type="email" name="recovery-email" id="recovery-email"
					class="form-control" autocomplete="off">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-custom">찾기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 리뷰 등록 모달  -->
<div class="modal fade forget-modal" id="reviewModal" tabindex="-1"
	role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content" style="width:400px">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 style="color:green">
					<span class="glyphicon glyphicon-envelope"></span>
					<label id="modal-title">리뷰 작성</label>
				</h4>
				<small>식사하신 메뉴에 대한 평점과 의견을 남겨주세요.</small>
				<br/>
			</div>
			<div class="modal-body" id="modal-body">
				<c:if test="${!empty mno}">
					<form method="post" action="insertReview.do"
						enctype="multipart/form-data">
						<table align="center" width="300">
							
							<tr height="50">
								<td><label for="title">아이디</label></td>
								<td><input type="text" name="mno" id="mno" value="${mno }" required/></td>
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
								<td><label for="title">코너</label></td>
								<td><select id="scode" name="scode">
										<option value="1">아침</option>
										<option value="2">일품</option>
										<option value="3">한식</option>
										<option value="4">저녁</option>
								</select></td>
							</tr>
							<tr height="50">
								<td><label for="title">메뉴</label></td>
								<td><input type="text" name="fname" id="fname" required/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><label for="contents">코멘트</label></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><textarea name="comments"
										id="comments" cols="40" rows="5" style="resize:none;"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
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
				</c:if>
				<c:if test="${empty mno }">
					<span>로그인 후에 리뷰를 작성하실 수 있습니다.</span>
				</c:if>
				<hr>
			</div>
		</div>
	</div>
</div>


<!-- Carousel -->
<article id="mainContent">
	<c:choose>
		<c:when test="${!empty content}">
			<jsp:include page="${content}" />
		</c:when>
		<c:otherwise>
			<div id="theme-carousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#theme-carousel" data-slide-to="0" class="active"></li>
					<li data-target="#theme-carousel" data-slide-to="1"></li>
					<li data-target="#theme-carousel" data-slide-to="2"></li>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="images/carousel1.jpg" alt="carousel1"
							style="width: 100%" />
						<div class="carousel-caption">
							<h2>"One man with courage makes a majority."</h2>
							<p>Andrew Jackson</p>
						</div>
					</div>
					<div class="item">
						<img src="images/carousel2.jpg" alt="carousel2"
							style="width: 100%" />
						<div class="carousel-caption">
							<h2>"When men are employed, they are best contented."</h2>
							<p>Benjamin Franklin</p>
						</div>
					</div>
					<div class="item">
						<img src="images/carousel3.jpg" alt="carousel3"
							style="width: 100%">
						<div class="carousel-caption">
							<h2>"Happiness is a warm puppy."</h2>
							<p>Charles M. Schulz</p>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</article>
<!-- Controls -->
<a class="left carousel-control" href="#theme-carousel" role="button"
	data-slide="prev">
	<div class="carousel-control-arrow">&#8249;</div>
</a>
<a class="right carousel-control" href="#theme-carousel" role="button"
	data-slide="next">
	<div class="carousel-control-arrow">&#8250;</div>
</a>

<div class="container-news">
	<div class="container">
		<div class="page-header" id="news">
			<h1 class="text-center text-danger">NOTICE</h1>
		</div>
		<div class="row">
			<div class="col-md-8">
				<article id="noticeBoardContent">
					<jsp:include page="${noticeBoardContent}" />
				</article>
			</div>
			<div class="col-md-4 text-center">
				<br />
				<h3>Calendar</h3>
				<br />
				<div id="calendar" class="calendar"></div>
				<br/> <br/>
			</div>
		</div>
	</div>
</div>

<div class="container-services">
	<div class="container">
		<div class="page-header" id="services">
			<h1 class="text-center text-default">Weekly Menu</h1>
		</div>
		<!-- <div class="clearfix hidden-xs" style="width: 100%; height: 50px;"></div> -->
		<div class="row">
			<div class="row text-center">
					<c:if test = "${empty addMenuContent && empty updateMenuContent}">
						<article id="weeklyMenuContent">
							<jsp:include page="${weeklyMenuContent}"/>
						</article>
					</c:if>
					<c:if test = "${!empty addMenuContent}">
						<article id="addMenuContent">
							<jsp:include page="${addMenuContent}"/>	
						</article>
					</c:if>
					<c:if test = "${!empty updateMenuContent}">
						<article id="updateMenuContent">
							<jsp:include page="${updateMenuContent}"/>	
						</article>
					</c:if>
			</div>
		</div>
	</div>
</div>

<div class="container-about">
	<div class="container">
		<div class="page-header" id="about">
			<h1 class="text-center text-danger">REVIEW</h1>
		</div>
		<div class="row">
			<div class="col-md-4 text-center">
				<article id="reviewBoardContent">
					<jsp:include page="${reviewBoardContent}" />
				</article>
			</div>
		</div>
	</div>
</div>

<div class="container-gallery">
	<div class="container">
		<div class="page-header" id="gallery">
			<h1 class="text-center text-default">RANKING</h1>
		</div>
		<div id="rankingBoardContent" class="row">
			<div class="col-md-12 text-center">
				<ul class="list-unstyled text-center">
					<li class="filter btn btn-success" data-filter=".dishes">아침</li>
					<li class="filter btn btn-success" data-filter=".restaurant">한식</li>
					<li class="filter btn btn-success" data-filter=".garden">일품</li>
					<li class="filter btn btn-success" data-filter=".kids">저녁</li>
					<li class="filter btn btn-success" data-filter="all">전체</li>
				</ul>
			</div>
			<article id="rankingBoardContent">
				<jsp:include page="${rankingBoardContent}" />
			</article>
		</div>
	</div>
	<div class="clearfix hidden-xs" style="width: 100%; height: 50px;"></div>
</div>

<div class="container-dishes" style="background-color:white">
	<div class="clearfix hidden-xs" style="width: 100%; height: 10px;"></div>
	<div class="container">
		<div class="page-header" id="dishes">
			<h1 class="text-center text-danger">SUGGESTION</h1>
		</div>
		<div class="row">
			<div class="col-md-6">
				<article id="reviewBoardContent">
					<jsp:include page="${anonymityBoardContent}" />
				</article>
			</div>
		</div>
	</div>
	<div class="clearfix hidden-xs" style="width: 100%; height: 50px;"></div>
</div>

<div class="container-ourteam" style="background-color: #222222">
	<div class="container">
		<div class="page-header" id="about">
			<h1 class="text-center" style="color:white;">Meet Our Team</h1>
		</div>
		<div class="col-md-3 text-center text-name">
			<p>Ko Yu Ra</p>
			<br />
			<p>
				<img src="images/koyura.jpg"
					style="border-radius: 50%; width: 180px; height: 180px;" />
			</p>
			<br />
		</div>
		<div class="col-md-3 text-center text-name">
			<p>Shin Yeon Seok</p>
			<br />
			<p>
				<img src="images/shinyeonseok.jpg"
					style="border-radius: 50%; width: 180px; height: 180px;" />
			</p>
			<br />
		</div>
		<div class="col-md-3 text-center text-name">
			<p>Yu Jeong Jae</p>
			<br />
			<p>
				<img src="images/yujeongjae.jpg"
					style="border-radius: 50%; width: 180px; height: 180px;" />
			</p>
			<br />
		</div>
		<div class="col-md-3 text-center text-name">
			<p>Lee Soo Chang</p>
			<br />
			<p>
				<img src="images/leesoochang.jpg"
					style="border-radius: 50%; width: 180px; height: 180px;" />
			</p>
			<br />
		</div>
	</div>
</div>

<footer id="subfooter" class="clearfix" style="background-color: #222222">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<p style="font-size: 18px; color:white;">
					<span class="fa fa-thumbs-o-up text-danger"></span> VISIT US
				</p>
				<p>한전KDN 본관 2층 구내식당</p>
			</div>
			<div class="col-md-3">
				<p style="font-size: 18px; color:white;">
					<span class="fa fa-clock-o text-danger"></span> OPEN HOURS
				</p>
				<p>Mon-Fri : 8am-7pm</p>
				<p>Sat-Sun : Closed</p>
			</div>
			<div class="col-md-3">
				<p style="font-size: 18px; color:white;">
					<span class="fa fa-map-marker text-danger"></span> CONTACTS
				</p>
				<p>전라남도 나주시 빛가람로 661</p>
				<p>+82 061 931 7114</p>
				<p>
					<a href="mailto:admin@kdn.com">admin@kdn.com</a>
				</p>
			</div>
			<div class="col-md-3">
				<p style="font-size: 18px; color:white;">
					<span class="fa fa-envelope-o text-danger"></span> NEWSLETTER
				</p>
				<p>
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Enter your email..." /> <span
						class="input-group-btn">
						<button class="btn btn-primary" type="button">Subscribe</button>
					</span>
				</div>
				</p>
				<p>
					<br/>
				</p>
			</div>
		</div>
	</div>
</footer>

<!-- <footer id="footer" class="clearfix">
	<div class="container">
		<div class="row">
			<div class="col-md-8"></div>
			<div class="col-md-4">
				<p>
					Created by <a href="https://www.kdn.com" title="KDN">KDN 2017 </a>
				</p>
			</div>
		</div>
	</div>
</footer> -->

<script type="text/javascript">
	jQuery(function($) {
		// Mix It Up Gallery and Magnific Popup setup
		$('.container-gallery').mixItUp({
			load : {
				filter : '.dishes'
			}
		});
		$('.container-gallery').magnificPopup({
			delegate : 'a',
			type : 'image'
		});

		// ShieldUI Calendar setup
		$("#calendar").shieldCalendar({
			footer : {
				enabled : true,
				footerTemlpate : "{0:dd.MM.yy}"
			},
			min : new Date("2009/2/23"),
			max : new Date("2039/3/1"),
			value : new Date()
		});

		// ShieldUI QRCode setup
		$("#qrcode").shieldQRcode({
			mode : "byte",
			size : 150,
			value : "https://demos.shieldui.com",
			style : {
				color : "#ed1b24"
			}
		});

		// Google Maps setup
		var googlemap = new google.maps.Map(document
				.getElementById('googlemap'), {
			center : new google.maps.LatLng(44.5403, -78.5463),
			zoom : 8,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});
	});

	function showPassword() {

		var key_attr = $('#key').attr('type');
		if (key_attr != 'text') {
			$('.checkbox').addClass('show');
			$('#key').attr('type', 'text');
		} else {
			$('.checkbox').removeClass('show');
			$('#key').attr('type', 'password');
		}
	}
</script>

</body>
</html>
