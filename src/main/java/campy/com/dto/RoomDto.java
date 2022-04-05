package campy.com.dto;

import lombok.Data;

@Data
public class RoomDto {

	private int c_no;
	private int r_no;
	private String theme;
	private int r_maxno;
	private String r_content;
	private String r_photo;
	private int c_price;
}
