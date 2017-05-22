<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
JSTL의 형식화(fmt)라이브러리 
- 출력메세지(숫자,날짜)를 특정한 형태로 출력하는 것을 지원
- 국제화(지역화)처리 기능 제공

태그:formatDate(날짜의 형식화 처리 - 값:java.util.Date/java.sql.Date/java.sql.Time/java.sql.TimeStamp)
-태그의 속성
	+value:(형식화해서)출력할 값(Date객체)
	+type:값-date(날짜),time(시간),both(날짜와 시간)
	+pattern:SimpleDateFormat에서 사용하는 패턴문자로 형식을 지정.
태그:setLocale - 지역을 설정하는 태그.
    +value : 지역(언어코드_국가코드)
    	언어코드:ISO-639,국가코드:ISO-3166
    	한글_한국:ko_KR
    	중국어_중국:zh_CN
    	중국어_대만:zh_TW
    	일본어_일본:ja_JP
    	영어_미국:en_US
    	영어_영국:en_GB
--%>
<c:set scope="request" var="current" value="<%=new Date() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
EL로 출력:${requestScope.current}
<p>
<fmt:setLocale value="en_US"/>
type:date-<fmt:formatDate value="${requestScope.current}" type="date"/><br>
type:time-<fmt:formatDate value="${requestScope.current}" type="time"/><br>
type:both-<fmt:formatDate value="${requestScope.current}" type="both"/><br>
</p>
<p>
	pattern:<fmt:formatDate value="${requestScope.current}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초 E"/>

</p>
</body>
</html>