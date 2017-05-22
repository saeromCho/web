<%@ page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean scope = "request" id = "member" class = "vo.Member"/><%--임포트 안해줘도 되지. 같은 클래스 내에 있잖아. --%>
<!-- '내용' 이 이 안에 있으면, 객체가 없을때는 객체를 생성하면서 이 내용의 일이 실행이 되고
				                생성된 객체가 이미 있으면 그냥 이 '내용'은 지나친다.
				       member.setId(request.getParameter("id")); 이 구문이 객체가 있었다면 set되지 않음. 없으면 set함-->
<%-- </jsp:useBean> --%>
				                
<%-- <jsp:setProperty name = "member" property = "id" param = "id"/> --%>
<jsp:setProperty name = "member" property = "*"/>
<%-- 
	 <jsp:setProperty name = "member" property = "id"/>처럼 param을 생략해줘도 가능하고
	 <jsp:setProperty name = "member" property = "*"/>처럼 property에 *를 해줘도 가능. 일괄적으로 다 넣어라 라는 의미. 이름이 같다면!! 
 --%>
 
<%-- 
	Member member = (Member)request.getAttribute("member");
	if(member == null) {
		member = new Member();
		request.setAttribute("member", member);
	} ==> setProperty 단계
	
	member.setId(request.getParameter("id")); ==> <jsp:setProperty name = "member" property = "id" param = "id"/>
 --%>
 
 <%
 //요청 디스패치 방식으로 RegisterServlet으로 이동
 //request.getRequestDispatcher("/register").forward(request, response);
 //response.sendRedirect("/myjsp/register");
 %>
 <jsp:forward page = "/register"/><%-- 요청디스패치 방식으로 page에서 지정해준 url로 이동해라 라는 의미 --%>
 <%-- request.getRequestDispatcher().forward(request, response); 경로만 뺀 게 forward태그임 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>

</body>
</html>