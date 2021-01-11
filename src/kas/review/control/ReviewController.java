package kas.review.control;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.impl.protocol.giopmsgheaders.RequestMessage;

import kas.domain.Exhibition;
import kas.domain.Review;
import kas.exhibition.model.ExhibitionService;
import kas.review.model.ReviewService;
import kas.review.vo.ListResult;



@WebServlet("/review.kas")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m != null) {
			System.out.println(m);
			m = m.trim();
			if(m.equals("writeForm")) {
				writeForm(request,response);
			}else if(m.equals("write")) {
				write(request, response);
			}else if(m.equals("review")) {
				review(request,response);
			}else if(m.equals("getReview")) {
				getReview(request, response);
			}else if(m.equals("edit")) {
				edit1(request,response);
			}else if(m.equals("editReal")) {
				edit2(request, response);
			}else if(m.equals("search")) {
				search(request, response);
			}else if(m.equals("delete")) {
	            delete(request, response);
	         }
		}else {	
		}
	}
	private void review(HttpServletRequest request, HttpServletResponse response) 
	         throws ServletException, IOException {
	String cpStr = request.getParameter("cp");
	HttpSession session = request.getSession();
	System.out.println(cpStr);
	int cp = 1;
	if(cpStr == null) {
		Object cpObj = session.getAttribute("cp");
		if(cpObj != null) {
			cp = (Integer)cpObj;
		}
	} else {
		cpStr = cpStr.trim();
		cp = Integer.parseInt(cpStr);
	}
	session.setAttribute("cp", cp);
	
	int ps = 5;
	session.setAttribute("ps", ps);
	
	ReviewService service = ReviewService.getInstance();
	ListResult listResult = service.getListResult(cp, ps);
	request.setAttribute("listResult", listResult);
	int size = listResult.getList().size();
	if(size == 0 && cp>1) {
		response.sendRedirect("review.kas?m=review&cp="+(cp-1));
	}else {
		String view = "review.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response); 
	}
}

	private void writeForm(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ReviewService service = ReviewService.getInstance();
		ArrayList<String> exTitle = service.getExTitleS();
		request.setAttribute("ExTitle", exTitle);
		System.out.println(1);
		String view = "write.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	private void write(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ReviewService service = ReviewService.getInstance();
		String exTitle = request.getParameter("c_code");
		
		int exCode = service.getExCodeS(exTitle);
		String posterTitle = service.getExPosterS(exTitle);
		
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(writer+email+title+content);
		Review newPost = new Review(-1, exCode, email, title, posterTitle, 
				writer, content, null, -1);
	
		service.writeReviewS(newPost);
		
		review(request, response);
		
	}
	
	private void getReview(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ReviewService service = ReviewService.getInstance();
		String idxStr = request.getParameter("idx");
		String codeStr = request.getParameter("code");
		int idx = Integer.parseInt(idxStr);
		int code = Integer.parseInt(codeStr);
		Review reviewGot = service.getReviewS(idx);
		String reviewGotT = service.getReviewTS(code);
		service.updateViewS(idx);
		
	
		request.setAttribute("ReviewGot", reviewGot);
		request.setAttribute("ReviewGotT", reviewGotT);
		
		String view = "getReview.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void edit1(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ReviewService service = ReviewService.getInstance();
		String idxStr = request.getParameter("idx");
		String codeStr = request.getParameter("code");
		int idx = Integer.parseInt(idxStr);
		int code = Integer.parseInt(codeStr);
		Review reviewGot = service.getReviewS(idx);
		String reviewGotT = service.getReviewTS(code);
		request.setAttribute("ReviewGot", reviewGot);
		request.setAttribute("ReviewGotT", reviewGotT);
		String view = "getReview2.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void edit2(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ReviewService service = ReviewService.getInstance();
		String idxStr = request.getParameter("idx");
		int idx = Integer.parseInt(idxStr);
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		service.editReviewS(idx, title, content);
		
		review(request, response);
		
	}
	public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String c_code = request.getParameter("c_code");
		String searchName = request.getParameter("searchName");
		System.out.println("c_code: "+c_code+", searchName: "+searchName);
		ReviewService service = ReviewService.getInstance();
		ArrayList<Review> searchList = service.getSearchS(c_code, searchName);
		request.setAttribute("searchList", searchList);
		
		String view = "searchResult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}	 
	private void delete(HttpServletRequest request, HttpServletResponse response) 
	         throws ServletException, IOException {
	      ReviewService service = ReviewService.getInstance();
	      String idxStr = request.getParameter("idx");
	      int idx = Integer.parseInt(idxStr);
	   
	      service.deleteS(idx);
	      
	      review(request, response);
	      
	}
}
