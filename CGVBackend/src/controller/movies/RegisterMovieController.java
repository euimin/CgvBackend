package controller.movies;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.BackendDAO;
import model.FileUtils;
import model.MovieDto;

public class RegisterMovieController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getInitParameter("POSTER_DIRECTORY"));
		if(mr != null){ //업로드 성공 시
			String[] genres = mr.getParameterValues("genre");
			String genreStr = "";
			for(String genre: genres) genreStr += genre+", ";
			genreStr = genreStr.substring(0, genreStr.length()-2);
			
			String[] countries = mr.getParameterValues("country");
			String countryStr = "";
			for(String country: countries) countryStr += country+", ";
			countryStr = countryStr.substring(0, countryStr.length()-2);
			
			MovieDto dto = new MovieDto(
					null, mr.getParameter("title").trim(), mr.getParameter("engtitle"), mr.getFilesystemName("poster"),
					mr.getParameter("director"), mr.getParameter("actor"), genreStr, 
					mr.getParameter("rating"), mr.getParameter("runningtime"),
					countryStr, mr.getParameter("releasedate"), mr.getParameter("website"),
					mr.getParameter("summary"));
			int affected = 0;
			BackendDAO dao = new BackendDAO(req.getServletContext());
			affected = dao.registerMovie(dto);
			dao.close();
			if(affected==1){
				resp.sendRedirect(req.getContextPath()+"/movies/Movie.jsp");
			}
			else{
				req.setAttribute("registerError", "입력 실패");
				//업로드 된 파일 지우기
				FileUtils.deleteFile(req, req.getServletContext().getInitParameter("POSTER_DIRECTORY"), mr.getFilesystemName("poster"));
				//입력 값 그대로 두기
				req.setAttribute("dto", dto);
				req.getRequestDispatcher("/movies/RegisterMovie.jsp").forward(req, resp);
			}
		}
		else{
			req.setAttribute("registerError", "파일 업로드 실패");
			req.getRequestDispatcher("/movies/RegisterMovie.jsp").forward(req, resp);
		}		
	}//////////////doPost
}
