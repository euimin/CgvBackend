package model;

import java.util.Date;

public class ReviewDto {
	
	private String review_no;
	private String movie_code;
	private String Id;
	private String feedback;
	private String content;
	private String title;
	private Date writedate;
	private String likes;
	private String nickname;
	private String directionpoint;
	private String storypoint;
	private String visualpoint;
	private String actingpoint;
	private String soundtrackpoint;
	
	public ReviewDto() {}

	public ReviewDto(String review_no, String movie_code, String id, String feedback, String content, Date writedate,
			String likes, String nickname, String title, String directionpoint, String storypoint, String visualpoint,
			String actingpoint, String soundtrackpoint) {
		this.review_no = review_no;
		this.movie_code = movie_code;
		this.Id = id;
		this.feedback = feedback;
		this.content = content;
		this.writedate = writedate;
		this.likes = likes;
		this.nickname = nickname;
		this.title = title;
		this.directionpoint = directionpoint;
		this.storypoint = storypoint;
		this.visualpoint = visualpoint;
		this.actingpoint = actingpoint;
		this.soundtrackpoint = soundtrackpoint;
	}

	public String getReview_no() {
		return review_no;
	}

	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}

	public String getMovie_code() {
		return movie_code;
	}

	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getDirectionpoint() {
		return directionpoint;
	}

	public void setDirectionpoint(String directionpoint) {
		this.directionpoint = directionpoint;
	}

	public String getStorypoint() {
		return storypoint;
	}

	public void setStorypoint(String storypoint) {
		this.storypoint = storypoint;
	}

	public String getVisualpoint() {
		return visualpoint;
	}

	public void setVisualpoint(String visualpoint) {
		this.visualpoint = visualpoint;
	}

	public String getActingpoint() {
		return actingpoint;
	}

	public void setActingpoint(String actingpoint) {
		this.actingpoint = actingpoint;
	}

	public String getSoundtrackpoint() {
		return soundtrackpoint;
	}

	public void setSoundtrackpoint(String soundtrackpoint) {
		this.soundtrackpoint = soundtrackpoint;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
}
