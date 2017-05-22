<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
action tag로 넘김<jsp:include page="/menu.jsp"/><br><!-- include로 넘겨주기때문에 menu.jsp로 가서 일을 실행한 후 결과가 여기로 와서 전달된다. -->
지시자 tag로 넘김<%@ include file = "/menu.jsp" %>
<form action = "/myjsp/findById" method = "post">
조회할 ID <input type = "text" name = "id">
<input type = "submit" value = "검색">
</form>
<h1>등록</h1>
<form action = "/myjsp/actiontag/forward.jsp" method = "post">
	ID : <input type = "text" name = "id"><br>
	비밀번호 : <input type = "password" name = "password"><br> 
	이름 : <input type = "text" name = "name"><br>
	이메일 : <input type = "text" name = "email"><br>
	포인트 : <input type = "text" name = "point"><br>
	<input type = "submit" value = "등록">
</form>
</body>
</html>



<!-- 
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
<form action = "/myjsp/findById" method = "post">
조회할 ID <input type = "text" name = "id"><br>
이름입력 <input type = "text" name = "name"><br>
비밀번호입력 <input type = "password" name = "password"><br>
이메일입력 <input type = "text" name = "email"><br>
포인트는 고정되어 있습니다.<br>
<input type = "submit" value = "검색">
</form>
</body>
</html>
 -->