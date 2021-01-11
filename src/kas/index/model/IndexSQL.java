package kas.index.model;

public class IndexSQL {
	static final String GETCONTENT = "select * from EXHIBITION order by CODE";
	   static final String GETKAS = "select * from EXHIBITION where artist='콰야' or artist='Jihee' or artist='JH'";
}
