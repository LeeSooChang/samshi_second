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

<script src="js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery.mixitup.min.js"></script>
<link href="css/magnific-popup.css" rel="stylesheet">
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/theme.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript"
	src="https://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>location.hash="ggokdaegi";</script>
<script type="text/javascript">
 function getBoard(rno){
		//input 양식의 hidden으로 선언된 no(게시글 번호)에 요청된 게시글 번호를 셋팅
		document.getElementById("rno").value = rno;
		var frm = document.getElementById("frm");
		frm.action="test2.do";
		frm.submit();
	}
 </script>
<!-- CSS includes -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="fonts/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="https://www.shieldui.com/shared/components/latest/css/light/all.min.css"
	rel="stylesheet" />
<link href="css/theme.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->
</head>
<style type="text/css">
#login {
	padding-top: 50px
}

#login .form-wrap {
	width: 30%;
	margin: 0 auto;
}

#login h1 {
	color: #1fa67b;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	padding-bottom: 20px;
}

#login .form-group {
	margin-bottom: 25px;
}

#login .checkbox {
	margin-bottom: 20px;
	position: relative;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
}

#login .checkbox.show:before {
	content: '\e013';
	color: #1fa67b;
	font-size: 17px;
	margin: 1px 0 0 3px;
	position: absolute;
	pointer-events: none;
	font-family: 'Glyphicons Halflings';
}

#login .checkbox .character-checkbox {
	width: 25px;
	height: 25px;
	cursor: pointer;
	border-radius: 3px;
	border: 1px solid #ccc;
	vertical-align: middle;
	display: inline-block;
}

#login .checkbox .label {
	color: #6d6d6d;
	font-size: 13px;
	font-weight: normal;
}

#login .btn.btn-custom {
	font-size: 14px;
	margin-bottom: 20px;
}

#login .forget {
	font-size: 13px;
	text-align: center;
	display: block;
}

.form-control {
	color: #212121;
}

.btn-custom {
	color: #fff;
	background-color: red;
}

.btn-custom:hover, .btn-custom:focus {
	color: #fff;
}

#loginFooter {
	color: #6d6d6d;
	font-size: 12px;
	text-align: center;
}

#loginFooter p {
	margin-bottom: 0;
}

#loginFooter a {
	color: inherit;
}
</style>
<body>
	<a naem="ggokdaegi"></a>
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
				<a href="/board" title="My Restaurant Bootstrap Theme"> <img
					class="img-responsive" src="images/kdn_logo.jpg"
					alt="My Restaurant Bootstrap Theme" />
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#news" class="smooth-scroll">Notice</a></li>
					<li><a href="#services" class="smooth-scroll">Menu</a></li>
					<li><a href="#about" class="smooth-scroll">Review</a></li>
					<li><a href="#gallery" class="smooth-scroll">TOP</a></li>

					<c:if test="${empty mno}">
						<li><a href="registerForm.do" class="smooth-scroll">
								Register </a></li>
						<li><a href="" class="smooth-scroll" data-toggle="modal"
							data-target="#myModal"> Login </a></li>
					</c:if>
					<c:if test="${!empty mno}">
						<li><a href="myPage.do" class="smooth-scroll"> MyPage </a></li>
						<li><a href="logout.do" class="smooth-scroll"> Logout </a></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- login 모달 팝업 -->
	<div class="modal fade forget-modal" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4>LOGIN</h4>
					<br />
					<form role="form" action="login.do" method="post" id="login-form"
						autocomplete="off">
						<div class="form-group">
							<label for="email" class="sr-only">Email</label> <input
								type="text" name="mno" id="mno" class="form-control"
								placeholder="Employee Number">
						</div>
						<div class="form-group">
							<label for="key" class="sr-only">Password</label> <input
								type="password" name="pw" id="pw" class="form-control"
								placeholder="Password">
						</div>
						<div class="checkbox">
							<span class="character-checkbox" onclick="showPassword()"></span>
							<span class="label">Show password</span>
						</div>
						<input type="submit" id="btn-login"
							class="btn btn-custom btn-lg btn-block" value="Log in">
					</form>
					<a href="javascript:;" class="forget" data-toggle="modal"
						data-target=".forget-modal">Forgot your password?</a>
					<hr>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- insert review 모달 팝업 -->
	<div class="modal fade forget-modal" id="reviewModal" tabindex="-1"
		role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4>Insert Review</h4>
					<br />
					<c:if test="${!empty mno}">
						<form method="post" action="insertReview.do"
							enctype="multipart/form-data">
							<table align="center" width="300">
								<tr>
									<th colspan="2">게시글 작성</th>
								</tr>
								<tr height="50">
									<td><label for="title">아이디</label></td>
									<td><input type="text" name="mno" id="mno" value="${mno }" /></td>
								</tr>
								<tr height="50">
									<td><label for="title">별점</label></td>
									<td><input type="text" name="spoint" id="spoint" /></td>
								</tr>
									<tr height="50">
										<td><label for="title">코너</label></td>
										<td>
											<select id = "scode" name = "scode">
												<option value = "1">아침</option>
												<option value = "2">일품</option>
												<option value = "3">한식</option>
												<option value = "4">저녁</option>
											</select>
										</td>
									</tr>
								<tr height="50">
									<td><label for="title">음식이름</label></td>
									<td><input type="text" name="fname" id="fname" /></td>
								</tr>
								<tr>
									<td colspan="2"><label for="contents">코멘트</label></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><textarea name="comments"
											id="comments" cols="30" rows="5"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
									<input type="submit" value="작성" /> <input type="reset" value="취소" /></td>
								</tr>
							</table>
						</form>
					</c:if>
					<c:if test="${empty mno }">
						<span> 로그인 후에 리뷰를 작성할 수 있습니다. </span>
					</c:if>
					<hr>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<div class="modal fade forget-modal" tabindex="-1" role="dialog"
		aria-labelledby="myForgetModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">Recovery password</h4>
				</div>
				<div class="modal-body">
					<p>Type your email account</p>
					<input type="email" name="recovery-email" id="recovery-email"
						class="form-control" autocomplete="off">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-custom">Recovery</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

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
								<h2>"People who love to eat are always the best people"</h2>
								<p>Julia Child</p>
							</div>
						</div>
						<div class="item">
							<img src="images/carousel2.jpg" alt="carousel2"
								style="width: 100%" />
							<div class="carousel-caption">
								<h2>What does it come from?</h2>
								<p>Contrary to popular belief, Lorem Ipsum is not simply
									random text.</p>
							</div>
						</div>
						<div class="item">
							<img src="images/carousel3.jpg" alt="carousel3"
								style="width: 100%">
							<div class="carousel-caption">
								<h2>Why do we use it?</h2>
								<p>It is a long established fact that a reader will be
									distracted by the readable content of a page when looking at
									its layout.</p>
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

	<div class="container-news" name="container-news" id="container-news">
		<div class="container">
			<div class="page-header" id="news">
				<h1 class="text-center text-danger">Notice</h1>
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
					<br /> <br />
				</div>
			</div>
		</div>
	</div>

	<div class="container-services">
		<div class="container">
			<div class="page-header" id="services">
				<h1 class="text-center text-default">Weekly Menu</h1>
			</div>
			<div class="clearfix hidden-xs" style="width: 100%; height: 50px;"></div>
			<div class="row">
				<div class="col-md-3 text-center">
					<c:if test="${!empty addMenuContent}">
						<jsp:include page="${addMenuContent}" />
					</c:if>
					<c:if test = "${!empty updateMenuContent}">
						<jsp:include page="${updateMenuContent}"/>	
					</c:if>
					<c:if test="${empty addMenuContent}">
						<article id="weeklyMenuContent">
							<jsp:include page="${weeklyMenuContent}" />
						</article>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<div class="container-about">
		<div class="container">
			<div class="page-header" id="about">
				<h1 class="text-center text-danger">Review</h1>
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
				<h1 class="text-center text-default">Ranking</h1>
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

	<!-- 
	<div class="container-dishes">
		<div class="clearfix hidden-xs" style="width: 100%; height: 10px;"></div>
		<div class="container">
			<div class="page-header" id="dishes">
				<h1 class="text-center text-default">TOP4</h1>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-body">
							<img src="images/dishes1.jpg" class="img-responsive" />
							<h4 class="text-danger">Dishes name</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-body">
							<img src="images/dishes2.jpg" class="img-responsive" />
							<h4 class="text-danger">Dishes name</h4>
							<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
								laboris nisi ut aliquip ex ea commodo consequat.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-body">
							<img src="images/dishes3.jpg" class="img-responsive" />
							<h4 class="text-danger">Dishes name</h4>
							<p>Duis aute irure dolor in reprehenderit in voluptate velit
								esse cillum dolore eu fugiat nulla pariatur ex ea commodo.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-body">
							<img src="images/dishes4.jpg" class="img-responsive" />
							<h4 class="text-danger">Dishes name</h4>
							<p>Duis aute irure dolor in reprehenderit in voluptate velit
								esse cillum dolore eu fugiat nulla pariatur ex ea commodo.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix hidden-xs" style="width: 100%; height: 50px;"></div>
	</div> -->

	<div class="container-ourteam">
		<div class="container">
			<div class="page-header" id="about">
				<h1 class="text-center text-danger">Meet Our Team</h1>
			</div>
			<div class="col-md-3 text-center">
				<p>Ko Yu Ra</p>
				<br />
				<p>
					<img src="images/koyura.jpg"
						style="border-radius: 50%; width: 180px; height: 180px;" />
				</p>
				<br />
			</div>
			<div class="col-md-3 text-center">
				<p>Shin Yeon Seok</p>
				<br />
				<p>
					<img src="images/shinyeonseok.jpg"
						style="border-radius: 50%; width: 180px; height: 180px;" />
				</p>
				<br />
			</div>
			<div class="col-md-3 text-center">
				<p>Yu Jeong Jae</p>
				<br />
				<p>
					<img src="images/yujeongjae.jpg"
						style="border-radius: 50%; width: 180px; height: 180px;" />
				</p>
				<br />
			</div>
			<div class="col-md-3 text-center">
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





	<footer id="subfooter" class="clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<p style="font-size: 18px;">
						<span class="fa fa-thumbs-o-up text-danger"></span> VISIT US
					</p>
					<p>한전KDN 본관 2층 구내식당</p>
				</div>
				<div class="col-md-3">
					<p style="font-size: 18px;">
						<span class="fa fa-clock-o text-danger"></span> OPEN HOURS
					</p>
					<p>Mon-Fri : 8am-7pm</p>
					<p>Sat-Sun : Closed</p>
				</div>
				<div class="col-md-3">
					<p style="font-size: 18px;">
						<span class="fa fa-map-marker text-danger"></span> CONTACTS
					</p>
					<p>전라남도 나주시 빛가람로 661</p>
					<p>+82 061 931 7114</p>
					<p>
						<a href="mailto:admin@kdn.com">admin@kdn.com</a>
					</p>
				</div>
				<div class="col-md-3">
					<p style="font-size: 18px;">
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
						<br />
					</p>
				</div>
			</div>
		</div>
	</footer>

	<footer id="footer" class="clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-8"></div>
				<div class="col-md-4">
					<p>
						Created by <a href="https://www.kdn.com" title="KDN">KDN 2017
						</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

	<script type="text/javascript">
    jQuery(function($) {
        // Mix It Up Gallery and Magnific Popup setup
        $('.container-gallery').mixItUp({
         load: {
            filter: '.dishes'
         }
      });
        $('.container-gallery').magnificPopup({
            delegate: 'a',
            type: 'image'
        });
 
        // ShieldUI Calendar setup
        $("#calendar").shieldCalendar({
            footer: {
                enabled: true,
                footerTemlpate: "{0:dd.MM.yy}"
            },
            min: new Date("2009/2/23"),
            max: new Date("2039/3/1"),
            value: new Date()
        });
 
        // ShieldUI QRCode setup
        $("#qrcode").shieldQRcode({
            mode: "byte",
            size: 150,
            value: "https://demos.shieldui.com",
            style: {
                color: "#ed1b24"
            }
        });
 
        // Google Maps setup
        var googlemap = new google.maps.Map(
            document.getElementById('googlemap'),
            {
                center: new google.maps.LatLng(44.5403, -78.5463),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
        );
    });
    
    function showPassword() {
        
        var key_attr = $('#key').attr('type');
        if(key_attr != 'text') {
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
