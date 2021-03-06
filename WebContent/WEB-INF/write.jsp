<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>REVIEW BOARD</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
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
	 

<link href="css/reservation_page.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="timepicker/jquery.datetimepicker.css"/ >
<link rel="shortcut icon" href="bit_logo.png" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="timepicker/jquery.js"></script>
<script src="timepicker/jquery.datetimepicker.full.min.js"></script>
<script src="js/login.js"></script>
    
    			<script language='javascript'>
			   function check()
			   {
				   for(var i=0; i<document.input.elements.length; i++)
				   {
					  if(document.input.elements[i].value == '')
					  {
						 alert('모든 값을 입력 하셔야 합니다. ');
						 return false;
					  }
				   }
				   document.input.submit();
			   }
			</script>
</head>

<style>
    
    
		.logo_main{
           
		    background-color: white; 
        }
		.logo_back {
           transition: all 0.5s ease 0s; 
            background: rgb(255, 255, 255); 
            box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 20px;
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
			
		.logo_back .login2{
			float:right;
			font-size:11pt;
			padding-right:7%;
			padding-top:10px;
			color:#787878;
		}

        border-collapse: collapse;
        a { text-decoration:none }
    
        #store_code {
            width: 500px;
            height:50%;
            line-height:12px;
            vertical-align: middle;
            border-radius:0px;
            margin: 0;       
        }

</style>

<body>
	<div class="wrap">
	
		<header>
          <div class="logo_back" >
          <div class="logo_main">
               <div class="main_this" >
                    <div class="main_1">
                        <p class="logo"><a href="#"><img src="imgs/logo.png" alt="logo"></a></p>


                    </div>
                    <div class="menu">
                        <ul class="menu1">
                            <li class="th_menu"><a href="#">Artists</a>
                            </li>
                            <li class="th_menu"><a href="#">Exhibitions</a>
                            </li>
                            <li class="th_menu"><a href="#">Review</a>
                            </li>
                            <li class="th_menu"><a href="#">About</a>
                            </li>
							<li class="th_menu"><a href="#">Search</a>
                            </li>
                        </ul>
                    </div>     
               </div>
			   <c:if test="${empty loginUser}">
            <a class="login2" href="member.kas?m=form">Login</a>
        </c:if>
         <c:if test="${!empty loginUser}">
            <a class="login2" href="member.kas?m=out">Logout</a>
        </c:if>
          </div>
		    
         </div> 
      
			<nav class="page-nav">
	<div class="inner">
		<ul>
			<li class="current"><a href="#">Review</a></li>
		</ul>
	</div>
	</nav>







			<div class="r_list">
				<div class="choose">
                <form name="input" action="review.kas?m=write" method="post">
                               <table border="1" width="600" align="center" cellpadding="3" cellspacing="1">
                                  <tbody>
                                  <tr>
                                 
                                     <td width="30%" align="center">전시명</td>
                                      <td align="center">
                                      <select name="c_code" id="store_code" onChange="text.value=c_code[selectedIndex].value">
                                           <c:forEach items="${ExTitle}" var="exTitle">
                                              <option value="${exTitle}">${exTitle}</option>
                                            </c:forEach>
                                      </select>
                                      </td>
                                  </tr>
                                  <tr>
                                     <td width="30%" align="center">글쓴이</td>
                                     
                                     <td align="center"><input type="text" name="writer" size="60"></td>
                                  </tr>
                                  <tr>
                                     <td align="center">이메일</td>
                                      <td align="center"><input type="text" name="email" size="60" style='background-color:#dbdbdb' readonly value="${loginUser.email}"></td>
                                  </tr>
                                  <tr>
                                     <td align="center">글제목</td>
                                     <td align="center"><input type="text" name="title" size="60"></td>
                                  </tr>
                                  <tr>
                                     <td align="center">글내용</td>
                                     <td align="center"><textarea name="content" rows="5" cols="53" style="width:500px; height:250px;"></textarea></td>
                                  </tr>
                                <tr>
                                     <td colspan='2' align='center'>
                                       
                                        <input type='button' value='전송' onclick='check()' style='background-color:black; color:white; width:70px; line-height:50%; padding:3px;'>
                                        <input type='reset' value='다시입력' style='background-color:black; color:white; width:70px;  line-height:50%; padding:3px;'>
                                     </td>
                                  </tr>
                               </tbody></table>
                               <br>
                               
                      </form>
				</div>
                
                <button type="button" class="searchBtn" 
					style='background-color:black; color:white; width:70px;' ><a href="review.kas?m=review">목록</button>                    

                                
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
                                        
		<!-- content -->
	</div>
	<!-- wrap -->
</body>
 <script type="text/javascript" src="js/ui.js"></script>
</html>