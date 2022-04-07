package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.MemberDto;

@Mapper
public interface LoginDao {
	
	MemberDto memLogin(MemberDto dto);
	int insertMem(MemberDto dto);
	String idCheck(String id);
}
