import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Album {
  
  private String _album_name;
  private int _album_id;
  private int _band_id;
  private int _number_of_tracks;
  private int _release_year;
  private String _rec_company;

  public String getRecCompany() {
    return _rec_company;
  }

  public Album (String rec_company, int release_year) {
    _rec_company = rec_company;
    _release_year = release_year;
  }

  public Album (int album_id, int band_id, String album_name, int number_of_tracks, int release_year) {
    _album_name = album_name;
    _album_id = album_id;
    _band_id = band_id;
    _number_of_tracks = number_of_tracks;
    _release_year = release_year;
  }
  
  public String getAlbumName() {
    return _album_name;
  }
  
  public int getAlbumId() {
    return _album_id;
  }

  public int getBandId() {
    return _band_id;
  }

  public int getNumberofTracks() {
    return _number_of_tracks;
  }
  
  public int getReleaseYear() {
    return _release_year;
  }
 
  public void setAlbumId(int album_id) {
    _album_id = album_id;
  }

  public void setBandId(int band_id) {
    _band_id = band_id;
  }

  public void setNumberofTracks(int number_of_tracks) {
    _number_of_tracks = number_of_tracks;
  }

  public void setReleaseyear(int release_year) {
    _release_year = release_year;
  }


  public String toString() {
    return _album_id + "  " + _band_id + "  " + _album_name + "  " + _number_of_tracks + "  " + _release_year;
  }
  
  public String toHTML() {
	  return "<tr><td>" + _album_id + "</td><td>" + _band_id + "</td><td>" + _album_name + "</td><td>" + _number_of_tracks + "</td><td>" + _release_year + "</td><td></tr>";
  }
}
