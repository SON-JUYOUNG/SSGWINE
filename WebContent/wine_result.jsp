<%@page import="model.RecommendDTO"%>
<%@page import="model.recommend_dto"%>
<%@page import="model.recommend_dao"%>
<%@page import="model.WineDTO"%>
<%@page import="model.WineDAO"%>
<%@page import="model.Product_basketDTO"%>
<%@page import="model.Product_basketDAO"%>
<%@page import="model.Wine_basketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Wine_basketDAO"%>
<%@page import="model.User_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>검색결과</title>
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
.line{
border-bottom:1px solid #FFFFFF;
}
#input_img {
	max-width: 100%;
	height: auto;
}

.korean {
	font-family: "BMJUA_ttf";
}
</style>
<body class="animsition">
	<%
		User_MemberDTO user_dto = (User_MemberDTO) session.getAttribute("user_dto");
	%>

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
		style="background-image: url(images/wine08.jpg);">
		<h2 class="tit6 t-center">result</h2>
	</section>

	
	<div class="container" style="width:100%; max-width:100%; background-color: #3B0B17;">
		<% /* 나라 플라스크 값 받아오기!!!!!!!!!! */
	String result = request.getParameter("result");
	if( result != null){
	System.out.print(result);

	WineDAO wine_dao = new WineDAO();
	WineDTO wine_dto = wine_dao.wineOneSelect(result);
	wine_dto.getInfo();
	%>
		<!-- 와인검색결과 -->
		<div style="width:100%; height:60px;"></div>
		<div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25" 
			style="justify-content:center;">

			<h2 class="tit9 t-center" id="wine_basket"
				style="color: white; text-align: center; width:100%;" id="winename">
				<%= wine_dto.getWinename() %>
				
			<input type="number" id="wine_count"
						min="0" value="1" style="width: 40px" style="height:40px;">
						<button>
							<img src="images/icons/cart2.png" alt="장바구니"
								onclick="WineAjax()" style="width:30px;">
						</button>
				</h2>
				
			<% if(user_dto != null){%>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
         <script type="text/javascript">
               function WineAjax() {
                  var count = document.getElementById("wine_count").value;
                  $.ajax({
                     type : "post",
                     url : "InsertWineCart",
                     data : {"wine_basket" : '<%= wine_dto.getWinename() %>', "count" : count, "id": '<%=user_dto.getId() %>'}, 
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
                     dataType : "text",
                     success : function(data) {
                        alert("위시리스트에 저장되었습니다.")
                    	location.href = "wine_home.jsp";
                     },
                     error : function() {
                        alert("로그인 후 사용해주세요")
                     }
                  });
               }
      </script>
         <% } %>
				
				
				
			<div class="item-gallery isotope-item bo-rad-10 hov-img-zoom events guests"
				style="text-align: center; width:100%;">
				<img src="<%= wine_dto.getPicture() %>" alt="IMG-GALLERY"
					style="width: 400px; hegiht: 400px;">

				<div class="overlay-item-gallery trans-0-4 flex-c-m" >
					<a class="btn-show-gallery flex-c-m fa fa-search"
						href="<%= wine_dto.getPicture() %>" data-lightbox="gallery"></a>
				</div>
			</div>
			<div style="height: 10px;width:100%;"></div>
			<p class="txt21" style="text-font: 28px; color:white; width:700px;text-align:center;"><%= wine_dto.getInfo() %></p>
			<div style="height: 40px;width:100%;"></div>
			<div sytle="width=100%">
			<table border = "0" bordercolor="white" style="text-align: center; width: 500px; color: white; border-spacing:5px;"
				class="txt25">
				
				<tr>
					<td colspan="2" class="line"></td>
				</tr>
				<tr>
					<td class="line" style="font-weight:900; padding:10px; border-right: 1px solid white;">용도</td>
					<td class="line" style="padding:10px;"><%= wine_dto.getUse() %></td>
				</tr>
				
				<tr>
					<td class="line" style="padding:10px; font-weight:900; border-right: 1px solid white;">종류</td>
					<td class="line" style="padding:10px;"><%= wine_dto.getSort() %></td>
				</tr>
				<tr>
					<td class="line" style="padding:10px; font-weight:900;border-right: 1px solid white;">생산지</td>
					<td class="line" style="padding:10px;"><%= wine_dto.getArea() %></td>
				</tr>
				<tr>
					<td class="line" style="padding:10px; font-weight:900;border-right: 1px solid white;">포도 종류</td>
					<td class="line" style="padding:10px;"><%= wine_dto.getGrape() %></td>
				</tr>
				<tr>
					<td class="line" style="padding:10px; font-weight:900; border-right: 1px solid white;">당도</td>
					<td class="line" style="padding:10px;">
					<% int cnt1 = Integer.parseInt(wine_dto.getSugar());
					for(int i=0; i < 5;i++){
					if(i < cnt1){%>
					<%= "★ " %>
					<% }else{ %>
					<%= "☆ " %>
					<% }} %>
					</td>
				</tr>
				<tr>
					<td class="line" style="padding:10px; border-right: 1px solid white;font-weight:900;">산도</td>
					<td class="line" style="padding:10px;">
					<% int cnt2 = Integer.parseInt(wine_dto.getAcidity());
					for(int i=0; i < 5;i++){
					if(i < cnt2){%>
					<%= "★ " %>
					<% }else{ %>
					<%= "☆ " %>
					<% }} %>
					</td>
				</tr>
				<tr>
					<td class="line" style="padding:10px; border-right: 1px solid white;font-weight:900;">바디</td>
					<td class="line" style="padding:10px;">
					<% int cnt3 = Integer.parseInt(wine_dto.getBody());
					for(int i=0; i < 5;i++){
					if(i < cnt3){%>
					<%= "★ " %>
					<% }else{ %>
					<%= "☆ " %>
					<% }} %>
					</td>
				</tr>
				<tr>
					<td class="line" style="padding:10px; border-right: 1px solid white;font-weight:900;">알코올</td>
					<td class="line" style="padding:10px;"><%= wine_dto.getAlcohol() %></td>
				</tr>
				<tr>
					<td class="line" style="padding:10px; border-right: 1px solid white;font-weight:900;">가격</td>
					<td class="line" style="padding:10px;"><%= wine_dto.getPrice() %></td>
				</tr>
			</table>
			</div>
			<div style="width:100%;justify-content:center;">
			<table style="text-align: center; width: 500px; color: white; margin-left:auto; margin-right:auto;">
				<tr style="height:80px; font-size:20px;">
					<td colspan="2" style="font-size:30px; color:white;"> 추천 음식
					</td>
				</tr>
				
				<%
				recommend_dao re_dao = new recommend_dao();
				String wine_name = wine_dto.getWinename();
				ArrayList<RecommendDTO> re_list = re_dao.Recommend(wine_name);
				System.out.println(re_list.size());
				String product1 = re_list.get(0).getProduct_name();
				String product2 = re_list.get(1).getProduct_name();
				%>
			
				<tr style="height:80px; font-size:20px;">
					<td style="padding:10px; width:400px">
					<a style="font-size:20px;" id="result_product1"><%= product1 %></a>
					</td>
					<td style="width:100px;">
					<input type="number" id="recommend_product1"
						min="1" value="1" style="width: 40px" style="height:40px;">
						<button>
							<img src="images/icons/cart2.png" alt="장바구니" id="product_count1"
								onclick="productCall1()" style="width: 30px">
						</button>
					</td>
				</tr>
				 <% if(user_dto != null){ %>
                  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
               <script type="text/javascript">
            
               function productCall1() {
                  var count = document.getElementById("product_count1").value;
                  $.ajax({
                     type : "post",
                     url : "InsertProductCart",
                     data : {"product" : '<%= product1 %>', "count" : count, "id":'<%=user_dto.getId()%>'},
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                     dataType : "text",
                     success : function(data) {
                        alert("위시리스트에 저장되었습니다.")
                    	location.href = "wine_home.jsp";
                     },
                     error : function() {
                        alert("error")
                     }
                  });
               }
            </script>
            <% } %>
				
				
				<tr style="height:80px; font-size:20px;">
					<td style="padding:10px; width:400px">
						<a style="font-size:20px;" id="recommend_product2"><%= product2 %></a>
					</td>
					<td style="width:100px;">
						<input type="number" id="product_count2"
						min="1" value="1" style="width: 40px" style="height:40px;">
						<button>
							<img src="images/icons/cart2.png" alt="장바구니"
								onclick="productCall2()" style="width: 30px">
						</button>
					</td>
				</tr>
				
				 <% if(user_dto != null){ %>
                  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
               <script type="text/javascript">
            
               function productCall2() {
                  var count = document.getElementById("product_count2").value;
                  $.ajax({
                     type : "post",
                     url : "InsertProductCart",
                     data : {"product" : '<%= product2 %>', "count" : count, "id":'<%=user_dto.getId()%>'},
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                     dataType : "text",
                     success : function(data) {
                        alert("위시리스트에 저장되었습니다.")
                        location.href = "wine_home.jsp";
                     },
                     error : function() {
                        alert("error")
                     }
                  });
         
               }
            </script>

            </div>
            <%} %>
			</table>
			<div style="width:100%; height:200px;"></div>
		</div>
		</div>
</div>	
<% } %>
	<!-- 	</section> -->


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
	<script src="js/main.js"></script>
	<!-- <script src="js/imgupload.js"></script> -->
</body>
</html>