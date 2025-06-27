package kr.borgssam.mapper;

import java.util.List;

import kr.borgssam.entity.Board;
import kr.borgssam.entity.Criteria;
import kr.borgssam.entity.Member;

//@Mapper
public interface BoardMapper { //@, XML 
	public List<Board> getList(Criteria cri);
	public int insert(Board vo);
	public int insertSelectKey(Board vo);
	
	public Board read(int idx);
	public int delete(int idx);
	public int update(Board vo);
	
	
	public Member login(Member vo);
	public int replyInsert(Board vo);
	public void replaySeqUpdate(Board parent);
	public int totalCount();

}
