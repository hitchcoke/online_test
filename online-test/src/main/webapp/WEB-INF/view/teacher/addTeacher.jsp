
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

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
	<br><br><br>

	<div class="section-header">
          <h2>addTeacher</h2>
        </div>
	<div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img src="${pageContext.request.contextPath}/image/logins.png" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
  
            </div>

	            <form action="${pageContext.request.contextPath}/employee/addTeacher" method="post" id="form">
	              <div class="form-group first">
	                <label for="username">아이디 </label>
	                <input type="text" class="form-control" id="id" >
	                <input type="text" class="form-control" id="ckid" name="teacherId" readonly="readonly">
	                <button type="button" id="idck" class="btn btn-block btn-success btn">중복검사</button>
	              </div>
	             
	              <div class="form-group last mb-4">
	                <label for="password">비밀번호 </label>
	                <input type="password" class="form-control" id="pw" name="teacherPw">
	                 <span style="color:red"id = "msgs" class="msgs"></span>
	              </div>
	              <div class="form-group first">
	                <label for="username">이름 </label>
	                <input type="text" class="form-control" id="name" name="teacherName" >
	              </div>
	              <br>
	              <div>
	              	<select class="form-select" aria-label="Default select example"name="grade">
					  <option selected  value="1">학년선택</option>
					  <option value="1">1학년</option>
					  <option value="2">2학년</option>
					  <option value="3">3학년</option>
					</select>
	              </div>
	             <br>
	              <button type="button" id="btn" class="btn btn-block btn-success btn-lg">add</button>
	            </form>
	            </div>
	          </div>
	       </div>
	     </div>
	     </div>       
	
		
	</div>
	<script>
	$('#idck').click(function(){
		if($('#id').val().length>3){
			$.ajax({
				url:'${pageContext.request.contextPath}/idCk'
				, type:'get'
				, data: {id:$('#id').val()}
				, success: function(model){
					if(model=='YES'){
						$('#ckid').val($('#id').val());
						
						alert($('#id').val()+"는 사용가능한 아이디입니다");
						$('#id').val('');
					}else{
						alert($('#id').val()+'는 사용중인 아이디입니다');
						$('#id').val('');
					}	
				}
				
			})
		}else{
			alert('아이디는 4자이상 입력해주세요')
		}		
	})
	
	
	$("#btn").click(function(){
		if($("#pw").val().length<4){
			alert('비밀번호는 4자이상 입력해주세요');
			return;
		}
		
		if($("#ckid").val().length<4){
			alert('아이디는 4자이상 입력해주세요');
			return;
		}
		
		if($("#name").val().length<2){
			alert('이름은 2자이상 입력해주세요');
			return;
		}
		
		
		$('#form').submit()
	})
	</script>
</body>
</html>