package model;
import java.sql.Date;

public class ShowTimeDTO {
	//SCREENING 테이블
	private String screening_code;
	private String screen_code;
	private String movie_code;	
	private String screeningdate;
	private String time;
	//MOVIE 테이블
	private String title;
	private String genre;
	private String rating;
	private String runningtime;
	private java.sql.Date releasedate;
	//SCREEN(상영관)
	private String no;//상영관 번호
	private String seats;//좌석 수
	//THEATER(극장)
	private String region;
	private String name;
	
	
	public ShowTimeDTO() {}


	public ShowTimeDTO(String screening_code, String screen_code, String movie_code, String screeningdate, String time,
			String title, String genre, String rating, String runningtime, Date releasedate, String no, String seats,
			String region, String name) {
		super();
		this.screening_code = screening_code;
		this.screen_code = screen_code;
		this.movie_code = movie_code;
		this.screeningdate = screeningdate;
		this.time = time;
		this.title = title;
		this.genre = genre;
		this.rating = rating;
		this.runningtime = runningtime;
		this.releasedate = releasedate;
		this.no = no;
		this.seats = seats;
		this.region = region;
		this.name = name;
	}





	public String getScreening_code() {
		return screening_code;
	}

	public void setScreening_code(String screening_code) {
		this.screening_code = screening_code;
	}

	public String getScreen_code() {
		return screen_code;
	}

	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}

	public String getMovie_code() {
		return movie_code;
	}

	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	

	public String getScreeningdate() {
		return screeningdate;
	}


	public void setScreeningdate(String screeningdate) {
		this.screeningdate = screeningdate;
	}


	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getRunningtime() {
		return runningtime;
	}

	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}

	public java.sql.Date getReleasedate() {
		return releasedate;
	}

	public void setReleasedate(java.sql.Date releasedate) {
		this.releasedate = releasedate;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	
}
