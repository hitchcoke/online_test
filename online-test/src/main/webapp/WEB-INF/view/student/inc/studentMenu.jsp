<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>

	<!-- 지나간 시험 리스트+ 점수
		오늘 날짜 시험 리스트는 응시버턴 시험치 출력
	 -->
	<a href="${pageContext.request.contextPath}/student/myScore">성적</a>
	<a href="${pageContext.request.contextPath}/student/home">시험</a>
	<a href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호수정</a>
	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
</div>