<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--empMenuInclude -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp">
		</c:import>
	</div>
	<h1>teacher List</h1>
	<a href="${pageContext.request.contextPath}/employee/addTeacher">강사등록</a>
	<table border="1">
		<tr>
			<th>teacherId</th>
			<th>teacherName</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.teacherId}</td>
				<td>${e.teacherName}</td>
				<td><a href="${pageContext.request.contextPath}/employee/deleteTeacher?teacherNo=${e.teacherNo}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
		<div>
		<c:if test="${currentPage>1}">
			<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=1&searchWord=${searchWord}">처음</a><span>&nbsp;</span>
			<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a><span>&nbsp;</span>
		</c:if>
		<c:forEach var="i" begin="${currentPage}" end="${lastPage}" step="1">
			<c:if test="${i<currentPage+5}">
				<c:if test="${i!=currentPage}">
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${i}&searchWord=${searchWord}">
						${i}
					</a>
					<span>&nbsp;</span>
				</c:if>
				<c:if test="${i==currentPage}"><span style="background-color: green">&nbsp;${i}&nbsp;</span></c:if>
			</c:if>
		</c:forEach>
		<c:if test="${currentPage<lastPage}">
			<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a><span>&nbsp;</span>
			<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${lastPage}&searchWord=${searchWord}">끝</a>
		</c:if>
		<form method="get" action="${pageContext.request.contextPath}/employee/teacherList">
			<span>
				<input type="text" name="searchWord">
				<button type="submit">검색</button>
			</span>
		</form>
	</div>
</body>
</html>
