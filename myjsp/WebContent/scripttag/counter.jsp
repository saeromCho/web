<%@ page contentType="text/html;charset=utF-8"%>
<%@ page import = "java.util.Date, java.util.ArrayList"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%//<%@ page import = "java.util.Date" %>
<%//<%@ page import = "java.lagn.ArrayList" %>

<%!//선언자 태그 - servlet의 member변수나 메소드를 선언 및 정의, 구현할 때 쓰는 태그//사용할 메소드나 변수는 여기에다가 선언해줘야 되는 구나.
	int counter = 0;//instance변수라서 생성될 때 딱 한번만 초기화 됨.
	//JSP lifeCycle메소드 : jspInit() - init()메소드 / jspDestroy() - destroy()메소드 
	//_jspService() - service()메소드는 오버라이딩하면 안됨. 지금 코드짜는 게 이미 오버라이딩을 하고 있는 거
	public void jspInit() {
		System.out.println("counter.jsp의 jspInit()");
	}

	public void jspDestroy() {
		System.out.println("counter.jsp의 jspDestroy()");
	}
%>
<%//int counter = 0;//지역변수 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Input Form</title>
</head>
<body>

<jsp:include page = "/menu.jsp"/><!-- 루트경로에다가 넣었으므로 이렇게...... -->

<%
//현재시간 저장
	Date d = new Date();//java.util패키지 필요
	ArrayList list = new ArrayList();//java.lang패키지 필요.
	SimpleDateFormat sdf = new SimpleDateFormat("yyy년 MM월 dd일 HH시 mm분 ss초");
	String current = sdf.format(d);
	
	int size = (int)(Math.random()*6) + 1;//1~6
	
%>

현재시간 : <%= current %><br><!-- out.write("현재시간"); out.print(current); -->
<%="안녕" %><br><!-- out.print("안녕")이지만 그냥 이 파일에 안녕 이라고만 써도 보임 -->
<font size ="<%= size %>"><%=size %></font><br>
카운터 : <%=++counter %>
<%--JSP Script주석 : WEB Container(웹컨테이너)에게 알려주는 주석, 소스보기해도 보이지 않음--%>
<!-- HTML주석  : WEB Browser(웹브라우저)한테 알려주는 주석, 소스보기하면 보임-->
</body>
</html>