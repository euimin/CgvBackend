package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;


public class ReserveDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public ReserveDAO(ServletContext context){
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/cgv");
			conn = source.getConnection();
			System.out.println(conn+"출력");
		} catch (NamingException e) {e.printStackTrace();}
		  catch (SQLException e) {e.printStackTrace();}		
	}
	
	public void close(){
		try{
			if(conn != null) conn.close();
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
		}catch(Exception e){}
	}
	
	public boolean login(String id, String password){
		String sql = "select count(*) from manageraccount where id=? and password=? ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}	
		return true;
	}
	
	
	public List<ReserveDTO> selectReserveList(Map map) {
		List<ReserveDTO> list = new Vector<ReserveDTO>();
		
		//페이징 처리전 전체검색 쿼리
		/*
		 * String sql="SELECT R.CODE,S.SCREENING_CODE,R.ID,R.PEOPLE, R.SEAT, R.SEATNUMBER, "
				+ "R.RESERVEDATE ,S.SCREENINGDATE, S.TIME, M.TITLE, T.NAME FROM RESERVE R "
				+ "JOIN SCREENING S ON R.SCREENING_CODE = S.SCREENING_CODE "
				+ "JOIN MOVIE M ON S.MOVIE_CODE = M.MOVIE_CODE "
				+ "JOIN SCREEN SC ON S.SCREEN_CODE = SC.SCREEN_CODE "
				+ "JOIN THEATER T ON SC.THEATER_CODE = T.THEATER_CODE ORDER BY R.CODE DESC ";
		*/
		
		String sql = "SELECT * FROM (SELECT AL.* , ROWNUM AS RNUM FROM " 
				+ "(SELECT R.CODE,S.SCREENING_CODE,R.ID,R.PEOPLE, R.SEAT, " 
				+ "R.SEATNUMBER, R.RESERVEDATE ,S.SCREENINGDATE, S.TIME, M.TITLE, T.NAME FROM RESERVE R " 
				+ "JOIN SCREENING S ON R.SCREENING_CODE = S.SCREENING_CODE " 
				+ "JOIN MOVIE M ON S.MOVIE_CODE = M.MOVIE_CODE " 
				+ "JOIN SCREEN SC ON S.SCREEN_CODE = SC.SCREEN_CODE " 
				+ "JOIN THEATER T ON SC.THEATER_CODE = T.THEATER_CODE "; 
				// 검색용 쿼리 추가시
				if(map.get("searchWord") !=null){
					sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
				}		
		sql += "ORDER BY R.CODE DESC) AL) WHERE RNUM BETWEEN ? AND ? ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
	        psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
		
			rs=psmt.executeQuery();
			
			while(rs.next()){
				ReserveDTO dto = new ReserveDTO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7).substring(0, 10),
						rs.getString(8).substring(0, 10),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11)
						);
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//총 레코드 수 얻기용
	public int getTotalRecordCount(Map map) {
	      int totalCount = 0;
	      String sql = "SELECT COUNT(*) FROM "
	      		+ "(SELECT R.CODE,S.SCREENING_CODE,R.ID,R.PEOPLE, R.SEAT, R.SEATNUMBER, "
	      		+ "R.RESERVEDATE ,S.SCREENINGDATE, S.TIME, M.TITLE, T.NAME FROM RESERVE R "
	      		+ "JOIN SCREENING S ON R.SCREENING_CODE = S.SCREENING_CODE "
	      		+ "JOIN MOVIE M ON S.MOVIE_CODE = M.MOVIE_CODE "
	      		+ "JOIN SCREEN SC ON S.SCREEN_CODE = SC.SCREEN_CODE "
	      		+ "JOIN THEATER T ON SC.THEATER_CODE = T.THEATER_CODE";
	      		
	      if(map.get("searchWord") !=null){
					sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
				}
	      		
	      sql+= ")";
	      
	      
	      try {
	         psmt = conn.prepareStatement(sql);

	         rs = psmt.executeQuery();
	         rs.next();
	         totalCount = rs.getInt(1);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return totalCount;
	   }//getTotalRecordCount
	
	/*좌석 선택용 쿼리*/
	public List<ReserveDTO> seatSelect(String m_title, String s_screeningdate, String s_time){
		List<ReserveDTO> seatlist = new ArrayList<ReserveDTO>();
		String sql="SELECT R.CODE,S.SCREENING_CODE,R.ID,R.PEOPLE, R.SEAT, R.SEATNUMBER, "
				+ "R.RESERVEDATE ,S.SCREENINGDATE, S.TIME, M.TITLE, T.NAME FROM RESERVE R "
				+ "JOIN SCREENING S ON R.SCREENING_CODE = S.SCREENING_CODE "
				+ "JOIN MOVIE M ON S.MOVIE_CODE = M.MOVIE_CODE "
				+ "JOIN SCREEN SC ON S.SCREEN_CODE = SC.SCREEN_CODE "
				+ "JOIN THEATER T ON SC.THEATER_CODE = T.THEATER_CODE ORDER BY R.CODE DESC "
				+ "where M.TITLE=? and S.SCREENINGDATE=? and S.TIME=? ";
		try{
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, m_title);
				psmt.setString(2, s_screeningdate);
				psmt.setString(3, s_time);
				rs = psmt.executeQuery();
				while(rs.next()){
					ReserveDTO rb=new ReserveDTO();
					rb.setR_seatnumber(rs.getString(1));
					seatlist.add(rb);
				}
			}catch(Exception e){
				e.printStackTrace();
		}
		return seatlist;
	}

	public ReserveDTO selectReserveOne(String code) {
		ReserveDTO dto=new ReserveDTO();
		String sql="SELECT R.CODE,S.SCREENING_CODE,R.ID,R.PEOPLE, R.SEAT, R.SEATNUMBER, "
				+ "R.RESERVEDATE ,S.SCREENINGDATE, S.TIME, M.TITLE, T.NAME FROM RESERVE R "
				+ "JOIN SCREENING S ON R.SCREENING_CODE = S.SCREENING_CODE "
				+ "JOIN MOVIE M ON S.MOVIE_CODE = M.MOVIE_CODE "
				+ "JOIN SCREEN SC ON S.SCREEN_CODE = SC.SCREEN_CODE "
				+ "JOIN THEATER T ON SC.THEATER_CODE = T.THEATER_CODE ORDER BY R.CODE DESC "
				+ "WHERE R.CODE==? ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, code);
			rs=psmt.executeQuery();
			rs.next();
			dto = new ReserveDTO(
					rs.getString(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7).substring(0, 10),
					rs.getString(8).substring(0, 10),
					rs.getString(9),
					rs.getString(10),
					rs.getString(11)
					);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	public int insert(ReserveDTO dto) {
		int affected=0;
		String sql="insert into reserve values(SEQ_RESERVECODE.nextval,(SELECT MAX(screening_code) FROM screening),?,?,?,?,SYSDATE) ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getR_id());
			psmt.setString(2, dto.getR_people());
			psmt.setString(3, dto.getR_seat());
			psmt.setString(4, dto.getR_seatnumber());
			
			affected=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}

	public int delete(String code) {
		int affected=0;
		String sql="delete reserve where code=? ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, code);
			affected=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	
	
	public int checkReserveDelete(ArrayList checkedCode) {
		int affected=0;
		String listSize="";
		for(int i=0;i<checkedCode.size();i++){
			listSize+="?,";
		}
		if(listSize.length() != 0){
			String sql="delete reserve where code in ("+listSize.substring(0,listSize.lastIndexOf(','))+") ";
			
			try {
				psmt=conn.prepareStatement(sql);
				for(int i=1;i<checkedCode.size()+1;i++){
					psmt.setString(i, checkedCode.get(i-1).toString());
				}
				affected=psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return affected;
	}
////////////////////////////////////////paging end
	
	
	
	
	
	
	
}
