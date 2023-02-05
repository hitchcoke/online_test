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
	<form action="${pageContext.request.contextPath}/loginEmp" method="post" id="form">
	<table>
		<tr>
			<td>id</td>
			<td><input type="text" name="Id"></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><input type="password" name="Pw"></td>
		</tr>
		<tr>
			<td>로그인 방식</td>
			<td>
				<select id="login" name="login">
					<option value="emp">사원</option>
					<option value="tea">강사</option>
					<option value="stu">학생</option>
				</select>	
			</td>
		</tr>
	</table>
	<button type="button" id="btn">로그인</button>
	</form>
	</c:if>
<script>
if(${row}==1){
	alert('아이디, 비밀번호확인해주세요')
}
	
$('#btn').click(function(){
	console.log($('#login').val());
	if($('#login').val() == 'tea'){
		$("#form").attr("action", "loginTea");
	}else if($('#login').val() == 'stu'){
		$("#form").attr("action", "loginStu");
	}
	
	$('#form').submit();
	
	
})
</script>	
</body>
</html>