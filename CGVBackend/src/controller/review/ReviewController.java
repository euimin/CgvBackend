package controller.review;
	
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.directory.SearchControls;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PagingUtil;
import model.ReviewDAO;

public class ReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String searchColumn=req.getParameter("searchColumn");
		String searchWord=req.getParameter("searchWord");
		String searchDate1=req.getParameter("searchDate1");
		String searchDate2=req.getParameter("searchDate2");

		Map<String,Object> map = new HashMap<String,Object>();
		
		String addQuery="";
		
		if(searchWord != null){
			addQuery +="searchColumn="+searchColumn+"&searchWord="+URLEncoder.encode(searchWord,"UTF-8")+"&";
			map.put("searchColumn", searchColumn);
			map.put("searchWord", searchWord);
		}
		if(searchDate1 != null || searchDate2 != null) {
			addQuery +="searchDate1="+searchDate1+"&searchDate2="+searchDate2+"&";
			map.put("searchDate1", searchDate1);
			map.put("searchDate2", searchDate2);
		}
		
		ReviewDAO dao=new ReviewDAO();
		List list=null;
		
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount = dao.getTotalRecordCount(map);
		//페이지 사이즈
		int pageSize = Integer.parseInt(req.getServletContext().getInitParameter("PAGE_SIZE"));
		//블락 페이지
		int blockPage = Integer.parseInt(req.getServletContext().getInitParameter("BLOCK_PAGE"));
		//전체 페이지 수
		int totalPage = (int)Math.ceil(totalRecordCount/(double)pageSize);
		//현재 페이지를 파라미터로 받기]
		int nowPage = req.getParameter("nowPage")==null? 1 : Integer.parseInt(req.getParameter("nowPage"));	
		
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		//페이징을 위한 로직 끝]
		map.put("start", start);
		map.put("end", end);
		
		//페이징용 문자열 생성]
		String pagingString = PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage,req.getServletContext().getContextPath()+"/review/Review.cgv?"+addQuery);
		
		try {
			list=dao.selectList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("list", list);
		req.setAttribute("pagingString", pagingString);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("totalRecordCount", totalRecordCount);
		req.setAttribute("searchColumn", searchColumn);
		req.getRequestDispatcher("/review/Review.jsp").forward(req, resp);
	}
	
}
