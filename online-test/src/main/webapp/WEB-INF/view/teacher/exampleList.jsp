<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
		<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp">
		</c:import>
	</div>
	<h2><a href="" data-bs-toggle="modal" data-bs-target="#exampleModal">${q.questionIdx}.${q.questionTitle}</a></h2>
	<table border="1">
		<tr>
			<td>보기번호</td>
			<td>보기내용</td>
			<td>보기답</td>
			<td>수정</td>
			<td>삭제</td>			
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.exampleIdx}</td>
				<td>${e.exampleTitle }</td>
				<td>${e.exampleOx}</td>
				<td><a href="" data-bs-toggle="modal" data-bs-target="#exampleModal${e.exampleIdx}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/teacher/deleteExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}">삭제</a></td>
			</tr>
		</c:forEach>
		<form action="${pageContext.request.contextPath}/teacher/addExample" method="post">
			<tr>
				<td><input type="number" name="exampleIdx" value="${idx}" readonly="readonly"><input type="hidden" name="questionNo" value="${q.questionNo}"></td>
				<td><input type="text" name="exampleTitle"></td>
				<td colspan="3"><select name="exampleOx">
					<option value="오답">오답
					<option value="정답">정답
				</select><button type="submit">추가</button></td>
			</tr>
		</form>
	</table>
	
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">question update</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="${pageContext.request.contextPath}/teacher/updateQuestion" method="post">
	      <div class="modal-body">
	       	 <div>questionTitle: <input type="text" name="questionTitle"> </div>
	       	 <input type="hidden" name="questionNo" value="${q.questionNo}">
	       	 <div>questionIdx: <input type="number" name="questionIdx"></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">update</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<c:forEach var="e" items="${list}">

<div class="modal fade" id="exampleModal${e.exampleIdx}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">example update</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="${pageContext.request.contextPath}/teacher/updateExample" method="post">
	      <div class="modal-body">
	      	<div>exampleIdx: <input type="number" name="exampleIdx" value="${e.exampleIdx}" readonly="readonly"></div>
	       	 <div>exampleTitle: <input type="text" name="exampleTitle"> </div>
	       	 <div>exampleOx:
	       	 	<select name="exampleOx">
					<option value="오답">오답
					<option value="정답">정답
				</select>
	       	 </div>
	       	 <input type="hidden" name="questionNo" value="${q.questionNo}">
	       	 <input type="hidden" name="exampleNo" value="${e.exampleNo}">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">update</button>
	      </div>
      </form>
    </div>
  </div>
</div>

</c:forEach>
<div><a href="${pageContext.request.contextPath}/teacher/questionList?testId=${testId}">문제로가기</a></div>	
</body>
</html>