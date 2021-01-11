package kas.exhibition.vo;

import java.util.List;

import kas.domain.Exhibition;

public class ExhibitionList {
	private String director;
	private List<Exhibition> list;
	private ExhibitionList() {}
	public ExhibitionList(String director, List<Exhibition> list) {
		this.director = director;
		this.list = list;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public List<Exhibition> getList() {
		return list;
	}
	public void setList(List<Exhibition> list) {
		this.list = list;
	}
	
	
}
