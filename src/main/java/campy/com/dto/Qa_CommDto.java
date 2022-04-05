package campy.com.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Qa_CommDto {

	private int no;
	private Date comm_date;
	private String comm_content;
}
