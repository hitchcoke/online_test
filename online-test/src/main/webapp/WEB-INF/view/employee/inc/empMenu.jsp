<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>Emp<span>.</span></h1>
      </a>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="${pageContext.request.contextPath}/employee/empList">사원관리</a></li>
          <li><a href="${pageContext.request.contextPath}/employee/studentList">학생관리</a></li>
          <li><a href="${pageContext.request.contextPath}/employee/teacherList">강사관리</a></li>
          <li><a href="${pageContext.request.contextPath}/employee/modifyEmpPw">비밀번호수정</a></li>
          <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
      </nav><!-- .navbar -->

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
  </header><!-- End Header -->