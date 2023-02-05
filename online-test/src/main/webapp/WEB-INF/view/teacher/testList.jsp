<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp">
		</c:import>
	</div>
	<h1>testList</h1>
	<table border="1">
		<tr>
			<td>testTitle</td>
			<td>testDate</td>
			<td>grade</td>
			<td>문제관리</td>
			<td>수정</td>
			<td>활성화</td>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.testTitle}</td>
				<td>${t.testDate}</td>
				<td>${t.grade}</td>
				<td><a href="${pageContext.request.contextPath}/teacher/questionList?testId=${t.testId}">문제</a></td>
				<td><a href="${pageContext.request.contextPath}/teacher/deleteTest?testId=${t.testId}">삭제</a></td>
				<td><c:if test="${t.active==0}">비활성화</c:if><c:if test="${t.active==1}">활성화</c:if></td>
			</tr>
		</c:forEach>
		<form action="${pageContext.request.contextPath}/teacher/addTest" method="post">
			<tr>
				<td><input type="text" name="testTitle"></td>
				<td><input type="date" name="testDate"> <button type="submit">추가</button></td>
			</tr>
		</form>
	</table>

</body>
</html>