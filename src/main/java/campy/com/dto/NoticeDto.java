package campy.com.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {

	private int not_no;
	private String not_title;
	private String id;
	private Date not_date;
	private String not_content;
	
	
}
