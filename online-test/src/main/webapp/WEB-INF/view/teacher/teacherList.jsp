
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


  <title>EmpList</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/bootstrap/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/bootstrap/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/bootstrap/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/bootstrap/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/bootstrap/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/bootstrap/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/bootstrap/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/bootstrap/assets/css/main.css" rel="stylesheet">
</head>
<body>

	<!--empMenuInclude -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp">
		</c:import>
	</div>
	
	<br><br>
	<div class="container">
	<div class="section-header">
          <h2>TeacherList</h2>
        </div>
		
		<table style="width:100%">
			<tr>
				<th>teacherId</th>
				<th>teacherName</th>
				<th>grade</th>
				<th>삭제</th>
			</tr>
			<tr>
				<td colspan="4"><hr style="height: 3px; background-color:black;"></td>
			</tr>
			
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.teacherId}</td>
					<td>${e.teacherName}</td>
					<td>${e.grade}</td>
					<td><button type="button" class="btn btn-outline-success btn" onclick="location.href='${pageContext.request.contextPath}/employee/deleteTeacher?teacherNo=${e.teacherNo}"'">삭제</button></td>
				</tr>
				<tr>
					<td colspan="4"><hr></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4"><hr style="height: 3px; background-color:black;"></td>
			</tr>
		</table>
		<div>
			<div style="text-align: center;">
				<h5>
				<c:if test="${currentPage>1}">
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=1&searchWord=${searchWord}">처음</a><span>&nbsp;</span>
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a><span>&nbsp;</span>
				</c:if>
				<c:forEach var="i" begin="${row}" end="${lastPage}" step="1">
					<c:if test="${i<currentPage+3}">
						<c:if test="${i!=currentPage}">
							<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${i}&searchWord=${searchWord}"">
								${i}
							</a>
							<span>&nbsp;</span>
						</c:if>
						<c:if test="${i==currentPage}"><span style="background-color: green">&nbsp;${i}&nbsp;</span></c:if>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage<lastPage}">
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a><span>&nbsp;</span>
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${lastPage}&searchWord=${searchWord}">끝</a>
				</c:if>
				</h5>
			</div>
			<br><br>
			<form method="get" action="${pageContext.request.contextPath}/employee/teacherList">
				<span>
					<input type="text" name="searchWord">
					<button type="submit" class="btn btn-outline-success btn">검색</button>
					<span style="float:right"><button type="button" class="btn btn-outline-success btn" onclick="location.href='${pageContext.request.contextPath}/employee/addTeacher'">강사등록</button></span>
				</span>
			</form>
		</div>
	</div>
	<br><br><br><br><br>
</body>
</html>
