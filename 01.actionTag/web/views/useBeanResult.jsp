<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>useBean 표준태그 활용하기 - 객체 조작하기</h2>
	<jsp:useBean id="person" class="com.usebean.model.vo.Person" scope="request"></jsp:useBean>
	<!-- useBean 태그는 서블릿에서 보낸 key값과 동일한 id명을 가지고 있으면
			서블릿에 세팅한 값을 그대로 가져올 수 있음 -->
			
	<!-- useBean의 값을 jsp:getProperty로 가져옴 -->
	<jsp:getProperty property="name" name="person"/> <!-- name과 동일한 명칭의 변수를 세터에서 가져옴 -->
	<jsp:getProperty property="age" name="person"/>
	<jsp:getProperty property="gender" name="person"/>
	
	<jsp:useBean id="p" class="com.usebean.model.vo.Person" scope="request"/>
	
	<!-- 생성된 useBean에 깂을 넣으려면 setProperty를 이용함 -->
	<h2>setProperty 이용하여 값넣기</h2>
	<jsp:setProperty property="name" name="p" value="김인술"/>
	<jsp:setProperty property="age" name="p" value="33"/>
	<jsp:setProperty property="gender" name="p" value="남"/>
	
	<jsp:getProperty property="name" name="p"/> <!-- name과 동일한 명칭의 변수를 세터에서 가져옴 -->
	<jsp:getProperty property="age" name="p"/>
	<jsp:getProperty property="gender" name="p"/>
	
	
	<h2>클라이언트가 보낸 param값을 useBean에 대입이 가능</h2>
	<jsp:setProperty property="name" name="p" param="name"/>
	<jsp:setProperty property="age" name="p" param="age"/>
	<jsp:setProperty property="gender" name="p" param="gender"/>
	
	<h3>전달받은 값</h3>	
	<jsp:getProperty property="name" name="p"/> <!-- name과 동일한 명칭의 변수를 세터에서 가져옴 -->
	<jsp:getProperty property="age" name="p"/>
	<jsp:getProperty property="gender" name="p"/>
	
	
</body>
</html>