package kr.borgssam.service;

import java.util.List;

import kr.borgssam.entity.Board;
import kr.borgssam.entity.Criteria;
import kr.borgssam.entity.Member;

public interface BoardService {
	public List<Board> getList(Criteria cri);
	public int register(Board vo);
	public Board get(int idx);
	public int remove(int idx);
	public int modify(Board vo);
	
	public Member login(Member vo);
	public int replyProcess(Board vo);
	public int totalCount();
	

}
