package file.upload.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class ImageUploadServlet2_bak extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이미지를 저장할 경로설정
		ServletContext ctx = getServletContext();//context객체(- 현재 application의 정보를 가짐)를 가져옴
		String imageDir = ctx.getRealPath("/up_images");
//		=>C:\\Java\\apache-tomcat-8.0.43\\webapps\\Fileupload\\up_images가 리턴됨(/up_image의 실제파일경로 => 업로드된 파일(이미지)를 저장할 디렉토리)
		System.out.println(imageDir);
		
		String temDir = ctx.getInitParameter("tempdir");//업로드된 파일을 저장할 임시 디렉토리 설정
		
		//1. DistFileItemFactory객체를 생성 - 임시저장소 정보설정
		DiskFileItemFactory factory = new DiskFileItemFactory(1024*1024, new File(temDir));//1MB(1024*1024)까지는 임시저장소에 저장하고 나머지는 temDir에다가 저장해라 
		
		//2. ServletFileUpload 객체 생성 - DiskFileItemFactory객체를 전달
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		//3. 요청파라미터 조회작업
		try {
			List<FileItem> list = upload.parseRequest(request);
			for(FileItem item : list) {
				String reqName = item.getFieldName();//요청파라미터의 이름을 조회.
				if(item.isFormField()) { //true : 일반 요청파라미터(String을 의미함) => 값만 조회하면 됨
					String reqValue = item.getString("utf-8");
					
					request.setAttribute(reqName, reqValue);
				} else { //false :  요청파라미터가 file일때를 의미함(input type = "file")
					String fileName = item.getName();//업로드 된 파일명을 조회
					//업로드된 파일이 있는 지 체크 => getSize() : long - 업로드 된 파일의 크기(byte). 0이라는 건 파일이 없는 것.
					if(item.getSize() != 0) {
						//1. 임시경로에 있던 파일을 최종 경로로 이동시키기
						item.write(new File(imageDir, fileName));//file객체에 임시경로에 있던 파일을 복사(copy)시켜놓음
						//2. 이동시켰으면 임시경로에 있던 파일을 삭제함
						item.delete();
						request.setAttribute(reqName, fileName);
					}
				}
				
			}//for문 끝
			
			//4. 응답처리
			request.getRequestDispatcher("/upload_result.jsp").forward(request, response);
			
		} catch (Exception e) {
			//에러 처리 페이지로 이동하게 하고 싶으면 구현하면 됨(예를 들면, error.jsp를 구현하고 여기로 이동시키는 것)
			
			e.printStackTrace();
			throw new ServletException(e);//던지고 싶으면 이렇게 하면 된다 => 예외 처리를 톰캣에게 맡긴다.
			
		}
	
	}
}







