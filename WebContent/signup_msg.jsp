<%@page contentType="text/html;charset=utf-8" import="kas.member.model.MemberSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>
<body>
<script language="javascript">

	if(${rCode} == <%=MemberSet.SIGN_UP_OK%>){
		Swal.fire({
			  title: '축하합니다! 회원가입되었어요',
			  text: "로그인 페이지로 이동하시겠어요?",
			  icon: 'success',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '그럴게요',
			  cancelButtonText: '괜찮아요'
			}).then((result) => {
			  if (result.value) {
				  location.href = "member.kas?m=form";
			  } else {
				  location.href = "index.kas";
			  }
			})
	}else if(${rCode} == <%=MemberSet.DUPLICATION%>){
		Swal.fire({
			  icon: 'error',
			  title: '이미 등록된 이메일이에요 :(',
			 // text: '다른 이메일로 다시 시도해보세요!',
		      confirmButtonText: '다시 시도'
			}).then(function() {
		           location.href = "member.kas?m=signupForm";
			});
	}else{
		alert("회원가입에 실패했습니다.");
		location.href="member.kas?m=signupForm";
	}
</script>

</body>
</html>	