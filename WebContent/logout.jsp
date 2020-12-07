c<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그아웃</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/themify/themify-icons.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<style>
.blank {
	width: 30px;
}
</style>
<body class="animsition">

	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="wrap-menu-header gradient1 trans-0-4">
			<div class="container h-full">
				<div class="wrap_header trans-0-3">
					<!-- Logo -->
					<div class="logo">
						<a href="wine_home.jsp"> <img src="images/icons/logo.png"
							alt="IMG-LOGO" data-logofixed="images/icons/logo2.png">
						</a>
					</div>

					<!-- Menu -->
					<div class="wrap_menu p-l-45 p-l-0-xl">
						<nav class="menu">
							<ul class="main_menu">
								<li><a href="wine_home.jsp" style="font-weight: bold">홈</a></li>

								<li><a href="wine_info.jsp" style="font-weight: bold">와인 소개 </a></li>

								<li><a href="wine_recommend.jsp" style="font-weight: bold">와인 추천</a></li>

								<li><a href="wine_search.jsp" style="font-weight: bold">와인사진검색</a></li>


							</ul>
						</nav>
					</div>

					<!-- Social -->
					<div class="social flex-w flex-l-m p-r-20">
						<a href="login.jsp">Logout</a> <a class="blank"> </a> <a
							href="mypage.jsp">My Page</a>
						<button class="btn-show-sidebar m-l-33 trans-0-4"></button>
					</div>
				</div>
			</div>
		</div>
	</header>


	<!-- Sidebar -->
	<aside class="sidebar trans-0-4" style='background-color: #620000'>
		<!-- main.css에서 sidebar을 "width:500px; right: -500px;"로 설정 -->
		<!-- Button Hide sidebar -->
		<button class="btn-hide-sidebar ti-close color0-hov trans-0-4"
			style='color: white'></button>

		<div class="gallery-sidebar t-center p-l-60 p-r-60 p-b-40">
			<!-- - -->
			<h1 class="txt22 m-b-33"></h1>
			<h1 class="tit2 t-center" style='color: white; font-size: 40px;'>Wish
				List</h1>

			<div class="item-mainmenu m-b-36"></div>
			<!-- 공백 -->
			<div class="item-mainmenu m-b-36" style="width: 430px">
				<div class="flex-w flex-b m-b-3">
					<p class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>제품명</p>

					<div class="line-item-mainmenu bg1-pattern"></div>

					<div class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>수량</div>
				</div>
			</div>
			<div class="item-mainmenu m-b-36" style="width: 430px">
				<div class="flex-w flex-b m-b-10   ">
					<a href="#" class="name-item-mainmenu txt21" style='color: white'>
						1865 싱글빈야드 까베르네 소비뇽</a>

					<div class="line-item-mainmenu" style='color: white'></div>

					<div class="name-item-mainmenu txt21" style='color: white'>
						<input type="number" min="0" value="2" style="width: 30px"
							style="height:30px;">
						<button>
							<img src="images/icons/delete.png" alt="삭제" style="width: 30px">
						</button>
					</div>
				</div>
			</div>

			<div class="item-mainmenu m-b-36" style="width: 430px">
				<div class="flex-w flex-b m-b-10">
					<a href="#" class="name-item-mainmenu txt21" style='color: white'>
						발레벨보 옐로우라벨 </a>

					<div class="line-item-mainmenu" style='color: white'></div>

					<div class="name-item-mainmenu txt21" style='color: white'>
						<input type="number" min="0" value="1" style="width: 30px"
							style="height:30px;">
						<button>
							<img src="images/icons/delete.png" alt="삭제" style="width: 30px">
						</button>
					</div>
				</div>
			</div>

			<div class="item-mainmenu m-b-36"></div>
			<!-- 공백 -->
			<li class="t-center" style="width: 400px">
				<!-- Button3 --> <a href="reservation.jsp"
				class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto"> 주문하기 </a>
			</li>
			<!-- 수빈 작업할 부분 끝! -->


		</div>
	</aside>


	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15"
		style="background-image: url(images/wineglass.jpg);">
		<h2 class="tit6 t-center"></h2>
	</section>


	<!-- Reservation -->
	<section class="section-reservation bg1-pattern p-t-100 p-b-113">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 p-b-30">
					<div class="t-center">
						<span class="tit2 t-center"> Login </span>

						<h3 class="tit3 t-center m-b-35 m-t-2">Wine Place</h3>
					</div>

					<form class="wrap-form-reservation size22 m-l-r-auto">
						<div class="row">
							<div class="col-md-4">
								<!-- Date -->
								<!-- <span class="txt9">
									Date
								</span>

								<div class="wrap-inputdate pos-relative txt10 size12 bo2 bo-rad-10 m-t-3 m-b-23">
									<input class="my-calendar bo-rad-10 sizefull txt10 p-l-20" type="text" name="date">
									<i class="btn-calendar fa fa-calendar ab-r-m hov-pointer m-r-18" aria-hidden="true"></i>
								</div> -->
							</div>

							<div class="col-md-4">
								<!-- Name -->
								<span class="txt9"> ID </span>

								<div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
									<input class="bo-rad-10 sizefull txt10 p-l-20" type="text"
										name="id" placeholder="ID">
								</div>
							</div>

						</div>

						<div class="row">

							<div class="col-md-4"></div>

							<div class="col-md-4" text-align='center'>
								<!-- PW -->
								<span class="txt9"> PW </span>

								<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
									<input class="bo-rad-10 sizefull txt10 p-l-20" type="password"
										name="pw" placeholder="PW">
								</div>
							</div>

						</div>

						<div class="wrap-btn-booking flex-c-m m-t-6">
							<!-- Button3 로그인 -->
							<button type="submit"
								class="btn3 flex-c-m size13 txt11 trans-0-4">Login</button>
						</div>
						<div class="wrap-btn-booking flex-c-m m-t-6">
							<a href="join.jsp">회원가입</a>
						</div>

					</form>
				</div>
			</div>

			<div class="info-reservation flex-w p-t-80">
				<div class="size23 w-full-md p-t-40 p-r-30 p-r-0-md">
					<h4 class="txt5 m-b-18"></h4>
				</div>

				<div class="size24 w-full-md p-t-40"></div>

			</div>
		</div>
	</section>


	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>



	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript"
		src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript"
		src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="vendor/lightbox2/js/lightbox.min.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
