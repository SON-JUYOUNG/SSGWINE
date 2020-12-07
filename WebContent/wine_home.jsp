<%@page import="model.Product_basketDTO"%>
<%@page import="model.Product_basketDAO"%>
<%@page import="model.Wine_basketDAO"%>
<%@page import="model.Wine_basketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>홈</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:60%;height:500px; margin: 0 auto; margin-bottom: 120px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background-color:white;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center; }
#menu_wrap .option p {margin:10px 0;}   
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
body {
	font-family: "KCC-eunyoung";
	line-height: 1.3em font-weight: 400;
}
#main_t{
	text-size : 20px;
	text-align : center;
}
.e_mart{
	font-size :30px;
}

img.wine10 {
	margin: 50px;
	padding: 30px;
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
							src="images/icons/wine-logo-white.png" alt="IMG-LOGO" style="width:150px; height:150px;"
							data-logofixed="images/icons/wine-logo.png">
						</a>
					</div>


					<!-- Menu -->
					<div class="wrap_menu p-l-45 p-l-0-xl"  >
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

	<!-- Slide1 -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item1-slick1"
					style="background-image: url(images/wine06.jpg);">
					<div
						class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span
							class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
							data-appear="fadeInDown"> Welcome to </span>

						<h2
							class="caption2-slide1 tit1 t-center animated visible-false m-b-37"
							data-appear="fadeInUp">Boom+sante</h2>

						<div class="wrap-btn-slide1 animated visible-false"
							data-appear="zoomIn">
							<!-- Button1 -->
							<a href="wine_info.jsp"
								class="btn1 flex-c-m size1 txt3 trans-0-4"> 와인메뉴보기 </a>
						</div>
					</div>
				</div>

				<div class="item-slick1 item2-slick1"
					style="background-image: url(images/wine05.jpg);">
					<div
						class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span
							class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
							data-appear="rollIn"> Welcome to </span>

						<h2
							class="caption2-slide1 tit1 t-center animated visible-false m-b-37"
							data-appear="lightSpeedIn">Boom+sante</h2>

						<div class="wrap-btn-slide1 animated visible-false"
							data-appear="slideInUp">
							<!-- Button1 -->
							<a href="wine_search.jsp"
								class="btn1 flex-c-m size1 txt3 trans-0-4"> 와인사진검색 </a>
						</div>
					</div>
				</div>
				<!-- 
            <div class="item-slick1 item3-slick1" style="background-image: url(images/wine08.jpg);">
               <div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
                  <span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="rotateInDownLeft">
                     Welcome to
                  </span>

                  <h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" data-appear="rotateInUpRight">
                     Wine Place
                  </h2>

                  <div class="wrap-btn-slide1 animated visible-false" data-appear="rotateIn">
                     Button1
                     <a href="menu.jsp" class="btn1 flex-c-m size1 txt3 trans-0-4">
                        Look Menu
                     </a>
                  </div>
               </div>
            </div> -->

			</div>

			<div class="wrap-slick1-dots"></div>
		</div>
	</section>

	<!-- Welcome -->
	<section class="section-welcome bg1-pattern p-t-120 p-b-105"
		style="text-align: center">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-t-45 p-b-30" style="text-align: center">
					<div class="wrap-text-welcome t-center">
						<span class="tit2 t-center"> Welcome </span>

						<h3 class="tit3 t-center m-b-35 m-t-5">Boom+sante</h3>

						<p class="t-center m-b-22 size3 m-l-r-auto" style="width: 250px;">



							<h2> 사이트를 방문해주신 여러분 환영합니다!</h2>
						</p>
						
						<p class="t-center m-b-22 size3 m-l-r-auto" style="width:400px;">
						
						<h2> 저희 Boom+sante는  고객맞춤형 와인추천 서비스와 <br> 와인사진검색 서비스를 제공하고 있습니다.</h2>
						</p>
						<p class="t-center m-b-22 size3 m-l-r-auto" style="width:400px;">
						
						<h2> 회원 가입을 하시고 서비스를 이용하여 고객님께 맞는 최적의 <br>와인을 찾아 
								바로 구매하실수 있도록 도와드립니다.			
						</h2>
						</p>
						
						<div class="wrap-btn-booking flex-c-m m-t-6">
							<!-- Button3 -->
							<!-- <button type="submit" class="btn3 flex-c-m size13 txt11 trans-0-4" >
									회원가입
							</button> -->
						</div>
					
					
					</div>
				</div>

	
				<div class="col-md-6 p-b-30">
					<div class="wrap-pic-welcome bo-rad-10 hov-img-zoom m-l-r-auto">
						<img class=wine10 src="images/wine10.jpg" alt="IMG-OUR">
					</div>
				</div>
			</div>
				
		</div>
	</section>
	
	<!-- Review -->
   <section class="section-review p-t-115">
      <!-- - -->
      <div class="title-review t-center m-b-2">
         <span class="tit2 p-l-15 p-r-15"> </span>

         <h3 class="tit8 t-center p-l-20 p-r-15 p-t-3">이달의 와인 추천</h3>
      </div>

      <!-- - -->
      <div class="wrap-slick3">
         <div class="slick3">
            <div class="item-slick3 item1-slick3">
               <div class="wrap-content-slide3 p-b-50 p-t-50">
                  <div class="container">
                     <div
                        class="pic-review size14 bo4 wrap-cir-pic m-l-r-auto animated visible-false"
                        data-appear="zoomIn">
                        <img src="images/red_wine/red04.PNG" alt="wine">
                     </div>

                     <div class="content-review m-t-33 animated visible-false"
                        data-appear="fadeInUp">
                        <div class="t-center txt12 size15 m-l-r-auto">
                           <h5 style="text-align: center">트라피체 오크캐스크 말벡</h5>
                           <p>이제 막 와인의 세계에 입문한 초보자들이나 매일 마실수 있는 편안하고 뛰어난 품질의 와인을 찾는
                              소비자들에게 추천합니다."</p>
                        </div>


                                          <p class="t-center txt12 size15 m-l-r-auto"></p>

                        <div class="star-review fs-18 color0 flex-c-m m-t-12">
                           <i class="fa fa-star" aria-hidden="true"></i> <i
                              class="fa fa-star p-l-1" aria-hidden="true"></i> <i
                              class="fa fa-star p-l-1" aria-hidden="true"></i> <i
                              class="fa fa-star p-l-1" aria-hidden="true"></i> <i
                              class="fa fa-star p-l-1" aria-hidden="true"></i>
                        </div>

                        <div
                           class="more-review txt4 t-center animated visible-false m-t-32"
                           data-appear="fadeInUp"></div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="item-slick3 item2-slick3">
               <div class="wrap-content-slide3 p-b-50 p-t-50">
                  <div class="container">
                     <div
                        class="pic-review size14 bo4 wrap-cir-pic m-l-r-auto animated visible-false"
                        data-appear="zoomIn">
                        <img src="images/white_wine/white05.PNG" alt="IGM-AVATAR">
                     </div>

                     <div class="content-review m-t-33 animated visible-false"
                        data-appear="fadeInUp">
                        <div style="font-size: 30px"
                           class="t-center txt12 size15 m-l-r-auto">
                           <h5 style="text-align: center">오이스터 베이 쇼비뇽 블랑</h5>
                           <p>"풍부하고 우아한 아로마가 입안에서 전해지며 특유의 청량감과 발랄함이 돋보이는 와인입니다.”</p>
                        </div>

                        <div class="star-review fs-18 color0 flex-c-m m-t-12">
                           <i class="fa fa-star" aria-hidden="true"></i> <i
                              class="fa fa-star p-l-1" aria-hidden="true"></i> <i
                              class="fa fa-star p-l-1" aria-hidden="true"></i> <i
                              class="fa fa-star p-l-1" aria-hidden="true"></i> <i
                              class="fa fa-star p-l-1" aria-hidden="true"></i>
                        </div>

                        <div
                           class="more-review txt4 t-center animated visible-false m-t-32"
                           data-appear="fadeInUp"></div>
                     </div>
                  </div>
               </div>
            </div>

         </div>
<!-- 리뷰 끝-->
         <div class="wrap-slick3-dots m-t-30"></div>
      </div>
   </section>
      
 <div id = "main_t"><a id="e_mart_main" class ="e_mart" style="color:#F8C90F; font-size:50px">e</a><a class ="e_mart" style="color:#8E8D89;">mart</a></div>
   <!-- 여기서부터 지도  api코드 입니다 !!!!!!!!!!!!!!!!!!!!!-->
 <div style="background-color : ">
<div class="map_wrap"  >
	
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden; "></div>
    
    <div id="menu_wrap" class="bg_white"  >
        <div class="option">
            <div >
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="광주 이마트" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=16c6c879765bc92cc3b34692e5ab6410&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=16c6c879765bc92cc3b34692e5ab6410"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.14161098010633, 126.93198218175641), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var lat = "";
var lon = "";
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        	lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">현재 위치입니다.</div>'; // 인포윈도우에 표시될 내용입니다
        var circle = new kakao.maps.Circle({
                center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 
                radius: 5000, // 미터 단위의 원의 반지름입니다 
                strokeWeight: 5, // 선의 두께입니다 
                strokeColor: '#75B8FA', // 선의 색깔입니다
                strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'dashed', // 선의 스타일 입니다
                fillColor: '#CFE7FF', // 채우기 색깔입니다
                fillOpacity: 0.7  // 채우기 불투명도 입니다   
            }); 

        // 지도에 원을 표시합니다 
        circle.setMap(map);
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(lat, lon),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    

// 키워드로 장소를 검색합니다
searchPlaces();


// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<!-- 여기까지가 지도  api코드 입니다 !!!!!!!!!!!!!!!!!!!!!-->
   
   
	
   
   
   <!-- Footer -->
   <footer class="bg1">
      <div class="container p-t-40 p-b-70">
         <div class="row">
            <div class="col-sm-6 col-md-4 p-t-50">
               <!-- - -->
               <h4 class="txt13 m-b-33">
                  (주) Boomsante
               </h4>

               <ul class="m-b-70">
                  <li class="txt14 m-b-14">
                     <i class="fa fa-map-marker fs-16 dis-inline-block size19" aria-hidden="true"></i>
                     광주광역시 동구 조선대학교 스마트미디어인재개발원
                  </li>

                  <li class="txt14 m-b-14">
                     <i class="fa fa-phone fs-16 dis-inline-block size19" aria-hidden="true"></i>
                     (+82) 230 456 7877
                  </li>

                  <li class="txt14 m-b-14">
                     <i class="fa fa-envelope fs-13 dis-inline-block size19" aria-hidden="true"></i>
                     Boomsante@chosun.ac.kr
                  </li>
               </ul>
            </div>
         
            <div class="col-sm-6 col-md-4 p-t-50">
               <!-- - -->
               <h4 class="txt13 m-b-33">
                  Opening Times
               </h4>
                  <ul class="m-b-70">
                  <li class="txt14">09:30 AM - 18:00 PM</li>

                  <li class="txt14">주말, 공휴일은 휴무</li>
               </ul>
               </div>
               
                  <div class="col-sm-6 col-md-4 p-t-50">
               <!-- - -->
               <h4 class="txt13 m-b-32">E-Mart</h4>

               <ul>
                  <!-- <li class="txt14"><a
                     href="https://dk.asiae.co.kr/article/2020022416300823661"
                     class="txt23"> 와인마실때 팁 알아가기 </a></li> -->

                  <li class="txt14"><a
                     href="http://emart.ssg.com/main.ssg?ckwhere=daum1" class="txt23">
                        이마트몰 바로가기 </a></li>

                  <li class="txt14">이마트 광주점</li>
                  <li class="txt14">이마트 광산점</li>
                  <li class="txt14">이마트 동광주점</li>
                  <li class="txt14">이마트 봉선점</li>
               </ul>
            </div>
            
</footer>
	
	
	
	
	
	
	
	<!-- Intro -->
						<!-- 	<section class="section-intro">
      <div class="header-intro parallax100 t-center p-t-135 p-b-158"
									style="background-image: url(images/wine01.jpg);">
      </div>
      
   </section> -->

   <!-- Back to top -->
   
						<div class="btn-back-to-top bg0-hov" id="myBtn">
      <span class="symbol-btn-back-to-top"> 
      <i class="fa fa-angle-double-up" aria-hidden="true"></i>
      </span>
   </div>

   <!-- Container Selection1 -->
   <div id="dropDownSelect1"></div>

   <!-- Modal Video 01-->
   <div class="modal fade" id="modal-video-01" tabindex="-1"
		role="dialog" aria-hidden="true">

      <div class="modal-dialog" role="document" data-dismiss="modal">
         <div class="close-mo-video-01 trans-0-4" data-dismiss="modal"
				aria-label="Close">&times;</div>

         <div class="wrap-video-mo-01">
            <div class="w-full wrap-pic-w op-0-0">
               <img src="images/icons/video-16-9.jpg" alt="IMG">
            </div>
            <div class="video-mo-01">
               <iframe
						src="https://www.youtube.com/embed/5k1hSu2gdKE?rel=0&amp;showinfo=0"
						allowfullscreen></iframe>
            </div>
         </div>
      </div>
   </div>



   <!--===============================================================================================-->
   <script type="text/javascript"
		src="vendor/jquery/jquery-3.2.1.min.js"></script>
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
   <script type="text/javascript"
		src="vendor/parallax100/parallax100.js"></script>
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
    