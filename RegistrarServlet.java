import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ResourceBundle;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RegistrarServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Registrar _reg;
	private ResourceBundle _bundle;
	
	private String _message;
        private static Connection _conn = null;

	public void init() throws ServletException {
		_bundle = ResourceBundle.getBundle("OraBundle");
		_reg = new Registrar();
		_message = _reg.openDBConnection(_bundle.getString("dbUser"), _bundle.getString("dbPass"), _bundle.getString("dbSID"), 
										 _bundle.getString("dbHost"), Integer.parseInt(_bundle.getString("dbPort")));  
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	     response.setContentType("text/html");

	     
	     PrintWriter out = response.getWriter();
	     out.println("<html><form action=\"BandServlet\" method=\"post\">");
	     out.println("<center><h1>Music Database</h1></center>");
	     out.println("<center>");
	     out.println("<h1>Select Music Genre</h1>"); 
             out.println("<p>");
	     out.println("<select name=\"genre\">");
	     ArrayList GenreList = _reg.getGenreList();
	
	     for (int i=0; i<GenreList.size(); i++) {
		    Band band = (Band) GenreList.get(i);
                    out.println("<OPTION VALUE=\"" + band.getGenre() +  "\">" + band.getGenre() + "</OPTION>");
              } 

	     
	     out.println("</select></p>");
	     out.println("<p><input type=\"submit\" value=\"show band\" name=\"B1\"></p></form></html>");

	     out.close();
       
	}
  
	public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse) throws ServletException, IOException {  
	
	  doGet(inRequest, outResponse);  
	}

	public void destroy() {
		_reg.closeDBConnection();
	}

}

