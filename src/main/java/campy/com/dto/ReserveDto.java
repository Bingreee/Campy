package campy.com.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date start_date;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date end_date;
}
