
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


  <title>testList</title>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/loginCss/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/loginCss/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/loginCss/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/loginCss/css/style.css">
     <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/style.css">
</head>
<body>
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp">
		</c:import>
	</div>
	<br><br><br>
	<div class="container">
		<div class="section-header">
	         <h2>${q.questionIdx}.${q.questionTitle} <span style="float:right"><button type="button" class="btn btn-outline-success btn" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button></span></h2>
	    </div>
			
		<table style="width:100%">
			<tr>
				<td>보기번호</td>
				<td>보기내용</td>
				<td>보기답</td>
				<td>수정</td>
				<td>삭제</td>			
			</tr>
			<tr>
				<td colspan="6"><hr style="height: 3px; background-color:black;"></td>
			</tr>
			
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.exampleIdx}</td>
					<td>${e.exampleTitle }</td>
					<td>${e.exampleOx}</td>
					<td><button type="button" class="btn btn-outline-success btn" data-bs-toggle="modal" data-bs-target="#exampleModal${e.exampleIdx}">수정</button></td>
					<td><button type="button" class="btn btn-outline-success btn" onclick="location.href='${pageContext.request.contextPath}/teacher/deleteExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}&testId=${testId}'">삭제</button></td>
				</tr>
				<tr>
					<td colspan="6"><hr></td>
				</tr>
			
			</c:forEach>
			<tr>
				<td colspan="6"><hr style="height: 3px; background-color:black;"></td>
			</tr>
			
			<form action="${pageContext.request.contextPath}/teacher/addExample" method="post">
				<tr>
					<td><input type="number" name="exampleIdx" value="${idx}" readonly="readonly"><input type="hidden" name="questionNo" value="${q.questionNo}"></td>
					<td><input type="text" name="exampleTitle"><input type="hidden" name="testId" value="${testId}"></td>
					<td> 
						<select name="exampleOx">
							<option value="오답">오답
							<option value="정답">정답
						</select>
					</td>
					<td colspan="2"><button type="submit" class="btn btn-outline-success btn">추가</button></td>
					
				</tr>
			</form>
		</table>
		<br><br>
		<div style="float:right"><button type="button" class="btn btn-outline-success btn" onclick="location.href='${pageContext.request.contextPath}/teacher/questionList?testId=${testId}'">문제로가기</button></div>	
	</div>
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
			       	 <input type="hidden" name="testId" value="${testId}">
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
			       	 <input type="hidden" name="testId" value="${testId}">
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

</body>
</html>
