<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>1개 사진 업로드폼</h2>
<form action = "${initParam.rootPath }/imageupload" method = "post" enctype="multipart/form-data">
	업로더 : <input type = "text" name = "uploader"><br>
	설명 : <input type = "text" name = "comment" size = "50"><br>
	사진1 : <input type = "file" name = "image"><br><!-- 파일의 type은 항상 file이다! --><!-- 각 세개마다 파일아이템객체를 만들게 됨. 그걸 list로 servlet에게 넘기게 되는 것. servlet은 그걸 list로 받는 거고 -->
	사진2 : <input type = "file" name = "image"><br>
	사진3 : <input type = "file" name = "image"><br>
	<input type = "submit" value = "전송"/>

</form>
</body>
</html>