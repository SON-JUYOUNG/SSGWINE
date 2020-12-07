<%@page import="model.User_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<!DOCTYPE html>
<html lang="en">
<head>
   <title>회원가입</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<!--===============================================================================================-->
   <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="fonts/themify/themify-icons.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="vendor/lightbox2/css/lightbox.min.css">
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
						%>
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
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</header>



   <!-- Title Page -->
   <section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(images/wineglass.jpg);">
      <h2 class="tit6 t-center">
         
      </h2>
   </section>


   <!-- Reservation -->
   <section class="section-reservation bg1-pattern p-t-100 p-b-113">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 p-b-30">
               <div class="t-center">
                  <span class="tit2 t-center">
                     Join
                  </span>

                  <h3 class="tit3 t-center m-b-35 m-t-2">
                     Wine Place
                  </h3>
               </div>

               <form action="Join" method="post" class="wrap-form-reservation size22 m-l-r-auto">
                  <div class="row">
                     <div class="col-md-4">
                     </div>
                     <div class="col-md-4">
                        <!-- ID -->
                        <span class="txt9">
                           ID
                        </span>
                        <div class="wrap-inputtime size12 bo2 bo-rad-10 m-t-3 m-b-23"> 
                        <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="id" placeholder="이마트몰과 동일한 ID를 입력하세요">
                        
                        </div>
                     </div>
               <div class="col-md-4"></div>
                  </div><!--row  -->

                  <div class="row">
                     <div class="col-md-4"></div>

                     <div class="col-md-4">
                        <!-- Pw -->
                        <span class="txt9">
                         PW
                        </span>

                        <div class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23">
                           <input class="bo-rad-10 sizefull txt10 p-l-20" type="password" name="pw" placeholder="이마트몰과 동일한 PW를 입력하세요">
                           
                        </div>
                     </div>
                        
                  </div>
                  
                  <div class="row">
                     <div class="col-md-4"></div>

                     <div class="col-md-4">
                        <!-- NAME -->
                        <span class="txt9">
                         NAME
                        </span>

                        <div class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23">
                           <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="name" placeholder="이름">
                        </div>
                     </div>
                        
                  </div>
                  
                     <div class="row">
                     <div class="col-md-4">
                     
                     </div>

                     <div class="col-md-4">
                        <!-- email -->
                        <span class="txt9">
                         EMAIL
                        </span>

                        <div class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23">
                           <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="email" placeholder="이메일">
                        </div>
                     </div>

                  </div>
                  
                           <div class="row">
                     <div class="col-md-4">
                     
                     </div>

                     <div class="col-md-4">
                        <!-- NAME -->
                        <span class="txt9">
                         PHONE
                        </span>

                        <div class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23">
                           <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="tel" placeholder="전화번호">
                        </div>
                     </div>

                     <div class="col-md-4">
                     </div>
                        
                  </div>
                  

                  <div class="wrap-btn-booking flex-c-m m-t-6">
                     <!-- Button3 -->
                     <button type="submit" class="btn3 flex-c-m size13 txt11 trans-0-4">
                        Join
                     </button>
                  </div>
               </form>
            </div>
         </div>

         
      </div>
   </section>


   


   <!-- Back to top -->
   <div class="btn-back-to-top bg0-hov" id="myBtn">
      <span class="symbol-btn-back-to-top">
         <i class="fa fa-angle-double-up" aria-hidden="true"></i>
      </span>
   </div>

   <!-- Container Selection1 -->
   <div id="dropDownSelect1"></div>



<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
   <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/daterangepicker/moment.min.js"></script>
   <script type="text/javascript" src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/slick/slick.min.js"></script>
   <script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/parallax100/parallax100.js"></script>
   <script type="text/javascript">
        $('.parallax100').parallax100();
   </script>
<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
   <script type="text/javascript" src="vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
   <script src="js/main.js"></script>

</body>
</html>
    