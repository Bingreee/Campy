package campy.com.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Qa_CommDto {

	private int qa_no;
	private Date qa_comm_date;
	private String qa_comm_content;
}
