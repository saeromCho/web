package hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * Servlet 클래스 구현 방식
 * -----------------서블릿 클래스 구현----------------
 * 1. public class로 선언해야 한다.
 * 2. javax.servlet.http.HttpServlet(TOMCAT과 연동을 해야지만 extends가 가능)을 상속받아야 한다.(extends) - java EE  API임, JDK깔았다고 있는 API가 아님(Core API가 아님)
 * 3. 매개변수가 없는 생성자(no-argument생성자) - 생성자는 default로 저절로 생성이 됨.
 * 4. doGet() 또는 doPost()메소드를 오버라이딩(HttpServlet클래스에 존재할 것) => 이 메소드 내에다가 서블릿이 서비스 해야하는 내용을 구현하게 된다.
 * 		doGet() : GET방식 요청을 처리함. doPost() : POST방식 요청을 처리함.
 * 
 * ---------------서블릿을 TOMCAT에 등록----------------
 * 5. 구현한 Servlet class를 톰캣에 등록
 * 		=> 1. web.xml에 등록하는 방법
 * 		   2. Annotation을 이용해서 등록하는 방법(서블릿 3.0부터 - 톰캣7)
 */
public class HelloServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	//메인메소드라고 생각하기
		
		
		Date date = new Date();//실행시점의 일시
		String current = String.format("%tY-%<tm-%<td %<tH:%<tM:%<tS", date);//2017-04-27 17:30:22//Y에 넣었던 date를 m, d, H, M, S에다가도 넣어라.
		
		//SimpleDateFormat : java.util.Date => String(format() 메소드 사용), String => Date(parse() 메소드 사용)
		//yyyy : 년도(4자리), MM : 월(2자리), dd : 일(2자리), HH : 시간(24시간제) mm(2자리) : 분, ss : 초(2자리)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current2 = sdf.format(date);//format : date를 String으로 바꿀거
		//Date dd = sdf.parse("2011-11-11 23:21:03"); 으로 하면String을 Date로 바꿔줌.
		
		response.setContentType("text/html;charset=UTF-8");	
		PrintWriter out = response.getWriter();
		out.println("<!doctype html>");
		out.println("<html>");
		out.println("<head><title>현재 시간</title></head>");
		out.println("<body>");
		out.printf("현재시간1 : %s<br>", current);
		out.printf("현재시간2 : %s<br>", current2);
		out.println("</body> </html>");
		//sysout이라고 생각하기
	
	}
}