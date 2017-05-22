<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope = "session" var = "message" value="안녕<br>Test</br>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body><%--out태그는 태그를 해석(parsing)해서 출력하지 않고 태그모양도 그대로 출력해줌--%>
안녕하세요 <b>Hello</b>
<p><%-- &lt; : 꺽새를 여는 표시임/////&gt; : 꺽새를 닫는 표시  --%>
안녕하세요 &lt;b&gt; Hello &lt;/b&gt;
</p>
<h2>out태그를 이용해 HTML 특수문자 출력</h2>
<c:out value = "안녕하세요 <b>Hello</b>"/>
${sessionScope.message}<br>
<c:out value="${sessionScope.message}"/>
<h2>null값 출력</h2>
표현식 태그 : <%= request.getAttribute("text") %><br><%--null이면 'null'로 찍힘 --%>
EL : ${requestScope.text }<br><%--EL은 null이면 아무것도 안찍힘 --%>
out : <c:out value = "${requestScope.text}" default="텍스트가 없습니다."/><%--default:가져온 값이 null일때(원래 아무것도 안찍히는데) 찍히는 값 --%>
</body>
</html>