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
<title>Ȩ</title>
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
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
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
								<li><a href="wine_home.jsp" style="font-weight: bold">Ȩ</a></li>

								<li><a href="wine_info.jsp" style="font-weight: bold">���� �Ұ� </a></li>

								<li><a href="wine_recommend.jsp" style="font-weight: bold">���� ��õ</a></li>

								<li><a href="wine_search.jsp" style="font-weight: bold">���λ����˻�</a></li>

							</ul>
						</nav>
					</div>
					
					<!-- ���� �۾��ؾ��ϴ� �κ� -->
					<!-- Social -->
					<div class="social flex-w flex-l-m p-r-20">
						<%
							if (user_dto == null) {
						%>
						<a href="login.jsp">Login</a>
						<%
						} else if (user_dto != null) {
							if(user_dto.getId().equals("admin")){%>
						<a href="adpage.jsp">ȸ������</a>
						<div style="width: 10px;"></div>
						<a href="adpage_product.jsp">��ǰ����</a>	
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
		<!-- main.css���� sidebar�� "width:500px; right: -500px;"�� ���� -->
		<!-- Button Hide sidebar -->
		<button class="btn-hide-sidebar ti-close color0-hov trans-0-4"
			style='color: white'></button>

		<div class="gallery-sidebar t-center p-l-60 p-r-60 p-b-40">
			<!-- - -->
			<h1 class="txt22 m-b-33"></h1>
			<h1 class="tit2 t-center" style='color: white; font-size: 40px;'>Wish
				List</h1>

			<div class="item-mainmenu m-b-36"></div>
			<!-- ���� -->
			<div class="item-mainmenu m-b-36" style="width: 430px">
				<div class="flex-w flex-b m-b-3">
					<p class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>����</p>

					<div class="line-item-mainmenu bg1-pattern"></div>

					<div class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>����</div>
				</div>
			</div>

			<%
				if (user_dto != null) {
				Wine_basketDAO wine_basket_dao = new Wine_basketDAO();
				ArrayList<Wine_basketDTO> wine_list = wine_basket_dao.select(user_dto.getId());
				System.out.println(wine_list.size() + "<- ���� ��ٱ��� ����");

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
								alt="����" style="width: 30px">
						</button>
						<button>
							<img src="images/icons/delete.png" onclick="DeleteWine(<%=i%>)"
								alt="����" style="width: 30px">
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
								alert("���ø���Ʈ���� �����Ǿ����ϴ�.")
								location.href = "wine_home.jsp";
								//select_wine_basket(wine_name, count);
							},
							error : function() {
								alert("�ٽ� �õ��� �ּ���")
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
								alert("�ٽ� �õ��� �ּ���")
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
								alert("������ ����Ǿ����ϴ�.")
								location.href = "wine_home.jsp";
								//select_wine_basket(wine_name, count);
							},
							error : function() {
								alert("�ٽ� �õ��� �ּ���")
							}
						});
						
						
					}
				
</script>
			<%
				}}
			%>
			<div class="item-mainmenu m-b-36"></div>
			<!-- ���� -->
			<div class="item-mainmenu m-b-36" style="width: 430px">
				<div class="flex-w flex-b m-b-3">
					<p class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>��ǰ</p>

					<div class="line-item-mainmenu bg1-pattern"></div>

					<div class="name-item-mainmenu txt7"
						style='color: white; font-size: 22px;'>����</div>
				</div>
			</div>
			<%
				if (user_dto != null) {
				Product_basketDAO pro_basket_dao = new Product_basketDAO();
				ArrayList<Product_basketDTO> product_list = pro_basket_dao.select(user_dto.getId());
				System.out.println(product_list.size() + "<- ��ǰ ��ٱ��� ����");

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
								alt="����" style="width: 30px">
						</button>
						<button>
							<img src="images/icons/delete.png" onclick="DeleteProduct(<%=i %>)" alt="����" style="width: 30px">
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
								alert("���ø���Ʈ���� �����Ǿ����ϴ�.")
								location.href = "wine_home.jsp";
							},
							error : function() {
								alert("�ٽ� �õ��� �ּ���")
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
								alert("������ ����Ǿ����ϴ�.")
								location.href = "wine_home.jsp";
								//select_wine_basket(wine_name, count);
							},
							error : function() {
								alert("�ٽ� �õ��� �ּ���")
							}
						});
						
						
					}
</script>
			<%
				}
			}
			%>


			<div class="item-mainmenu m-b-36"></div>
			<!-- ���� -->
			<li class="t-center" style="width: 400px">
				<!-- Button3 --> 
					<a href="Selenium"	class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto"> �ֹ��ϱ� </a>
			</li>
			<!-- ���� �۾��� �κ� ��! -->
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
								class="btn1 flex-c-m size1 txt3 trans-0-4"> ���θ޴����� </a>
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
								class="btn1 flex-c-m size1 txt3 trans-0-4"> ���λ����˻� </a>
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



							<h2> ����Ʈ�� �湮���ֽ� ������ ȯ���մϴ�!</h2>
						</p>
						
						<p class="t-center m-b-22 size3 m-l-r-auto" style="width:400px;">
						
						<h2> ���� Boom+sante��  �������� ������õ ���񽺿� <br> ���λ����˻� ���񽺸� �����ϰ� �ֽ��ϴ�.</h2>
						</p>
						<p class="t-center m-b-22 size3 m-l-r-auto" style="width:400px;">
						
						<h2> ȸ�� ������ �Ͻð� ���񽺸� �̿��Ͽ� ���Բ� �´� ������ <br>������ ã�� 
								�ٷ� �����ϽǼ� �ֵ��� ���͵帳�ϴ�.			
						</h2>
						</p>
						
						<div class="wrap-btn-booking flex-c-m m-t-6">
							<!-- Button3 -->
							<!-- <button type="submit" class="btn3 flex-c-m size13 txt11 trans-0-4" >
									ȸ������
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

         <h3 class="tit8 t-center p-l-20 p-r-15 p-t-3">�̴��� ���� ��õ</h3>
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
                           <h5 style="text-align: center">Ʈ����ü ��ũĳ��ũ ����</h5>
                           <p>���� �� ������ ���迡 �Թ��� �ʺ��ڵ��̳� ���� ���Ǽ� �ִ� ����ϰ� �پ ǰ���� ������ ã��
                              �Һ��ڵ鿡�� ��õ�մϴ�."</p>
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
                           <h5 style="text-align: center">���̽��� ���� ��� ���</h5>
                           <p>"ǳ���ϰ� ����� �Ʒθ��� �Ծȿ��� �������� Ư���� û������ �߶����� �����̴� �����Դϴ�.��</p>
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
<!-- ���� ��-->
         <div class="wrap-slick3-dots m-t-30"></div>
      </div>
   </section>
      
 <div id = "main_t"><a id="e_mart_main" class ="e_mart" style="color:#F8C90F; font-size:50px">e</a><a class ="e_mart" style="color:#8E8D89;">mart</a></div>
   <!-- ���⼭���� ����  api�ڵ� �Դϴ� !!!!!!!!!!!!!!!!!!!!!-->
 <div style="background-color : ">
<div class="map_wrap"  >
	
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden; "></div>
    
    <div id="menu_wrap" class="bg_white"  >
        <div class="option">
            <div >
                <form onsubmit="searchPlaces(); return false;">
                    Ű���� : <input type="text" value="���� �̸�Ʈ" id="keyword" size="15"> 
                    <button type="submit">�˻��ϱ�</button> 
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
// ��Ŀ�� ���� �迭�Դϴ�
var markers = [];

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(35.14161098010633, 126.93198218175641), // ������ �߽���ǥ
        level: 8 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ��� �˻� ��ü�� �����մϴ�
var ps = new kakao.maps.services.Places();  

// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var lat = "";
var lon = "";
// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
if (navigator.geolocation) {
    
    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
    navigator.geolocation.getCurrentPosition(function(position) {
        
        	lat = position.coords.latitude, // ����
            lon = position.coords.longitude; // �浵
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
            message = '<div style="padding:5px;">���� ��ġ�Դϴ�.</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
        var circle = new kakao.maps.Circle({
                center : new kakao.maps.LatLng(lat, lon),  // ���� �߽���ǥ �Դϴ� 
                radius: 5000, // ���� ������ ���� �������Դϴ� 
                strokeWeight: 5, // ���� �β��Դϴ� 
                strokeColor: '#75B8FA', // ���� �����Դϴ�
                strokeOpacity: 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
                strokeStyle: 'dashed', // ���� ��Ÿ�� �Դϴ�
                fillColor: '#CFE7FF', // ä��� �����Դϴ�
                fillOpacity: 0.7  // ä��� ������ �Դϴ�   
            }); 

        // ������ ���� ǥ���մϴ� 
        circle.setMap(map);
        // ��Ŀ�� ���������츦 ǥ���մϴ�
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
    
    var locPosition = new kakao.maps.LatLng(lat, lon),    
        message = 'geolocation�� ����Ҽ� �����..'
        
    displayMarker(locPosition, message);
}

//������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
function displayMarker(locPosition, message) {

    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // ���������쿡 ǥ���� ����
        iwRemoveable = true;

    // ���������츦 �����մϴ�
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // ���������츦 ��Ŀ���� ǥ���մϴ� 
    infowindow.open(map, marker);
    
    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
    map.setCenter(locPosition);      
}    

// Ű����� ��Ҹ� �˻��մϴ�
searchPlaces();


// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('Ű���带 �Է����ּ���!');
        return false;
    }

    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
    ps.keywordSearch( keyword, placesSearchCB); 
}

// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������
        // �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
        displayPlaces(data);

        // ������ ��ȣ�� ǥ���մϴ�
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('�˻� ����� �������� �ʽ��ϴ�.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
        return;

    }
}

// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
    removeAllChildNods(listEl);

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�

        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(placePosition);

        // ��Ŀ�� �˻���� �׸� mouseover ������
        // �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
        // mouseout ���� ���� ���������츦 �ݽ��ϴ�
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

    // �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
    map.setBounds(bounds);
}

// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
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

// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new kakao.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new kakao.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}

// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // ������ �߰��� ��������ȣ�� �����մϴ�
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

// �˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
// ���������쿡 ��Ҹ��� ǥ���մϴ�
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<!-- ��������� ����  api�ڵ� �Դϴ� !!!!!!!!!!!!!!!!!!!!!-->
   
   
	
   
   
   <!-- Footer -->
   <footer class="bg1">
      <div class="container p-t-40 p-b-70">
         <div class="row">
            <div class="col-sm-6 col-md-4 p-t-50">
               <!-- - -->
               <h4 class="txt13 m-b-33">
                  (��) Boomsante
               </h4>

               <ul class="m-b-70">
                  <li class="txt14 m-b-14">
                     <i class="fa fa-map-marker fs-16 dis-inline-block size19" aria-hidden="true"></i>
                     ���ֱ����� ���� �������б� ����Ʈ�̵�����簳�߿�
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

                  <li class="txt14">�ָ�, �������� �޹�</li>
               </ul>
               </div>
               
                  <div class="col-sm-6 col-md-4 p-t-50">
               <!-- - -->
               <h4 class="txt13 m-b-32">E-Mart</h4>

               <ul>
                  <!-- <li class="txt14"><a
                     href="https://dk.asiae.co.kr/article/2020022416300823661"
                     class="txt23"> ���θ��Ƕ� �� �˾ư��� </a></li> -->

                  <li class="txt14"><a
                     href="http://emart.ssg.com/main.ssg?ckwhere=daum1" class="txt23">
                        �̸�Ʈ�� �ٷΰ��� </a></li>

                  <li class="txt14">�̸�Ʈ ������</li>
                  <li class="txt14">�̸�Ʈ ������</li>
                  <li class="txt14">�̸�Ʈ ��������</li>
                  <li class="txt14">�̸�Ʈ ������</li>
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
    