<%@page import="model.Product_basketDAO"%>
<%@page import="model.Wine_basketDAO"%>
<%@page import="model.Product_basketDTO"%>
<%@page import="model.Wine_basketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>와인추천</title>
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
<body class="animsition">
   <% 
   User_MemberDTO user_dto = (User_MemberDTO)session.getAttribute("user_dto");
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
      style="background-image: url(images/wine01.jpg);">
      <h2 class="tit6 t-center">Wine Recommend</h2>
   </section>



   <!-- Main menu -->
   <!-- 수빈 작업할 부분 -->
   <section class="section-mainmenu p-t-110 p-b-70 bg1-pattern">
      <div class="container">
         <div class="row">
            <div class="col-md-10 col-lg-6 p-r-35 p-r-15-lg m-l-r-auto">
               <div class="wrap-item-mainmenu p-b-22">
                  <h3 class="tit-mainmenu tit10 p-b-25 t-center">와인 추천</h3>
                  
 <!-- 질문 1 -->
                  <div class="item-mainmenu m-b-36">
                     <div class="flex-w flex-b m-b-3">
                        <p class="name-item-mainmenu txt22">원하는 와인 종류를 선택하세요</p>
                        <br>
                     </div>
                     <div class="line-item-mainmenu bg3-pattern"></div>
                     <div class="price-item-mainmenu txt21">
                     <form action="">
                        <input type="radio" name = "sort" value="레드와인"> 레드와인
                        <input type="radio" name = "sort" value="화이트와인"> 화이트와인
                        <input type="radio" name = "sort" value="스파클링와인"> 스파클링와인
                     </form>
                     </div>
                  </div>

                  <!-- 질문 2 -->
                  <div class="item-mainmenu m-b-36" >
                     <div class="flex-w flex-b m-b-3"style="text-align:center;">
                        <p href="#" class="name-item-mainmenu txt22">언제 드실 예정인가요?</p>
                     </div>
                     <div class="line-item-mainmenu bg3-pattern"></div>
                     <div class="price-item-mainmenu txt21">
                        <form action="">
                        <input type="radio" name="use" value="식전"> 식전
                        <input type="radio" name="use" value="식중"> 식중
                          <input type="radio" name="use" value="식후"> 식후
                        </form>
                     </div>
                  </div>

                  <!-- 질문 3 -->
                  <div class="item-mainmenu m-b-36">
                     <div class="flex-w flex-b m-b-3">
                        <p href="#" class="name-item-mainmenu txt22">원하는 당도를 설정하세요</p>
                     </div>
                     <div class="line-item-mainmenu bg3-pattern"></div>
                     <div class="price-item-mainmenu txt21">
                        <input type="number" max="5" min="1" value="1" id ="sugar">
                        <span class="info-item-mainmenu txt23">
                        1:낮은 당도 / 2:조금 낮은 당도 / 3:중간 당도 / 4:조금 높은 당도 / 5:높은 당도
                        </span>
                     </div>
                  </div>

                  <!-- 질문 4 -->
                  <div class="item-mainmenu m-b-36">
                     <div class="flex-w flex-b m-b-3">
                        <p href="#" class="name-item-mainmenu txt22">원하는 산도를 설정하세요</p>
                     </div>
                     <div class="line-item-mainmenu bg3-pattern"></div>
                     <div class="price-item-mainmenu txt21">
                        <input type="number" max="5" min="1" value="1" id ="acidity">
                        <span class="info-item-mainmenu txt23">
                        1:낮은 산도 / 2:조금 낮은 산도 / 3:중간 산도 / 4:조금 높은 산도 / 5:높은 산도
                        </span>
                     </div>
                  </div>

                  <!-- 질문 5 -->
                  <div class="item-mainmenu m-b-36">
                     <div class="flex-w flex-b m-b-3">
                        <p href="#" class="name-item-mainmenu txt22">원하는 바디를 설정하세요</p>
                     </div>
                     <div class="line-item-mainmenu bg3-pattern"></div>
                     <div class="price-item-mainmenu txt21">
                       <input type="number" max="5" min="1" value="1" id ="body">
                        <span class="info-item-mainmenu txt23">
                        1:낮은 바디감 / 2:조금 낮은 바디감 / 3:중간 바디감 / 4:조금 높은 바디감 / 5:높은 바디감
                        </span>
                     </div>

                  </div>

               </div>

               <input type="button" onclick="WineAjax2()" value="submit" class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto">

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
               <script type="text/javascript">
            
               function WineAjax2() {             
                  var sort = document.getElementsByName("sort");
                  var use = document.getElementsByName("use");
                  var sugar = document.getElementById("sugar").value;
                  var acidity = document.getElementById("acidity").value;
                  var body = document.getElementById("body").value;
                  
                  var display = document.getElementById(".col-md-10 col-lg-6 p-l-35 p-l-15-lg m-l-r-auto");
                  for(var i=0; i < sort.length; i++) {
                     if(sort[i].checked === true) { // checked 속성이 true 와 같은지 비교합니다.
                        console.log(sort[i].value); // 만 출력합니다.
                        var sort_plus = sort[i].value;
                        } 
                     }
                  
                  for(var i=0; i < use.length; i++) { if(use[i].checked === true) { // checked 속성이 true 와 같은지 비교합니다.
                     console.log(use[i].value); //blue 만 출력합니다.
                     var use_plus = use[i].value;
                     } }
                  
                  $.ajax({
                     type : "post",
                     url : "recommend",
                     data : {"sort_plus" : sort_plus, "use_plus" : use_plus, "sugar" : sugar, "acidity" : acidity, "body" : body},
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
                     dataType : "json",
                     success : function(data) {
                        console.log(data);
                        $("#display").show();
                        //alert("상품추천되었음")                       
                        //DB에서 가져온 와인이름, 사진주소 값 저장
                        $("#winename").html(data.winename);
                        $("#wineimg").attr("src", data.picture);
                        
                        //DB에서 가져온 추천상품을 아래에다가 저장해서 해당  id에 보내줘야함
                        $("#recommend_product1").html(data.reArrayList[0].product_name);
                        $("#recommend_product2").html(data.reArrayList[1].product_name);
                        console.log(sort_plus, use_plus, sugar, acidity, body); 
    					                 
  //                      $(".col-md-10 col-lg-6 p-l-35 p-l-15-lg m-l-r-auto").attr("style","display="block"");
                     },
                     error : function() {        
                        alert("error");
                        console.log(sort_plus, use_plus, sugar, acidity, body)
                     }
                  });
               
               }
            </script>
                        

         </div>
      <!-- 와인 추천 결과 -->

<!-- 결과 표시!!!!! -->
         <div  class="col-md-10 col-lg-6 p-l-35 p-l-15-lg m-l-r-auto">
<div id="display" style="display:none">
            <div class="wrap-item-mainmenu p-b-22">
               <h3 class="tit-mainmenu tit10 p-b-25 t-center">추천와인 & 음식</h3>
               <!-- Item mainmenu -->
               
               <div class="item-mainmenu m-b-36" style="align:center">
                     <p style="text-align:center">
                     <img alt="와인 사진"  style="width:300px"id="wineimg">
                     </p>
                     
                     <h2 class="tit9 t-center"><div id="winename"></div>
</h2>
                     <div class="name-item-mainmenu txt21 t-center">
                        <input type="number" id="wine_count" min="0" value="1" style="width:40px" style="height:40px;">
                        <button>
                           <img src="images/icons/cart.png" alt="장바구니" onclick="WineAjax()" style="width:30px">
                        </button>
                     
                     </div>
               </div>
               
               <% if(user_dto != null){%>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
         <script type="text/javascript">
               function WineAjax() {                  
                  var wine_basket = document.getElementById("winename").innerHTML;
                  var count = document.getElementById("wine_count").value;
                  
                  $.ajax({
                     type : "post",
                     url : "InsertWineCart",
                     data : {"wine_basket" : wine_basket, "count" : count, "id": '<%=user_dto.getId() %>'}, 
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
                     dataType : "text",
                     success : function(data) {
                        alert("위시리스트에 저장되었습니다.")
                    	location.href = "wine_recommend.jsp";
                     },
                     error : function() {
                        alert("로그인 후 사용해주세요")
                     }
                  });
               }
      </script>
         <% } %>
            
                  <div class="item-mainmenu m-b-36">
                     <div class="name-item-mainmenu txt22"> 이 음식과 같이 먹으면 어떨까요?</div>                     
                     <div class="line-item-mainmenu bg3-pattern"></div>
                     <div class="name-item-mainmenu txt21 t-right" >
                        
                        <!-- 주영 추가해야할 ID위치 -->
                        <b id="recommend_product1"></b>
                        <input type="number" id="product_count1" min="1" value="1" style="width:40px">
                        <button>
                           <img src="images/icons/cart.png" alt="장바구니" onclick="productCall1()" style="width:30px">
                        </button>
                     </div>
                  </div>
                 
                  <% if(user_dto != null){ %>
                  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
               <script type="text/javascript">
            
               function productCall1() {
                  var product = document.getElementById("recommend_product1").innerHTML;
                  var count = document.getElementById("product_count1").value;
                  $.ajax({
                     type : "post",
                     url : "InsertProductCart",
                     data : {"product" : product, "count" : count, "id":'<%=user_dto.getId()%>'},
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                     dataType : "text",
                     success : function(data) {
                        alert("위시리스트에 저장되었습니다.")
                    	location.href = "wine_recommend.jsp";
                     },
                     error : function() {
                        alert("error")
                     }
                  });
               }
            </script>
            <% } %>
            
                  <div class="item-mainmenu m-b-36">
                     <div class="name-item-mainmenu txt22"> 이 음식과 같이 먹으면 어떨까요?</div>                     
                     <div class="line-item-mainmenu bg3-pattern"></div>
                     <div class="name-item-mainmenu txt21 t-right" id="product">
                     <!-- 주영 추가해야할 ID위치 -->
                    <b id="recommend_product2"></b>
                        
                        <input type="number" id="product_count2" min="1" value="1" style="width:40px">
                        <button>
                           <img src="images/icons/cart.png" alt="장바구니" onclick="productCall2()" style="width:30px">
                        </button>
                     </div>
                  </div>
                  <% if(user_dto != null){ %>
                  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
               <script type="text/javascript">
            
               function productCall2() {
                  var product = document.getElementById("recommend_product2").innerHTML;
                  var count = document.getElementById("product_count2").value;
                  
                  $.ajax({
                     type : "post",
                     url : "InsertProductCart",
                     data : {"product" : product, "count" : count, "id":'<%=user_dto.getId()%>'},
                     contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                     dataType : "text",
                     success : function(data) {
                        alert("위시리스트에 저장되었습니다.")
                        location.href = "wine_recommend.jsp";
                     },
                     error : function() {
                        alert("error")
                     }
                  });
         
               }
            </script>

            </div>
            <%} %>
            
         </div>
         </div>
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