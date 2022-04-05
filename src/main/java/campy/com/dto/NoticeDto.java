package campy.com.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {

	private int number;
	private String title;
	private String id;
	private Date date;
	private String content;
	private String file;
	
}
