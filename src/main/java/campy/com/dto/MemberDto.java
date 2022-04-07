package campy.com.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class MemberDto {
	
	@NotNull(message="id is null.")
	@NotEmpty(message="id is empty.")
	private String id;
	@NotNull(message="pw is null.")
	@NotEmpty(message="pw is empty.")
	private String pw;
	private String mem_name;
	private String mem_address;
	private String mem_tel;
}
