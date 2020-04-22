<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag 활용</title>
</head>

<body>

	<a href="<%=request.getContextPath() %>/useBeanTest.do">useBeanTest</a>
	
	<c:out value="${'안녕' }"/> <!-- == -->	<%-- <%="안녕" %> --%>

</body>

</html>