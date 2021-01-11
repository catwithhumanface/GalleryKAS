<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery KAS</title>

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
        a, p, span{text-decoration: none;!important; color:black; !important;}

		.entry_content p h1{
		  height:400px;
		 
 		  animation-timing-function:cubic-bezier(0.1, 0.7, 1.0, 0.1);
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
 			<c:if test="${!empty likeList}">
              <a class="MyList" style="margin-top:-50px;margin-right:200px;float:right;" href="exhibit.kas?m=getMyList">MyList</a>
            </c:if>
        </c:if>	       
	  </div>
	</div>

  </nav>



		<nav class="page-nav">
	<div class="inner">
		<ul>
			<li class="current"><a href="/about">Gallery Kas</a></li>
		</ul>
	</div>
</nav>
	<div class="detail">
		<div class="info">
		<!-- <h2>GALLERY<strong>HYUNDAI</strong><em>1</em></h2> -->
			<figure><img src="imgs/img_galleryhyundai_1.jpg" alt="Gallery Hyundai 1"></figure>
				<p>#3 89 Mapo-daero Mapo-gu Seoul Republic of Korea<br>
				 서울시 서초구 강남대로 459 (서초동, 백암빌딩)</p>
				<p>
					<strong>Tel</strong>+82 2 3486 9600<br>
					<strong>Fax</strong>+82 2 6007 1245<br>
					<strong>Email</strong><a href="mailto:mail@galleryhyundai.com" target="_blank">galleryKAS@galleryKAS.com</a>
				</p>
		</div>
	<div class="entry-content" align="center">
				<p>
				<h1>요즘 같은 봄날...<br/><br/>전시회 한편 어떠세요?</h1>
				잘 몰라서, 어렵게만 느껴져서, 쉽게 접해보지 못했던 문화생활
				
				<br/><br/><br/>Gallery Kas가 도와드립니다.</p>



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
	<script type="text/javascript" src="js/ui.js"></script>
</body>
</html>