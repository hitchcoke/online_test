
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/style.css">
</head>
<body>
	<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp">
		</c:import>
	</div>
	<br><br><br>
	<div class="container">
		<div class="section-header">
	          <h2>${loginStu.studentName}님의 성적</h2>
	    </div>
		
	
		<div>
			<canvas id="myChart" style="width:100%;max-width:100%"></canvas>
		</div>
		
		<br><br>
		<table style="width:100%">
			<tr>
				<th>시험 이름</th>
				<th>성적</th>
				<th>시험 날짜</th>
				<th>시험 보기</th>
			</tr>
			<tr>
				<td colspan="4"><hr style="height: 3px; background-color:black;"></td>
			</tr>
			
			<c:forEach var="s" items="${list}">
				<tr>
					<td>${s.testTitle}</td>
					<td>${s.score}점</td>
					<td>${s.testDate }</td>
					<td><button type="button" class="btn btn-outline-success btn" onclick="location.href='${pageContext.request.contextPath}/student/answerPaper?testId=${s.testId}'">문제보기</button></td>
				</tr>
				<tr>
					<td colspan="4"><hr></td>
				</tr>
			
			</c:forEach>
			<tr>
				<td colspan="4"><hr style="height: 3px; background-color:black;"></td>
			</tr>
		</table>
	</div>
	<script>
		let xModel= [];
		let yModel= [];
		
		$.ajax({
			async: false
			,url : '/online-test/chartScore'
			,type : 'get'
			,data : {
					studentNo: ${loginStu.studentNo}
				}
			,success : function(model){
				console.log(model);
				for(let attr in model){
					yModel.push(model[attr].score);
					console.log(model[attr].score);
					xModel.push(model[attr].testTitle);
				}
			}
		})
	</script>
		<script>
		var xValues = xModel;
		var yValues = yModel;
		
		new Chart("myChart", {
		  type: "bar",
		  data: {
		    labels: xValues,
		    datasets: [{
		      
		      data: yValues
		    }]
		  },
		  options: {
			  scales: {
					yAxes: [{
						ticks: {
							min: 0,
							max: 100
						}
					}]
				
			  }
		  ,title: {
		      display: true,
		      text: "시험 성적"
		    }
		  ,legend: {display: false}
		    
		   
		  	}
		});

	</script>

</body>
</html>