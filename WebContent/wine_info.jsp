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
<title>���μҰ�</title>
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
								alert("���ø���Ʈ�� ����Ǿ����ϴ�.")
							},
							error : function() {
								alert("�α��� �� ������ּ���")
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
					<strong id="wine_basket1">�ƺ�Ŭ���� ���ο��</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 30px" class="txt23" class=info>
					�̼��� ������ �Ծ��� ���θ鼭 ������� ���ָ�, 2�� ��ȿ�� ���� �̽�Ʈ �Ʒθ��� Ư¡���̴�. �Ծȿ����� ���ַ�,
					�̳׶����� ������, ������ �Ѹ�ݱ��� ����ϰ� ���Ǽ� �ִ� �������̴�.
					</td>
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>����Ƽ�� ����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ�� ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Champagne</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>12��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>74,500��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count1"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(1)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine01 ��! -->

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
					<strong  id="wine_basket2">�߷����� �𽺱�� �ٽ���</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">���� �׸��� ������ ��¤ ���� ��
					��췯���� ����, ��� ���� �絵�� �ż����� �ϸ�ϰ� �ε巯���� ���� ���� ������� �λ����̴�.</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>����Ʈ ����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ�� ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��Ż����</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Moscato 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>5.5��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>14,800��</td>
					</tr>
					<tr>
						<td colspan="2">����:<input type="number" id="wine_count2"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(2)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine02 �� -->

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
					<strong id="wine_basket3">�ƹ�����, ��Ϲ� ��ī��</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					��̿� ���� ������ ������ ������ ���� �Ǿ������. ��� ���� �������� �Ծ� ���� ������ ������ �굵���� ��췯��
					������ ǳ�̰� �ŷ����̴�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>����Ʈ����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��Ż����(Italy)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Moscato 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>6��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>10,800��</td>
					</tr>
					<tr>
						<td colspan="2">����:<input type="number" id="wine_count3"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(3)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div></div>
		<!-- sparkling wine03 �� -->

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
					<strong id="wine_basket4">���� �ν�</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					�θ�ƽ�� ���� ��� ������ ������ ������ �ε巯�� ������ �� ���� ���� �������� �ŷ����� ����Ʈ �����̴�. �����ֳ�
					������ ������,���� ����Ʈ �������� ������ ������ ��� ���� ����Ʈ���� ȯ������ �����̴�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>����Ʈ����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��Ż����(Italy)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Brachetto 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>5��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>24,000��</td>
					</tr>
					<tr>
						<td colspan="2">����:<input type="number" id="wine_count4"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(4)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine04 �� -->

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
					<strong id="wine_basket5">����Ʈ�� ȭ��Ʈ</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					���� ������ ��� �� ������ �ż��� �������� ��Ʈ������ �Ʒθ��� ������ �굵�� �絵�� ��췯�� ����Ʈ ȭ��Ʈ �����̴�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>����Ʈ����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>�̱�(U.S.A)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Blend</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>5��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>14,000��</td>
					</tr>
					<tr>
						<td colspan="2">����:<input type="number" id="wine_count5"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(5)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- sparkling wine05 �� -->

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
					<strong id="wine_basket6">���� ������ ��� �з���</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					�θ�ƽ�� ���� ��� ������ ������ ������ �ε巯�� ������ �� ���� ���� �������� �ŷ����� ����Ʈ ���� �����ֳ� ������
					������, ���� ����Ʈ �������� ������ ������ ��� ���� ����Ʈ���� ȯ������ �����̴�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���丮Ƽ������</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(France)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Pinot Noir 60%, Chardonnay 40%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>6��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>178,200��</td>
					</tr>
					<tr>
						<td colspan="2">����:<input type="number" id="wine_count6"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(6)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine06 �� -->

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
					<strong id="wine_basket7">���� ������, ���� ������</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					�ż��� �����ư� ���� ������ ���� �������� �������� �ϴ� ���� ����. �ó���� ������Ű�� ǳ���� �����Ե� ������ �ִ�.
					�Ծȿ��� ��� �Ŀ�Ǯ�� ������ ���� �� �ִ�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���丮Ƽ������</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(France)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Pinot Noir 44%, Chardonnay 38%, Pinot Meunier 18%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>6��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>151,200��</td>
					</tr>
					<tr>
						<td colspan="2">����:<input type="number" id="wine_count7"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(7)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine07 �� -->

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
					<strong id="wine_basket8">�ӵ巹 ���翡 ���Ĵ� ��� �׶� ������</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					100% �׶� ũ�� �������� ����� �ǳ봩�Ʒ� ������ 6�� ������Ų ����������, ������ ��̿� ����� �̳׶� ������
					�����ִ� ������ �����.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���丮Ƽ������</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(France)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Pinot Noir','Champagne AOC</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>12��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>49,500��</td>
					</tr>
					<tr>
						<td colspan="2">����:<input type="number" id="wine_count8"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(8)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine08 �� -->

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
					<strong id="wine_basket9">���Ǿ� ��� �� ���</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					�����ý� ���� ������ ������ ���� �� '���Ǿ� ������'�� ���� ���� �����̴�. �׸����ð� ���� ��Ʈ���� �迭�� ��ŭ��
					�Ʒθ��� �������� ���ξ����� ���� ǳ�̿� ������� �굵���� û������ �ִ� �����̴�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���丮Ƽ������</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>�̱�(U.S.A)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Pinot Blanc 70%, Riesling 15%, Muscat 15%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>7��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>42,300��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count9"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(9)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine09 �� -->

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
					<strong id="wine_basket10">�߷����� ��ũ �𽺱�� ��Ǫ����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					����� �÷η� ���� ���� �� ������, ��� ���� ��ũ���� ������� �絵�� ��췯�� ��������� �߶��� �̹����� ���մ´�.
					���� ���� ��ѱ�� ��ǰ���� �Ծ��� ������� �ڱ��ϴ� ����Ŭ�� �����̴�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���丮Ƽ������</td>
					</tr>
					<tr>
						<td>����</td>
						<td>����Ŭ������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��Ż����(Italy)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Moscato 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>7��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>18,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count10"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(10)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- sparkling wine10 �� -->

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
					<strong id="wine_basket11">�ڳ���� �̱ۺ�ߵ� ����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					������ �������� ���� ���� ��ȹ�� �������� ������ �� ���� ǰ���� ���� �ŷ��� �ش�ȭ ��Ų �����̴�. �󺧿� ������
					���� ��ȹ�� ��ȣ,�̸�,��ġ�� ���������ν� ����� ������ '�����'�� �ΰ� ��Ų��.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>ĥ��(Chile)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Syrah/Shiraz 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>16��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>32,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count11"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(11)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 01 �� -->

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
					<strong id="wine_basket12">1865 �̱ۺ�ߵ� ����� �Һ�</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					2003����� 2016����� ���� �� ���� �Ǹŷ� 400������ ������ ���� �ְ��� ĥ���������� ��� ������� �����ϴ�
					�����̴�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>ĥ��(Chile)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Cabernet Sauvignon 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>14��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>32,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count12"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(12)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 02 �� -->

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
					<strong id="wine_basket13">���� ���Ľ� ����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					�������� ��ǥ�ϴ� �� ǰ���� ������Ͽ�� ���������� ������ ���� ����������� �������� ������ ������ Ư¡�� ������.
					ǳ���� ������� ���� ���� ���� �ڶ��ϰ� � ������� �����ϰ� �� ��︰��.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>ĥ��(Chile)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Tempranillo,Garnatxa</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>12��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>4,900��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count13"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(13)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 03 �� -->

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
					<strong id="wine_basket14">Ʈ����ü ��ũĳ��ũ ����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					Ʈ����ü�� �÷��׽� ������ �������� 13���� ���� ��ũ �����Ͽ� �Ƹ���Ƽ���� �������� ����Ƹ� �����ش�. ���� �� ������
					���迡 �Թ��� �ʺ��ڵ��̳� ���� ���Ǽ� �ִ� ����ϰ� �پ ǰ���� ������ ã�� �Һ��ڵ鿡�� �����ϴ�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>ĥ��(Chile)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Malbec 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>19,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count14"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(14)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 04 �� -->

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
					<strong id="wine_basket15">���� ���� ī������ �Һ�</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					�̱� ���� ������ ���� ������ ������ �����̾� ���� �귣�� �̴�.1967����� ���� ���� ���� ǰ������ ��ä�ο� ��Ÿ����
					������ ������ ����������, ���� ������ ������ AVA ��� ü���� ����� �� �������� ���̳ʸ��� �����ϴ�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>�̱�(U.S.A)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Cabernet Sauvignon 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>14��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>19,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count15"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(15)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 05 �� -->

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
					<strong id="wine_basket16">�Ѷ��̿� ��׸��� ����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					������ ���ϵ��� ������ ���� �� ������ ���� ǰ���� ������Ͽ� ���߷� ���� ������ ȥ���Ͽ� ������ �������� �������
					���� ���׸��� �Դϴ�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���丮Ƽ������</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(Spain)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Tempranillo</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>14��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>7,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count16"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(16)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 06 �� -->

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
					<strong id="wine_basket17">�� ��ǪƼ�� ��Ʈ �� �� ����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					M.��ǪƼ���� ���� ��Ʈ�������� �� ���� ������ �پ ���ε�θ� ������ GMS�������� �Ұ����� �̶�� ���� ������
					������ ��� ������� �ѹ��� �Ծ������ �����̶�� ���� �����ϰ� �ִ�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(France)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Grenache, Syrah/Shiraz,Mourvedre</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>14��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>14,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count17"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(17)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 07 �� -->

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
					<strong id="wine_basket18">�ƽ� ũ������</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					��Ŀ��Ʈ,������ �� ���� ������ ���� �Ʒθ��� ��ŷ� ���� ��������, �� �ٵ���� ź�� ���� ������, �ټ��� ����ִ�
					��̰� ��췯�� ���� ���� �ִ�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(Spain)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Tempranillo 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>14��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>23,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count18"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(18)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 08 �� -->

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
					<strong id="wine_basket19">���� ��� ����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					���� ���� ���� ������ ��� �÷��� �� Ŀ��Ʈ,�ڵ�, ü���� ���� �������� ���������� �������� �Ծȿ����� �ε巯��
					ź�Ѱ� ����� �굵�� �Ǹ��� �뷱���� �̷��.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(France)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Cabernet Sauvignon 50%, Merlot 50%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>16��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>17,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count19"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(19)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 09 �� -->

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
					<strong id="wine_basket20">��� ���� ��� ����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					������,�󽺺��� ������ �ż����� �����̸� �����̽��� �Ʒθ��� �뷱���� �̷�� �������� ������ ���� ���� �� �ִ� ������
					���� �����̴�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>�������</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(France)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Crenache 80%, Syrah/Shiraz 20%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>8,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count20"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(20)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- red 10 �� -->

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
					<strong id="wine_basket21">Ŭ���� ���� �Һ� ���</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					���� �ʷϻ��� ��� ������, �ż��� ������ϰ� ������,ǲǲ�� Ǯ������ ��������. �Ծȿ����� ����԰� ����� ������
					Ư¡���̴�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���丮Ƽ������</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��������(New Zealand)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Sauvignon Blanc 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>14��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>50,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count21"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(21)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 01 �� -->

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
					<strong id="wine_basket22">�׸��� ��Ŭ �Һ� ���</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					���� ���� ǳ�̿� �Բ� ����� ��̰� �Կ��� ������� ��췯����. ����� ��� źź�� ¥�ӻ��� ���� ȭ��Ʈ �����̴�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��Ż����(Italy)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Sauvignon Blanc 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13.5��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>45,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count22"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(22)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 02 �� -->

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
					<strong id="wine_basket23">�������� �׶� ������ ��� ���</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					�ſ� �������� ���������� ��Ʈ���� �� �׸��� ��� ���� �������� �Ծȿ��� �굵�� �������� ������ �� ���� �λ����̴�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>ĥ��(Chile)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Sauvignon Blanc 85%, Semillon 8%, Sauvignon Gris 7%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13.5��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>35,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count23"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(23)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 03 �� -->

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
					<strong id="wine_basket24">���� ���Ľ� ��������</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					���� ���ο� ���� ��� ���� ������ ���� ���� ��������. �����ƿ� ���ξ����� ���� �������ϰ� ��ȭ�� �̷�� ���ӷ���
					�پ�� ���� �����̴� �����̴�.
				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>ĥ��(Chile)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Chardonnay 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>49,00��</td>
					</tr>
					<tr>
						<td colspan="2">����:<input type="number" id="wine_count24"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(24)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 04 �� -->

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
					<strong id="wine_basket25">���̽��� ���� ��� ���</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					ǳ���ϰ� ����� �Ʒθ��� �Ծȿ��� �������� �굵�� ��޽����� �̳׶� ��ġ�� �Ǹ��� �뷱���� �̷��. Ư���� û������
					�߶����� �����̴� �����̴�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��������(New Zealand)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Sauvignon Blanc 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>35,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count25"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(25)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 05 �� -->

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
					<strong id="wine_basket26">����Ÿ 6 �����</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					���ξ���,���� ���� ���������� �м�Ǫ��Ʈ�� ������ ǳ�̰� �ŷ����� �������� ����� �̳׶���Ƽ�� �굵�� ��������
					�𽺱�� �ε巴�� �޴��� �������� �λ����� �����̴�.


				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��������(Portugal)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Fernao Pires 60%, Arinto 30%, Moscatel 10%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>19,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count26"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(26)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 06 �� -->

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
					<strong id="wine_basket27">��Ź�� ������</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					����Ʈ�� ���ſ� �� �߰����� �̸�, ������� ���̰�, �ε巴�⺸�� �Ÿ��� ���� ����.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>����(Germany)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Riesling 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>9,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count27"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(27)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 07 �� -->

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
					<strong id="wine_basket28">��Ÿ�������� �����յ� ��ī�� �ٽ�Ƽ</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					����,������ ��,���� �����ϰ� �ż��� ��Ʈ�� �ſ� �����̴� �����̴�. ��ü������ ������ �� �̷������ ������ �����Ѱ�
					�ż��� ���� �� ��췯�� ����� �����ϰ� ������ִ� ��ī�� �����̴�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>����Ʈ����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>��Ż����(Italy)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Moscato 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>6.5��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>19,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count28"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(28)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 08 �� -->

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
					<strong id="wine_basket29">�� ��ǪƼ�� ���� �� �� ���</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					������,�̳׶���Ƽ�� �������� �������� �� �⵵ ���Գ��� ���� �� �ִ�. �̵�� �굵���� ������ ������ ��ü������ ����
					�ż��� ������ �ִ� �����̴�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>������(France)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Grenache Blanc, Bourboulenc, Clairette</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>13��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>22,800��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count29"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(29)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 09 �� -->

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
					<strong id="wine_basket30">G7 ������ ��������</strong>
				</p>

				<div style="height: 20px"></div>
				<p style="text-font: 20px" class="txt23">
					<!-- �̸�Ʈ�� ���� �۱� -->
					���� Ȳ�ݻ��� ��� ������ ������,�ٳ���,��ġ,��Ʈ������ �ż��ϰ� ������ ��� �Բ� ����� �������, �ٴҶ� �Ʒθ���
					��� �� �ִ�. ǳ���� ������� ����ϰ� ���������ִ� ����� �������� �پ �����̴�.

				</p>
				<div style="height: 10px"></div>
				<table style="text-align: center; width: 500px;" class="txt23">

					<tr>
						<td>�뵵</td>
						<td>���̺����</td>
					</tr>
					<tr>
						<td>����</td>
						<td>ȭ��Ʈ����</td>
					</tr>
					<tr>
						<td>������</td>
						<td>ĥ��(Chile)</td>
					</tr>
					<tr>
						<td>���� ����</td>
						<td>Chardonnay 100%</td>
					</tr>
					<tr>
						<td>�絵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�굵</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>�ٵ�</td>
						<td>�� �� �� �� ��</td>
					</tr>
					<tr>
						<td>���ڿ�</td>
						<td>10��</td>
					</tr>
					<tr>
						<td>����</td>
						<td>14,000��</td>
					</tr>
					<tr>
						<td colspan="2">����: <input type="number" id="wine_count30"
							min="0" value="1" style="width: 40px" style="height:40px;">
							<button>
								<img src="images/icons/cart.png" alt="��ٱ���" onclick="WineAjax(30)"
									style="width: 30px">
							</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<!-- white wine 10 �� -->


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