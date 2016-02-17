//@author Kaveri Krishnaraj
//Band model class

public class Band {

private String _name;
private String _homepage;
private String _hometown;
private String _genre;
private int _band_id;
private int _album_count;

public int getBand_id(){
	return _band_id;
}
public void setBand_id(int band_id){
	_band_id = band_id;
}
public int getalbum_count(){
        return _album_count;
}
public void setAlbum_count(int album_count){
        _album_count = album_count;
}

public String  getName(){
	return  _name;
}
public void setName(String name){
        _name = name;
}
public String  getHomepage(){
	return  _homepage;
}
public void setHomepage(String homepage){
        _homepage = homepage;
}
public String  getHometown(){
	return  _hometown;
}
public void setHometown(String hometown){
        _hometown = hometown;
}
public String  getGenre(){
	return  _genre;
}
public void setGenre(String genre){
        _genre = genre;
}

public Band(int id,String name, String hometown, String homepage, String genre)
{
        _band_id = id;
        _name = name;
        _homepage = homepage;
	_hometown = hometown;
	_genre = genre;
}
public Band(String name, String hometown, String homepage, String genre)
{
        //_band_id = id;
        _name = name;
        _homepage = homepage;
        _hometown = hometown;
        _genre = genre;
}

public Band( int album_count){
	_album_count = album_count;	
}

public Band (String genre){
	_genre = genre;
}
 public String toHTML() {
          return "<tr><td>" + _homepage + "</td><td>" + _hometown + "</td><td>" + _genre + "</td><td></tr>";
  }
}
