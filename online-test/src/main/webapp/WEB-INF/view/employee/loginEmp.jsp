
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

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

  <style type="text/css">
	html, body {
	    height: 100%
	}
	
	#wrap {
	    min-height: 100%;
	    position: relative;
	    padding-bottom: 60px;
	}
	
	footer {
	    bottom: 0;
	}
	<!--하단 footer 고정-->
	</style>
 
</head>
<body>
 <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">이지원 두번째 개인 프로젝트</h1>
                                <p class="lead fw-normal text-white-50 mb-4">Spring Framwork를 이용한 LMS 프로그램</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                            
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="${pageContext.request.contextPath}/image/home.png"></div>
                    </div>
                </div>
            </header>

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
              <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <button class="nav-link active btn btn-outline-success" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">&nbsp;&nbsp;&nbsp;사원&nbsp;&nbsp;&nbsp;</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link btn btn-outline-success " id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">&nbsp;&nbsp;&nbsp;강사&nbsp;&nbsp;&nbsp;</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link btn btn-outline-success" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">&nbsp;&nbsp;&nbsp;학생&nbsp;&nbsp;&nbsp;</button>
				  </li>
			  </ul>
              <h3>로그인</h3>
 
            </div>
            <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
	            <form action="${pageContext.request.contextPath}/loginEmp" method="post" id="form">
	              <div class="form-group first">
	                <label for="username">아이디 </label>
	                <input type="text" class="form-control" id="id" name="Id" value="hitch">
	              </div>
	             
	              <div class="form-group last mb-4">
	                <label for="password">비밀번호 </label>
	                <input type="password" class="form-control" id="pw" name="Pw" value="1234">
	                 <span style="color:red"id = "msgs" class="msgs"></span>
	              </div>
	              <input type="submit" value="로그인" class="btn btn-block btn-success">
	            </form>
	            </div>
	            
	        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
	            <form action="${pageContext.request.contextPath}/loginTea" method="post" id="form">
	              <div class="form-group first">
	                <label for="username">아이디 </label>
	                <input type="text" class="form-control" id="id" name="Id" value="teacher">
	              </div>
	             
	              <div class="form-group last mb-4">
	                <label for="password">비밀번호 </label>
	                <input type="password" class="form-control" id="pw" name="Pw" value="1234"> 
	                 <span style="color:red"id = "msgs" class="msgs"></span>
	              </div>
	              <input type="submit" value="로그인" class="btn btn-block btn-success">
	            </form>
	            </div>
	            
	          <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
	            <form action="${pageContext.request.contextPath}/loginStu" method="post" id="form">
	              <div class="form-group first">
	                <label for="username">아이디 </label>
	                <input type="text" class="form-control" id="id" name="Id" value="student">
	              </div>
	             
	              <div class="form-group last mb-4">
	                <label for="password">비밀번호 </label>
	                <input type="password" class="form-control" id="pw" name="Pw" value="1234">
	                 <span style="color:red"id = "msgs" class="msgs"></span>
	              </div>
	              <input type="submit" value="로그인" class="btn btn-block btn-success">
	            </form>
	            </div>     
            </div>
            </div>
           
          </div>
          
          
        </div>
        
      </div>
    </div>
  </div>
  <c:if test="${msg==1}">
  	<script>
  		alert("아이디 비밀번호를 확인해주세요")
  	</script>
  </c:if>
<br><br><br><br>

	<script src="${pageContext.request.contextPath}/bootstrap/loginCss/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/loginCss/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/loginCss/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/loginCss/js/main.js"></script>
	    <script>
	  $(document).ready(function() {
	  	$('#pw').blur(function(){
	  		if ($('#id').val().length<1||$('#pw').val().length<1){
	  			$('#msgs').text("올바르게 채워주세요");
	  			$('#id').focus();
	  		}
	  		
	  	})
	  })
	  if(${row}==1){
			alert('아이디, 비밀번호확인해주세요')
		}
			

	  	
  </script>
	
</body>
</html>


  
   