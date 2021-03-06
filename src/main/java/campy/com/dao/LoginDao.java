package campy.com.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.MemberDto;

@Mapper
public interface LoginDao {
	
	MemberDto memLogin(MemberDto dto);
	int insertMem(MemberDto dto);
	String idCheck(String id);
	String findId(Map<String, Object> map);
	int updatePw(Map<String, String> map);
	MemberDto loginById(String id);
}
