package kas.domain;

import java.sql.Date;

public class Review {
	   private int idx;
	   private int code;
	   private String email;
	   private String title;
	   private String poster;
	   private String name;
	   private String content;
	   private Date w_date;
	   private int views;
	public Review() {}
	public Review(int idx, int code, String email, String title, String poster, String name, String content,
			Date w_date, int views) {
		super();
		this.idx = idx;
		this.code = code;
		this.email = email;
		this.title = title;
		this.poster = poster;
		this.name = name;
		this.content = content;
		this.w_date = w_date;
		this.views = views;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
}
