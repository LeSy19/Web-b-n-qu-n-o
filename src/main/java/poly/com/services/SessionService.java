package poly.com.services;

public interface SessionService {
	public Object get(String key, String string); //Get theo key trả về type
	public void set(String key, Object value); //set key là string, type tùy ý
	Object get(String key);
	
}	
