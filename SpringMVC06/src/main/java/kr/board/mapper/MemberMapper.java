package kr.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.board.entity.AuthVO;
import kr.board.entity.Member;

@Mapper  //- MyBatis API
public interface MemberMapper {
	public Member registerCheck(String memID);
	public Member getMember(String memID);
	public int register(Member m);
	public int memUpdate(Member m);
	
	public Member memLogin2(Member mvo);
	public Member memLogin(String username);
	public int memProfileUpdate(Member mvo);
	public void authInsert(AuthVO saveVO); 	
	public int authDelete(String memID);
}
