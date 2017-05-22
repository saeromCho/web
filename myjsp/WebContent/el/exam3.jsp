<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
<h1>쿠키값 출력</h1>
 ${cookie.currentTime.value} <%--EL - 쿠키값출력 => cookie.쿠키이름.value --%>
<h1>요청파라미터 출력</h1>
age : ${param.age} <%--request.getParameter("age")을 출력한 거랑 같은 의미 --%>
<br>

취미 : <%-- ${paramValues.hobby} --%> <%--rquest.getParamterValues("hobby") : String --%>
<br>

<%-- ${paramValues. hobby[0] } - ${paramValues.hobby[1]} - ${paramValues.hobby[2] } --%>
<p><%--forEach로 hobby출력 --%>
<c:forEach items="${paramValues.hobby}" var="hobby">
	${hobby }<br>
</c:forEach>
</p>
</body>
</html>