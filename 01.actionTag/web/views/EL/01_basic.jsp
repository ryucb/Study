
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.usebean.model.vo.Person" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h2>기본적인 EL문 사용하기</h2>
	<pre>
		EL 표현식은 jsp내장객체에 있는 값을 편리하게 사용할 수 있게 함.
		내장객체에 setAttribute로 저장된 값을 자동으로, key값을 기준으로 탐색하여 값을 가져옴.
		자동탐색: 작은범위 -> 큰 범위순
		<%-- ${키값||변수명||리터럴 } --%>
	</pre>
	
	
	<%
	
		String name="유병승";
		request.setAttribute("name", name);
		
		//객체 선언
		com.usebean.model.vo.Person p = new com.usebean.model.vo.Person();
		p.setName("서원");
		p.setAge(33);
		p.setGender("남");
		
		request.setAttribute("person", p);
		
		List<Person> persons = new ArrayList();
		persons.add(new Person("유병승", 19, "남"));
		persons.add(new Person("유축복", 24, "남"));
		persons.add(new Person("유슬기", 26, "여"));
		
		
		
		request.setAttribute("persons", persons);
		
		
	%>
	
	<p><%=name %></p>
	<p>${name}</p> 
	<p>${"유병승"}</p>
	
	<p>${person.name}, ${person["age"]}, ${person.gender}</p>
	
	<p>${persons}</p>
	
	<h2>리스트 출력하기</h2>
	
	<p>${persons.get(0).name }</p>
	<p>${persons.get(0).age }</p>
	<p>${persons[2].name }</p>
	<%-- <c:forEach item="${persons }" var="p">
		${p }
	</c:forEach> --%>
	
	<h2>EL 연산자 처리</h2>
	<%
		int su1=10;
		int su2=20;
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
	%>
	
	<p>더하기연산: ${su1+su2}</p>
	<p>더하기연산: ${19+30}</p>
	<p>마이너스연산: ${su1-su2}</p>
	<p>나누기연산: ${su1/su2}</p>
	<p>나누기연산: ${su1 div su2}</p> <!-- EL연산 -->
	<p>곱하기연산: ${su1*10}</p>
	<p>나머지연산: ${su1%su2}</p>
	<p>나머지연산: ${su1 mod su2}</p>
	
	<h4>비교, 논리연산</h4>
	<p>대소비교: ${su1>su2 }</p>
	<p>대소비교: ${su1<=20 }</p>
	<p>대소비교: ${su1 le 30 }</p>
	<p>대소비교: ${su1 gt 30 }</p>
	
	<%
		String hobby="LoL";
		request.setAttribute("hobby", hobby);
	%>
	
	<p>${hobby=="LoL"}</p>
	<p>${hobby eq "LoL"}</p>
	<p>${persons[0].name eq "유병승"}</p>
	<p>${persons[2].name eq "유슬기" && persons[0].age==19 }</p>
	<p>${persons[2].name eq "유슬기" and persons[0].age==19 }</p>
	<p>${persons[2].name eq "유슬기" or persons[0].age==19 }</p>
	<p>${persons[2].name eq "유슬기" || persons[0].age==19 and persons[1].name=="유축복"}</p>
	
	<h4>부정연산</h4>
	<p>${persons[0].name != "유병승" }</p>
	<p>${persons[0] ne "유병승" }</p>
	
	<%
	
		List<String> test = new ArrayList();
		/* test.add("하하하하"); */
		request.setAttribute("test", test);
	
	%>
	
	<h4>객체의 빈값을 확인</h4>
	<p>${test }</p>
	<p>${test == null }</p>
	<p>${test.size() == 0 }</p>
	<p>${empty test}</p>
	<p>${!(empty test)}</p>
	
	<c:if test="${not empty test }">
		<p>이거출력</p>
	</c:if>
	
	<p>${persons[0].age==19?"미성년이시네요" : "성년이시네요" }</p>
	
	<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
	

</body>
</html>


