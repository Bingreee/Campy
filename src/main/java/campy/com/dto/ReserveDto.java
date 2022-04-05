package campy.com.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveDto {

	private String id;
	private String mem_name;
	private int c_no;
	private int r_no;
	private Date reserve_date;
	private String mem_tel;
	private int c_price;
	private Date start_date;
	private Date end_date;
}
