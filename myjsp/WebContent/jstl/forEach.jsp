<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="vo.Customer"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	request.setAttribute("names", new String[]{"조새롬", "조새봄", "조성길", "양재순", "조상열"});
ArrayList customerList = new ArrayList<>();
customerList.add(new Customer("야야야", "sss@naver.com", 30, 30, false));
customerList.add(new Customer("이이이", "ㄱㄱㄱ@d.com", 29, 29, true));
customerList.add(new Customer("조새롬", "ROM@naver.com", 33, 12, false));
request.setAttribute("list", customerList);

HashMap map = new HashMap();
map.put("pId", "p-111");
map.put("product name", "노트북");
map.put("price", 4000000);
map.put("cust", new Customer("안녕", "ds@m.com", 23, 33, false));

session.setAttribute("info", map);
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
<select>
	<c:forEach items="${requestScope.names}" var="name"> <%--태그보다 EL이 먼저 실행된다.--%>
		<%--반복할 구문 --%>
		<option>${name}</option>
	</c:forEach>
</select>
<h1>고객정보</h1>
 <table border="1">
 	<thead>
 		<tr>
 			<td>이름</td>
 			<td>이메일</td>
 			<td>나이</td>
 			<td>몸무게</td>
 			<td>결혼여부</td>
 		</tr>
 	</thead>
 	<tbody>
 		<c:forEach items="${requestScope.list}" var="customer">
 		<tr>
 			<td>${customer.name }</td>
 			<td>${customer.email }</td>
 			<td>${customer.age }</td>
 			<td>${customer.weight }</td>
 			<td>${customer.marriage ? "기혼" : "미혼"}</td>
 		</tr>
 		</c:forEach>
 	</tbody>
  
 </table>
 
 <h1>forEach를 이용해 HashMap 전체조회</h1>
 <c:forEach items="${sessionScope.info}" var="info"><%--session.setAttribute("info", map); --%>
 	<%--info -> Entry값임 --%>
 	Key :${info.key } /////
 	Value : ${info.value }<br>
 
 <c:choose>
 	<c:when test='${info.key == "cust"}'>
 		<ul>
 			<li>${info.value.name}</li>
 			<li>${info.value.email}</li>
 			<li>${info.value.age}</li>
 		</ul>
 	</c:when>
 	
 	<c:otherwise>
 	
 	</c:otherwise>
 </c:choose>
 </c:forEach>
 <h1>forEach를 이용한 단순반복-몇부터 몇까지 몇씩 증가하는 지</h1><%--begin:시작숫자, end:종료숫자, step:증가숫자(생략시 기본 값 1)//begin, end, step은 음수로 해주면 안됨 => 감소를 해줄 수 없음--%>
 <c:forEach items="${sessionScope.info }" begin = "1" end = "3" step="1" var = "info">
 	Key :${info.key } /////
 	Value : ${info.value }<br>
 </c:forEach>
  <br>
 <c:forEach items="${sessionScope.info }" begin = "1" end = "2" step="1" var = "info">
 <c:when test='${info.key == "cust"}'>
 		<ul>
 			<li>${info.value.name}</li>
 			<li>${info.value.email}</li>
 			<li>${info.value.age}</li>
 		</ul>
 	</c:when>
 </c:forEach>
 <ol type = "I">
	<c:forEach begin = "1" end="10" step="1" var="no"><%--var를 설정해주면 증감숫자를 표시해줄 수 있다 --%>
		<li>안녕 - ${no}</li>
	</c:forEach>
</ol>
</body>
</html>