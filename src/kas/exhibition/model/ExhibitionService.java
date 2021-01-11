package kas.exhibition.model;

import java.util.ArrayList;
import java.util.HashMap;

import kas.domain.Exhibition;

public class ExhibitionService {
	private ExhibitionDAO dao;
	private static final ExhibitionService instance = new ExhibitionService();
	private ExhibitionService() {
		dao = new ExhibitionDAO();
	}
	public static ExhibitionService getInstance() {
		return instance;
	}
	
	public ArrayList<Exhibition> getExhibitionS(String director){
		return dao.getExhibition(director);
	}
	
	public Exhibition getExhibitionContentS(int exhibitCode) {
		return dao.getExhibitionContent(exhibitCode);
	}
	
	public ArrayList<Exhibition> searchS(String searchName){
		System.out.println("searchName Service"+searchName);
		return dao.search(searchName);
	}
    public HashMap<String, String> getArtistsS() {
        return dao.getArtists();
     }
	public ArrayList<Exhibition> getMyListS(ArrayList<String> list){
		return dao.getMyList(list);
	}
}
