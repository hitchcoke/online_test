<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyEmpPw</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h1>${loginEmp.empName} 님의 정보수정</h1>

	<form action="${pageContext.request.contextPath}/employee/modifyEmpPw" method="post" id="form">
		<table>
			<tr>
				<td>현재비밀번호</td>
				<td><input type="password" name="oldPw"></td>
			</tr>
			<tr>
				<td>새로운 비밀번호</td>
				<td><input type="password" name="newPw" id="pw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="newPwCk" id="ck"></td>
			</tr>
		</table>
		<button type="button" id="btn">변경</button>
	</form>
</body>
<script>
	$("#btn").click(function(){
		if($("#pw").val().length<4){
			alert('비밀번호확인해주세요');
			return;
		}
		
		
		if($("#pw").val()!=$('#ck').val()){
			alert('비밀번호확인해주세요');
			return;
		}	
		
		$('#form').submit()
	})
	if(${row}==1){
		alert('비밀번호확인해주세요')
	}
</script>
</html>