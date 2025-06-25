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
		return boardMapper.read(idx);
	}

	@Override
	public int remove(int idx) {
		return boardMapper.delete(idx);
	}

	@Override
	public int modify(Board vo) {
		
		return boardMapper.update(vo);
	}

	@Override
	public Member login(Member vo) {
		// TODO Auto-generated method stub
		Member mvo = boardMapper.login(vo);
		return mvo;
	}

	@Override
	public int replyProcess(Board vo) {
		System.out.println(vo);
		Board parent = boardMapper.read(vo.getIdx());
		vo.setBoard_group(parent.getBoard_group());
		vo.setBoard_sequence(parent.getBoard_sequence()+1);
		vo.setBoard_level(parent.getBoard_level()+1);
		vo.setBoard_available(1);
		boardMapper.replaySeqUpdate(parent);

		System.out.println("-- -- -- -- -- -- -- -- -- -- -- --");
		System.out.println(vo);
		
		int result = boardMapper.replyInsert(vo);
		return result;
	}

}
