package kas.exhibition.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kas.domain.Exhibition;
import kas.domain.Member;
import kas.exhibition.model.ExhibitionService;
import kas.exhibition.vo.ExhibitionList;
import kas.member.model.MemberService;




@WebServlet("/exhibit.kas")
public class ExhibitionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m != null) {
			System.out.println(m);
			m = m.trim();
			if(m.equals("artists")) {
				artists(request, response);
			}else if(m.equals("exhibition")) {
				exhibition(request, response);
			}else if(m.equals("exhibitBoard")) {
				exhibitBoard(request, response);
			}else if(m.equals("search")) {
				search(request, response);
			}else if(m.equals("searchReal")) {
				searchReal(request, response);
			}else if(m.equals("about")) {
				about(request, response);
			}else if(m.equals("getMyList")) {
				getMyList(request, response);
			}
				
			else {
			
			}
		}else {
			
		}
	}
	
	private void exhibition(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ExhibitionService service = ExhibitionService.getInstance();
		String director = (String)request.getParameter("Dir");
		System.out.println("DDDDDDDDD"+director);
		if(director==null){
			director="Ann";
		}
		request.setAttribute("Director", director);
		ArrayList<Exhibition> list = service.getExhibitionS(director);
		request.setAttribute("ExhibitionList", list); 
		if(list !=null && list.size() !=0) {
			System.out.println("listsize:"+list.size());
			for(Exhibition ex : list) {
				String artist = ex.getArtist();
				String poster = ex.getPoster();
			}
		}
		String view = "exhibition_page.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void getMyList(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String toSplit = loginUser.getListList();
		String[] listSplited = toSplit.split("#");
		ArrayList<String> listSplitedArray = new ArrayList<String>();
		for(int i=0; i<listSplited.length; i++) {
			System.out.println("%%%%%%1%%"+listSplited[i]);
			listSplitedArray.add(listSplited[i]);
		
		}
		
		ExhibitionService service = ExhibitionService.getInstance();
		ArrayList<Exhibition> list = service.getMyListS(listSplitedArray);
		request.setAttribute("ExhibitionList", list); 
		if(list !=null && list.size() !=0) {
			System.out.println("listsize:"+list.size());
			for(Exhibition ex : list) {
				String artist = ex.getArtist();
				String poster = ex.getPoster();
			}
		}
		String view = "mylist_page.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	
	private void exhibitBoard(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<String> list = (ArrayList)session.getAttribute("likeList");
		
		
		ExhibitionService service = ExhibitionService.getInstance();
		String exhibitCodeStr = (String)request.getParameter("Exh");
		System.out.println("exhibitCodeStr:"+exhibitCodeStr);
		int exhibitCode=7;
		if(exhibitCodeStr != null) {
			exhibitCode = Integer.parseInt(exhibitCodeStr);
		}else {
		}
		
		Exhibition exContent = service.getExhibitionContentS(exhibitCode);
		request.setAttribute("ExContent", exContent);
		
		String content = exContent.getContent();
		String contentReal = content.substring(0,content.indexOf("@"));
		request.setAttribute("ContentReal", contentReal);
		
		String photoContent1 =content.substring(content.indexOf("@")+1,content.indexOf("#"));
		String photoContent2 =content.substring(content.indexOf("~")+1,content.indexOf("&"));
		
		request.setAttribute("PhotoContent1", photoContent1);
		request.setAttribute("PhotoContent2", photoContent2);
		
		String view = "exhibition_board.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}
	private void search(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String view = "search.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	private void searchReal(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		ExhibitionService service = ExhibitionService.getInstance();
		String searchName = request.getParameter("searchName");
		
		ArrayList<Exhibition> searchResult = service.searchS(searchName);
		request.setAttribute("SearchResult", searchResult);
		
		String view = "search2.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	private void about(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String view = "about.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
   private void artists(HttpServletRequest request, HttpServletResponse response) 
	         throws ServletException, IOException {
	   ExhibitionService service = ExhibitionService.getInstance();
	      HashMap<String, String> artist = service.getArtistsS();
	      request.setAttribute("artist", artist);   
	       
	      String view = "artists_page.jsp";
	      RequestDispatcher rd = request.getRequestDispatcher(view);
	      rd.forward(request, response);      
	   }
   


}
