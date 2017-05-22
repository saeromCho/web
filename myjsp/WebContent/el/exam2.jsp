<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import = "vo.Customer" %>
<%
	String [] names = {"조새롬", "조새봄", "조성길"};
	request.setAttribute("names", names);
	
	ArrayList customerList = new ArrayList<>();
	customerList.add(new Customer("야야야", "sss@naver.com", 30, 30, false));
	customerList.add(new Customer("이이이", "ㄱㄱㄱ@d.com", 29, 29, true));
	customerList.add(new Customer("조새롬", "ROM@naver.com", 33, 12, false));
	request.setAttribute("list", customerList);
	
	HashMap map = new HashMap();
	map.put("pId", "p-111");
	map.put("product name", "노트북");
	map.put("price", 4000000);
	map.put("cust", new Customer("안녕", "ds@m.com", 23, 33, false));
	
	session.setAttribute("info", map);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>
${sessionScope.info.cust["name"]}<br>
${sessionScope.info.cust.name}<br>
${sessionScope.info.cust.age}<br>

<h2>EXL - MAP출력 => key값으로 조회하므로, .표기법과 []표기법이 둘 다 가능하다.</h2>
<ul>제품 ID : ${sessionScope.info.pId }</ul><%--pId가 key값임 --%><br>
<ul>제품이름 : ${sessionScope.info["product name"]}</ul><%--식별자 규칙에 어긋나는 문자가 있을 경우(여기서는 띄어쓰기랑 두부) []표기법을 써준다. --%>
<ul>제품가격 : ${sessionScope.info.price}원</ul><br>
<ul></ul>
<h2>EL - 배열출력</h2>
<ul>
<li>${requestScope.names[0]}</li> <%-- index로 접근하는 경우는  []표기법 사용--%>
<li>${requestScope.names["1"]}</li>
<li>${requestScope.names[2]}</li>
</ul>
<table border='20' width="1000px">
	<thread><!-- 각 열들의 이름, 제목 -->
		<tr>
			<td>이름</td>
			<td>이메일</td>
			<td>나이</td>
			<td>몸무게</td>
			<td>결혼여부</td>
		</tr>
	</thread>
	
	<tbody><!--  실제 테이블의 내용 -->
		<tr><!-- 한 행, 고객 1명 정보 -->
			<td>${requestScope.list[0].name}</td><!-- 한 행의, 각 열들의 정보 -->
			<td>${requestScope["list"][0]["email"]}</td>
			<td>${requestScope.list[0].age}세</td><!--arrayList는 보통 테이블로 많이 만든다. 대괄호 안의 공백은 인식하지 않지만 밖의 공백은 html이기에 인식을 한다. -->
			<td>${requestScope.list[0].weight}kg</td>
			<td>${requestScope.list[0].marriage ? "기혼" : "미혼"}</td>
		</tr>
		<tr><!-- 한 행, 고객 1명 정보 -->
			<td>${requestScope.list[1].name}</td><!-- 한 행의, 각 열들의 정보 -->
			<td>${requestScope["list"][1]["email"]}</td>
			<td>${requestScope.list[1].age}세</td>
			<td>${requestScope.list[1].weight}kg</td>
			<td>${requestScope.list[1].marriage ? "기혼" : "미혼"}</td>
		</tr>
		<tr><!-- 한 행, 고객 1명 정보 -->
			<td>${requestScope.list[2].name}</td><!-- 한 행의, 각 열들의 정보 -->
			<td>${requestScope["list"][2]["email"]}</td>
			<td>${requestScope.list[2].age}세</td>
			<td>${requestScope.list[2].weight}kg</td>
			<td>${requestScope.list[2].marriage ? "기혼" : "미혼"}</td>
		</tr>
	</tbody>
</table>

<ol>
<li>${requestScope.list[0].name}</li>
<li>${requestScope["list"][0]["email"]}</li> <%-- == requestScope.list --%>
<li>${requestScope.list[1].age}</li>
<li>${requestScope.list[2].email}</li>
</ol>

</body>
</html>