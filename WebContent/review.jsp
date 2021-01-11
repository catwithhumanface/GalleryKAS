<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="kas.review.vo.ListResult" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>REVIEW BOARD</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/creative.css" rel="stylesheet">
	
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script src="js/logout.js"></script>
</head>

<style>
		* {margin:0; padding:0;}
        ul,ol,li{list-style:none;}
        a, p, span{text-decoration: none; color:black; !important;}
        
        a:visited{
                color: #6666;!important;
            }

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
			
		.logo_back .login2{
			float:right;
			font-size:11pt;
			padding-right:7%;
			padding-top:10px;
			color:#787878;
		}
.r_list {padding:40px 0; width:1100px; height:700px; margin:0 auto; margin-bottom:10%;!important;}
th{border-top:3px solid black}
th, td {padding:6px;border-bottom:1px solid #999}
tbody tr {border-bottom:1px solid #999;}
tbody a {width:100%; height:100%; display:block; text-indent:10px;}
tbody a:hover {background-color:white; text-decoration:none;}
</style>

<body>
	<div class="wrap">

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


      
			<nav class="page-nav">
	<div class="inner">
		<ul>
			<li class="current"><a href="#">Review</a></li>
		</ul>
	</div>
	</nav>


			<div class="r_list">
				<div class="choose">
					<form action="review.kas?m=search" name="check_into"
						method="post">  
						<ul class="clearfix">
							<li><span>분류 : </span> 
							<select name="c_code" id="store_code" onChange="text.value=c_code[selectedIndex].value" style='height:30px; margin-bottom:3px;'>
									<option value="NAME">작성자</option>
									<option value="TITLE">글제목</option>
							</select></li>
							<li>
								<input type="text" name="searchName" style='height:30px; margin-bottom:3px;'
									title="검색" required placeholder="Search" maxlength="20">
								<button type="submit" style='height:30px;'>검색</button>
							</li>
					
						</ul>
					</form>
				</div>
				
				<table>
					<colgroup>
						<col width="5%">
						<col width="20%">
						<col width="30%">
						<col width="15%">
                        <col width="10%">
                        <col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>EXHIBITION</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>DATE</th>
							<th>VIEWS</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty listResult.list}">
						<TR align='center' noshade>
							<TD colspan="6"> 작성된 후기가 없습니다. </TD>
						</TR>
					</c:if>
					<c:forEach items="${listResult.list}" var="reviewList">
						<tr>
						<td>${reviewList.idx}</td>
	                    <td><img src="${reviewList.poster}" style='width:130px;'></td>
	                    <td><a class="title" href="review.kas?m=getReview&idx=${reviewList.idx}&code=${reviewList.code}">${reviewList.title}</a></td>
	                    <td>${reviewList.name}</td>
	                    <td>${reviewList.w_date}</td>
	                    <td>${reviewList.views}</td>
	                    </tr>
	                </c:forEach>
					</tbody>
      
				</table>
                
          <div align="center" style='margin-top:30px; color:#666666; line-height:50%;'>
           	<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
           	    <a href="review.kas?m=list&cp=${i}">
	           	    <c:choose>
	           	    	<c:when test="${i==listResult.currentPage}">
	           	    		<strong>${i}</strong>
	           	    	</c:when>
	           	    
	            	<c:otherwise>
	            		<b>${i}</b>
	            	</c:otherwise>
	            	</c:choose>
	             </a> 
           	</c:forEach>
         
            

             <a href="review.kas?method=list&cp=${i==listResult.currentPage}&ps=${i==listResult.totalPageCount}">
			     |  이후 ▶
			  </a>

		</div>
		<div class="empty" style='margin-bottom:20%;!important;'>
			<c:choose>
           <c:when test="${!empty loginUser}"> 	 
				<button type="button" class="searchBtn">
				<a style='background-color:black;!important; color:white;!important; width:70px;!important; margin-bottom:20%;!important;' href="review.kas?m=writeForm">글쓰기</a></button>
			</c:when>
			</c:choose>
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