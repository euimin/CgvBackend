package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.BackendDAO;
import model.FileUtils;
import model.MovieDto;

public class EditMovieController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String movie_code = "";
		MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getInitParameter("POSTER_DIRECTORY"));												
		if(mr != null){ //업로드 성공 시
			movie_code = mr.getParameter("movie_code");
			String[] genres = mr.getParameterValues("genre");
			String genreStr = "";
			for(String genre: genres) genreStr += genre+",";
			genreStr = genreStr.substring(0, genreStr.length()-1);
			
			String[] countries = mr.getParameterValues("country");
			String countryStr = "";
			for(String country: countries) countryStr += country+",";
			countryStr = countryStr.substring(0, countryStr.length()-1);
			
			String poster = mr.getFilesystemName("poster");
			if(poster==null){
				poster = mr.getParameter("originalFile");
			}
			
			MovieDto dto = new MovieDto(
					movie_code, mr.getParameter("title"), mr.getParameter("engtitle"), 
					poster, mr.getParameter("director"), mr.getParameter("actor"), 
					genreStr, mr.getParameter("rating"), mr.getParameter("runningtime"),
					countryStr, mr.getParameter("releasedate"), mr.getParameter("website"),
					mr.getParameter("summary"));
			int affected = 0;
			BackendDAO dao = new BackendDAO(req.getServletContext());
			affected = dao.editMovie(dto);
			dao.close();
			if(affected==1){
				if(mr.getFilesystemName("poster")!= null){
					FileUtils.deleteFile(req, req.getServletContext().getInitParameter("POSTER_DIRECTORY"), mr.getParameter("originalFile"));
				}
				req.setAttribute("editSucceed", "수정 완료");
				req.getRequestDispatcher("/movies/MovieDetail.jsp?movie_code="+movie_code).forward(req, resp);
			}
			else{
				req.setAttribute("editError", "수정 오류:다시 확인하세요");
				req.getRequestDispatcher("/movies/MovieDetail.jsp?movie_code="+movie_code).forward(req, resp);
			}
		}
		else{
			req.setAttribute("editError", "파일 변경 실패");
			req.getRequestDispatcher("/movies/MovieDetail.jsp?movie_code="+movie_code).forward(req, resp);
		}
	}
}
