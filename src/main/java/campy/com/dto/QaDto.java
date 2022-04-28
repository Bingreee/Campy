package campy.com.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QaDto {

	private int qa_no;
	private String qa_title;
	private String id;
	private Date qa_date;
	private String qa_content;
	
}
