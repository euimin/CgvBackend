package model;

import java.sql.Date;

public class SupportPostDto {
	private String no;
	private String category;
	private String title;
	private java.sql.Date postdate;
	private String visitcount;
	private String content;

	public SupportPostDto() {}

	public SupportPostDto(String no, String category, String title, Date postdate, String visitcount, String content) {
		this.no = no;
		this.category = category;
		this.title = title;
		this.postdate = postdate;
		this.visitcount = visitcount;
		this.content = content;
	}



	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public java.sql.Date getPostdate() {
		return postdate;
	}

	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
