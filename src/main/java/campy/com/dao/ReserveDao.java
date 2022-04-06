package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.ReserveDto;

@Mapper
public interface ReserveDao {

	ReserveDto reserveStatus();
	int deleteReserve(ReserveDto dto);
}
