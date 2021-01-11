package kas.review.model;

public class ReviewSQL {
	static final String LIST ="select TITLE from EXHIBITION";
	static final String GETPOSTER ="select POSTER from EXHIBITION where TITLE=?";
	static final String GETCODE ="select CODE from EXHIBITION where TITLE=?";
	static final String WRITE ="insert into REVIEW values(REVIEW_IDX.nextval,?,?,?,?,?,?,SYSDATE,0)";
	static final String GETREVIEW ="select * from REVIEW where IDX=?";
	static final String GETLISTREVIEW ="select * from REVIEW";
	static final String GETTITLE ="select TITLE from EXHIBITION where CODE=?";
	static final String EDIT ="update REVIEW set title=?, content=? where idx=?";
	static final String EXHIBIT = "select * from REVIEW order by idx desc";
	final static String LIST_PAGE 
	=  "select * from (select ROWNUM rnum, aa.* from (select * from REVIEW order by IDX desc) aa) where rnum>? and rnum<=?";
	final static String COUNT = "select COUNT(IDX) from REVIEW";
	final static String SEARCHNAME = "select * from REVIEW where NAME like ?";
	final static String SEARCHTITLE = "select * from REVIEW where TITLE like ?";
	final static String VIEW = "update REVIEW set VIEWS=VIEWS+1 where idx=?";
	final static String DELETE = "delete REVIEW where idx=?";
}
