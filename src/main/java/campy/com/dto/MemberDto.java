package campy.com.dto;

import lombok.Data;

@Data
public class MemberDto {
	private String id;
	private String pw;
	private String mem_name;
	private String roadAddress;
	private String mem_tel;
	private String postcode;
	private String detailAddress;
}
