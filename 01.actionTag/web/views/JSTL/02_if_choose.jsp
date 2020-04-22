<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건문 사용하기</title>
</head>
<body>

	<h2>if 사용하기</h2>
	<pre>
	c:if
	속성: test, var
	test -> 조건문이 들어가는 곳 / if() - 괄호 안
	var -> 변수 조건문의 결과 (true, false)
	</pre>
	
	<%request.setAttribute("name", "최가영"); %>
	
	<c:if test="${name ne '정세현' }" var="flag">
		<h1>이것이 맞을까요 출력?? 될까??</h1>
	</c:if>
	
	<h1>로그인 확인하기</h1>
	<c:if test="${param.userId eq 'admin' and param.password eq '1234' }">
		<h2>관리자로 로그인되었습니다.</h2>
	</c:if>
	<c:if test="${param.userId eq 'admin' }">
		<c:if test="${param.password eq '1234'}">
			
		</c:if>
	</c:if>
	
	<pre>
	else문은 딱히 없음.
	수작업으로 진행해야댐.
	choose로 스위치문마냥 만들어야댐..
	</pre>
	
	<%
		List<String> list = new ArrayList();
		list.add("육개장");
		list.add("잔치국수");
		list.add("돈까스");
		list.add("탕수육");
		
		request.setAttribute("list", list);
	%>
	
	<ul>
		<c:if test="${not empty list }">
			<li><c:out value="${list[0] }"/></li>
		</c:if>
		<c:if test="${empty list }">
			<li><c:out value="읎다 임마"/></li>
		</c:if>
	</ul>
	
	<h3>choose문 사용하기</h3>
	<pre>
	c:choose
	java의 switch문과 흡사
	c:choose
		c:when test="조건"
		c:when test="조건"
		c:when test="조건"
		c:otherwise
	</pre>
	
	<c:choose>
		<c:when test="${list[0] eq '삼계탕' }">
			<h1>삼계탕 굿굿</h1>
		</c:when>
		<c:when test="${list[0] eq '육개장' }">
			<h1>축복씨가 저녁으로 먹은 육개장!</h1>
		</c:when>
		<c:otherwise>
			<h1>굶어버리기~</h1>
		</c:otherwise>
	</c:choose>
	
	<h1>오늘의 식사메뉴~</h1>
	<ul>
		<c:forEach items="${list }" var="d">
			<li><c:out value="${d }"></c:out></li>
		</c:forEach>
	</ul>
		
</body>
</html>