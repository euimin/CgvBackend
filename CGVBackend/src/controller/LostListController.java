package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.PagingUtil;

public class LostListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BackendDAO dao = new BackendDAO(req.getServletContext());

		// 페이징을 위한 로직 시작]
		// 전체 레코드 수
		int totalRecordCount = dao.getTotalLostRecord();

		/* req.getServletContext().getInitParameter(arg0) */
		// 페이지 사이즈
		int pageSize = Integer.valueOf(this.getInitParameter("PAGE_SIZE"));
		// 블락페이지
		int blockPage = Integer.parseInt(getInitParameter("BLOCK_PAGE"));
		// 전체 페이지수]
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		// 현재 페이지를 파라미터로 받기]
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		// 페이징을 위한 로직 끝]

		// 페이지용 문자열 생성]

		String pagingString = PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage,
				req.getServletContext().getContextPath() + "/lost/lost.list.cgv?");
		
		List list = dao.selectLostList(start, end);
		dao.close();
		req.setAttribute("totalRecordCount", totalRecordCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("list", list);
		req.setAttribute("pagingString",pagingString);

		req.getRequestDispatcher("/lost/lostarticle_list.jsp").forward(req, resp);
	}

}//////////////// controller
