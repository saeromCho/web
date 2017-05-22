<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
	태그:formatNumber - 숫자(정수/실수)의 형식화 처리 후 출력
	-정수부의 자릿수 구분자(,)붙여서 출력
	-실수부(정수부)자릿수 지정
	-숫자에 특정기호(통화,%...)붙여서 출력
	태그 속성
	+value:출력할 숫자
	+type:number(기본:자리구분자),currency(통화기호),percent(%을 붙인다.value*100) => 기본 포멧 지정
	+pattern : 원하는 형식을 직접 지정.(DecimalFormat - #,0(자릿수),(자리구분자) .(소숫점구분자))
 --%>
<c:set scope="request" var="num" value="123456789"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
EL num : ${requestScope.num}<br>
<p>
type : number - <fmt:formatNumber value="${requestScope.num}"/><br>
groupingUsed="false"-<fmt:formatNumber value="${requestScope.num}" groupingUsed="false"/><br>
type=currency-<fmt:formatNumber value="${requestScope.num}" type="currency"/><br>
<fmt:setLocale value="en_US"/>
<fmt:formatNumber value="${requestScope.num}" type="currency"/><br>

<fmt:setLocale value="en_GB"/>
<fmt:formatNumber value="${requestScope.num}" type="currency"/><br>

type:percent-<fmt:formatNumber value="0.1" type="percent"/>-${10}%<!-- 보고싶은 %나누기 100 -->
</p>
<c:set scope="request" var="numFloat" value="100300.12345"/>
실수 EL-${requestScope.numFloat}<br>
<fmt:formatNumber value="${requestScope.numFloat}"/><br><!-- 기본:소수점 3자리 -->
minFractionDigits="정수":최소로 유지할 소숫점이하 자리수
<fmt:formatNumber value="${requestScope.numFloat}" minFractionDigits="5"/><br>
<fmt:formatNumber value="${requestScope.numFloat}" maxFractionDigits="2"/><br>
<p>
pattern : <fmt:formatNumber value="${requestScope.numFloat}" pattern="#,###"/>
pattern : <fmt:formatNumber value="${requestScope.numFloat}" pattern="#,###.0000000"/>
<%--#은 모자라는 숫자는 무시,0은 모자라는 숫자는 0으로 채움. --%>

</body>
</html>