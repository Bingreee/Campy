package campy.com.dto;

import java.util.List;

import lombok.Data;

@Data
public class RoomListDto {
	private CampCreateDto cdto;
	private List<RoomDto> rListDto;
	
}
