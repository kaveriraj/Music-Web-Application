public  class Live {

private String _place_name;
private String _venue;
private String _live_date;
private int _phone;
public String getPlaceName(){
	return _place_name;
}

public void setPlaceName(String place_name){
	_place_name = place_name;
}

public String getVenue(){
        return _venue;
}

public void setVenue(String venue){
        _venue = venue;
}

public String getLiveDate(){
        return _live_date;
}

public void setLiveDate(String live_date){
        _live_date = live_date;
}
public void setPhone(int phone)
{
    _phone = phone;
}
public int  getPhone()
{
return  _phone;
}
public Live( String place_name, String venue, String live_date,int phone)
{
        
        _place_name = place_name;
        _venue = venue;
	_live_date = live_date;
	_phone = phone;
}

public String LivetoHTML() {
          return "<tr><td>" + _place_name + "</td><td>" + _venue + "</td><td>" + _live_date + "</td><td>" +_phone+ "</td></tr>";
  }
}

