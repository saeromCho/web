<%@ page contentType="text/html;charset=UTF-8"%>

<%--
	vo.Member result = (vo.Member)request.getAttribute("result");
	if(result == null) {
		result = new vo.Member();//매개변수가 없는 생성자를 부르기에 no-args생성자를 만들어 놓는 건 기본!!!!
		request.setAttribute("result", result);
	} 									=> 이렇게 긴 코드를 	useBean을 사용함으로써 간단히 가능
 --%>
 <!-- action태그의 목적 : 자바코드를 밖으로 빼는 것!! -->
<jsp:useBean scope = "request" id = "result" class = "vo.Member"/>  
<%--
	useBean : 속성영역에서 속성객체(객체가 VO일때 많이 사용)를 가져오는 태그. 가져오는 객체가 없으면 만들어서 넣어준다.
		태그의 속성 - scope : 사용해야 하는 속성영역이 지정되어 있음. - page(객체생성하는 개념, 기본값), request, session, application 이 중에서만 골라쓸 수 있음.
			    - id : 사용할 VO객체의 이름을 얘로 정해줌  & 가져온 속성객체의 변수명(식별자) 역할임. => result = request.getAttribute("result");
			    - class : 속성의 타입(클래스 명)을0 지정. 패키지명을 포함해서 설정해야한다.		
 --%>
<%--
<%
	Member member = (Member) request.getAttribute("result");
%>
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
ID : <%= result.getId() %> <br>
   : <jsp:getProperty name = "result" property = "id"/><br>
이름 : <%= result.getName() %> <br>
   : <jsp:getProperty name = "result" property = "name"/><br> 
<!--result는 그걸 갖고있는 객체를 가리킴. 그 객체에서 name이라는 property(속성)을 갖고오겠다.-->

<a href = "/myjsp/actiontag/request.jsp">검색폼으로 이동</a>
</body>
</html>

<%-- 

<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean scope = "request" id = "result" class = "vo.Member"/>

<!doctype html>
<html>
<head>
<meta charset = "utf-8">
<title>제목을 입력하세요</title>
</head>
<body>
ID : <jsp:getProperty name="result" property="id"/><br>
이름 : <jsp:getProperty name="result" property="name"/><br>
비밀번호 : <jsp:getProperty name="result" property="password"/><br>
이메일 : <jsp:getProperty name="result" property="email"/><br>
포인트 : <jsp:getProperty name="result" property="point"/><br>


<a href ="/myjsp/actiontag/request.jsp">검색폼으로 이동</a>

 --%>