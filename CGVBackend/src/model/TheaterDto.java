package model;

public class TheaterDto {
	private String theater_code;
	private String name;
	private String region;
	private String transportationinfo;
	private String parkinginfo;
	private String screens;
	private String seats;	
	private String addr1;
	private String addr2;
	private String roadaddr1;
	private String roadaddr2;
	
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}

	public String getTransportationinfo() {
		return transportationinfo;
	}
	public void setTransportationinfo(String transportationinfo) {
		this.transportationinfo = transportationinfo;
	}
	public String getParkinginfo() {
		return parkinginfo;
	}
	public void setParkinginfo(String parkinginfo) {
		this.parkinginfo = parkinginfo;
	}
	public String getScreens() {
		return screens;
	}
	public void setScreens(String screens) {
		this.screens = screens;
	}
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getRoadaddr1() {
		return roadaddr1;
	}
	public void setRoadaddr1(String roadaddr1) {
		this.roadaddr1 = roadaddr1;
	}
	public String getRoadaddr2() {
		return roadaddr2;
	}
	public void setRoadaddr2(String roadaddr2) {
		this.roadaddr2 = roadaddr2;
	}
}
