package kas.review.model;

import java.util.ArrayList;

import kas.domain.Exhibition;
import kas.domain.Review;
import kas.review.vo.ListResult;

public class ReviewService {
	private ReviewDAO dao;
	private static final ReviewService instance = new ReviewService();
	private ReviewService() {
		dao = new ReviewDAO();
	}
	public static ReviewService getInstance() {
		return instance;
	}
	
    public ArrayList<String> getExTitleS() {
		return dao.getExTitle();
	}
    
	public String getExPosterS(String exTitle) {
		return dao.getExPoster(exTitle);
		
	}
	
	public int getExCodeS(String exTitle) {
		return dao.getExCode(exTitle);
	}
	
	public void writeReviewS(Review newPost) {
		dao.writeReview(newPost);
	}
	
	public Review getReviewS(int idx) {
		return dao.getReview(idx);
	}

	public ArrayList<Review> getListReviewS(){
		return dao.getListReview();
	}
	
	public String getReviewTS(int idx) {
		return dao.getReviewT(idx);
	}
	
	public void editReviewS(int idx, String title, String content) {
		dao.editReview(idx, title, content);
	}
	
	public ListResult getListResult(int currentPage, int pageSize) {
		ArrayList<Review> list = dao.getListResult(currentPage, pageSize);
		long totalCount = dao.getTotalCount();
		ListResult r = new ListResult(currentPage, totalCount, pageSize, list, -1L);

		return r;
	}
	
	public ArrayList<Review> getSearchS(String c_code, String searchName){
		return dao.getSearch(c_code, searchName);
	}
	
	public void updateViewS(int idx) {
		dao.updateView(idx);
	}
	public void deleteS(int idx) {
	      dao.delete(idx);
	   }
}
