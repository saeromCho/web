<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import = "vo.Customer" %>
<%
	Customer customer = new Customer("롬", "rom@naver.com", 20, 40.2, false);
	request.setAttribute("customer", customer);//request객체에 넣었음
	
 	Customer custom = new Customer("봄", "bom@Na.com", 20, 45.1, false);
 	session.setAttribute("customer", custom);//같은 이름으로 넣었지만 저장 위치가 다름. session
 	//작은 범위에 있는 것부터 찾아보고서는 있으면 찍는다. 따라서 request객체에 담겨있는 객체의 속성값들을 찍게 될 것.
 	//세션꺼를 찍고 싶으면 세션에서 가지고 왔다 고 명시를 해주어야 함. 'sessionScope.'
 	//page -> requestScope -> sessionScope -> 
 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>


<h1>Request객체에서 조회한 고객 정보(pageScope를 들렸다가 왔음)</h1>
<%--getAttribute("customer").getName(); --%>
이름 : ${customer.name}<br>
이메일 :${customer.email}<br>
나이 : ${customer.age}<br> <%--getAttribute("customer").getAge()--%>
몸무게 : ${customer.weight}<br>
결혼여부 : ${customer.marriage ? "기혼" : "미혼"}<br><%--삼항 연산자 사용//getAttribute("customer").isMarriage() --%>
<p>
${customer }<br><%--getAttribute("customer")객체전체의 속성값들이 toString된 값으로 찍힘 --%>
${result }<%--출력할 내용이 null일 경우는 출력을 하지 않는다. 출력대상을 찾아가는 도중 속성 값이  null이 나온 경우, 연산을 멈추고 아무것도 출력하지 않는다. --%> 
<%--getAttribute("result") => null이 찍힘 --%>
<%-- <%= request.getAttribute("result") %> --%>
</p>


<h1>바로 Request로 가서 조회한 고객 정보</h1>
<%--getAttribute("customer").getName(); --%>
이름 : ${requestScope.customer.name}<br>
이메일 :${requestScope.customer.email}<br>
나이 : ${requestScope.customer.age}<br> <%--getAttribute("customer").getAge()--%>
몸무게 : ${requestScope.customer.weight}<br>
결혼여부 : ${requestScope.customer.marriage ? "기혼" : "미혼"}<br>
<br><br>


<h1>Session Scope에서 조회한 고객 정보</h1>
이름 : ${sessionScope.customer.name}<br>
이메일 :${sessionScope.customer.email}<br>
나이 : ${sessionScope.customer.age}<br> <%--getAttribute("customer").getAge()--%>
몸무게 : ${sessionScope.customer.weight}<br>
결혼여부 : ${sessionScope.customer.marriage ? "기혼" : "미혼"}<br>
<p>
${sessionScope.customer}
</p>


</body>
</html>