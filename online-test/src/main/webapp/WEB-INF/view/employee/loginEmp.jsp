<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>login</h2>
	<form action="${pageContext.request.contextPath}/employee/loginEmp" method="post">
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
</body>
</html>