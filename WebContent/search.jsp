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

	<script src="/js/vue-filter.js"></script>
	<script src="/js/app/App.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script src="js/logout.js"></script>
	
	
	<style>
		* {margin:0; padding:0;}
        ul,ol,li{list-style:none;}
        a, p, span{text-decoration: none; color:black; !important;}


		.logo_back .login2{
			float:right;
			font-size:11pt;
			padding-right:7%;
			padding-top:10px;
			color:#787878;
		}
        
		.inner {padding-top:10%;}

		.inner .current{	
			text-align:center;
		}
		.page-nav{
			width:100%;
			padding-top:5%;
			padding-bottom:10%;
		}
		.inner2{display: block;content:'';clear:both;}
        .inner2>.inner1{}
        .inner2>.inner1>li{float:left;height:100%;font-size:19px;cursor:pointer;}
        .inner2>.inner1>li>a{color:#787878;}
        .inner2>li:nth-child(1){margin-right:100px;line-height:50%;}
        .inner2>li:nth-child(2){margin-right:100px;line-height:50%;}
		.page-nav{margin-bottom:10%;}
		
		  .section1{

           margin-top:7%;   
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
 			<c:if test="${!empty likeList}">
              <a class="MyList" style="margin-top:-50px;margin-right:200px;float:right;" href="exhibit.kas?m=getMyList">MyList</a>
            </c:if>
        </c:if>	       
	  </div>
	</div>

  </nav>


  </header>

   
	<div class="inner"> 
		<ul>
			<li class="current"><a href="#">Search</a></li>
		</ul>
	</div>

		<nav class="page-nav"> 
			<button type="button" class="search-btn"></button>
		<div id="search-form" class="search-form">
		<div class="inner2">
			<form action="exhibit.kas?m=searchReal" method="post" autocomplete="off">
				<input type="text" name="searchName"
					title="검색" required placeholder="Search" maxlength="20">
				<button type="submit">검색</button>
			</form>
		
		</div><strong></strong>
		</nav>
		
		</div>
	</div>

			<!-- //Content -->
		</article>
				<!-- //Content -->
			
		</div>
	</header>
	
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
	<script type="text/javascript" src="/assets/js/ui.js"></script>
</body>
</html>