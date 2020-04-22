<%@page import="java.util.Date"%>
<%@page import="org.apache.naming.java.javaURLContextFactory, com.usebean.model.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set, out 태그이용하기</title>
</head>
<body>

	<h1>core태그 -> out태그 활용</h1>
	<pre>
	c:out
	태그 속성: value, default, escapeXML
	value: 출력할 값
	default: value가 없을경우 기본으로 설정되는 값 
	escapeXML: value의 Tag형식(HTML) 해석여부
	</pre>
	
	<c:out value="이거 출력하자"></c:out>
	<% String msg = "오늘 아직 수요일이네요"; %>
	<c:out value="<%=msg %>"></c:out>
	<c:out value="${'하하하'}"></c:out>
	<h2><c:out value="${'호호호호' }"/></h2>
	<c:out value='<h2>이거는 되니</h2>'/>
	<c:out escapeXml="false" value='<h2>이거는 될까</h2>'></c:out>
	<c:out value="${10==20 }"/>
	
	<%
		request.setAttribute("hobby", "게임");
	%>
	
	<c:out value="${hobby }"/>
	<c:out value="${name }" default="현정호"/>
	
	<h3>데이터 변수에 저장하기</h3>
	<pre>
	c:set
	속성: var, value, target, scope
	var: 변수명을 이용해서 EL로로 데이터 호출
	value: var에 들어갈 값
	target: 지정 객체
	scope: 변수 저장 영역
	</pre>
	
	<c:set var="content" value="이제 곧 쉬는시간" />
	<c:out value='${content}'/> <!-- pageScope.content -->
	
	
	
	<c:set var="path" value="<%=request.getContextPath() %>"/>
	<c:set var="path2" value="${pageContext.request.contextPath }"/>
	${path }
	${path2 } 
	
	<h3>객체를 저장해보자</h3>
	<c:set var="today" value="<%=new Date()%>"/>
	<c:out value="${today }"/>
	<c:set var="person" value='<%=new Person("진승연", 27, "남") %>'/>
	<c:out value="${person.name }"/>
	
	<c:out value='${requestScope.person }'/>
	<c:out value='${pageScope.person }'/>
	
	<h4>특정 scope에 저장하기</h4>
	<c:set var="age" value="19" scope="request"/>
	<c:set var="age" value="20" scope="session"/>
	<c:set var="age" value="21" scope="application"/>
	
	<c:out value="${age }"/>
	<c:out value="${requestScope.age }"/>
	<c:out value="${sessionScope.age }"/>
	<c:out value="${applicationScope.age }"/>
	
	<h4>특정 객체에 값 저장하기</h4>
	<c:out value="${person }"/></br>
	<c:set target="${person }" property="age" value="33"/>
	<c:out value="${person }"/></br>
	<c:set target="${person }" property="age" value="33"/>
	<c:out value="${person }"/></br>
	
	<h4>등록된 변수 삭제</h4>
	<c:remove var="age" scope="request"/> <!-- scope 지정하지 않을 경우 전체삭제 -->
	<c:out value="${age }"/>
	
	<script type="text/javascript">
	
		console.log(typeof("${applicationScope.age }")); // String으로 무적권 저장
	
	</script>

</body>

	
</html>