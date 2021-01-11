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
    <link href="https://stazxckpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">

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

       .logo_main{
           
		    background-color: white; 
        }
		.logo_back {
			position:fixed;
			width:100%;
            height: 105px;
            background-color: white;    
			z-index:1;
		}
        .main_this {position:fixed;width:100%;}
        .main_1{display: block;content:'';clear:both;}
        .main_1 .logo a img{position:absolute;padding-top:40px;margin-left:7%;width:190px;}

		
        .menu{position:fixed;margin-left:55.5%;margin-top:42px;}
		.menu>.menu1:after{
            display:block;
            content:'';
            clear:both;
		}
        .menu>.menu1{display:block;content:'';clear:both;}
        .menu>.menu1>li{float:left;line-height:22px;padding-right:100px;height:100%;font-size:18px;}
		.menu>.menu1>li>a:nth-child(4){padding-right:0px};
        .menu>.menu1>li>a{color:#787878;}
			
		.logo_back .login{
			float:right;
			font-size:11pt;
			padding-right:7%;
			padding-top:10px;
			color:#787878;
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
            left:23px;
            margin-top:36%;
        }
        .txt1 h3 {
            position:absolute;
            left:23px;
            margin-top:30%;
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
            position:absolute;
            left:0;
            top:0;
            z-index:-1;
            width: 100%;height: 600px;background-image: url(imgs/main_img.png);background-position:50%;
            background-repeat:no-repeat;
        }
        
        
        
        /* txt 2 */
        .txt_box {
            display: block;
            content: '';
            clear:both;            
        }
        
        .txt2 h3 {
            position:absolute;
            left:177px;
            top:160px;
            color:white;
            font-size:60px;    
        }
        .txt2 p {
            position:absolute;
            left:177px;
            top:236px;
            color:white;
        }
        .txt2 .see a{
            position:absolute;
            display: block;
            left:0px;
            top:145px;
            width: 260px;
            height: 60px;
            line-height: 60px;
            text-align: center;
            color:white;
            background-color:black;
        }
        
        .txt2 .imgbox{
            position:absolute;
            left:0;
            top:0;
            z-index:-1;
            width: 100%;height: 510px;background-image: url(img/travel.jpg);background-position:-500px -300px;background-repeat:no-repeat;
        }

        .txt2 {position:relative;}
        .txt2 .box2{
            position:absolute;
            left:177px;
            top:113px;
        }


        .txt2 li:nth-child(1){background-color:darkgreen;}
        .txt2 li:nth-child(2){
            width: 80px;
        }
        .txt2 li:nth-child(2):after{
            position:absolute;
            left:210px;
            top:0px;
            content:"|";
        }
        .txt2 li:last-child{
            width: 100px;
        }

        
        
        
        .txt_box>.txt2{display: none;}
        .txt_box>.txt3
        .txt_box>.txt4
        .txt2,.txt3,.txt4{display:none;}

		.inner2{display: block;margin-bottom:10%;}
        .inner2>.inner1{padding-top:10%; padding-left:40%; }
		
		/* margin-top:5%; margin-bottom:30% */
        .inner2>.inner1:after{display: block;content:'';clear:both;}
        .inner2>.inner1>li{float:left;height:100%;font-size:15px;cursor:pointer}
        .inner2>.inner1>li>a{color:#787878;}
        .inner1>li:nth-child(1){margin-right:100px;line-height:50%;}
        .inner1>li:nth-child(2){margin-right:100px;line-height:50%;}
        .inner1>li:nth-child(3){line-height:50%;}


        /* section1 */
        .section1{

          
           margin-left:6.8%; 
		   margin-bottom:10%;
        }
        .section1 .kas_gall:after {
             display:block;
            content:'';
            clear:both;           
              
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
            font-size: 2em;
            margin-top:2px;
            margin-bottom:3px;
        }
        .section1 .kas_gall li a .date{
            display:block;
            font-size: 1.3em;
            color:#666;
			margin-bottom:15%;
        }
        

    </style>
    
    
    <script src="js/jquery-1.12.4.js"></script>
    <script>

    </script>
</head>
<body>
     <div id="Gallery_KAS" style="min-width:1600px">
        <header>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


<nav class="navbar navbar-expand-md navbar-dark fixed-top " style="background-color:white; !important;box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 20px;">
    <a class="navbar-brand" href="index.kas" style="margin-left:7%;height:105px; padding-top:40px; "><img src="imgs/logo.png" alt="logo"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" style="background-color:black;">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto" style="padding-left:42%;">
        <li class="nav-item active" >
          <a class="nav-link" href="exhibit.kas?m=artists" style="color:black; !important;  padding-right:100px;font-size:20px;!important;">Artists<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="exhibit.kas?m=exhibition" style="color:black; !important; padding-right:100px;font-size:20px;!important;">Exhibitions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="review.kas?m=review&cp=1&ps=5" style="color:black; !important; padding-right:100px;font-size:20px;!important;">Review</a>
        </li>
        <li class="nav-item">
		          <a class="nav-link" href="exhibit.kas?m=about" style="color:black; !important; padding-right:100px;font-size:20px;!important;">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="exhibit.kas?m=search" tabindex="-1" aria-disabled="true" style="color:black; !important;font-size:20px;!important;">Search</a>
        </li>
      </ul>
	  <div id="login" >
	  	<c:if test="${empty loginUser}">
            <a class="login" href="member.kas?m=form" style="margin-right:115px; margin-top:-50px;float:right;">Login</a>
        </c:if>
         <c:if test="${!empty loginUser}">
		    <a class="login" href="#" onclick="logout()" style="margin-right:115px; margin-top:-50px;float:right;">Logout</a>

        </c:if>	       
	  </div>
	</div>

  </nav>
	<div class="inner2">
         <ul class="inner1">
            <li class="current" style="margin-left:15%;"><strong>My List</strong></li>
      
         </ul>
      </div>     	
       </header>

		<section class="section1">
			<div class="kas_gall">
				<ul>
				<c:forEach items="${ExhibitionList}" var="exhibit">
						<li >
							<a href="exhibit.kas?m=exhibitBoard&Exh=${exhibit.code}">
								<figure><img src='${exhibit.poster}' style="width:504px; height:100%;" alt=""></figure>
								<span class="category" style='color: #888888'>${exhibit.artist}</span>
								<span class="title">${exhibit.title}</span>
                                <span class="date">${exhibit.e_date}</span>
							</a>
						</li>
				</c:forEach>
				</ul>
				
			</div>
		</section>
        
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
    </div>
</body>
</html>