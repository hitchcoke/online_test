<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quetionList</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
		<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp">
		</c:import>
	</div>
	<h2><a href="" data-bs-toggle="modal" data-bs-target="#exampleModal">${t.testTitle}</a> ${t.testDate }</h2>
	<table border="1">
		<tr>
			<td width="10%">문제번호</td>
			<td width="40%">문제</td>
			<td>배점</td>
			<td width="5%">수정</td>
			<td width="5%">삭제</td>
		</tr>
		<c:forEach var="q" items="${list}">
			<tr>
				<td>${q.questionIdx}</td>
				<td>${q.questionTitle}</td>
				<td>${score}</td>
				<td><a href="${pageContext.request.contextPath}/teacher/exampleList?questionNo=${q.questionNo}&testId=${testId}">관리</a></td>
				<td><a href="${pageContext.request.contextPath}/teacher/deleteQuestion?questionNo=${q.questionNo}&testId=${t.testId}">삭제</a></td>
			</tr>
		</c:forEach>
		<form action="${pageContext.request.contextPath}/teacher/addQuestion" method="post">
			<tr>
				<td><input type="hidden" name="testId" value="${t.testId}">
					<input type="number" name="questionIdx" value="${idx}" readonly="readonly"></td>
				<td colspan="3"><input type="text" name="questionTitle"><button type="submit">추가</button></td>
			</tr>		
		</form>

	</table>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">test update</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="${pageContext.request.contextPath}/teacher/updateTest" method="post">
	      <div class="modal-body">
	       	 <div>testTitle: <input type="text" name="testTitle"> </div>
	       	 <input type="hidden" name="testId" value="${t.testId}">
	       	 <div>testDate: <input type="date" name="testDate"></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">update</button>
	      </div>
      </form>
    </div>
  </div>
</div>
	
	

</body>
</html>