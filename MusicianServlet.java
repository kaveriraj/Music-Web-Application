//@author Kaveri Krishnaraj
//Musician Servlet class

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ResourceBundle;


public class MusicianServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Registrar _reg;
	private ResourceBundle _bundle;
	
	private String _message;
  
	public void init() throws ServletException {
		_bundle = ResourceBundle.getBundle("OraBundle");
		_reg = new Registrar();
		_message = _reg.openDBConnection(_bundle.getString("dbUser"), _bundle.getString("dbPass"), _bundle.getString("dbSID"), 
										 _bundle.getString("dbHost"), Integer.parseInt(_bundle.getString("dbPort")));  
	}
	public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse) throws ServletException, IOException {  
	  	doGet(inRequest, outResponse);  
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("text/html");
	        ArrayList info = new ArrayList();
		PrintWriter out = response.getWriter();
		String member = request.getParameter("musicianName");
	        
		out.println("<center>");
		out.println("<h2>Musician Information</h2>");
		out.println("<table>");
		
		info = _reg.getMusicianInfo(member);
		for ( int i=0;i<info.size();i++) {
		Musician m = (Musician)info.get(i);
		out.println("<h4>"+m.getMusicianName()+"<h4>");
		out.println("<br></br>");
		out.println("<tr><td>Date of Birth :" +m.getDOB()+  "</td></tr>");
		out.println("<tr><td>Place of Birth :" +m.getPlace()+  "</td></tr>");
	        out.println("<tr><td>Years Active :" +m.getYears()+  "</td></tr>");
		out.println("<tr><td>Associated Acts :" +m.getAssoc()+  "</td></tr>");

        }
	}
	public void destroy() {
		_reg.closeDBConnection();
	}
}

