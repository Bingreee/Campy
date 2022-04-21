package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.MemberDto;

@Mapper
public interface MypageDao {

	int updateMem(MemberDto dto);

	int deleteMem(int id);

	MemberDto memberOne(int id);

	
}
