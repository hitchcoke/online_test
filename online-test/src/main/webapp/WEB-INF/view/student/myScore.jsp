<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myScore</title>
</head>
<body>
<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp">
		</c:import>
</div>
	<h1>${loginStu.studentName}님의 성적</h1>
	<table>
		<tr>
			<td>시험 이름</td>
			<td>성적</td>
			<td>시험 날짜</td>
		</tr>
		<c:forEach var="s" items="${list }">
			<tr>
				<td>${s.testTitle}</td>
				<td>${s.score}</td>
				<td>${s.testDate}</td>
			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>