<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp">
		</c:import>
</div>
	<h1>제 1회 모의고사</h1>
	<div>${loginStu.studentName}</div>
	<c:set var="idx" value=""/>
		<table>
		<c:forEach var="q" items="${list}">
		
		<c:set var="curdate" value="${q.questionIdx}"/>
		<c:if test="${curdate != idx}">
			<tr>
				<td><hr></td>
			</tr>
			
			<c:set var="idx" target="idx" value="${q.questionIdx}"/>
			<tr>
				<form action="${pageContext.request.contextPath}/student/addPaper" method="post" id="form${q.questionNo}">
					<td>${q.questionIdx} . ${q.questionTitle} 
					<input type="hidden" value="${q.questionNo}" name="questionNo">
					<input type="hidden" value="${q.testId}" name="testId">
					<select name="answer" id="quantity${q.questionNo}">
						<option value="0">선택해주세요</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<span>제출 답: 
						<c:forEach var="a" items="${answer}">
							<c:if test="${a.questionNo eq q.questionNo}">${a.answer}</c:if>
						</c:forEach>
					</span>
					</td>
				</form>
			</tr>
			<tr>
				<td><hr></td>
			</tr>
			
		</c:if>
				<tr>
					<td>${q.exampleIdx }. ${q.exampleTitle}</td>
				</tr>
		</c:forEach>
		</table>	
	<c:set var="idx" value=""/>	
	<c:forEach var="q" items='${list}'>
		<c:set var="curdate" value="${q.questionIdx}"/>
			<c:if test="${curdate != idx}">
				<script>
					$(document).ready(function(){	
		
							$("#quantity${q.questionNo}").change(function(){
								$('#form${q.questionNo}').submit();
							})
					})
				</script>
			</c:if>	
	</c:forEach>
	
	<form action="${pageContext.request.contextPath}/student/addScore" method="post">
		<input type="hidden" value="${testId}" name="testId">
		<button type="submit" id="btn">제출</button>
	
	</form>

	
</body>
</html>