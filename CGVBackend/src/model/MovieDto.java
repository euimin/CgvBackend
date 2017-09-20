package model;

import java.sql.Date;

public class MovieDto {
	private String movie_code;
	private String title;
	private String engtitle;
	private String poster;
	private String director;
	private String actor;
	private String genre;
	private String rating;
	private String runningtime;
	private String country;
	private String releasedate;
	private String website;
	private String summary;
	
	public MovieDto(){};
	public MovieDto(String movie_code, String title, String engtitle, String poster, String director, String actor,
			String genre, String rating, String runningtime, String country, String releasedate, String website,
			String summary) {
		this.movie_code = movie_code;
		this.title = title;
		this.engtitle = engtitle;
		this.poster = poster;
		this.director = director;
		this.actor = actor;
		this.genre = genre;
		this.rating = rating;
		this.runningtime = runningtime;
		this.country = country;
		this.releasedate = releasedate;
		this.website = website;
		this.summary = summary;
	}

	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEngtitle() {
		return engtitle;
	}
	public void setEngtitle(String engtitle) {
		this.engtitle = engtitle;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
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
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getReleasedate() {
		return releasedate;
	}
	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
}
