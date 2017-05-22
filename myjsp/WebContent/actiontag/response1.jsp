<%@page import="vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
<h1>조회결과</h1>
<%
	Member member = (Member) request.getAttribute("result");
%>
ID : <%= member.getId() %><br>
패스워드 : <%= member.getPassword() %><br>
이름 :  <%= member.getName() %><br>
이메일 : <%= member.getEmail() %> <br> 
포인트 :  <%= member.getPoint() %><br>

<a href = "/myjsp/actiontag/request.jsp">검색폼으로 이동</a>
</body>
</html>