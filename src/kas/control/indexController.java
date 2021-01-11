package kas.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kas.domain.Exhibition;
import kas.exhibition.model.ExhibitionService;
import kas.index.model.IndexService;

@WebServlet("/index.kas")
public class indexController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   protected void service(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      String m = request.getParameter("m");
      if(m != null) {
         m = m.trim();
         if(m.equals("main")) {
            main(request, response);
         }else if(m.equals("others")){
            others(request, response);
         }else {
            main(request, response);
         }
      }else {
         main(request, response);
      }
   }
   private void main(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      IndexService service = IndexService.getInstance();
      ArrayList<Exhibition> exhibit = service.getExhibitionS();

      request.setAttribute("Exhibit", exhibit);
      
      
      ArrayList<Exhibition> exhibit2 = service.getKasS();

      request.setAttribute("Exhibit2", exhibit2);

      String view = "index.jsp";
      RequestDispatcher rd = request.getRequestDispatcher(view);
      rd.forward(request, response);         
      
   }
   private void others(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
   
      String view = "index.jsp";
      RequestDispatcher rd = request.getRequestDispatcher(view);
      rd.forward(request, response);         
   }
   
}