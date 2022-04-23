package campy.com.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CampAndReserveDto {

	private int c_no;
	private String c_name;
	private String c_address;
	private int maxno;
	private long rate;
	private int c_price;
	private String place;
	private String c_photo;
	private String c_tel;
	private char swim;
	private char pick;
	private char elec;
	private char wifi;
	private char snack;
	private char pet;
	
	private String id;
	private String mem_name;
	//private int c_no;
	private int r_no;
	
	//@DateTimeFormat(pattern = "yyyymmdd")
	private Date reserve_date;
	private String mem_tel;
	//private int c_price;
	
	//@DateTimeFormat(pattern = "yyyymmdd")
	private Date start_date;
	
	//@DateTimeFormat(pattern = "yyyymmdd")
	private Date end_date;
	private int reserve_no;
	private Date end_date2;
}
