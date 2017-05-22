<%@page import="vo.Customer"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%--JSTL 태그라이브러리(중에서 코어라이브러리) 등록 -> 태그를 쓰기 위해서 쓴다고 알려주는 것.--%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%--
	SessionScope에 "login_customer"라는 이름으로 Customer객체를 속성으로 등록 
	=> session.setAttribute("login_customer", Customer의 변수이름)
 --%>
 <c:set scope="session" var="login_customer" value='<%=new Customer("이회원", "lee@a.com", 40, 20, true) %>'/>
<%-- scope : 어디에다가 넣을지를 의미함. var : 어떤 이름으로 넣을거냐 . value : 무엇을 넣을거냐-새로 만들어서 넣는 경우는 표현식태그로해줘야한다.  --%>
<%-- <c:remove scope = "session" var = "login_customer"/>속성제거 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
<%--choose : 다중조건, if : 단일조건 --%>
<c:choose>
	<c:when test = "${sessionScope.login_customer == null }"><%--empty sessionScope.login_customer--%><%--로그인을 안했으면~ --%>
		로그인 회원가입
	</c:when>

	<c:otherwise><%--로그인을 했으면~ --%>
		로그아웃 마이페이지 고객센터
		<%-- 로그인한 고객의 나이가 19세 이상이면 성인용품 메뉴를 보여준다.(if문)--%>
		<c:if test = "${sessionScope.login_customer.age >= 19}"><%--조건을 가져올 때 EL을 이용해서 가져온다. EL은 특성 속성의 값을 이용해야 할 때 많이 쓰인다. --%>
			성인용품
		</c:if>
	</c:otherwise>

</c:choose>

</body>
</html>