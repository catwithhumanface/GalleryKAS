package kas.member.model;

class MemberSQL {
	final static String CONTENT = "select * from MEMBER where email=?";
	final static String SIGN_UP = "insert into MEMBER values(?, ?, ?, '0#')";
	final static String LIKE = "update MEMBER set LIKELIST=? where email=?";
	final static String LIKELIST = "select LIKELIST from MEMBER where email=?";
}
