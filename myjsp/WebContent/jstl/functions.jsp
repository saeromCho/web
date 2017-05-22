<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setAttribute("names", new String[]{"조새롬", "조새봄", "김철기", "김진광", "김수란", "김희철", "정석", "함박", "미소"});
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>

<c:choose>
	<c:when test="${fn:length(requestScope.names)  == 0 }">
		조회된 결과가 없습니다.
	</c:when>
	<c:otherwise>
		<h2>이름 전체 출력</h2>
		<c:forEach items="${requestScope.names}" var="name">
			${name }
	
		</c:forEach>
	<h2>김씨만 보고싶음. 김씨만 출력</h2>
	<c:forEach items="${requestScope.names}" var="name">
		<c:if test="${fn:startsWith(name, '김')}"><%--name이 '김'씨로 시작하는 이름만 출력 --%>
		   ${name }
		</c:if>
	</c:forEach>
	<h2>이름이 2자인 사람의 이름만 출력</h2>
	<c:forEach items="${requestScope.names }" var="name">
		<c:if test="${fn:length(name) == 2 }">
			${name } - ${fn:length(name) }<br><%--이름찍고 그 옆에 몇글자인지 숫자가 찍힐 것.(새롬-2) --%>
		</c:if>
	</c:forEach>
	<h2>총 저장된 이름의 개수</h2>
	${fn:length(requestScope.names) }<br>
	join():${fn:join(requestScope.names, " ")}<%--애들을 붙일 때 사이에 두는 구분자를 정해줄 때, 두번째에 있는 걸로 --%>
	</c:otherwise>
	
	</c:choose>

</body>
</html>