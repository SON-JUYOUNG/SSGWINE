<%@page import="model.User_MemberDTO"%>
<%@page import="model.WineDTO"%>
<%@page import="model.WineDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<title>관리자페이지</title>
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
.mybtn {
	width: 100px;
	height: 30px;
	color: gray;
	text-align: center;
	font-size: 15px;
	margin: 3px;
}

.mybtn:hover {
	background: none;
	color: tomato;
}

.user {
	text-align: center;
}

.blank {
	width: 30px;
}

table.user {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin: 20px 10px;
}
</style>
<body class="animsition">

	<%	User_MemberDTO user_dto = (User_MemberDTO) session.getAttribute("user_dto"); %>
	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="wrap-menu-header gradient1 trans-0-4">
			<div class="container h-full">
				<div class="wrap_header trans-0-3">
					<!-- Logo -->
					<div class="logo">
						<a href="wine_home.jsp"> <img
							src="images/icons/wine-logo-white.png" alt="IMG-LOGO" style="width:80px; height:100px;"
							data-logofixed="images/icons/wine-logo.png">
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
					<!-- 수빈 작업해야하는 부분 -->
					<!-- Social -->
					<div class="social flex-w flex-l-m p-r-20">
						<%
							if (user_dto == null) {
						%>
						<a href="login.jsp">Login</a>
						<%
						} else if (user_dto != null) {
							if(user_dto.getId().equals("admin")){%>
						<a href="adpage.jsp" style="font-weight: bold">회원관리</a>
						<div style="width: 10px;"></div>
						<a href="adpage_product.jsp" style="font-weight: bold">상품관리</a>	
						<div style="width: 10px;"></div>
						<a href="MemberLogout">Logout</a>
						<%}else{ %>
						<a href="mypage.jsp">MyPage</a>
						<div style="width: 10px;"></div>
						<a href="MemberLogout" style="font-weight: bold">Logout</a>
						<div class=cart>
							<button class="btn-show-sidebar m-l-33 trans-0-4">
								<img src="images/icons/cart2.png" style="width: 30px"
									data-logofixed="images/icons/cart.png">
							</button>
						</div>
						<%
						}}
						%>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Sidebar -->
	<aside class="sidebar trans-0-4">
		<!-- Button Hide sidebar -->
		<button class="btn-hide-sidebar ti-close color0-hov trans-0-4"></button>

		<!-- - -->
		<ul class="menu-sidebar p-t-95 p-b-70">

			<li class="t-center m-b-13"><a href="wine_home.jsp"
				class="txt19">홈</a></li>

			<li class="t-center m-b-13"><a href="wine_info.jsp"
				class="txt19">와인소개</a></li>

			<li class="t-center m-b-13"><a href="wine_recommend.jsp"
				class="txt19">와인추천</a></li>

			<li class="t-center m-b-13"><a href="wine_search.jsp"
				class="txt19">와인사진검색</a></li>

			<li class="t-center">
				<!-- Button3 --> <a href="reservation.jsp"
				class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto"> </a>
			</li>
		</ul>

		<!-- - -->
		<div class="gallery-sidebar t-center p-l-60 p-r-60 p-b-40">
			<!-- - -->
			<h4 class="txt20 m-b-33">Gallery</h4>

			<!-- Gallery -->
			<div class="wrap-gallery-sidebar flex-w">
				<a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-01.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-01.jpg" alt="GALLERY">
				</a> <a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-02.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-02.jpg" alt="GALLERY">
				</a> <a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-03.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-03.jpg" alt="GALLERY">
				</a> <a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-05.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-05.jpg" alt="GALLERY">
				</a> <a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-06.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-06.jpg" alt="GALLERY">
				</a> <a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-07.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-07.jpg" alt="GALLERY">
				</a> <a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-09.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-09.jpg" alt="GALLERY">
				</a> <a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-10.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-10.jpg" alt="GALLERY">
				</a> <a class="item-gallery-sidebar wrap-pic-w"
					href="images/photo-gallery-11.jpg" data-lightbox="gallery-footer">
					<img src="images/photo-gallery-thumb-11.jpg" alt="GALLERY">
				</a>
			</div>
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
						<span class="tit2 t-center"> Administer Page </span>

						<h3 class="tit3 t-center m-b-35 m-t-2">Boom+sante</h3>
					</div>
					<form>
						<table class="user" border=2px style="width:100%;">

							<tr style="text-align: center" bgcolor=#bf5151>
								<th class="user" style="text-align: center; width:600px; color:white; padding:10px;">와인명</th>
								<th class="user" style="text-align: center; width:350px; color:white; padding:10px;">용도</th>
								<th class="user" style="text-align: center; width:400px; color:white; padding:10px;">종류</th>
								<th class="user" style="text-align: center; width:100px; color:white; padding:10px;">생산지</th>
								<td class="user" style="text-align: center; width:100px; color:white; padding:10px;">지역</td>
								<th class="user" style="text-align: center; width:100px; color:white; padding:10px;">포도 종류</th>
								<th class="user" style="text-align: center; width:100px; color:white; padding:10px;">등급</th>
								<th class="user" style="text-align: center; width:200px; color:white; padding:10px;">당도</th>
								<th class="user" style="text-align: center; width:200px;color:white; padding:10px;">산도</th>
								<th class="user" style="text-align: center; width:200px; color:white; padding:10px;">바디</th>
								<th class="user" style="text-align: center; width:300px; color:white; padding:10px;">알코올</th>
								<th class="user" style="text-align: center; width:100px; color:white; padding:10px;">가격</th>
								
								<th class="user" style="text-align: center; width:150px; color:white; padding:10px;">상품삭제</th>
							</tr>

							<tbody style="text-align: center">
								<%
									//project member 테이블 에서 전체회원정보를 검색하여 출력ㅎ시오 
									//사용자가 입력한 정보없이 전체테이블의 정보를 검색하면되기때문에 servlet이 필요없음 

									try {

										WineDAO wine_dao = new WineDAO();
										ArrayList<WineDTO> arr = wine_dao.wineSelect();

										for (int i = 0; i < arr.size(); i++) {
											out.print("<tr>");
											out.print("<td>" + arr.get(i).getWinename() + "</td>");
											out.print("<td>" + arr.get(i).getUse() + "</td>");
											out.print("<td>" + arr.get(i).getSort() + "</td>");
											out.print("<td>" + arr.get(i).getCountry() + "</td>");
											out.print("<td>" + arr.get(i).getArea() + "</td>");
											out.print("<td>" + arr.get(i).getGrape() + "</td>");
											out.print("<td>" + arr.get(i).getGrade() + "</td>");
											out.print("<td>" + arr.get(i).getSugar() + "</td>");
											out.print("<td>" + arr.get(i).getAcidity() + "</td>");
											out.print("<td>" + arr.get(i).getBody() + "</td>");
											out.print("<td>" + arr.get(i).getAlcohol() + "</td>");
											out.print("<td>" + arr.get(i).getPrice() + "</td>"); %>
										<td >
											<a style="font-weight:900; color:black;" href="wineDelete?winename=<%= arr.get(i).getWinename()  %>">삭제</a>
										</td>
	
											<!-- out.print("<td style='font-weight:bold;'><a href='wineDelete?winename=" + arr.get(i).getWinename() + "'>삭제</a></td>"); -->
											<%//QueryString : URL을 통해서 서버로 값을 전송  사용자가입력한 값이 없을때 사용.
											out.print("</tr>");
										}
										// ------------------------실행 후 처리

									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</tbody>
						</table>
					</form>
				</div>
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
