package campy.com.dto;

import java.util.Date;

import lombok.Data;
@Data
public class ReserveAndReviewDto {

	private String id;
	private String mem_name;
	private int c_no;
	private int r_no;
	private Date reserve_date;
	private String mem_tel;
	private int c_price;
	private String start_date;
	private String end_date;
	private int reserve_no;
	
	private int rv_no;
	private String rv_title;
	//private String id;
	private String rv_date;
	private String rv_content;
	//private int c_no;
	private double rate;
	private String rv_photo;
}
