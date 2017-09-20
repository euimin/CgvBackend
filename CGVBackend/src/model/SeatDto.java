package model;

public class SeatDto {
	/*seat table
	SEATNUMBER
	SCREEN_CODE
	SEAT*/
	private String seatnumber;
	private String screen_code;
	private String seat;
	
	public String getSeatnumber() {
		return seatnumber;
	}
	public void setSeatnumber(String seatnumber) {
		this.seatnumber = seatnumber;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
}
