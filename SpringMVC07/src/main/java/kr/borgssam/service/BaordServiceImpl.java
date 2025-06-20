package kr.borgssam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.borgssam.entity.Board;
import kr.borgssam.entity.Member;
import kr.borgssam.mapper.BoardMapper;

@Service
public class BaordServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<Board> getList() {
		// TODO Auto-generated method stub
		List<Board> list = boardMapper.getList(); 
		return list;
	}

	@Override
	public int register(Board vo) {
		// TODO Auto-generated method stub
		//public int register(Board vo);
		return boardMapper.insertSelectKey(vo);		
	}

	@Override
	public Board get(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int remove(int idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify(Board vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member login(Member vo) {
		// TODO Auto-generated method stub
		Member mvo = boardMapper.login(vo);
		return mvo;
	}
	

}
