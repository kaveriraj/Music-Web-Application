//@author Kaveri Krishnaraj
//Tracks model class
public class Tracks {
  
  private String _trackTitle;
  private int _track_id;
  private int _tLength;

  public Tracks (String trackTitle) {
   _trackTitle = trackTitle;
  }

  public Tracks(int track_id, String trackTitle, int tLength) {
    _trackTitle = trackTitle;
    _track_id = track_id;
    _tLength = tLength;
  }
  
  public String gettrackTitle() {
    return _trackTitle;
  }
  
  public int getTrackId() {
    return _track_id;
  }

  public int getTLength() {
    return _tLength;
  }
  
  public void setTrackId( int track_id) {
    _track_id = track_id;
  }

  public void setTLength(int tLength) {
    _tLength = tLength;
  }

  public String toString() {
    return _track_id + "  " + _trackTitle + "  " + _tLength;
  }
  
  public String toHTML() {
	  return "<tr><td>" + _track_id + "</td><td>" + _trackTitle + "</td><td>" + _tLength + "</td><td></tr>";
  }
}
