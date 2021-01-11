<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	
	<title>GALLERYKAS SIGNIN</title>
	<!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/creative.css" rel="stylesheet">
	
	<!-- Fonts -->
   
    <!-- CSS -->
    <link href="css/signin.css" rel="stylesheet">
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

	</div>

  </nav>
 
	</header>

 	
	<div class="container" class="container2">
	  <div class="d-flex justify-content-center h-100">
		<div class="card" style='border:0px;'>
		  <div class="card-body" align="center" >
			<form name="f" action="member.kas?m=check" method="post">
			  <p align="left" style="font-size:30px; margin-bottom:2px;">Login</p>
			  <input type="text" name='email' placeholder=' 이메일' onkeyup="emailCheck(this.value); signinCheck();">
			  <p></p>
			  <input type='password' style='margin-bottom:5px;' name='pwd' placeholder=' 비밀번호' onkeyup="pwCheck(this.value); signinCheck();">
			  <p></p>
			  <input type='submit' class="btn btn-signin btn-xl" value='Login' style=' background-color:#6666;'disabled>

			</form>
			<hr>
			<a class="btn btn-signup btn-xl" style='margin-bottom:40%;'href="member.kas?m=signupForm">Sign up</a>
			<p></p>
			<!--<a class="btn btn-kakao btn-xl" href="javascript:loginWithKakao()"><img src="${pageContext.request.contextPath}/img/kakao.png"> 카카오계정으로 시작하기</a>-->
		  </div>
		</div>	</div>
	</div>
	<!-- JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- Kakao SDK -->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script>
		var regex_email = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		var regex_pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,16}$/;
		var flag_email = false;
		var flag_pw = false;

		function emailCheck(str){
			if(!regex_email.test(str)){
				$("input[name='email']").css("background-image", "url('${pageContext.request.contextPath}/img/no.png')");
				flag_email = false;
			}else{
				$("input[name='email']").css("background-image", "url('${pageContext.request.contextPath}/img/ok.png')");
				flag_email = true;
			}
		}
	  
		function pwCheck(str){
			if(!regex_pw.test(str)){
				$("input[name='pwd']").css("background-image", "url('${pageContext.request.contextPath}/img/no.png')");
				flag_pw = false;
			}else{
				$("input[name='pwd']").css("background-image", "url('${pageContext.request.contextPath}/img/ok.png')");
				flag_pw = true;
			}
		}
		
		function signinCheck(){
			if(flag_email == true && flag_pw == true){
				$("input[type=submit]").prop('disabled', false);
			}else{
				$("input[type=submit]").prop('disabled', false);
			}
		}
		
	    Kakao.init('10018fa82982d92d19877db18c35268f');
	    function loginWithKakao() {
	      Kakao.Auth.loginForm({
	        success: function(authObj) {
	          Kakao.API.request({
	        	url: '/v2/user/me',
	        	success: function(res) {
	        	  alert(res.kakao_account.email + ' (' + res.properties['nickname'] + ') 님 환영합니다.');
	        	  $("input[type='submit']").prop("disabled", false);
	        	  $("input[type='hidden']").val(res.kakao_account.email);
	        	  $("form").submit();
	        	}
	          });
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	    };
	    
	    function enterCheck(elm){
			if(event.keyCode == 13){
				if(elm == f.id){
					f.pwd.focus();
				}else{
					check();
				}
			}
		}
	
    </script>


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