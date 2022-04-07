package campy.com.dto;

import lombok.Data;

@Data
public class EmailDto {
	private String subject;
	private String content;
	private String date;
	private String receiver;
}
