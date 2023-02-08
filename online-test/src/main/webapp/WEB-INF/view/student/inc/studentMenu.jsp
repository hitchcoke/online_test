<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="${pageContext.request.contextPath}/student/home" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>Student<span>.</span></h1>
      </a>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="${pageContext.request.contextPath}/student/myScore">성적</a></li>
          <li><a href="${pageContext.request.contextPath}/student/home">시험일정</a></li>
          <li><a href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호 수정</a></li>
          <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
      </nav><!-- .navbar -->

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
  </header><!-- End Header -->