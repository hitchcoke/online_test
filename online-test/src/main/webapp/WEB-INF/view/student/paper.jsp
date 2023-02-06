<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>제 1회 모의고사</h1>
	<c:forEach var="q" items="${qList}">
		
		<table>
				<tr>
					<td>${q.questionIdx} . ${q.questionTitle} </td>
				</tr>
				<c:set var="test" value="${q.questionNo + q.questionTitle }"/>
				<c:forEach var="e" items="${test}">
					<tr>
						<td>${e.exampleIdx}. ${e.exampleTitle}</td>
					</tr>
				</c:forEach>
		</table>
	
	
	</c:forEach>
	
</body>
</html>