package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.MembersDTO;
import model.PagingUtil;


public class MembersListController extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);

	}////////////////////////	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//가]사용자 요청을 받는다		  
		//나]요청을 분석한다.		  
		//다]모델에서 필요한 로직 호출해서 결과값이 있으면 받기  

		//한글처리]
		req.setCharacterEncoding("UTF-8");
		//검색과 관련된 파라미터 받기]
		String 	searchColumn = req.getParameter("searchColumn");
		String 	searchWord = req.getParameter("searchWord");
		
		//검색후 페이징과 관련된 파라미터를 전달할 값을 저장할 변수]
		String addQuery ="";
				
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(searchWord !=null){
			addQuery+="searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
			
			map.put("searchColumn",searchColumn);
			map.put("searchWord",searchWord);
		}
		
		BackendDAO dao = new BackendDAO(req.getServletContext());
		
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount=dao.membersGetTotalRecordCount(map);
		//페이지 사이즈
		int pageSize  =Integer.valueOf(req.getServletContext().getInitParameter("PAGE_SIZE"));
		//블락페이지
		int blockPage =Integer.parseInt(req.getServletContext().getInitParameter("BLOCK_PAGE"));
		//전체 페이지수]
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);		
		//현재 페이지를 파라미터로 받기]
		int nowPage=req.getParameter("nowPage")==null ? 1 :	Integer.parseInt(req.getParameter("nowPage"));		
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;	
		map.put("start",start);
		map.put("end",end);
		//페이징을 위한 로직 끝]		
		List<MembersDTO> list= dao.membersSelectList(map);
				
		//자원반납
		dao.close();
		
		//페이지용 문자열 생성]
		String pagingString=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage,req.getServletContext().getContextPath()+"/user/members.List.cgv?");
		
		//라]결과값이 있으면 리퀘스트 영역에 저장
		req.setAttribute("list", list);
		req.setAttribute("pagingString", pagingString);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalRecordCount", totalRecordCount);
		req.setAttribute("pageSize", pageSize);
		
		//마]결과값을 뿌려주거나 이동할 뷰(JSP페이지) 선택후 포워딩
		//뷰선택]
		RequestDispatcher dispatcher=req.getRequestDispatcher("/user/User.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}//////////////////////doGet()
}
