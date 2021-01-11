<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery KAS</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/creative.css" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&display=swap&subset=korean" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR:300,400,700&display=swap&subset=korean" rel="stylesheet">
    <link rel='stylesheet' id='content-css'  href='css/content.css' type='text/css' media='all' />
   <link rel='stylesheet' id='global-css'  href='css/global.css' type='text/css' media='all' />
   <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
   <script src="js/jquery.form.min.js"></script>
   <script src="js/jquery.validate.min.js"></script>
   <script src="js/vue.min.js"></script>
   <script src="js/jquery.cookie.js"></script>

   <script src="js/moment.min.js"></script>
   <script src="js/moment-timezone-with-data.min.js"></script>

   <script src="/js/vueComponent/vue-filter.js"></script>
   <script src="/js/app/App.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script src="js/logout.js"></script>


    <style>
    	
		* {margin:0; padding:0;}
        ul,ol,li{list-style:none;}
        a, p, span{text-decoration: none; color:black; !important;}

		a:visited{
                color: #6666;!important;
            }
		
		@media screen and (max-width:505px){
			.login{
				margin-top:0px;
				background-color:yellow;
			}
		}
		@media screen and (min-width:506px){
			.login{
				margin-top:-50px;
				margin-right:115px;
			
			}
		
       .txt{display: block;content:'';clear:both;position:relative;}

        .txt li{
            float:left;
            width: 130px;
            height: 27px;
            line-height: 27px;
            text-align: center;       
            color:white;
            font-size:14px;
            font-weight:700;
            background-color: rgba(0,0,0,0.4);}
        .txt h3 p {
            display: block;
        }
    

        
        
        .left{
            position:absolute;
            left:60px;
            top:420px;}
        
        .right{
            position:absolute;
            left:1265px;
            top:420px;}
        
        
        
        /* txt 1 */
        .txt_box {
            display: block;
            content: '';
            clear:both;            
        }

        .txt1 {position:relative;}
        .txt1 .box1{
            position:absolute;
            left:10%;
            margin-top:40%;
        }
        .txt1 h3 {
            position:absolute;
            left:10%;
            margin-top:35%;
            color:white;
            font-size:45px;    
        }
        .txt1 p {
            position:absolute;
            left:23px;
            margin-top:0%;
            color:white;
        }

        .txt1 li:nth-child(1){background-color:skyblue;}
        .txt1 li:nth-child(2){
            width: 140px;
        }
        .txt1 li:nth-child(2):after{
            position:absolute;
            left:275px;
            top:0px;
            content:"|";
        }
        .txt1 li:last-child{
            width: 100px;
        }
        
        .txt1 .see a{
            position:absolute;
            display: block;
            left:0px;
            top:350px;
            width: 260px;
            height: 60px;
            color:white;
            line-height: 60px;
            text-align: center;
            background-color:black;
        }

        .txt_box>.txt1>.imgbox{
            position:relative;
            left:0;
            top:100px;
            z-index:-1;
            width: 100%;height: 850px;background-image: url(imgs/main_img.png);
			background-position:50%;
            background-repeat:no-repeat;
        }
        
        

        
        /* section1 */
        .section1:after{
              display:block;
            content:'';
            clear:both;           
        }
        .section1 .kas_gall {
        	margin-top:7%;   
            margin-left:6.8%;   
        
        }
        .section1 .kas_gall li{
            float:left;
        }
        .section1 .kas_gall li:nth-child(1){
            margin-right:65px;
        }
        .section1 .kas_gall li:nth-child(2){
            margin-right:65px;
        }
     
        .section1 .kas_gall li a { }
        .section1 .kas_gall li a .category{
            display:block;
            font-size: 1em;
            margin-top:3px;
            color:#666;
        }
        .section1 .kas_gall li a .title{
            display:block;
            font-size: 1.7em;
            margin-top:2px;
            margin-bottom:3px;
        }
        .section1 .kas_gall li a .date{
            display:block;
            font-size: 1.3em;
            color:#666;
        }

		/* section2 */
        .section2:after{

		}

        .section2 .autor a img {
            position:relative;
            float:left;
            width: 57%;
            margin-left:6.8%;  
            margin-top:7%;
          
        }
        .section2 .autor a:after {        
			display:block;
            content:'';
            clear:both;	
        }        
        .section2 .autor a .text {        
            float:left;
            display:block;    
            width:500px;       
        
            margin-left:3%;
            margin-top:7%;
            margin-bottom:30%;!important;
        }
        .section2>.autor>a>.text>.category {
            position:absolute;
            margin-bottom: 20px;
            width:500px;
         	line-height:1.5;
            color:#666;
            font-size:1.875em;
            text-align: center;
        }
        .section2>.autor>a>.text>.title {
            position:absolute;
            display:block;
			width:500px;
            font-size: 2.625em;
            margin-top: 5%;
            margin-bottom:10%;
            text-align: center;
        }
        .section2 .autor a .text .excerpt {
            position:absolute;
            display:block;
            width:500px;
            color:#666;
            margin-top: 15%;!important;
            margin-bottom:50px;
            font-size: 1.9em;
            line-height: 1.5;
            text-align: center;

        }
        .section2 .autor a .text .go {  
       	   position:absolute;
       	   width:500px;
           margin-top:30%;
           margin-left:0px;
		   text-align:center;
		   
        }
 
        .section2 .autor a .text .go .goReview {  
           padding:10px;
           border:1px solid #666;
           font-size:1.1em;
           color:#666;
        }
        
        /* 섹션 3 */
        .section3:after{	
	
        }
       .section3  .gall_list:after{	
			display:block;
            content:'';
            clear:both;			
        }
        .section3  .gall_list{
			display:block;		
			margin-left:7%;	
		
			margin-top:5%;
        }        
        .section3  .gall_list li {
       		float:left;
			display:inline-block;
            margin-right:50px;
          	margin-bottom:80px;

        }

		.section3  .gall_list li:nth-child(4n+0){
           margin-right:0; 
        }
    
        .section3  .gall_list li a .category2{
            margin-top:3px;
            font-size: 1em;
            color:#666;
        }
        .section3  .gall_list li a .title2{
            display:block;
            font-size: 1.7em;
            line-height: 1.5;
        }
        .section3  .gall_list li a .date2{
            display:block;
            font-size: 1.2em;
            line-height: 1.3;
            margin-top:3%;
            color:#666;
        }

		/* load-more */
		.load{
			display:block;
            content:'';
            clear:both;		
			margin-bottom:5%;
			margin-left:7%;
		}
		.load .load-more p{
			width:150px;
			height:100%;
			text-align:center;
			
		}
		.load .load-more a{		
			margin-left:45%;
			
			font-size:18px;
			padding: 18px 15px 15px;
			height:100px;
			border: 1px solid #d6d6d6;
		}

	#footer:after {

	}
		
		
		
		
		}

    </style>
    
    
    <script src="js/jquery-1.12.4.js">
    </script>




</head>
<body>
    <div id="Gallery_KAS" style='margin:0 auto; max-width:1920px;'>
   <header>

	 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
	 <nav class="navbar navbar-expand-md navbar-dark fixed-top " style="background-color:white; !important;box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 20px;margin:0 auto; max-width:1920px; ">
	    <a class="navbar-brand" href="index.kas" style="margin-left:7%;height:105px; padding-top:40px;"><img src="imgs/logo.png" alt="logo"></a>
	
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" style="background-color:black;">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarCollapse" style="padding-top:8px; padding-left:840px;">

	      <ul class="navbar-nav mr-auto">
	        <li class="nav-item active" style="margin-right:10%">
	          <a class="nav-link" href="exhibit.kas?m=artists" style="color:black;!important;font-size:20px;!important;">Artists<span class="sr-only">(current)</span></a>
	        </li>
	        <li class="nav-item" style="margin-right:10%!important;">
	          <a class="nav-link" href="exhibit.kas?m=exhibition" style="color:black;!important;font-size:20px;!important;">Exhibitions</a>
	        </li>
	        <li class="nav-item" style="margin-right:10%!important;">
	          <a class="nav-link" href="review.kas?m=review&cp=1&ps=5" style="color:black;!important;font-size:20px;!important;">Review</a>
	        </li>
	        <li class="nav-item" style="margin-right:10%!important;">
			          <a class="nav-link" href="exhibit.kas?m=about" style="color:black; !important;font-size:20px;!important;">About</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="exhibit.kas?m=search" tabindex="-1" aria-disabled="true" style="color:black; !important;font-size:20px;!important;">Search</a>
	        </li>
	        </ul>	

	        </div>  
		        <c:if test="${empty loginUser}">  
		           <a class="login" href="member.kas?m=form" >Login</a>
		        </c:if>
		         <c:if test="${!empty loginUser}">
				    <a class="login logout" href="#" onclick="logout()" style="margin-top:-50px;margin-right:115px;">Logout</a>
		 			<c:if test="${!empty likeList}">
		            <div class="login myList2" ><a class="MyList" href="exhibit.kas?m=getMyList" style="margin-top:-50px;margin-right:135px;">MyList</a></div>
		            </c:if>
		        </c:if>	 
	       </nav>  	
	       
	 <!--     </div>  -->
	 <!--  
	    <div class="collapse navbar-collapse" id="navbarCollapse">
	      <ul class="navbar-nav mr-auto" style="padding-left:42%;">
	        <li class="nav-item active" style="margin-right:30%;!important;">
	          <a class="nav-link" href="exhibit.kas?m=artists" style="color:black;!important;font-size:20px;!important;">Artists<span class="sr-only">(current)</span></a>
	        </li>
	        <li class="nav-item" style="margin-right:30%;!important;">
	          <a class="nav-link" href="exhibit.kas?m=exhibition" style="color:black;!important;padding-right:60%;!important;font-size:20px;!important;">Exhibitions</a>
	        </li>
	        <li class="nav-item" style="margin-right:30%;!important;">
	          <a class="nav-link" href="review.kas?m=review&cp=1&ps=5" style="color:black;!important;font-size:20px;!important;">Review</a>
	        </li>
	        <li class="nav-item" style="margin-right:30%;!important;">
			          <a class="nav-link" href="exhibit.kas?m=about" style="color:black; !important;font-size:20px;!important;">About</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="exhibit.kas?m=search" tabindex="-1" aria-disabled="true" style="color:black; !important;font-size:20px;!important;">Search</a>
	        </li>
	        </ul>
	        </div>
	  -->       
	      <%-- 
		  <div id="login" >
		  	<c:if test="${empty loginUser}">
	           <a class="login" href="member.kas?m=form" style="margin-right:115px; margin-top:-50px;float:right;">Login</a>
	        </c:if>
	         <c:if test="${!empty loginUser}">
			    <a class="login" href="#" onclick="logout()" style="margin-right:115px; margin-top:-50px;float:right;">Logout</a>
	 			<c:if test="${!empty likeList}">
	            <div class="myList2" style="margin-top:-50px;margin-right:200px;float:right;"><a class="MyList" href="exhibit.kas?m=getMyList">MyList</a></div>
	            </c:if>
	        </c:if>	       
		  </div>
		
		  	  	<c:if test="${empty loginUser}">
	           <li class="nav-item">
					<a class="nav-link" class="login" href="member.kas?m=form" style="color:black; !important; position:absolute; top:0%; right:10%; padding-right:100px;font-size:20px;!important;">Login</a>
				</li>
				
	        </c:if>
	         <c:if test="${!empty loginUser}">
			    <li class="nav-item">
					<a class="nav-link" class="login" href="#" onclick="logout()" style="color:black; !important;
					margin-top:-40px;margin-left:-160px;font-size:18px;!important;">Logout</a>
				</li>
	 			<c:if test="${!empty likeList}">
				<li class="nav-item">
							   <a class="nav-link" href="exhibit.kas?m=getMyList" 
							   style='color:black; !important;margin-top:-40px;margin-left:-70px;font-size:18px;!important;'>MyList</a>
				</li>
	            </c:if>
	        </c:if>	 
		
	  --%>
	




<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="">
		
	  </li>
      <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="2" class=""></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect>
			<p style="width:1640px;height:850px;margin:0 auto;background-image: url(imgs/main_img1_1.jpg);
					background-position:50%; background-repeat:no-repeat;"></p>
		</rect></svg>

        <div class="container">
          <div class="carousel-caption text-left">
         <!--    <h1>Example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
           <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>  -->
          </div>
        </div>
      </div>



      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect>
			<p style="width:100%;height:850px;background-image: url(imgs/toulouse.jpg);
					background-position:50%; background-repeat:no-repeat;"></p>
		</rect></svg>
        <div class="container">
          <div class="carousel-caption text-left">
           <!--     <h1>툴루즈 로트렉 展</h1>
            <p>20/06/10 ~ 20/07/25</p>
        <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>  -->
          </div>
        </div>
      </div>


      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect>
			<p style="width:100%;height: 850px;background-image: url(imgs/ann.jpg);
					background-position:50%; margin:0 auto;background-repeat:no-repeat;"></p>
		</rect></svg>


        <div class="container">
          <div class="carousel-caption text-left">
        <!--    <h1>One more for good measure.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>  -->
          </div>
        </div>
      </div>
    </div>



    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev" style='margin-top:5%;'>
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next" style='margin-top:5%;'>
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


	</header>



		<section class="section1">
			<div class="kas_gall">

					<c:forEach items="${Exhibit2}" var="exhibit">								
						<li >
							<a href="exhibit.kas?m=exhibitBoard&Exh=${exhibit.code}">
								<figure><img src='${exhibit.poster}' alt="" style='width:504px; height:100%;'></figure>
								<span class="category2" style='color: #888888; display:block;font-size:1.5em;'>${exhibit.artist}</span>
								<span class="title2" style='font-size:2em; display:block;f'>${exhibit.title}</span>
                                <span class="date2">${exhibit.e_date}</span>
							</a>
						</li>
				</c:forEach>
				
				
				</ul>
			</div>
		</section>
                 
        <section class="section2">  
            <div class="autor">
				<a href="review.kas?m=review">  
					<figure><img src="poster/event.jpg" alt=""></figure>
					<div class="text">
						<span class="category" >Event</span>
						<span class="title">회원가입 + <br/>REVIEW 작성 EVENT</span>
						<span class="excerpt">회원가입 후 <br/> 전시 후기를 남겨주시면 <br/> 툴루즈 로트렉 展 <br/>도록 할인권을 드립니다.<br></span>
						<p class="go"><span class="goReview">Review 작성하러 가기 →</span></p>
					</div>
				</a>
            </div>
      </section>
        <%--  
		<section class="section3"> 
			<div class="gall_list">
				<ul>
								
				<c:forEach items="${Exhibit}" var="exhibit">						
						<li> 
							<a href="exhibit.kas?m=exhibitBoard&Exh=${exhibit.code}">
								<figure><img src='${exhibit.poster}' alt="" style='width:362px; height:100%;'></figure>
								<span class="category2" style='color: #888888'>${exhibit.artist}</span>
								<span class="title2">${exhibit.title}</span>
                                <span class="date2">${exhibit.e_date}</span>
							</a>
						</li>
				</c:forEach>
				
						
				</ul>
			</div> 
	
		</section>
		
		--%>   
		<section class="recent-posts vuelayer">
   <div class="post-list column-4">
      <ul>
      <!--
         <c:forEach items="${Exhibit}" var="exhibit">                  
                  <li> 
                     <a href="exhibit.kas?m=exhibitBoard&Exh=${exhibit.code}">
                        <figure><img src='${exhibit.poster}' alt="" style='width:362px; height:100%;'></figure>
                        <span class="category2" style='color: #888888'>${exhibit.artist}</span>
                        <span class="title2">${exhibit.title}</span>
                                <span class="date2">${exhibit.e_date}</span>
                     </a>
                  </li>
         </c:forEach>
         -->
         
      
      
      
      <c:forEach items="${Exhibit}" var="exhibit">   
      <li class="">
         <a href="exhibit.kas?m=exhibitBoard&Exh=${exhibit.code}">
            <figure>
            <img src='${exhibit.poster}' alt="">
            </figure> <span class="category">${exhibit.artist}</span> 
            <span class="title">${exhibit.title}</span> 
            <span class="excerpt">${exhibit.e_date} </span></a>
         </a></li>
      </c:forEach>   
<!--
      <li class="">
      <a href="/story/view/20000000112">
      <figure><img src="/public/2020/06/30/10/34/36/baf45cea-a3c2-4cc4-9767-f9d61ad7d903.crop_small.jpg" alt=""></figure> <span class="category">News</span> <span class="title">Iván Navarro 이반 나바로 : The Ladder</span> <span class="excerpt">Iván Navarro’s first permanent site-specific public artwork, "The Ladder," has been unveiled by Shorenstein Residential for its new apartment building, 50 Jones, in San Francisco</span></a></li><li class=""><a href="/story/view/20000000111"><figure><img src="/public/2020/06/26/18/31/57/96d92504-b323-4bab-8cc5-411f1b65f086.crop_small.jpg" alt=""></figure> <span class="category">Press</span> <span class="title">"A Full View, at Last, of Modern Art in South Korea"</span> <span class="excerpt">Reviewing the art book "Korean Art from 1953: Collision, Innovation, Interaction,"&nbsp;which outlines the history of Korean contemporary art, Jason Farago, an art critic for the New York Times.</span></a></li><li class=""><a href="/story/view/20000000109"><figure><img src="/public/2020/06/25/13/58/14/d42704d2-3b92-4461-9ceb-86f697e70eac.crop_small.jpg" alt=""></figure> <span class="category">Essays</span> <span class="title">Yoo Geun-Taek 유근택 : Normandy</span> <span class="excerpt">Here we introduce Yoo Geun-Taek essay, photographs and new paintings produced in Normandy. </span></a></li><li class=""><a href="/story/view/20000000108"><figure><img src="/public/2020/06/23/18/9/6/28b5de58-2b46-4f3f-a4e5-d029ba080c26.crop_small.jpg" alt=""></figure> <span class="category">Press</span> <span class="title">Yang Jung Uk 양정욱 : Scenery of Dialogue</span> <span class="excerpt">Yang Jung Uk has gained renown in the art scene for his lyrical and synaesthetic works featuring sound, light, and movement. You can find an interview with him in GQ Korea's June issue.&nbsp;</span></a></li><li class=""><a href="/story/view/20000000099"><figure><img src="/public/2020/05/30/17/43/16/b2ee9062-38a0-4b01-b02a-97cc4ca51a83.crop_small.jpg" alt=""></figure> <span class="category">Essays</span> <span class="title">Nam June Paik 백남준 : Marco Polo</span> <span class="excerpt">Nam June Paik’s 1993 piece "Marco Polo" gave new expression to this historical figure in the form of a TV robot.</span></a></li><li class=""><a href="/story/view/20000000098"><figure><img src="/public/2020/05/30/11/43/22/ae53735e-9e9f-40d4-a8da-a9e4e570bdf7.crop_small.jpg" alt=""></figure> <span class="category">Essays</span> <span class="title">Lee Jung Seob 이중섭 : Bull</span> <span class="excerpt">Painted in 1953, "Bull" is one of Lee Jung Seob’s most recognizable work.</span></a></li></ul></div> <div class="pagination"><a href="javascript:;" class="load-more">Load More</a>
     -->   
     
     
      </div></section>
      
      
      
      
      
      
			<div class="load"> 
			<p class="load-more"><a href="#">TOP ↑</a></p>
		 </div>
	</div>   
	
  <footer id="footer">

	<div class="social-channel">
	   <ul>
		  
		  <li class="instagram"><a href="https://www.instagram.com/galleryhyundai/" target="blank">HYUNGSUB KIM</a></li>
		  <li class="facebook"><a href="https://www.facebook.com/galleryhyundai" target="blank">JOOHYUN ANN</a></li>
		  <li class="twitter"><a href="https://twitter.com/GalleryHyundai1" target="blank">JIHEE SEO</a></li>
	   </ul>
	</div>
	<div id="newsletter" class="newsletter-form">
	   <h2>Subscribe to stay up-to-date on our artists, exhibitions, news, and more.</h2>
	   <form id="newsletterForm" name="newsletterForm" method="POST" autocomplete="off" novalidate
			 onsubmit="return onsubmitNewsLetter()">
		  <div class="box">
			 <input type="text" name="email" id="email" required placeholder="Email address" maxlength="50">
			 <button type="submit">전송</button>
		  </div>
		  <p>By submitting your email address, you consent to receive our Newsletter. Your consent is revocable at any time by clicking the unsubscribe link within our mailings. Personal information is not used for any purpose other than to provide the information requested.</p>
		  <input type="checkbox" name="privacy" id="privacy">
		  <label for="privacy" tabindex="0">I agree</label>
	   </form>
	   <button type="button" class="close btnCloseNewsLetter">닫기</button>
	</div>
	<address>#3 89 Mapo-daero Mapo-gu Seoul Republic of Korea</address>
	<p class="copyright">Gallery KAS - All rights reserved 2020</p>


   <script type="text/javascript" src="js/ui.js"></script>
<script>
   $(function() {
      $('.btnCloseNewsLetter').on('click', function() {
         $('form#newsletterForm')[0].reset();
      });

   });

   function onsubmitNewsLetter() {
      var $form = $('form#newsletterForm');
      var $email = $form.find('#email');
      var $privacy = $form.find('#privacy');

      if (!$email.val().trim()) {
         alert('이메일주소를 입력해 주세요.');
         $email.focus();
         return false;
      }
      if (!$privacy.is(":checked")) {
         alert('개인정보 수집 및 이용에 동의해 주세요.');
         return false;
      }

      $.ajax({dataType : 'json', type : 'post',
         contentType : 'application/json',
         url : '/gallery/newslp/submit',
         data : JSON.stringify({
            email : $email.val().trim(),
         }),
      }).done(function(data) {
         if ('duplicated' == data.result) {
            alert('이미 등록된 이메일 주소입니다.');
            return false;
         } else {
            alert('등록되었습니다.');
            $('form#newsletterForm')[0].reset();
            $('.btnCloseNewsLetter').trigger('click');
            return false;
         }

      });
      return false;

   }
		</script>
   </footer>

</body>
</html>