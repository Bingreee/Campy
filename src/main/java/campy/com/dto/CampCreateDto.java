package campy.com.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class CampCreateDto implements Serializable{
	private int c_no;		
	private int r_no;		
	private String c_name;	
	private String c_address;	
	private int maxno;		
	//private long rate;		
	//private int c_price;		
	private String place;	
	//private String c_photo;
	private String c_tel;		
	private char swim;		
	private char pick;		
	private char elec;		
	private char wifi;		
	private char snack;		
	private char pet;	
	
	

}
