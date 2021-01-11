<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    if(${empty loginUser}){
    	alert("회원 서비스 입니다. 로긴을 먼저 하고 오세요");
    	location.href="../login/login.oz?m=form"; //로긴폼으로 이동 
    	//location.href="../index.do";  //인덱스로 이동 
    }
</script>