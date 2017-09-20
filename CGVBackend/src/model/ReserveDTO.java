package model;

import java.sql.Date;

public class ReserveDTO {
	private String r_code;//예매코드
	private String s_screeningcode;//상영코드
	private String r_id;//예매자아이디
	private String r_people;//인원
	private String r_seat;//좌석등급
	private String r_seatnumber;//좌석번호
	private String r_reservedate;//예매일
	private String s_screeningdate;//상영일
	private String s_time;//상영시간
	private String m_title;//영화제목
	private String t_name;//극장명
	
	public ReserveDTO() {
		
	}

	public ReserveDTO(String r_code, String s_screeningcode, String r_id, String r_people, String r_seat,
			String r_seatnumber, String r_reservedate, String s_screeningdate, String s_time, String m_title,
			String t_name) {
		super();
		this.r_code = r_code;
		this.s_screeningcode = s_screeningcode;
		this.r_id = r_id;
		this.r_people = r_people;
		this.r_seat = r_seat;
		this.r_seatnumber = r_seatnumber;
		this.r_reservedate = r_reservedate;
		this.s_screeningdate = s_screeningdate;
		this.s_time = s_time;
		this.m_title = m_title;
		this.t_name = t_name;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getS_screeningcode() {
		return s_screeningcode;
	}

	public void setS_screeningcode(String s_screeningcode) {
		this.s_screeningcode = s_screeningcode;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_people() {
		return r_people;
	}

	public void setR_people(String r_people) {
		this.r_people = r_people;
	}

	public String getR_seat() {
		return r_seat;
	}

	public void setR_seat(String r_seat) {
		this.r_seat = r_seat;
	}

	public String getR_seatnumber() {
		return r_seatnumber;
	}

	public void setR_seatnumber(String r_seatnumber) {
		this.r_seatnumber = r_seatnumber;
	}

	public String getR_reservedate() {
		return r_reservedate;
	}

	public void setR_reservedate(String r_reservedate) {
		this.r_reservedate = r_reservedate;
	}

	public String getS_screeningdate() {
		return s_screeningdate;
	}

	public void setS_screeningdate(String s_screeningdate) {
		this.s_screeningdate = s_screeningdate;
	}

	public String getS_time() {
		return s_time;
	}

	public void setS_time(String s_time) {
		this.s_time = s_time;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	
	
	

	
}
