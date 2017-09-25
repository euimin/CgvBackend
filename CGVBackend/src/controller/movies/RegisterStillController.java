package controller.movies;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.BackendDAO;
import model.FileUtils;
import model.StillDto;

public class RegisterStillController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getInitParameter("STILL_DIRECTORY"));
		if(mr != null){ //업로드 성공 시		
			StillDto dto = new StillDto();
			dto.setMovie_code(mr.getParameter("movie_code"));
			dto.setFilename(mr.getFilesystemName("still"));
			int affected = 0;
			BackendDAO dao = new BackendDAO(req.getServletContext());
			affected = dao.registerStill(dto);
			dao.close();
			if(affected==1){	
				String movie_code = new String(mr.getParameter("movie_code").getBytes("utf-8"), "8859_1");
				String movie_title = new String(mr.getParameter("movie_title").getBytes("utf-8"), "8859_1");
				resp.sendRedirect(req.getContextPath()+"/movies/Still.jsp?"
						+"movie_code="+movie_code
						+"&movie_title="+movie_title);
			}
			else{
				req.setAttribute("registerError", "등록 실패");
				//업로드 된 파일 지우기
				FileUtils.deleteFile(req, req.getServletContext().getInitParameter("STILL_DIRECTORY"), mr.getFilesystemName("poster"));
				//입력 값 그대로 두기
				req.setAttribute("dto", dto);
				req.getRequestDispatcher("/movies/RegisterStill.jsp").forward(req, resp);
			}
		}
		else{
			req.setAttribute("registerError", "파일 업로드 실패");
			req.getRequestDispatcher("/movies/RegisterStill.jsp").forward(req, resp);
		}		
	}//////////////doPost
}
