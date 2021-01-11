package kas.member.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kas.domain.Exhibition;
import kas.exhibition.control.ExhibitionController;
import kas.exhibition.model.ExhibitionService;
import kas.exhibition.vo.ExhibitionList;
import kas.member.model.MemberService;
import kas.member.model.MemberSet;
import kas.domain.Member;

@WebServlet("/member.kas")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m != null) {
			System.out.println(m);
			m = m.trim();
			if(m.equals("form")) {
				form(request, response);
			} else if(m.equals("check")) {
				check(request, response);
			} else if(m.equals("out")) {
				out(request, response);
			} else if(m.equals("signupForm")) {
				signupForm(request, response);
			} else if(m.equals("signup")) {
				signup(request, response);
			} else if(m.equals("likes")) {
				likeIt(request, response);
			}else if(m.equals("likesOff")) {
				likeOff(request, response);
			}
				else {
			}
		}else {
			
		}
	}
	
	private void form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "signin.jsp";
		response.sendRedirect(view);
	}
	
	private void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String pwd = request.getParameter("pwd");
	   // ArrayList<Integer> listArray = new ArrayList<Integer>();
	    ArrayList<String> listArray = new ArrayList<String>();
	    if(email != null) email = email.trim();
	    if(pwd != null) pwd = pwd.trim();
	    HttpSession session=null;
	    Member m=null;
	    MemberService service = MemberService.getInstance();
	    int rCode = service.checkMember(email, pwd);
	    request.setAttribute("rCode", rCode);
		String likelistTotal ="";
	    if(rCode == MemberSet.PASS) {
	    	session = request.getSession();
	    	m = service.getMemberS(email);
	    	String str = m.getListList();
	    	System.out.println("???:"+str);
	    	
	    	 String[] likeListP = str.split("#");
	    	 for(int i=0; i<likeListP.length; i++) {
	    		//int k =  Integer.parseInt(likeListP[i]);
	    		 listArray.add(likeListP[i]);
	    		 System.out.println("2222222222222"+likeListP[i]);
			 }	
			session.setAttribute("likeList", listArray);
	    	session.setAttribute("loginUser", m);  
	    	
	    
	    }    	
	    String view = "login_msg.jsp";
	    RequestDispatcher rd = request.getRequestDispatcher(view);
	    rd.forward(request, response);
	    }
	    
	private void out(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//session.removeAttribute("loginUser");
		session.invalidate();
		
		String view = "index.kas";
		response.sendRedirect(view);
	}
	
	private void signupForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "signup.jsp";
		response.sendRedirect(view);
	}
	
	private void signup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
	    String pwd = request.getParameter("pwd");	    
	    if(email != null) email = email.trim();
	    if(name != null) name = name.trim();
	    if(pwd != null) pwd = pwd.trim();
	    System.out.println("email: " + email);
	    System.out.println("name: " + name);
	    System.out.println("pwd: "+ pwd);
	    
	    Member m = new Member(email, name, pwd, null);
	    
	    MemberService service = MemberService.getInstance();
	    int rCode = service.signUpS(m);
	    request.setAttribute("rCode", rCode);
	    
	    System.out.println(rCode);
	    
	    String view = "signup_msg.jsp";
	    RequestDispatcher rd = request.getRequestDispatcher(view);
	    rd.forward(request, response);
	}
	 

	private void likeIt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String codeStr =  request.getParameter("code");
		int code = Integer.parseInt(codeStr);
		
		HttpSession session = request.getSession();
		String likelistTotal="";
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("!:"+loginUser.getListList() );

		likelistTotal = loginUser.getListList();
		String email = loginUser.getEmail();
		
		MemberService service = MemberService.getInstance();
		System.out.println("!!:"+likelistTotal);
		String likelistNew = service.likeItS(likelistTotal, code, email);
		
		loginUser.setListList(likelistNew);
		session.setAttribute("loginUser", loginUser);
		
		ArrayList<String> likeListReal = new ArrayList<String>();
		 String[] likeListP = likelistNew.split("#");
		
		 for(int i=0; i<likeListP.length; i++) {
			 likeListReal.add(likeListP[i]);
		 }	
		 session.setAttribute("likeList", likeListReal);
		 response.sendRedirect("exhibit.kas?m=exhibitBoard&Exh="+code);
	}
	
	private void likeOff (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		String codeStr =  request.getParameter("code");
		System.out.println("*****1:"+codeStr);
		int code = Integer.parseInt(codeStr);
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String likelistTotal = loginUser.getListList();
		System.out.println("*****2:"+likelistTotal);
		String email = loginUser.getEmail();
		System.out.println("*****3:"+email);
		ArrayList<String> listSplitedArray = new ArrayList<String>();
		
		String[] listSplited = likelistTotal.split("#");
		for(int i =0; i<listSplited.length ; i++) {
			listSplitedArray.add(listSplited[i]);
			System.out.println("*****4:"+(listSplited[i]));
		}
		
		for(String k : listSplitedArray) {
			if(k.equals(codeStr)) {
				System.out.println("*****5:"+k);
				listSplitedArray.remove(k); break;
				
			}
			
		}
		
		StringBuffer buffer = new StringBuffer();
		for(String st : listSplitedArray) {
			buffer.append(st+"#");
		}	
		String bufferStr = buffer.toString();
		System.out.println("*****6:"+bufferStr);
		System.out.println("3333333333333:"+bufferStr);
		
		MemberService service = MemberService.getInstance();
		service.likeOffS(bufferStr,code,email);
		
		loginUser.setListList(bufferStr);
		session.setAttribute("loginUser", loginUser);
		
		session.setAttribute("likeList", listSplitedArray);
		 response.sendRedirect("exhibit.kas?m=exhibitBoard&Exh="+code);
		
		
	}
}
