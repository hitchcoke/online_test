
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
	           <h2>${t.testTitle} ${t.testDate }<span style="float:right"><button type="button" class="btn btn-outline-success btn" data-bs-toggle="modal" data-bs-target="#exampleModal">??????</button></span></h2>
	    </div>
			
		<table style="width:100%">
			<tr>
				<td width="10%">????????????</td>
				<td width="40%">??????</td>
				<td>??????</td>
				<td width="8%">??????</td>
				<td width="8%">??????</td>
			</tr>
			<tr>
				<td colspan="6"><hr style="height: 3px; background-color:black;"></td>
			</tr>
			
			<c:forEach var="q" items="${list}">
				<tr>
					<td>${q.questionIdx}</td>
					<td>${q.questionTitle}</td>
					<td>${score}</td>
					<td><button type="button" class="btn btn-outline-success btn" onclick="location.href='${pageContext.request.contextPath}/teacher/exampleList?questionNo=${q.questionNo}&testId=${testId}'">??????</button></td>
					<td><button type="button" class="btn btn-outline-success btn" onclick="location.href='${pageContext.request.contextPath}/teacher/deleteQuestion?questionNo=${q.questionNo}&testId=${t.testId}'">??????</button></td>
				</tr>
				<tr>
					<td colspan="6"><hr></td>
				</tr>
			
			</c:forEach>
			<tr>
				<td colspan="6"><hr style="height: 3px; background-color:black;"></td>
			</tr>
			
			<form action="${pageContext.request.contextPath}/teacher/addQuestion" method="post">
				<tr>
					<td><input type="hidden" name="testId" value="${t.testId}">
					<input type="number" name="questionIdx" value="${idx}" readonly="readonly"></td>
					<td><input type="text" name="questionTitle"></td>
					<td colspan="2"><button type="submit" class="btn btn-outline-success btn">??????</button></td>
				</tr>
			</form>
		</table>
	</div>
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
<script>
	if(${row}==1){
		
		alert("????????? ????????? ???????????????")
	}

</script>
</body>
</html>