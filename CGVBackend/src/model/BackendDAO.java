package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import model.ShowTimeDTO;

public class BackendDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public BackendDAO(ServletContext context){
		try {
			InitialContext ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/cgv");
			conn = source.getConnection();		 
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
		String sql = "select count(*) from manageraccount where id=? and password=?";
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
	
	public List<MovieDto> selectMovieList(){
		List<MovieDto> list = new Vector<MovieDto>();
		String sql = "select movie_code, title, engtitle, rating, releasedate from movie";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				MovieDto dto = new MovieDto();
				dto.setMovie_code(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setEngtitle(rs.getString(3));
				dto.setRating(rs.getString(4));
				dto.setReleasedate(rs.getDate(5).toString());
				list.add(dto);
			}
		} catch (SQLException e) {e.printStackTrace();}
		return list;
	}

	public MovieDto selectOneMovie(String movie_code){
		MovieDto dto = null;
		String sql = "select * from movie where movie_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, movie_code);
			rs = psmt.executeQuery();
			if(rs.next()){
				dto = new MovieDto(
						rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),
						rs.getString(9), rs.getString(10), rs.getDate(11).toString(), rs.getString(12),
						rs.getString(13)
						);
			}
		} catch (SQLException e) {e.printStackTrace();}
		return dto;
	}
	
	public int registerMovie(MovieDto dto) {
		int affected = 0;
		String sql = "insert into movie values('MC'||seq_movie.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getEngtitle());
			psmt.setString(3, dto.getPoster());
			psmt.setString(4, dto.getDirector());
			psmt.setString(5, dto.getActor());
			psmt.setString(6, dto.getGenre());
			psmt.setString(7, dto.getRating());
			psmt.setString(8, dto.getRunningtime());
			psmt.setString(9, dto.getCountry());
			psmt.setString(10, dto.getReleasedate());
			psmt.setString(11, dto.getWebsite());
			psmt.setString(12, dto.getSummary());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}
	/* 	 MOVIE_CODE
	 TITLE
	 ENGTITLE
	 POSTER
	 DIRECTOR
	 ACTOR
	 GENRE
	 RATING
	 RUNNINGTIME
	 COUNTRY
	 RELEASEDATE
	 WEBSITE
	 SUMMARY*/
	public int editMovie(MovieDto dto) {
		int affected = 0;
		String sql = "update movie set title=?, engtitle=?, poster=?, director=?, actor=?, genre=?, rating=?, "
				+ "runningtime=?, country=?, releasedate=?, website=?, summary=? where movie_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getEngtitle());
			psmt.setString(3, dto.getPoster());
			psmt.setString(4, dto.getDirector());
			psmt.setString(5, dto.getActor());
			psmt.setString(6, dto.getGenre());
			psmt.setString(7, dto.getRating());
			psmt.setString(8, dto.getRunningtime());
			psmt.setString(9, dto.getCountry());
			psmt.setString(10, dto.getReleasedate());
			psmt.setString(11, dto.getWebsite());
			psmt.setString(12, dto.getSummary());
			psmt.setString(13, dto.getMovie_code());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}
	
	public int deleteMovie(String movie_code) {
		int affected = 0;
		String sql = "delete from movie where movie_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, movie_code);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}

	public int registerTheater(TheaterDto dto) {
		int affected = 0;
		String sql = "insert into theater values('TC'||seq_theater.nextval, ?, ?, ?, ?, 0, 0, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getRegion());
			psmt.setString(3, dto.getTransportationinfo());
			psmt.setString(4, dto.getParkinginfo());
			psmt.setString(5, dto.getAddr1());
			psmt.setString(6, dto.getAddr2());
			psmt.setString(7, dto.getRoadaddr1());
			psmt.setString(8, dto.getRoadaddr2());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}

	public List<TheaterDto> selectTheaterList() {
		List<TheaterDto> list = new Vector<TheaterDto>();
		String sql = "select * from theater";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				TheaterDto dto = new TheaterDto();
				dto.setTheater_code(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setRegion(rs.getString(3));
				dto.setTransportationinfo(rs.getString(4));
				dto.setParkinginfo(rs.getString(5));
				dto.setAddr1(rs.getString(8));
				dto.setAddr2(rs.getString(9));
				dto.setRoadaddr1(rs.getString(10));
				dto.setRoadaddr2(rs.getString(11));
				
				String theater_code = rs.getString(1);
				sql = "select count(*) from screen where theater_code=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, theater_code);
				ResultSet rs2 = psmt.executeQuery();
				if(rs2.next())dto.setScreens(rs2.getString(1));
				
				int seats = 0;
				sql = "select screen_code from screen s join theater t "
						+ "on s.theater_code=t.theater_code where s.theater_code=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, theater_code);
				rs2 = psmt.executeQuery();
				while(rs2.next()) {
					String screen_code = rs2.getString(1);
					sql = "select count(*) from seat where screen_code=?";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, screen_code);
					ResultSet rs3 = psmt.executeQuery();
					if(rs3.next()) seats += rs3.getInt(1);
					rs3.close();
				}
				rs2.close();
				dto.setSeats(String.valueOf(seats));
				list.add(dto);	
			}
		} catch (SQLException e) {e.printStackTrace();}
		return list;
	}
	
	public TheaterDto selectOneTheater(String theater_code){
		TheaterDto dto = null;
		String sql = "select * from theater where theater_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, theater_code);
			rs = psmt.executeQuery();
			if(rs.next()){
				dto = new TheaterDto();
				dto.setTheater_code(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setRegion(rs.getString(3));
				dto.setTransportationinfo(rs.getString(4));
				dto.setParkinginfo(rs.getString(5));
				dto.setScreens(rs.getString(6));
				dto.setSeats(rs.getString(7));
				dto.setAddr1(rs.getString(8));
				dto.setAddr2(rs.getString(9));
				dto.setRoadaddr1(rs.getString(10));
				dto.setRoadaddr2(rs.getString(11));
			}
		} catch (SQLException e) {e.printStackTrace();}
		return dto;
	}
	
	public int deleteTheater(String theater_code) {
		int affected = 0;
		String sql = "delete from theater where theater_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, theater_code);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}
	/* THEATER_CODE
	 NAME
	 REGION
	 TRANSPORTATIONINFO
	 PARKINGINFO
	 SCREENS
	 SEATS
	 ADDR1
	 ADDR2
	 ROADADDR1
	 ROADADDR2*/
	public int editTheater(TheaterDto dto) {
		int affected = 0;
		String sql ="update theater set name=?, region=?, transportationinfo=?, "
				+ "parkinginfo=?, addr1=?, addr2=?, roadaddr1=?, roadaddr2=? "
				+ "where theater_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getRegion());
			psmt.setString(3, dto.getTransportationinfo());
			psmt.setString(4, dto.getParkinginfo());
			psmt.setString(5, dto.getAddr1());
			psmt.setString(6, dto.getAddr2());
			psmt.setString(7, dto.getRoadaddr1());
			psmt.setString(8, dto.getRoadaddr2());
			psmt.setString(9, dto.getTheater_code());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}
	
	public String registerScreen(String theater_code, String no, String seats){
		String screen_code = null;
		String sql = "insert into screen values('SC'||seq_screen.nextval, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, theater_code);
			psmt.setString(2, no);
			psmt.setString(3, seats);
			int affected = psmt.executeUpdate();
			if(affected==1){
				sql = "select screen_code from screen where theater_code=? and no=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, theater_code);
				psmt.setString(2, no);
				rs = psmt.executeQuery();
				if(rs.next()) screen_code = rs.getString(1);
			}
		} catch (SQLException e) {e.printStackTrace();}
		return screen_code;
	}
	
	public List<ScreenDto> selectScreenList(String theater_code){
		List<ScreenDto> list = new Vector<ScreenDto>();
		String sql = "select * from screen where theater_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, theater_code);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ScreenDto dto = new ScreenDto();
				dto.setScreen_code(rs.getString(1));
				dto.setTheater_code(rs.getString(2));
				dto.setNo(rs.getString(3));
				dto.setSeats(rs.getInt(4));
				list.add(dto);
			}
		} catch (SQLException e) {e.printStackTrace();}
		return list;
	}
	
	public ScreenDto selectOneScreen(String screen_code) {
		ScreenDto dto = null;
		String sql = "select * from screen where screen_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, screen_code);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new ScreenDto();
				dto.setScreen_code(rs.getString(1));
				dto.setTheater_code(rs.getString(2));
				dto.setNo(rs.getString(3));
				dto.setSeats(rs.getInt(4));
			}
		} catch (SQLException e) {e.printStackTrace();}
		return dto;
	}
	/*SCREEN_CODE
	THEATER_CODE
	NO
	SEATS*/
	public int editScreen(String screen_code, String seats) {
		int affected = 0;
		String sql = "update screen set seats=? where screen_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, seats);
			psmt.setString(2, screen_code);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}
	
	public int deleteScreen(String screen_code) {
		int affected = 0;
		String sql = "delete from screen where screen_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, screen_code);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	} 
	
	public void registerSeat(String seatnumber, String screen_code, String seat){
		String sql = "insert into seat values(?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, seatnumber);
			psmt.setString(2, screen_code);
			psmt.setString(3, seat);
			psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public List<SeatDto> selectSeatList(String screen_code){
		List<SeatDto> list = new Vector<SeatDto>();
		String sql = "select * from seat where screen_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, screen_code);
			rs = psmt.executeQuery();
			while(rs.next()) {
				SeatDto dto = new SeatDto();
				dto.setSeatnumber(rs.getString(1));
				dto.setScreen_code(rs.getString(2));
				dto.setSeat(rs.getString(3));
				list.add(dto);
			}
		} catch (SQLException e) {e.printStackTrace();}
		return list;
	}
	/*SEATNUMBER
	SCREEN_CODE
	SEAT*/
	public void deleteSeat(String screen_code) {
		String sql = "delete seat where screen_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, screen_code);
			psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	
	public List<SupportPostDto> selectFaqList(Map map) {
		List<SupportPostDto> list = new Vector<SupportPostDto>();
		String sql=" select * from (select t.*,rownum r from (select * from faq ";
		if(map.get("searchWord") !=null){
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}		
		sql+=" order by no desc) t) where r between ? and ? ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs=psmt.executeQuery();
			while(rs.next()){
				SupportPostDto dto = new SupportPostDto(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getDate(4),
						rs.getString(5),
						rs.getString(6)
						);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public SupportPostDto selectFaqOne(String no) {
		SupportPostDto dto=new SupportPostDto();
		String sql="select * from faq where no=? ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs=psmt.executeQuery();
			rs.next();
			dto = new SupportPostDto(
					rs.getString(1),
					rs.getString(2),
					rs.getString(3),
					rs.getDate(4),
					rs.getString(5),
					rs.getString(6)
					);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	public int insert(SupportPostDto dto) {
		int affected=0;
		String sql="insert into faq values(SEQ_FAQ.nextval,?,?,default,default,?) ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			affected=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}

	public int update(SupportPostDto dto) {
		int affected=0;
		String sql="update faq set category=?,title=?,content=? where no=? ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getNo());
			affected=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}

	public int delete(String no) {
		int affected=0;
		String sql="delete faq where no=? ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}

	public int checkDelete(ArrayList checkedNo) {
		int affected=0;
		String listSize="";
		for(int i=0;i<checkedNo.size();i++){
			listSize+="?,";
		}
		if(listSize.length() != 0){
			String sql="delete faq where no in ("+listSize.substring(0,listSize.lastIndexOf(','))+") ";
			
			try {
				psmt=conn.prepareStatement(sql);
				for(int i=1;i<checkedNo.size()+1;i++){
					psmt.setString(i, checkedNo.get(i-1).toString());
				}
				affected=psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return affected;
	}

	///레코드 수 얻기
	public int getTotalRecordCount(Map map){
		int totalRecordCount = 0;
		String sql = "SELECT COUNT(*) FROM FAQ";
		
		if(map.get("searchWord") !=null){
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}
		
		try {
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			rs.next();
			totalRecordCount = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalRecordCount;
	}//////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
public List<SupportPostDto> selectNewsList(Map<String,Object> map) {
		
		List<SupportPostDto> list = new Vector();

		String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT * FROM NEWS ";
		//검색용 쿼리 추가
		if(map.get("searchWord") !=null){
			
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}		
		sql+="ORDER BY POSTDATE DESC) T) WHERE R BETWEEN ? AND ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			
		
			
			while (rs.next()) {
				
				SupportPostDto dto = new SupportPostDto();
				dto.setNo(rs.getString(1));
				dto.setCategory(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setPostdate(rs.getDate(4));
				dto.setVisitcount(rs.getString(5));
				list.add(dto);	
			}
		} catch (Exception e) {
			e.getMessage();
			System.out.println("에러발생 news list DAO");
		}
		return list;
	}/////////////////////////////selectList
	
	
	
	public int insertNews(SupportPostDto dto){
		int suc =0;
		String sql = "INSERT INTO News VALUES(SEQ_NEWSNO.nextval,?,?,SYSDATE,SEQ_CLICK_COUNT.nextval,?)";
		try {
		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			suc = psmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			
			System.out.println("데이터베이스 입력실패 ");
		}
		
		
		return suc;
	}/////////////////////insert
	
	public  List<SupportPostDto> ContentView(String no) {
		
		List<SupportPostDto> list = new  Vector<SupportPostDto>();
		SupportPostDto dto;
		String sql = "SELECT * FROM News WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,no);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				dto = new SupportPostDto();
				
				dto.setNo(rs.getString(1));
				dto.setCategory(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setPostdate(rs.getDate(4));
				dto.setVisitcount(rs.getString(5));
				dto.setContent(rs.getString(6));
				list.add(dto);
				
			}
		} catch (SQLException e) {
			System.out.println("데이터 베이스 가져오기실패");
		}
		
		return list;
		
	}
	
	public int updateNews(SupportPostDto dto){
		int count = 0;
		
		String sql = "UPDATE news SET CATEGORY=?,TITLE=?,CONTENT=? WHERE NO=?";
		
		try {
		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getNo());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("데이터 수정 실패");
			System.out.println(e.getMessage());
		}
		
		return count;
		
	}
	
	public int deleteNews(String num) {
		
		int count = 0;
		
		String no = num;
		String sql = "DELETE FROM FAQ WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,no);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("데이터베이스 삭제실패");
			e.printStackTrace();
		}
		
		return count;
		
	}
	//전체삭제
	public int deleteCheckedNews(ArrayList checkedNo) {
		int affected=0;
		String listSize="";
		for(int i=0;i<checkedNo.size();i++){
			listSize+="?,";
		}
		if(listSize.length() != 0){
			String sql="DELETE news WHERE NO IN ("+listSize.substring(0,listSize.lastIndexOf(','))+")";
						
			try {
				psmt=conn.prepareStatement(sql);
				for(int i=1;i<checkedNo.size()+1;i++){
					psmt.setString(i, checkedNo.get(i-1).toString());
				}
				affected = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return affected;
	}
	//총 레코드 수 얻기용]
	public int getTotalNewsRecord(Map<String,Object> map){
		int total =0;
		String sql="SELECT COUNT(*) FROM NEWS";
		if (map.get("searchWord") != null) {

			sql += " WHERE " + map.get("searchColumn") + " LIKE '%" + map.get("searchWord") + "%' ";
		}//////////
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {e.printStackTrace();}

		return total;
	}
	
	public List<EmailDto> selectEmailList(int start, int end) {///////////list
		List<EmailDto> list = new Vector<EmailDto>();
		
		
		String sql = "SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT * FROM QNA ORDER BY NO DESC) t) WHERE R BETWEEN ? AND ?";
		
		try {
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			
			while(rs.next()){
			
				EmailDto dto = new EmailDto();
				
				dto.setNo(rs.getString(1));
				dto.setId(rs.getString(2));	
				dto.setCategory(rs.getString(3));
				dto.setTheater(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFilename(rs.getString(7));
				dto.setWritedate(rs.getString(8));
				
				list.add(dto);
			
			}/////////while
			rs.close();
		} catch (SQLException e) {
			System.out.println("리스트 가져오기실패 (이메일)");
			e.printStackTrace();
		}
		return list;

	}/////////////////////////////////////////////////////EmailList
	
	public List<EmailDto> viewEmailList(String no) {//////////Viewlist
		List<EmailDto> list = new  Vector<EmailDto>();
		String sql ="SELECT * FROM QNA WHERE NO=?";
	
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			
			rs = psmt.executeQuery();
		
			while(rs.next()){
				
				EmailDto dto = new EmailDto();
				dto.setNo(rs.getString(1));
				dto.setId(rs.getString(2));	
				dto.setCategory(rs.getString(3));
				dto.setTheater(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFilename(rs.getString(7));
				dto.setWritedate(rs.getString(8));
				
				list.add(dto);
				
			}///////////
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("뷰데이터 베이스 실패");
			e.printStackTrace();
		}///////////
		
		return list;
		
	}/////viewList
	
	public int  insertEmail(EmailDto dto) {//////////Insert
		
		int count = 0;
		String sql ="INSERT INTO QNA(NO,ID,CATEGORY,THEATER,TITLE,CONTENT,WRITEDATE) VALUES(SEQ_QNANO.nextval,?,?,?,?,?,SYSDATE)";
		try {
				
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, dto.getId());
		psmt.setString(2, dto.getCategory());
		psmt.setString(3, dto.getTheater());
		psmt.setString(4, dto.getTitle());
		psmt.setString(5, dto.getContent());
		
		
		count = psmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		
		return count;
		
	}///////////////insert
	
	public int deleteEmail(String no) {
		int count= 0;
		
		String sql ="DELETE QNA WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}/////////////////////////delete
	
	//전체삭제
	public int deleteCheckedEmail(ArrayList checkedNo) {
		int affected=0;
		String listSize="";
		for(int i=0;i<checkedNo.size();i++){
			listSize+="?,";
		}
		if(listSize.length() != 0){
			String sql="DELETE QNA WHERE NO IN ("+listSize.substring(0,listSize.lastIndexOf(','))+")";
						
			try {
				psmt=conn.prepareStatement(sql);
				for(int i=1;i<checkedNo.size()+1;i++){
					psmt.setString(i, checkedNo.get(i-1).toString());
				}
				affected = psmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return affected;
	}//////////////////checkDelete
	
	//총 레코드 수 얻기용]
	public int getTotalEmailRecord(){
		int total =0;
		String sql="SELECT COUNT(*) FROM QNA";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {e.printStackTrace();}
		
		return total;
	}
	
	public List<LostDto> selectLostList(int start, int end) {
		
		List<LostDto> records = new Vector<LostDto>();
		LostDto dto;	
		String sql = "SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT * FROM LOST ORDER BY NO DESC) t) WHERE R BETWEEN ? AND ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			
			while (rs.next()){
				dto = new LostDto();
				dto.setNo(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPlace(rs.getString(3));
				dto.setLostdate(rs.getString(4));
				dto.setHour(rs.getString(5));
				dto.setMinute(rs.getString(6));
				dto.setType(rs.getString(7));
				dto.setColor(rs.getString(8));
				dto.setTitle(rs.getString(9));
				dto.setContent(rs.getString(10));
				dto.setWritedate(rs.getString(11));
				records.add(dto);
			}
		} catch (Exception e) {
			System.out.println("데이터베이스 실패");
			System.out.println(e.getMessage());
		}
		return records;
	}///////////////////////////// selectList
	
	public List<LostDto> viewLostList(String no){
		List<LostDto> list = new  Vector<LostDto>();
		LostDto dto;	
		String sql ="SELECT * FROM LOST WHERE NO =?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			
			rs = psmt.executeQuery();
			
			
				while (rs.next()){
					dto = new LostDto();
					dto.setNo(rs.getString(1));
					dto.setId(rs.getString(2));
					dto.setPlace(rs.getString(3));
					dto.setLostdate(rs.getString(4));
					dto.setHour(rs.getString(5));
					dto.setMinute(rs.getString(6));
					dto.setType(rs.getString(7));
					dto.setColor(rs.getString(8));
					dto.setTitle(rs.getString(9));
					dto.setContent(rs.getString(10));
					dto.setWritedate(rs.getString(11));
					list.add(dto);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}////////////////////////////////
	
	
	public int insertLost(LostDto dto) {
		int index =0;
		
		String sql = "INSERT INTO LOST VALUES(SEQ_LOSTNO.NEXTVAL,?,?,?,?,?,?,?,?,?,SYSDATE)";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPlace());
			psmt.setString(3, dto.getLostdate());
			psmt.setString(4, dto.getHour());
			psmt.setString(5, dto.getMinute());
			psmt.setString(6, dto.getType());
			psmt.setString(7, dto.getColor());
			psmt.setString(8, dto.getTitle());
			psmt.setString(9, dto.getContent());
			index= psmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return index;
	}//////////////////////INSERT
	
	public int deleteLost(String num) {
		int index =0;
		String no = num;
		
		String sql = "DELETE LOST WHERE NO = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			index = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("데이터 베이스 삭제실패");
			e.printStackTrace();
		}
		
		return index;
	}//////////////////////DELETE
	
	//전체삭제
	public int deleteCheckedLost(ArrayList checkedNo) {
		int affected=0;
		String listSize="";
		for(int i=0;i<checkedNo.size();i++){
			listSize+="?,";
		}
		if(listSize.length() != 0){
			String sql="DELETE LOST WHERE NO IN ("+listSize.substring(0,listSize.lastIndexOf(','))+")";
						
			try {
				psmt=conn.prepareStatement(sql);
				for(int i=1;i<checkedNo.size()+1;i++){
					psmt.setString(i, checkedNo.get(i-1).toString());
				}
				affected = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return affected;
	}
	
	
	//총 레코드 수 얻기용]
	public int getTotalLostRecord(){
		int total =0;
		String sql="SELECT COUNT(*) FROM LOST";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {e.printStackTrace();}
		
		return total;
	}
	
	public List<RentalDto> selectRentalList(int start, int end) {////////////list
		List<RentalDto> list = new Vector<RentalDto>();
		
		
		String sql = "SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT * FROM LEASE ORDER BY NO DESC) t) WHERE R BETWEEN ? AND ?";
		
		try {
				//,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				RentalDto dto = new RentalDto();
				dto.setNo(rs.getString(1));
				dto.setTheater(rs.getString(2));
				dto.setLeasedate(rs.getString(3));
				dto.setHour(rs.getString(4));
				dto.setPeople(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setName(rs.getString(7));
				dto.setPhone(rs.getString(8));
				dto.setEmail(rs.getString(9));
				dto.setWritedate(rs.getString(10));
				
				list.add(dto);
			
			}/////////while
			rs.close();
		} catch (SQLException e) {
			System.out.println("리스트 가져오기실패 (렌탈)");
			e.printStackTrace();
		}
		return list;

	}/////////////////////////////////////////////////////rentalList
	
	public List<RentalDto> viewRantalList(String no) {////////////viewlist
		List<RentalDto> list = new  Vector<RentalDto>();
		String sql ="SELECT * FROM LEASE WHERE NO=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			
			rs = psmt.executeQuery();
		
			while(rs.next()){
				
				RentalDto dto = new RentalDto();
				dto.setNo(rs.getString(1));
				dto.setTheater(rs.getString(2));
				dto.setLeasedate(rs.getString(3));
				dto.setHour(rs.getString(4));
				dto.setPeople(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setName(rs.getString(7));
				dto.setPhone(rs.getString(8));
				dto.setEmail(rs.getString(9));
				dto.setWritedate(rs.getString(10));
				
				list.add(dto);
				
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("뷰데이터 베이스 실패");
			e.printStackTrace();
		}
		
		return list;
		
	}/////viewList
	
	public int  insertRantal(RentalDto dto) {////////////insert
		
		int count = 0;
		String sql ="INSERT INTO LEASE VALUES(SEQ_RENTAL.NEXTVAL,?,?,?,?,?,?,?,?,SYSDATE)";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,dto.getTheater());
		psmt.setString(2, dto.getLeasedate());
		psmt.setString(3, dto.getHour());
		psmt.setString(4, dto.getPeople());
		psmt.setString(5, dto.getContent());
		psmt.setString(6, dto.getName());
		psmt.setString(7, dto.getPhone());
		psmt.setString(8, dto.getEmail());
		
		count = psmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		try {
			psmt.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return count;
		
	}///////////////insert
	
	public int deleteRantal(String no) {///////////delete
		int count= 0;
		
		String sql ="DELETE LEASE WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}/////////////////////////delete
	
	//전체삭제
	public int deleteCheckedRantal(ArrayList checkedNo) {
		int affected=0;
		String listSize="";
		int count =0;
		for(int i=0;i<checkedNo.size();i++){
			listSize+="?,";
			count++;
		}
		
		if(listSize.length() != 0){
			String sql="DELETE LEASE WHERE NO IN ("+listSize.substring(0,listSize.lastIndexOf(','))+")";
						
			try {
				psmt=conn.prepareStatement(sql);
				for(int i=1;i<checkedNo.size()+1;i++){
					psmt.setString(i, checkedNo.get(i-1).toString());
				}////
				affected = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}//////////
		}
		return affected;
	}////////////////checkDelete
	
	//총 레코드 수 얻기용]
	public int getTotalRantalRecord(){
		int total =0;
		String sql="SELECT COUNT(*) FROM LEASE";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {e.printStackTrace();}
		
		return total;
		
	}//getTotalRentalRecord
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////

	
	/* 		MEMBERS
	 * ID
	 * PASSWORD
	 * NAME
	 * BIRTH
	 * PHONE
	 * EMAIL
	 * REGIDATE
	 * GENDER
	 * NICKNAME
	 * PROFILEPICTURE
	 */
	public List<MembersDTO> membersSelectList(Map<String,Object> map){
		List list = new Vector();

		String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT * FROM MEMBERS ";
		//검색용 쿼리 추가
		if(map.get("searchWord") !=null){
			sql+=" WHERE UPPER("+map.get("searchColumn")+ ") LIKE UPPER('%"+map.get("searchWord")+"%') ";
		}
		sql+=" ORDER BY REGIDATE DESC) T) WHERE R BETWEEN ? AND ?";
		try{
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정]
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs = psmt.executeQuery();
			while(rs.next()){
				MembersDTO dto = new MembersDTO();
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(3));
				dto.setNickname(rs.getString(9));
				dto.setBirth(rs.getDate(4));
				dto.setGender(rs.getString(8));
				dto.setRegidate(rs.getDate(7));
				list.add(dto);
			}
		}
		catch(SQLException e){e.printStackTrace();}
		return list;
	}/////////////membersSelectList()

	//총 레코드 수 얻기용]
	public int membersGetTotalRecordCount(Map<String,Object> map){
		int total =0;

		String sql="SELECT COUNT(*) FROM MEMBERS ";
		//검색용 쿼리 추가
		if(map.get("searchWord") !=null){
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {e.printStackTrace();}
		
		return total;
	}///////////////////membersGetTotalRecordCount
	
	
	public MembersDTO membersSelectOne(String id) {
		MembersDTO dto=null;
		
		String sql="SELECT ID, NAME, NICKNAME, BIRTH, PHONE, EMAIL, REGIDATE, GENDER, RPAD(substr(PASSWORD,1,1),length(PASSWORD),'*') FROM MEMBERS WHERE ID=? ";
				
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()){
				dto = new MembersDTO();
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setNickname(rs.getString(3));
				dto.setBirth(rs.getDate(4));
				dto.setPhone(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setRegidate(rs.getDate(7));
				dto.setGender(rs.getString(8));
				dto.setPassword(rs.getString(9));
			}			
		} catch (SQLException e) {e.printStackTrace();}		
		return dto;
	}/////////////////////membersSelectOne()

	public int membersUpdate(MembersDTO dto) {
		
		int affected=0;
		String sql="UPDATE MEMBERS SET PASSWORD=?,PHONE=?,EMAIL=? WHERE ID=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPassword());
			psmt.setString(2, dto.getPhone());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getId());
			affected = psmt.executeUpdate();
			
		} catch (SQLException e) {e.printStackTrace();}
		
		return affected;
	}////////////////////update
	
	public int membersDelete(MembersDTO dto) {
		
		int affected=0;
		String sql="DELETE FROM MEMBERS WHERE ID=? ";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			affected = psmt.executeUpdate();
			
		} catch (SQLException e) {e.printStackTrace();}
		
		return affected;
	}////////////////////delete
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
	public List<ShowTimeDTO> selectTitles() {
		List<ShowTimeDTO> list = new Vector<ShowTimeDTO>();
		String sql = "select title from movie";
		
		try {
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			
			while(rs.next()){
				ShowTimeDTO dto = new ShowTimeDTO(
						null,
						null,
						null,
						null,
						null,
						rs.getString(1),
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null			
						); 
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ShowTimeDTO> selectRegions() {
		List<ShowTimeDTO> list = new Vector<ShowTimeDTO>();
		String sql = "select distinct region from theater";
		
		try {
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			
			while(rs.next()){
				ShowTimeDTO dto = new ShowTimeDTO(
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						rs.getString(1),
						null			
						); 
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<ShowTimeDTO> selectTheaterList(String region){
			List<ShowTimeDTO> list = new Vector<ShowTimeDTO>();		
			String sql = "select name from theater where region = ?";
			System.out.println("sql에 세팅할 region값 : " + region);	
		try {			
			psmt=conn.prepareStatement(sql);
			
			psmt.setString(1, region);
			rs=psmt.executeQuery();
			
			while(rs.next()){
				ShowTimeDTO dto = new ShowTimeDTO(
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						rs.getString("name")		
						); 
				System.out.println(dto.getName());
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ShowTimeDTO> selectNumberList(String theatername){
		List<ShowTimeDTO> list = new Vector<ShowTimeDTO>();		
		String sql = "select distinct s.no from screen s join theater t on s.theater_code = t.theater_code where t.name = ? order by s.no asc";
	try {			
		psmt=conn.prepareStatement(sql);
		psmt.setString(1, theatername);
		rs=psmt.executeQuery();
		
		while(rs.next()){
			ShowTimeDTO dto = new ShowTimeDTO(
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					rs.getString(1),
					null,
					null,
					null		
					); 
			System.out.println("극장 번호:" + dto.getNo());
			list.add(dto);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
	
}
	
	public List<ShowTimeDTO> selectTimeList(String no,String theatername) {
		List<ShowTimeDTO> list = new Vector<ShowTimeDTO>();		
		String sql = "select sc.time from screening sc join screen s on sc.screen_code = s.screen_code inner join theater t on s.theater_code = t.theater_code where t.name= ? and s.no = ? order by sc.time asc";
	try {			
		
		//
		System.out.println("DAO에 들어온 no: "+no);
		System.out.println("DAO에 들어온 theatername: "+theatername);
		//
		psmt=conn.prepareStatement(sql);
		psmt.setString(1, theatername);
		psmt.setString(2, no);
		rs=psmt.executeQuery();
		
		while(rs.next()){
			ShowTimeDTO dto = new ShowTimeDTO(
					null,
					null,
					null,
					null,
					rs.getString(1),
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					null		
					); 
			System.out.println("상영 시간:" + dto.getTime());
			list.add(dto);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
	}
	
	
	public List<ShowTimeDTO> selectScreeningList() {
		List<ShowTimeDTO> list = new Vector<ShowTimeDTO>();
		String sql="select s.*,m.title,t.name from screening s join movie m on s.movie_code = m.movie_code inner join screen sc on s.screen_code = sc.screen_code inner join theater t on sc.theater_code = t.theater_code order by s.screeningdate desc";
		try {
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
	
			while(rs.next()){
				ShowTimeDTO dto = new ShowTimeDTO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4).substring(0, 10),
						rs.getString(5),
						rs.getString(6),
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						rs.getString("name")				
						);
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ShowTimeDTO selectShowTimeOne(String code) {
		ShowTimeDTO dto = new ShowTimeDTO();
		String sql="select s.*,m.title,m.genre,m.rating,m.runningtime,m.releasedate,sc.no,sc.seats,t.region,t.name from screening s join movie m on s.movie_code = m.movie_code inner join screen sc on s.screen_code = sc.screen_code inner join theater t on sc.theater_code = t.theater_code where s.screening_code = ?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, code);
			rs=psmt.executeQuery();
			rs.next();
			dto = new ShowTimeDTO(
					rs.getString(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4).substring(0, 10),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8),
					rs.getString(9),
					rs.getDate(10),
					rs.getString(11),
					rs.getString(12),
					rs.getString(13),
					rs.getString("name")	
					);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int insertShowTime(ShowTimeDTO dto) {
		int affected=0;
		String sql="insert into screening values (SEQ_SCREENINGCODE.nextval, (select screen_code from screen where no= ? and theater_code = (select theater_code from theater where region=? and name=?)),(select movie_code from movie where title=?),?,?)";
		try {
			
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getNo());
			psmt.setString(2, dto.getRegion());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getTitle());
			psmt.setString(5, dto.getScreeningdate());
			psmt.setString(6, dto.getTime());
			affected=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return affected;
	}
	
	public int deleteShowTime(String screening_code) {
		int affected=0;
		String sql="delete screening where screening_code = ? ";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, screening_code);
			affected=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}/////////////////////////delete

	public int update(ShowTimeDTO dto) {
		int affected=0;
		//
		System.out.println("DAO의 update로 들어왔다.......");	
		System.out.println();
		//
		String sql="update screening set screen_code = (select screen_code from screen where no= ? and theater_code = (select theater_code from theater where region=? and name=?)), movie_code = (select movie_code from movie where title=?), screeningdate = ?, time = ? where screening_code = ?";
		// (select screen_code from screen where no= ? and theater_code = (select theater_code from theater where region=? and name=?)),(select movie_code from movie where title=?),?,?)
		try {
			psmt=conn.prepareStatement(sql);
			System.out.println(psmt);
			psmt.setString(1, dto.getNo());
			psmt.setString(2, dto.getRegion());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getTitle());
			psmt.setString(5, dto.getScreeningdate());
			psmt.setString(6, dto.getTime());
			psmt.setString(7, dto.getScreening_code());
			
			affected=psmt.executeUpdate();
			System.out.println("affected :"+affected);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}
/////////////////////
////////////////////////////////////////////////////////////////////////////////////////	
	
	public List<RentalDto> returncgv(RentalDto dto1) {
		List<RentalDto> list = new Vector<RentalDto>();
		RentalDto dto = null;
		
		String sql = "SELECT NAME FROM THEATER WHERE REGION =?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto1.getAddress());
			rs = psmt.executeQuery();
			System.out.println("return cvas안 ");
			while(rs.next()){
				
				dto = new RentalDto();
				System.out.println("while문 안");
				dto.setCgv(rs.getString(1));
				list.add(dto);
			}//////////////
			
		} catch (SQLException e) {
			System.out.println("catch문 진입");
			e.printStackTrace();
		}//////////////
		return list;
		
	}/////////////////
	
}//class