package kas.exhibition.model;

public class ExhibitionSQL {
	static final String LIST ="select * from EXHIBITION where DIRECTOR=? order by code";
	static final String GETCONTENT2 = "select * from EXHIBITION where director=?";
	static final String GETCONTENT = "select * from EXHIBITION where CODE=?";
	static final String SEARCH = "select * from EXHIBITION where UPPER(TITLE) like ? or UPPER(ARTIST) like ? or LOWER(TITLE) like ? or LOWER(ARTIST) like ?";
	final static String ARTIST = "select artist, poster from Exhibition";
}
