
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ResourceBundle;

public class TracksServlet extends HttpServlet {

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

	public void printAlbumInfo(PrintWriter out, String albumName) {
              out.println("<h1>Album " + albumName +" Information</h1>");
	      ArrayList AlbumInfoList = _reg.getAlbumInfoList(albumName);
	      Album album = (Album) AlbumInfoList.get(0);
              out.println("<br><tr><td>Record Company   :" + album.getRecCompany() +"</td></tr></br>");
	      out.println("<br><tr><td>Release year   :" + album.getReleaseYear() +"</td></tr></br>");
	      out.println("<br></br>");
              out.println("<h1> Track List </h1>");	      
	      out.println("<table>");
	      out.println("<tr><td></td><td>Title</td><td>Length(in secs)</td><td></tr>");
	      ArrayList TrList = _reg.getTrList(albumName);
	     
	      for (int i=0; i<TrList.size(); i++) {
	    	 Tracks tracks = (Tracks) TrList.get(i);
	    	out.println(tracks.toHTML());  
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
	  response.setContentType("text/html");
	 String albumName = request.getParameter("albumName");
	 System.out.println("selected album: " + albumName);                
      PrintWriter out = response.getWriter();
      out.println("<html><head></head><body>");
      
      if (!_message.equalsIgnoreCase("servus")) {
    	  out.println("<h1>Oracle connection failed " + _message + "</h1>");
      } else {
	     printAlbumInfo(out, albumName);
	     
      }
	  
      out.println("</table>");
      out.println("</html>");
	}
  
	public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse) throws ServletException, IOException {  
	
	  doGet(inRequest, outResponse);  
	}

	public void destroy() {
		_reg.closeDBConnection();
	}
}
