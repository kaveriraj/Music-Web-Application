import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Registrar {
  
  private static Connection _conn = null;
  
  /**
   * Open the database connection.
   * @param dbUser
   * @param dbPass
   * @return
   */
  public String openDBConnection(String dbUser, String dbPass, String dbSID, String dbHost, int port) {
    
    String res="";
    if (_conn != null) {
      closeDBConnection();
    }
  
    try {
       _conn = DBUtils.openDBConnection(dbUser, dbPass, dbSID, dbHost, port);
       System.out.println("Opened a connection");
       res = DBUtils.testConnection(_conn);
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    } catch (ClassNotFoundException cnfe) {
      cnfe.printStackTrace(System.err);
    }
    return res;
  }
  
  /**
   * Close the database connection.
   */
  public void closeDBConnection() {
    try {
      DBUtils.closeDBConnection(_conn);
      System.out.println("Closed a connection");
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  }
  
    
  
  
   public ArrayList getAlList(String BandName) { 
	  ArrayList AlList = new ArrayList();
    
    try {
      String query = "select A.album_id, A.band_id, A.name, A.number_of_tracks, A.release_year from album A, band B where A.band_id = B.band_id and B.name = '" + BandName + "'";
      
      Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        
        while (rs.next()) {
        
          int album_id = rs.getInt("album_id");
          int band_id = rs.getInt("band_id");
          String album_name = rs.getString("name");
	  int number_of_tracks = rs.getInt("number_of_tracks");
	  int release_year = rs.getInt("release_year");
          Album album = new Album(album_id, band_id, album_name, number_of_tracks, release_year);
           
          AlList.add(album);
        }
        
        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
 
    return AlList;
    }

  public ArrayList getLiveList(String BandName) {
          ArrayList LiveList = new ArrayList();
    
    try {
      String query = "select LV.place_name, LV.venue, to_char(BLP.live_date, 'MM/DD/YYYY') as live_date,LV.phone from band B, live_venue LV, band_live_performance BLP where BLP.band_id = B.band_id and LV.place_id = BLP.place_id and B.name = '" + BandName + "'";

      Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {

          String place_name = rs.getString("place_name");
	  String venue = rs.getString("venue");
	  String live_date = rs.getString("live_date");
	  int phone = rs.getInt("phone");
          Live live = new Live(place_name, venue, live_date,phone);

          LiveList.add(live);
        }

        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  
    return LiveList;
    }

  public ArrayList getGenreList() {
          ArrayList GenreList = new ArrayList();
    
    try {
      String query = "select distinct genre from band";

      Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
          String genre = rs.getString("genre");
          Band band = new Band(genre);

          GenreList.add(band);
        }

        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  
    return GenreList;
  }

  public ArrayList getBandList(String Genre) {
          ArrayList BandList = new ArrayList();
    
    try {
      String query = "select name, hometown, homepage, genre from band where genre ='" + Genre + "'";

      Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
	  String name = rs.getString("name");
	  String hometown = rs.getString("hometown");
          String homepage = rs.getString("homepage");
	  String genre = rs.getString("genre");
          Band band = new Band(name, hometown, homepage, genre);

          BandList.add(band);
        }

        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  
    return BandList;
  }

  public ArrayList getBandInfoList(String BandName) {
          ArrayList BandList = new ArrayList();
    
    try {
      String query = "select name, hometown, homepage, genre from band where name ='" + BandName + "'";

      Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
          String name = rs.getString("name");
          String hometown = rs.getString("hometown");
          String homepage = rs.getString("homepage");
          String genre = rs.getString("genre");
          Band band = new Band(name, hometown, homepage, genre);

          BandList.add(band);
        }

        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  
    return BandList;
  }

  public ArrayList getTrList (String albumName) {
       ArrayList TrList = new ArrayList();
      try {
      String query = "select distinct T.track_id, T.title, T.length_in_secs from tracks T, album A where A.album_id = T.album_id and A.band_id = T.band_id and A.name = '" + albumName + "'";

      Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {

          int track_id = rs.getInt("track_id");
          String trackTitle = rs.getString("title");
          int tLength = rs.getInt("length_in_secs");
          Tracks tracks = new Tracks(track_id, trackTitle, tLength);
	  TrList.add(tracks);
        }

        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  
    return TrList;

  }

  
   public ArrayList getAlbumInfoList (String albumName) {
       ArrayList AlbumInfoList = new ArrayList();
      try {
      String query = "select RC.REC_COMPANY_NAME, A.release_year from album A, record_company RC, Album_Produce_by_Rec_Company ARC where A.band_id=ARC.band_id and A.album_id=ARC.album_id and ARC.rec_company_id = RC.rec_company_id and A.name = '" + albumName + "'";

      Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {

          String rec_company_name = rs.getString("rec_company_name");
	  int release_year = rs.getInt("release_year");
          Album album = new Album(rec_company_name, release_year);
          AlbumInfoList.add(album);
        }

        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  
    return AlbumInfoList;

  }

  public ArrayList getMusicianList (String BandName) {
       ArrayList MusicianList = new ArrayList();
      try {
        String query = "select musician_name, max(ltrim(sys_connect_by_path(instrument_name,','),',')) AS instrument_name, to_char(DOB, 'MM/DD/YYYY') as DOB, join_year from (select X.musician_name, X.instrument_name, X.DOB, X.join_year, row_number() over (partition by X.musician_name order  by X.instrument_name) as rn from (select distinct M.name as musician_name, I.name as instrument_name, M.DOB, MB.join_year from musician M, Musician_Member_of_Band MB, band B, instrument I, instrument_played_by_musician IM where M.musician_id=MB.musician_id and MB.band_id=B.band_id and M.musician_id = IM.musician_id and I.instrument_id = IM.instrument_id and MB.left_year is null and b.name = '"+BandName+"') X) start with rn = 1 connect by prior musician_name = musician_name and prior rn+1 = rn group by musician_name, DOB, join_year order by musician_name ";

        Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {

          String musician_name = rs.getString("musician_name");
	  String instrument_name = rs.getString("instrument_name");
	  String DOB = rs.getString("DOB");
	  int join_year = rs.getInt("join_year");
          Musician musician = new Musician(musician_name, instrument_name, DOB, join_year);
          MusicianList.add(musician);
        }

        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
 
    return MusicianList;

  }
public ArrayList getMusicianInfo (String name) {
	 ArrayList MusicianList = new ArrayList();
      try {
	  String query = "select place, years, assoc, to_char(DOB, 'MM/DD/YYYY') as DOB from Musician M where name = '" +name+ "'";
	   Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
	String place = rs.getString("place");
	String years = rs.getString("years");
	String assoc = rs.getString("assoc");
	String dob = rs.getString("DOB");
	Musician musician = new Musician(name,dob,place, years, assoc);
	MusicianList.add(musician);
        }

        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  
    return MusicianList;

  }

}
