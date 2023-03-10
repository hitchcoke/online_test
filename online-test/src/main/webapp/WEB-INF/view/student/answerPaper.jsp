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
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp">
		</c:import>
</div>
	<div class="container">
	<br><br><br>
		<div class="section-header">
	          <h2>??? ${t.testId}??? ${t.testTitle} ?????????</h2>
	    </div>
	    <div style="float:right"><h4>${loginStu.studentName}???</h4></div>
	    <br><br>
		<c:set var="idx" value=""/>
		<div class="row">
			<div class="col-md-6">
			<c:forEach var="q" items="${list}">
				<table>
				
				
				<c:set var="curdate" value="${q.questionIdx}"/>
				<c:if test="${curdate != idx}">
					<tr>
						<td><hr></td>
					</tr>
					
					<c:set var="idx" target="idx" value="${q.questionIdx}"/>
					<tr>
						
							<td>${q.questionIdx} . ${q.questionTitle} 
							
					
							<br>
							<span>?????? ???: 
								<c:forEach var="a" items="${answer}">
									<c:if test="${a.questionNo eq q.questionNo}">${a.answer}</c:if>
								</c:forEach>
							</span>
							
							</td>
						
					</tr>
					<tr>
						<td><hr></td>
					</tr>
					
				</c:if>
						<tr>
							<td>
								<span> 
								<c:if test="${q.exampleOx=='??????'}"><span style="color:red">???</span></c:if>
								<c:forEach var="a" items="${answer}">
									<c:if test="${a.questionNo eq q.questionNo}">
										<c:if test="${a.answer==q.exampleIdx}">
											???
										</c:if>
									</c:if>
								</c:forEach>
								</span>
							${q.exampleIdx }. ${q.exampleTitle} 
		
							<c:if test="${q.exampleOx=='??????'}"><span style="color:red">${q.exampleOx}</span></c:if></td>
						</tr>
				
				</table>
					<c:if test="${q.questionIdx%5==0&&q.exampleIdx==5}"> 
						</div>
						<c:if test="${q.questionIdx==10&&q.exampleIdx==5}">
							<br><br><hr style="height: 3px; background-color:black;"><br><br>
						</c:if>	
						<div class="col-md-6">
					</c:if>
				</c:forEach>
				</div>
		
			<div><br><br></div>
			
		
	
</body>
</html>