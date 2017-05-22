package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Member;

public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 요청파라미터 조회 안해줘도 됨 => <jsp의 jsp:setAttribute>로 쉽게 해주고 받을때 dispatch를 이용한 방식으로 바꿈
		Member member = (Member)req.getAttribute("member");//넘어온 객체 받아주기만 하면 됨.
		System.out.println("요청파라미터 : " + member);
		
		//비즈니스 로직 - memberService.addMember(member);
		
		//req.getRequestDispatcher("/actiontag/response3.jsp").forward(req, resp);//여기서는 디스패치방식으로 말고 리다이렉트방식으로 보내줘야 한다. 
																				  //같은 member가 계속 등록됨.
		resp.sendRedirect("/myjsp/actiontag/response3.jsp");//한번 등록된 건 등록되지 않음.
	
	}
}
