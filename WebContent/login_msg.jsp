<%@ page language="java" contentType="text/html; charset=utf-8" import="kas.member.model.MemberSet"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 <html>
  <head>
 	 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

  </head>
  <body>
  <script language="javascript">		
 	if(${rCode} == <%=MemberSet.NO_ID%>){
 		Swal.fire({
			  icon: 'error',
			  title: '등록된 이메일이 아니에요 :(',
			  //text: '다른 이메일로 다시 시도해보세요!',
			  confirmButtonText: '다시 시도'
			}).then(function() {
		           location.href = "member.kas?m=form";
			});

	}else if(${rCode} == <%=MemberSet.NO_PWD%>){
		Swal.fire({
			  icon: 'error',
			  title: '비밀번호가 달라요 ㅜㅜ',
			  //text: '다시 시도해보세요!',
			  confirmButtonText: '다시 시도'
			}).then(function() {
		           location.href = "member.kas?m=form";
			});
	}else{
		Swal.fire({
			  position: 'center',
			  icon: 'success',
			  title: '로그인 되었어요!',
			  showConfirmButton: false,
			  timer: 1500
			}).then(function() {
		           location.href = "index.kas";
			});
	}
  </script>


  </body>
 </html>	