<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<c:if test="${loginEmp!=null}">
		${loginEmp.empName}님 반갑습니다
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:if>
	<c:if test="${loginEmp==null}">
	<h2>login</h2>
	<form action="${pageContext.request.contextPath}/loginEmp" method="post">
	<table>
		<tr>
			<td>id</td>
			<td><input type="text" name="empId"></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><input type="password" name="empPw"></td>
		</tr>
	</table>
	<button type="submit">로그인</button>
	</form>
	</c:if>
<script>
if(${row}==1){
	alert('아이디, 비밀번호확인해주세요')
}
</script>	
</body>
</html>