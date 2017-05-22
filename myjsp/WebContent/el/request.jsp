<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%-- <%
	Cookie c = new Cookie("currentTime", new SimpleDateFormat("HH : mm : ss").format(new Date()));
	response.addCookie(c);
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
<h2>Context Root경로명</h2>
<%= application.getContextPath() %><br>
<%= application.getInitParameter("rootPath") %><br><%--두개 다 초기파라미터 조회하는 구문 --%>
${initParam.rootPath}<%-- 서블릿콘텍스트.get해서 가져온 구문. 위에 2개랑은 다르다. initParam : 초기파라미터를 제공하는 EL내장객체 --%>
<%--/myjsp == initParam.rootPath로 해도 됨--%>
<form action="/myjsp/el/exam3.jsp">
	나이 : <input type = "number" name = "age"><br>
	취미 : <br>
	<label>게임<input type = "checkbox" name = "hobby" value = "게임"></label>
	<label>운동<input type = "checkbox" name = "hobby" value = "운동"></label>
	<label>영화감상<input type = "checkbox" name = "hobby" value = "영화감상ㄴ"></label>
	<br>
	<input type = "submit" value = "전송"><br><br>
	<button>전송2</button>

</form>

</body>
</html>