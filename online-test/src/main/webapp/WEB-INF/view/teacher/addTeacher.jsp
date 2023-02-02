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
	<h1>강사추가</h1>
	<form action="${pageContext.request.contextPath}/employee/addTeacher" method="post" id="form">
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" name="teacherId" id="id"></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="teacherPw" id="pw"></td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="teacherName" id="name"></td>
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