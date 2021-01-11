package kas.domain;

import java.sql.Date;

public class Exhibition {
	private int code;
	private String title;
	private String artist;
	private String content;
	private String poster;
	private Date s_date;
	private Date e_date;
	private int g_code;
	private int likes;
	private String director;
	
	public Exhibition() {}

	public Exhibition(int code, String title, String artist, String content, String poster, Date s_date, Date e_date,
			int g_code, int likes, String director) {
		super();
		this.code = code;
		this.title = title;
		this.artist = artist;
		this.content = content;
		this.poster = poster;
		this.s_date = s_date;
		this.e_date = e_date;
		this.g_code = g_code;
		this.likes = likes;
		this.director = director;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public int getG_code() {
		return g_code;
	}

	public void setG_code(int g_code) {
		this.g_code = g_code;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}
	


	
	
}
