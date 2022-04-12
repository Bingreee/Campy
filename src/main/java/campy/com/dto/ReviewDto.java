package campy.com.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDto {

	private int rv_no;
	private String rv_title;
	private String id;
	private String rv_date;
	private String rv_content;
	private int c_no;
	private long rate;
}
