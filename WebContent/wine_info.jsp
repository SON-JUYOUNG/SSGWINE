<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="model.*" %>	
<%
    User_MemberDTO user_dto = (User_MemberDTO)session.getAttribute("user_dto");
%>	
<!DOCTYPE html>
<html lang="en">
<head>
<title>와인소개</title>
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
<% if(user_dto != null){ %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
					function WineAjax(num) {						
						var wine_basket=$("#wine_basket"+num).text();
						var count = document.getElementById("wine_count"+num).value;
						$.ajax({
							type : "post",
							url : "InsertWineCart",
							data : {"wine_basket" : wine_basket, "count" : count, "id":'<%= user_dto.getId() %>'}, 
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
							dataType : "text",
							success : function(data) {
								location.href = "wine_info.jsp";
								alert("위시리스트에 저장되었습니다.")
							},
							error : function() {
								alert("로그인 후 사용해주세요")
							}
						});
						
			
					}

				
</script>
<% } %>
</head>
<style>
.imgsize {
	width: 300px;
	hegiht: 400px;
}

.imgchange {
	width: 300px;
	style: height:auto;
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
						<a href="wine_home.jsp"> <img
							src="images/icons/wine-logo-white.png" alt="IMG-LOGO"
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
						<a href="adpage.jsp">회원관리</a>
						<div style="width: 10px;"></div>
						<a href="adpage_product.jsp">상품관리</a>	
						<div style="width: 10px;"></div>
						<a href="MemberLogout">Logout</a>
						<%}else{ %>
						<a href="mypage.jsp">MyPage</a>
						<div style="width: 10px;"></div>
						<a href="MemberLogout">Logout</a>
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
						style='color: white; font-size: 22px;'>와인</p>

					<div class="line-item-mainmenu bg1-pattern"></div>

					<div class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>수량</div>
				</div>
			</div>

			<%
				if (user_dto != null) {
				Wine_basketDAO wine_basket_dao = new Wine_basketDAO();
				ArrayList<Wine_basketDTO> wine_list = wine_basket_dao.select(user_dto.getId());
				System.out.println(wine_list.size() + "<- 와인 장바구니 갯수");

				for (int i = 0; i < wine_list.size(); i++) {
					Wine_basketDTO wine_list_dto = wine_list.get(i);
			%>
			<div class="item-mainmenu m-b-36" style="width: 430px">
				<div class="flex-w flex-b m-b-10">
					<a href="#" class="name-item-mainmenu txt21" id="wine_name<%=i%>"
						style='color: white'><%=wine_list_dto.getWine_name()%></a>

					<div class="line-item-mainmenu" style='color: white'></div>

					<div class="name-item-mainmenu txt21" style='color: white'>
						<input type="number" min="1" id="wine_count<%=i%>"
							value=<%=wine_list_dto.getCount()%> style="width: 40px"
							style="height:30px;">
						<button>
							<img src="images/icons/update.png" onclick="UpdateWine(<%=i%>)"
								alt="수정" style="width: 30px">
						</button>
						<button>
							<img src="images/icons/delete.png" onclick="DeleteWine(<%=i%>)"
								alt="삭제" style="width: 30px">
						</button>
					</div>
				</div>
			</div>
			
		
			
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script type="text/javascript">
					function DeleteWine(num) {						
						var wine_name=$("#wine_name"+num).text();
						var count=document.getElementById("wine_count"+num).value;
						
						$.ajax({
							type : "post",
							url : "DeleteWineCart",
							data : {"wine_name" : wine_name, "count" : count, "id":'<%= user_dto.getId() %>', "w_seq":'<%= wine_list.get(i).getW_seq() %>'}, 
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text",
							success : function(data) {
								alert("위시리스트에서 삭제되었습니다.")
								location.href = "wine_home.jsp";
								//select_wine_basket(wine_name, count);
							},
							error : function() {
								alert("다시 시도해 주세요")
							}
						});
						
						
					}
					
					function select_wine_basket(wineNm, wineCount){
						$.ajax({
							type : "post",
							url : "SelectWineBasket",
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text",
							success : function(data) {
								
								console.log(data);		
								
								var wine_name=$(wineNm);
								var count=document.getElementById(wineCount);
								
								
								wine_name.text(wineNm);
								count.value = wineCount;
								
							},
							error : function() {
								alert("다시 시도해 주세요")
							}
						});
					}
				
					function UpdateWine(num) {						
						var wine_name=$("#wine_name"+num).text();
						var count=document.getElementById("wine_count"+num).value;
						
						$.ajax({
							type : "post",
							url : "UpdateWineCart",
							data : {"wine_name" : wine_name, "count" : count, "id":'<%= user_dto.getId() %>', "w_seq":'<%= wine_list.get(i).getW_seq() %>'}, 
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text",
							success : function(data) {
								alert("수량이 변경되었습니다.")
								location.href = "wine_home.jsp";
								//select_wine_basket(wine_name, count);
							},
							error : function() {
								alert("다시 시도해 주세요")
							}
						});
						
						
					}
				
</script>
			<%
				}}
			%>
			<div class="item-mainmenu m-b-36"></div>
			<!-- 공백 -->
			<div class="item-mainmenu m-b-36" style="width: 430px">
				<div class="flex-w flex-b m-b-3">
					<p class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>상품</p>

					<div class="line-item-mainmenu bg1-pattern"></div>

					<div class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>수량</div>
				</div>
			</div>
			<%
				if (user_dto != null) {
				Product_basketDAO pro_basket_dao = new Product_basketDAO();
				ArrayList<Product_basketDTO> product_list = pro_basket_dao.select(user_dto.getId());
				System.out.println(product_list.size() + "<- 상품 장바구니 갯수");

				for (int i = 0; i < product_list.size(); i++) {
					Product_basketDTO product_list_dto = product_list.get(i);
			%>
			<div class="item-mainmenu m-b-36" style="width: 430px">
				<div class="flex-w flex-b m-b-10">
					<a href="#" class="name-item-mainmenu txt21" id="product_name<%= i %>" style='color: white'><%=product_list_dto.getProduct_basket()%></a>

					<div class="line-item-mainmenu" style='color: white'></div>

					<div class="name-item-mainmenu txt21" style='color: white'>
						<input type="number" min="1" id="product_count<%= i %>"
							value=<%=product_list_dto.getCount()%> style="width: 40px"
							style="height:30px;">
						<button>
							<img src="images/icons/update.png" onclick="UpdateProduct(<%=i%>)"
								alt="수정" style="width: 30px">
						</button>
						<button>
							<img src="images/icons/delete.png" onclick="DeleteProduct(<%=i %>)" alt="삭제" style="width: 30px">
						</button>
					</div>
				</div>
			</div>
	
		<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script type="text/javascript">
					function DeleteProduct(num) {						
						var product_name=$("#product_name"+num).text();
						var count=document.getElementById("product_count"+num).value;
						
						$.ajax({
							type : "post",
							url : "DeleteProductCart",
							data : {"product_name" : product_name, "count" : count, "id":'<%= user_dto.getId() %>', "p_seq":'<%= product_list.get(i).getP_seq() %>'}, 
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text",
							success : function(data) {
								alert("위시리스트에서 삭제되었습니다.")
								location.href = "wine_home.jsp";
							},
							error : function() {
								alert("다시 시도해 주세요")
							}
						});
						
						
					}

					function UpdateProduct(num) {						
						var product_name=$("#product_name"+num).text();
						var count=document.getElementById("product_count"+num).value;
					
						$.ajax({		
							type : "post",
							url : "UpdateProductCart",
							data : {"product_name" : product_name, "count" : count, "id":'<%= user_dto.getId() %>', "p_seq":'<%= product_list.get(i).getP_seq() %>'}, 
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text",
							success : function(data) {
								alert("수량이 변경되었습니다.")
								location.href = "wine_home.jsp";
								//select_wine_basket(wine_name, count);
							},
							error : function() {
								alert("다시 시도해 주세요")
							}
						});
						
						
					}
</script>
			<%
				}
			}
			%>


			<div class="item-mainmenu m-b-36"></div>
			<!-- 공백 -->
			<li class="t-center" style="width: 400px">
				<!-- Button3 --> 
					<a href="Selenium"	class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto"> 주문하기 </a>
			</li>
			<!-- 수빈 작업할 부분 끝! -->
		</div>
	</aside>



	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15"
		style="background-image: url(images/wineglass.jpg);">
		<h2 class="tit6 t-center">
			<!--  -->
		</h2>
	</section>



	<!-- Gallery -->
	<div class="section-gallery p-t-118 p-b-100">
		<div
			class="wrap-label-gallery filter-tope-group size27 flex-w flex-sb-m m-l-r-auto flex-col-c-sm p-l-15 p-r-15 m-b-60">
			<button class="label-gallery txt26 trans-0-4 is-actived"
				data-filter="*">All WINE</button>

			<button class="label-gallery txt26 trans-0-4" data-filter=".interior">
				RED WINE</button>

			<button class="label-gallery txt26 trans-0-4" data-filter=".food">
				WHITE WINE</button>

			<button class="label-gallery txt26 trans-0-4" data-filter=".events">
				SPARKLING WINE</button>

		</div>

		<!-- sparkling wine01 --->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp01.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp01.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;" style=text-align:center>
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket1">뵈브클리코 옐로우라벨</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 30px" class="txt23" class=info>
					미세한 기포가 입안을 감싸면서 기분좋게 해주며, 2차 발효로 인한 이스트 아로마가 특징적이다. 입안에서는 감귤류,
					미네랄향이 감돌며, 마지막 한모금까지 우아하게 마실수 있는 샴페인이다.
					</td>
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>아펠티프 와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링 와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>프랑스</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Champagne</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ★ ★</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>12도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>74,500원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count1"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(1)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine01 끝! -->

		<!-- sparkling wine02 --->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp02.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp02.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong  id="wine_basket2">발레벨보 모스까또 다스띠</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">라벨의 그림과 와인의 볏짚 색이 잘
					어우러지는 와인, 기분 좋은 당도와 신선함의 하모니가 두드러지며 과일 향의 향긋함이 인상적이다.</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>디저트 와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링 와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>이탈리아</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Moscato 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>5.5도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>14,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량:<input type="number" id="wine_count2"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(2)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine02 끝 -->

		<!-- sparkling wine03 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp03.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp03.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket3">아바지아, 허니문 모스카토</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					장미와 같은 꽃향기와 달콤한 과실의 향이 피어오른다. 기분 좋은 달콤함이 입안 가득 퍼지며 적당한 산도감과 어우러진
					과실의 풍미가 매력적이다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>디저트와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>이탈리아(Italy)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Moscato 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>6도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>10,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량:<input type="number" id="wine_count3"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(3)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div></div>
		<!-- sparkling wine03 끝 -->

		<!-- sparkling wine04 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp04.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp04.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket4">빌라엠 로쏘</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					로맨틱한 붉은 장미 빛깔을 가지고 있으며 부드러운 기포와 잘 익은 붉은 과일향이 매력적인 스위트 와인이다. 식전주나
					간단한 샐러드,식후 디저트 와인으로 좋으며 달콤한 향과 맛이 디저트류와 환상적인 궁합이다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>디저트와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>이탈리아(Italy)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Brachetto 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>5도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>24,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량:<input type="number" id="wine_count4"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(4)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine04 끝 -->

		<!-- sparkling wine05 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp05.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp05.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket5">엘렉트라 화이트</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					밝은 골드색을 띄는 이 와인은 신선한 오렌지의 시트러스한 아로마와 가벼운 산도와 당도가 어우러진 스위트 화이트 와인이다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>디저트와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>미국(U.S.A)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Blend</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>5도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>14,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량:<input type="number" id="wine_count5"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(5)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- sparkling wine05 끝 -->

		<!-- sparkling wine06 -->
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp06.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp06.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket6">찰스 하이직 브뤼 밀레짐</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					로맨틱한 붉은 장미 빛깔을 가지고 있으며 부드러운 기포와 잘 익은 붉은 과일향이 매력적인 스위트 와인 식전주나 간단한
					샐러드, 식후 디저트 와인으로 좋으며 달콤한 향과 맛이 디저트류와 환상적인 궁합이다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>아페리티프와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>프랑스(France)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Pinot Noir 60%, Chardonnay 40%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ★ ★</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>6도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>178,200원</td>
					</tr>
					<tr>
						<td colspan="2">수량:<input type="number" id="wine_count6"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(6)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine06 끝 -->

		<!-- sparkling wine07 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp07.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp07.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket7">찰스 하이직, 로제 리저브</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					신선한 복숭아가 섞인 집에서 만든 딸기잼을 생각나게 하는 향이 난다. 시나몬과 생강쿠키의 풍성한 따스함도 느낄수 있다.
					입안에서 깊고 파워풀한 느낌을 얻을 수 있다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>아페리티프와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>프랑스(France)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Pinot Noir 44%, Chardonnay 38%, Pinot Meunier 18%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>6도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>151,200원</td>
					</tr>
					<tr>
						<td colspan="2">수량:<input type="number" id="wine_count7"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(7)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine07 끝 -->

		<!-- sparkling wine08 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp08.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp08.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket8">앙드레 끌루에 상파뉴 브뤼 그랑 리저브</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					100% 그랑 크뤼 부지에서 재배한 피노누아로 양조해 6년 숙성시킨 샴페인으로, 적당한 산미와 우아한 미네랄 여윤이
					균형있는 여운을 남긴다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>아페리티프와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>프랑스(France)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Pinot Noir','Champagne AOC</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>12도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>49,500원</td>
					</tr>
					<tr>
						<td colspan="2">수량:<input type="number" id="wine_count8"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(8)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine08 끝 -->

		<!-- sparkling wine09 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp09.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp09.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket9">소피아 블랑 드 블랑</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					프란시스 포드 코폴라 감독이 그의 딸 '소피아 코폴라'를 위해 만든 와인이다. 그린애플과 같은 시트러스 계열의 상큼한
					아로마가 느껴지고 파인애플의 과실 풍미와 기분좋은 산도감이 청량감을 주는 와인이다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>아페리티프와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>미국(U.S.A)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Pinot Blanc 70%, Riesling 15%, Muscat 15%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>7도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>42,300원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count9"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(9)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine09 끝 -->

		<!-- sparkling wine10 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center">
				<img src="images/sparkling_wine/sp10.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/sparkling_wine/sp10.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket10">발레벨보 핑크 모스까또 스푸만떼</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					산뜻한 플로럴 향을 맡을 수 있으며, 밝고 연한 핑크빛과 기분좋은 당도가 어우러져 사랑스럽고 발랄한 이미지를 내뿜는다.
					벨벳 같은 목넘김과 거품들이 입안을 기분좋게 자극하는 스파클링 와인이다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>아페리티프와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>스파클링와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>이탈리아(Italy)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Moscato 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>7도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>18,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count10"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(10)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine10 끝 -->

		<!-- red wine01 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red01.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red01.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket11">코노수르 싱글빈야드 쉬라</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					포도밭 내에서도 가장 좋은 구획의 포도만을 엄선해 각 포도 품종이 지닌 매력을 극대화 시킨 와인이다. 라벨에 포도가
					재배된 구획의 번호,이름,위치를 기재함으로써 구대륙 컨셉인 '떼루아'를 부각 시킨다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>칠레(Chile)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Syrah/Shiraz 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ★</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>16도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>32,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count11"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(11)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 01 끝 -->

		<!-- red wine02 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red02.jpg" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red02.jpg" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket12">1865 싱글빈야드 까베르네 소비뇽</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					2003년부터 2016년까지 국내 총 누적 판매량 400만병을 돌파한 국내 최고의 칠레와인으로 모든 사람들이 좋아하는
					와인이다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>칠레(Chile)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Cabernet Sauvignon 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>14도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>32,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count12"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(12)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 02 끝 -->

		<!-- red wine03 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red03.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red03.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket13">도스 코파스 레드</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					스페인을 대표하는 두 품종인 템프라니요와 가르나차를 블렌딩해 만든 레드와인으로 전형적이 스페인 와인의 특징을 가진다.
					풍부한 과실향과 균형 잡힌 맛을 자랑하고 어떤 음삭과도 무난하게 잘 어울린다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>칠레(Chile)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Tempranillo,Garnatxa</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>12도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>4,900원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count13"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(13)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 03 끝 -->

		<!-- red wine04 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red04.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red04.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket14">트라피체 오크캐스크 말벡</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					트라피체의 플래그쉽 리저브 와인으로 13개월 동안 오크 숙성하여 아르헨티나의 전형적인 떼루아를 보여준다. 이제 막 와인의
					세계에 입문한 초보자들이나 매일 마실수 있는 편안하고 뛰어난 품질의 와인을 찾는 소비자들에게 적합하다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>칠레(Chile)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Malbec 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>19,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count14"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(14)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 04 끝 -->

		<!-- red wine05 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red05.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red05.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket15">세븐 폴스 카베르네 소비뇽</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					미국 와인 기준을 세운 최초의 워싱턴 프리미엄 와인 브랜드 이다.1967년부터 유럽 전통 포도 품종으로 다채로운 스타일의
					워신텅 와인을 선보였으며, 현재 워싱턴 지역의 AVA 등급 체계의 기반이 된 혁신적인 와이너리로 유명하다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>미국(U.S.A)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Cabernet Sauvignon 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ★</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>14도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>19,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count15"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(15)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 05 끝 -->

		<!-- red wine06 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red06.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red06.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket16">롤라이오 상그리아 레드</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					지중해 과일들을 으깨어 만든 즙에 스페인 토착 품종인 템프라니와 보발로 만든 와인을 혼합하여 스페인 전통적인 방식으로
					만든 샹그리아 입니다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>아페리티프와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>스페인(Spain)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Tempranillo</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>14도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>7,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count16"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(16)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 06 끝 -->

		<!-- red wine07 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red07.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red07.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket17">엠 샤푸티에 코트 뒤 론 루즈</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					M.샤푸티에의 많은 포트폴리오들 중 가장 가성비가 뛰어난 와인들로만 구성된 GMS레인지로 불가피한 이라는 뜻을 가지고
					있으며 모든 사람들이 한번씩 먹어봐야할 와인이라는 뜻을 내포하고 있다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>프랑스(France)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Grenache, Syrah/Shiraz,Mourvedre</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>14도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>14,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count17"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(17)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 07 끝 -->

		<!-- red wine08 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red08.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red08.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket18">아싸 크리안자</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					블랙커런트,블랙베리 등 검은 과일의 진한 아로마와 향신료 향이 느껴지며, 잘 다듬어진 탄닌 맛과 볼륨감, 텐션을 잡아주는
					산미가 어우러진 맛을 즐길수 있다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>스페인(Spain)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Tempranillo 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ★ ★</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>14도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>23,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count18"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(18)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 08 끝 -->

		<!-- red wine09 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red09.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red09.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket19">샤또 기봉 레드</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					진한 보라 빛이 감도는 루비 컬러에 블랙 커런트,자두, 체리와 같은 과일향이 지속적으로 느껴지며 입안에서는 부드러운
					탄닌과 산뜻한 산도가 훌륭한 밸런스를 이룬다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>프랑스(France)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Cabernet Sauvignon 50%, Merlot 50%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>16도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>17,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count19"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(19)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 09 끝 -->

		<!-- red wine10 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="text-align: center">
				<img src="images/red_wine/red10.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/red_wine/red10.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom interior guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket20">들라스 꼬뜨 방뚜 하프</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					블랙베리,라스베리 과실의 신선함이 돋보이며 스파이시한 아로마가 밸런스를 이루어 진하지만 누구나 쉽게 마실 수 있는 가성비
					좋은 와인이다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>레드와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>프랑스(France)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Crenache 80%, Syrah/Shiraz 20%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>8,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count20"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(20)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 10 끝 -->

		<!-- white wine01 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white01.jpg" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/red01.jpg" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket21">클라우디 베이 소비뇽 블랑</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					엷은 초록색을 띄고 있으며, 신선한 열대과일과 라임향,풋풋한 풀내음이 느껴진다. 입안에서는 산뜻함과 깔끔한 여운이
					특징적이다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>아페리티프와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>뉴질랜드(New Zealand)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Sauvignon Blanc 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>14도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>50,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count21"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(21)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 01 끝 -->

		<!-- white wine02 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white02.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white02.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket22">테를란 빙클 소비뇽 블랑</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					진한 과일 풍미와 함께 산뜻한 산미가 입에서 기분좋게 어우러진다. 향긋한 향과 탄탄한 짜임새를 갖춘 화이트 와인이다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>이탈리아(Italy)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Sauvignon Blanc 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13.5도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>45,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count22"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(22)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 02 끝 -->

		<!-- white wine03 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white03.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white03.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket23">라포스톨 그랑 셀렉션 쇼비뇽 블랑</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					매우 집중적인 열대과일향과 시트러스 향 그리고 허브 톤이 느껴지며 입안에서 산도와 볼륨감이 균형이 잘 잡혀 인상적이다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>칠레(Chile)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Sauvignon Blanc 85%, Semillon 8%, Sauvignon Gris 7%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13.5도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>35,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count23"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(23)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 03 끝 -->

		<!-- white wine04 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white04.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white04.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket24">도스 코파스 샤르도네</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					밝은 옐로우 빛을 띠고 열대 과일의 진한 향이 느껴진다. 복숭아와 파인애플의 맛이 프레시하게 조화를 이루며 지속력이
					뛰어나고 향이 돋보이는 와인이다.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>칠레(Chile)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Chardonnay 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>49,00원</td>
					</tr>
					<tr>
						<td colspan="2">수량:<input type="number" id="wine_count24"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(24)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 04 끝 -->

		<!-- white wine05 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white05.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white05.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket25">오이스터 베이 쇼비뇽 블랑</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					풍부하고 우아한 아로마가 입안에서 전해지며 산도와 고급스러운 미네랄 터치가 훌륭한 밸런스를 이룬다. 특유의 청량감과
					발랄함이 돋보이는 와인이다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>뉴질랜드(New Zealand)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Sauvignon Blanc 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>35,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count25"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(25)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 05 끝 -->

		<!-- white wine06 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white06.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white06.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket26">포르타 6 블랑코</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					파인애플,망고 등의 열대과일향과 패션푸르트의 강렬한 풍미가 매력적인 와인으로 산뜻한 미네랄리티와 산도가 느껴지며
					모스까뗄의 부드럽고 달달한 마무리가 인상적인 와인이다.


				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>포르투갈(Portugal)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Fernao Pires 60%, Arinto 30%, Moscatel 10%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>19,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count26"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(26)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 06 끝 -->

		<!-- white wine07 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white07.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white07.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket27">벨탁스 리슬링</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					라이트와 무거운 맛 중간정도 이며, 드라이한 편이고, 부드럽기보단 신맛이 많이 난다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>독일(Germany)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Riesling 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>9,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count27"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(27)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 07 끝 -->

		<!-- white wine08 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white08.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white08.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket28">폰타나프레다 르프롱드 모스카토 다스티</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					사향,오렌지 꽃,꿀의 달콤하고 신선한 노트가 매우 돋보이는 와인이다. 전체적으로 균형을 잘 이루었으며 벌꿀의 달콤한과
					신선한 맛이 잘 어우러진 기분을 유쾌하게 만들어주는 모스카토 와인이다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>디저트와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>이탈리아(Italy)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Moscato 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ★ ★ ★ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>6.5도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>19,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count28"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(28)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 08 끝 -->

		<!-- white wine09 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white09.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white09.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket29">엠 샤푸티에 꼬뜨 뒤 론 블랑</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					레몬향,미네랄리티가 느껴지는 와인으로 꿀 향도 옅게나마 느낄 수 있다. 미디엄 산도감을 가지고 있으며 전체적으로 비교적
					신선한 느낌을 주는 와인이다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>프랑스(France)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Grenache Blanc, Bourboulenc, Clairette</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>13도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>22,800원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count29"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(29)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 09 끝 -->

		<!-- white wine10 -->
		<div style="width:100%;">
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25"
			style="text-align: center; width:50%; margin: 0 auto">

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="text-align: center">
				<img src="images/white_wine/white10.PNG" alt="IMG-GALLERY"
					style="width: 300px; hegiht: 300px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" class=img-size>
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="images/white_wine/white10.PNG" data-lightbox="gallery"></a>
				</div>
			</div>

			<div
				class="item-gallery isotope-item bo-rad-10 hov-img-zoom food guests"
				style="width: 600px; hegiht: 300px;">
				<p style="text-align: center" class="txt22">
					<strong id="wine_basket30">G7 리저브 샤도네이</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- 이마트몰 인포 글귀 -->
					밝은 황금색을 띠고 있으며 복숭아,바나나,리치,시트러스의 신선하고 달콤한 향과 함께 고소한 헤이즐넛, 바닐라 아로마를
					즐길 수 있다. 풍부한 과즙맛과 산뜻하게 마무리해주는 산미의 균형감이 뛰어난 와인이다.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>용도</td>
						<td>테이블와인</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>화이트와인</td>
					</tr>
					<tr>
						<td>생산지</td>
						<td>칠레(Chile)</td>
					</tr>
					<tr>
						<td>포도 종류</td>
						<td>Chardonnay 100%</td>
					</tr>
					<tr>
						<td>당도</td>
						<td>★ ☆ ☆ ☆ ☆</td>
					</tr>
					<tr>
						<td>산도</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>바디</td>
						<td>★ ★ ★ ☆ ☆</td>
					</tr>
					<tr>
						<td>알코올</td>
						<td>10도</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>14,000원</td>
					</tr>
					<tr>
						<td colspan="2">수량: <input type="number" id="wine_count30"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax(30)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 10 끝 -->


	</div>
	<!--gallery  -->
	<!--    <div class="pagination flex-c-m flex-w p-l-15 p-r-15 m-t-24 m-b-50">
         <a href="#" class="item-pagination flex-c-m trans-0-4 active-pagination">1</a>
         <a href="#" class="item-pagination flex-c-m trans-0-4">2</a>
         <a href="#" class="item-pagination flex-c-m trans-0-4">3</a>
      </div> -->
	</div>


	<!-- Sign up -->
	<!-- <div class="section-signup bg1-pattern p-t-85 p-b-85">
      <form class="flex-c-m flex-w flex-col-c-m-lg p-l-5 p-r-5">
         <span class="txt5 m-10">
            Specials Sign up
         </span>

         <div class="wrap-input-signup size17 bo2 bo-rad-10 bgwhite pos-relative txt10 m-10">
            <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="email-address" placeholder="Email Adrress">
            <i class="fa fa-envelope ab-r-m m-r-18" aria-hidden="true"></i>
         </div>

         Button3
         <button type="submit" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
            Sign-up
         </button>
      </form>
   </div> -->



	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>



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
	<script type="text/javascript" src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>