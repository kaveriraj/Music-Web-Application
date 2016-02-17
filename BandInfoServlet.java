
//@author Kaveri Krishnaraj
//Album model class

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

public class BandInfoServlet extends HttpServlet {

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
	//Print Band's Live Schedule Information   
	public void printLiveInfo(PrintWriter out, String BandName) {
              out.println("<h1>Live Schedule</h1>");
	      out.println("<table>");
	      out.println("<tr><td>Location</td><td>Venue</td><td>Date</td><td>Phone</td></tr>");
	      ArrayList LiveList = _reg.getLiveList(BandName);
	     //out.println(bandName);
	      for (int i=0; i<LiveList.size(); i++) {
	    	 Live live = (Live) LiveList.get(i);
	    	out.println(live.LivetoHTML());  
	      }
	      out.println("</table>");
	}
	
	//Print Musician Info
	public void printMusicianInfo(PrintWriter out, String BandName) {
              out.println("<h1>Band Member</h1>");
              out.println("<table>");
              out.println("<tr><td>Name</td><td>Instruments</td><td>DOB</td><td>Year_Joined</td><td></td><td></tr>");
              ArrayList MusicianList = _reg.getMusicianList(BandName);
              Musician musician = null;
              for (int i=0; i<MusicianList.size(); i++) {
                 musician = (Musician) MusicianList.get(i);
                 out.println(musician.MusiciantoHTML());
              }
              out.println("</table>");
		
	}
	public void musicianList(PrintWriter out, String BandName) {
	      out.println("<h1>More Details about the Band Member</h1>");
              out.println("<p>");
	      ArrayList MusicianList = _reg.getMusicianList(BandName);
              Musician musician = null;
	      out.println("<form action=\"MusicianServlet\" method=\"post\">");
              out.println("<select name=\"musicianName\">");
              for (int i=0; i<MusicianList.size(); i++) {
		 musician = (Musician) MusicianList.get(i);
                 out.println("<OPTION VALUE=\"" + musician.getMusicianName() +  "\">" + musician.getMusicianName() + "</OPTION>");
	       }
		out.println("</select></p>");
 	        out.println("<p><input type=\"submit\" value=\"list Musician Info\" name=\"B1\"></p></form>");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	     response.setContentType("text/html");
	     String BandName = request.getParameter("bandname");
	     System.out.println("selected Genre: " + BandName);
	     
	     PrintWriter out = response.getWriter();
	     out.println("<html>");
             if (!_message.equalsIgnoreCase("servus")) {
    	  	out.println("<h1>Oracle connection failed " + _message + "</h1>");
             } 
             else {
		     out.println("<h1>"+ BandName +" Information Page</h1>");
		     ArrayList BandInfoList = _reg.getBandInfoList(BandName);
		     for(int j=0;j<BandInfoList.size();j++) {
			     Band bandinfo = (Band) BandInfoList.get(j);
			     out.println("<br><tr><td>Home Page :" +bandinfo.getHomepage()+ "</td></tr></br>");
			     out.println("<br><tr><td>Home Town :" +bandinfo.getHometown()+"</td></tr></br>");
		     }
		     out.println("<br></br>");
		     printMusicianInfo(out, BandName);
		     out.println("<br></br>");
		     out.println("<form action=\"TracksServlet\" method=\"post\">");
		     out.println("<h1>Album List</h1>"); 
		     out.println("<p>");
		     out.println("<select name=\"albumName\">");
		     ArrayList AlList = _reg.getAlList(BandName);
		
		     for (int i=0; i<AlList.size(); i++) {
			    Album album = (Album) AlList.get(i);
		            out.println("<OPTION VALUE=\"" + album.getAlbumName() +  "\">" + album.getAlbumName() + "</OPTION>");
		      } 
		     out.println("</select></p>");
		     out.println("<p><input type=\"submit\" value=\"list tracks\" name=\"B1\"></p></form>");
		     printLiveInfo(out, BandName);
		     musicianList(out, BandName);
	  }   
	     out.println("</html>");
	     
	     out.close();
              
	}
  
	public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse) throws ServletException, IOException {  
	  doGet(inRequest, outResponse);  
	}

	public void destroy() {
		_reg.closeDBConnection();
	}

}

