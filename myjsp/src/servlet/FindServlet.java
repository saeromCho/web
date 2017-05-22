package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Member;

public class FindServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//1. 요청파라미터 조회
		String id = req.getParameter("id");
		//2. 비즈니스 로직 저리
		Member member = new Member(id, "1111", "조새롬", "rom@naver.com", 9099999);//조회결과
		//3. 응답 - VIEW 호출(JSP)
		req.setAttribute("result", member);//member객체에 result라는 이름을 부여하겠다.
		req.getRequestDispatcher("/actiontag/response2.jsp").forward(req, resp);
	}

}


/*package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Member;

public class FindServlet extends HttpServlet{
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("utf-8");
      //1. 요청파라미터 조회
      String id = req.getParameter("id");
      String password = req.getParameter("password");
      String name = req.getParameter("name");
      String email = req.getParameter("email");
      //int point = req.getParameter("point");
      //2. 비즈니스 로직 저리
      //Member member = new Member(id, "1111", "조새롬", "rom@naver.com", 9099999);//조회결과
      Member member = new Member(id, password, name, email, 23423);
      //3. 응답 - VIEW 호출(JSP)
      req.setAttribute("result", member);//member객체에 result라는 이름을 부여하겠다.
      req.getRequestDispatcher("/actiontag/response2.jsp").forward(req, resp);
   }

}
*/