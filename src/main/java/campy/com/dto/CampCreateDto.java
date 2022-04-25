package campy.com.dto;

import lombok.Data;

@Data
public class CampCreateDto {
	private int c_no;		
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
	
	
	private int r_no1;
	private String theme1;
	private int r_maxno1;
	private String r_content1;
	//private String r_photo;
	private int c_price1;
	
	private int r_no2;
	private String theme2;
	private int r_maxno2;
	private String r_content2;
	//private String r_photo;
	private int c_price2;
	
	private int r_no3;
	private String theme3;
	private int r_maxno3;
	private String r_content3;
	//private String r_photo;
	private int c_price3;
}
