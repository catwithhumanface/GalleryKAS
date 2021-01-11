package kas.index.model;

import java.util.ArrayList;

import kas.domain.Exhibition;

public class IndexService {
	private IndexDAO dao;
	private static final IndexService instance = new IndexService();
	private IndexService() {
		dao = new IndexDAO();
	}
	public static IndexService getInstance() {
		return instance;
	}
	public ArrayList<Exhibition> getExhibitionS(){
		return dao.getExhibition();
	}
	public ArrayList<Exhibition> getKasS(){
		return dao.getKas();
	}	
}
