<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<!-- 시험회차관리 내에서 시험문제(crud) -->
	<a href="${pageContext.request.contextPath}/teacher/testList">시험관리</a>
	<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">비밀번호수정</a>
	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
</div>