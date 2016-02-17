
//@author Kaveri Krishnaraj
//Musician model class
public  class Musician {

private String _musician_name;
private String _instrument_name;
private String _DOB;
private int  _join_year;
private String _place;
private String _years;
private String _assoc;
public String getMusicianName(){
	return _musician_name;
}

public void setMusicianName(String musician_name){
	_musician_name = musician_name;
}
public String getPlace(){
        return _place;
}

public void setPlace(String place){
        _place = place;
}
public String getYears(){
        return _years;
}

public void setYears(String years){
        _years = years;
}
public String getAssoc(){
        return _assoc;
}

public void setAssoc(String assoc){
        _assoc = assoc;
}
public String getInstrumentName(){
        return _instrument_name;
}

public void setInstrumentName(String instrument_name){
        _instrument_name = instrument_name;
}

public String getDOB(){
        return _DOB;
}

public void setDOB(String DOB){
        _DOB = DOB;
}

public int getJoinYear(){
        return _join_year;
}

public void setJoinYear(int join_year){
        _join_year = join_year;
}

public Musician (String musician_name, String instrument_name, String DOB, int join_year)
{
        
        _musician_name = musician_name;
        _instrument_name = instrument_name;
	_DOB = DOB;
	_join_year = join_year;
}
public Musician (String musician_name,String DOB,String place, String years, String assoc)
{	        _musician_name = musician_name;
	_place = place;
	_years = years;
	 _assoc = assoc;
       _DOB = DOB;
}
public String MusiciantoHTML() {
          return "<tr><td>" + _musician_name + "</td><td>" + _instrument_name + "</td><td>" + _DOB + "</td><td>" + _join_year + "</td><td></tr>";
  }
}

