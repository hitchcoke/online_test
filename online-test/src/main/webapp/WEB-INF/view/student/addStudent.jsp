<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>학생추가</h1>
	<form action="${pageContext.request.contextPath}/employee/addStudent" method="post" id="form">
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" name="studentId" id="id"></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="studentPw" id="pw"></td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="studentName" id="name"></td>
			</tr>
		</table>
		<button type="button" id="btn">추가</button>
	</form>
	<script>
	if(${row}==1){
		alert('다른아이디를 사용해주세요')
	}
	$("#btn").click(function(){
		if($("#pw").val().length<4){
			alert('비밀번호는 4자이상 입력해주세요');
			return;
		}
		
		if($("#id").val().length<4){
			alert('아이디는 4자이상 입력해주세요');
			return;
		}
		
		if($("#name").val().length<2){
			alert('이름은 2자이상 입력해주세요');
			return;
		}
		
		
		$('#form').submit()
	})
	</script>
</body>
</html>