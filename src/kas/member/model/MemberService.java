package kas.member.model;

import kas.domain.Member;

public class MemberService {
	private MemberDAO dao;
	private static final MemberService instance = new MemberService();
	private MemberService() {
		dao = new MemberDAO();
	}
	public static MemberService getInstance() {
		return instance;
	}
	
	public int checkMember(String email, String pwd) {
		Member m = dao.getMember(email);
		if(m == null) {
			return MemberSet.NO_ID; //그런 이메일을 가진 회원이 없음
		}else {
			String pwdDb = m.getPwd();
			if(pwdDb != null) pwdDb = pwdDb.trim();
			
			if(!pwd.equals(pwdDb)) {
				return MemberSet.NO_PWD; //PWD불일치 
			}else {
				return MemberSet.PASS; //PWD 일치 
			}
		}
	}
	
	public Member getMemberS(String email) {
		Member m = dao.getMember(email);
		m.setPwd("");
		
		return m;
	}
	
	public int signUpS(Member m) {
		int rCode = dao.signUp(m);
		return rCode;
	}
	
	public String likeItS(String likelistTotal, int code, String email) {
		return dao.likeIt(likelistTotal,code,email);
		
	}
	
	public void likeOffS(String likelistTotal, int code, String email) {
		dao.likeOff(likelistTotal,code,email);
		
	}
	
}
