<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/employee/addEmp" method="post">
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" name="empId"></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="empPw"></td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="empName"></td>
			</tr>
		</table>
		<button type="submit">추가</button>
	</form>
</body>
</html>