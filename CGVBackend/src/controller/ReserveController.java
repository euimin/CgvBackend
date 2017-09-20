package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PagingUtil;
import model.ReserveDAO;

public class ReserveController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String searchColumn = req.getParameter("searchColumn");
	      String searchWord = req.getParameter("searchWord");
	      String no = req.getParameter("no");


	      
	      //검색후 페이징과 관련된 파라미터를 전달할 값을 저장할 변수]
	       String addQuery = "";

	      Map<String, Object> map = new HashMap<String, Object>();

	      if(searchWord != null){
				addQuery +="searchColumn="+searchColumn+"&searchWord="+URLEncoder.encode(searchWord,"UTF-8")+"&";
				map.put("searchColumn", searchColumn);
				map.put("searchWord", searchWord);
			}

		
		ReserveDAO dao=new ReserveDAO(req.getServletContext());
		
		
		 //페이징을 위한 로직 시작]
	      //전체 레코드 수
	       int totalRecordCount = dao.getTotalRecordCount(map);
	       System.out.println("totalRecordCount컨트롤러"+totalRecordCount);
	      //페이지 사이즈
	      int pageSize = Integer.valueOf(req.getServletContext().getInitParameter("PAGE_SIZE"));
	      //블락페이지
	      int blockPage = Integer.parseInt(req.getServletContext().getInitParameter("BLOCK_PAGE"));
	      //전체 페이지수]
	      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
	      //현재 페이지를 파라미터로 받기]
	      int nowPage = req.getParameter("nowPage") == null
	            ? 1
	            : Integer.parseInt(req.getParameter("nowPage"));
	      //시작 및 끝 ROWNUM구하기]
	      int start = (nowPage - 1) * pageSize + 1;
	      int end = nowPage * pageSize;
	      map.put("start", start);
	      map.put("end", end);
	      //페이징을 위한 로직 끝]   

	      
	      String pagingString = PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, req.getServletContext().getContextPath()+"/reserve/Reserve.cgv?"+addQuery);

	      List list = dao.selectReserveList(map); 		
		  req.setAttribute("list", list);
		  req.setAttribute("pagingString", pagingString);
	      req.setAttribute("nowPage", nowPage);
	      req.setAttribute("totalPage", totalPage);
	      req.setAttribute("totalRecordCount", totalRecordCount);
	      req.setAttribute("pageSize", pageSize);
	      req.setAttribute("no",no);
	      req.setAttribute("searchColumn", searchColumn);
	      req.setAttribute("searchWord", searchWord);
	      //자원반납
		
		dao.close();
		req.getRequestDispatcher("/reserve/Reserve.jsp").forward(req, resp);
	}
}