package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@RestController
public class BoardRestController {

	@Autowired
	BoardMapper boardMapper;
	
	@RequestMapping("/boardList.do")
	public @ResponseBody List<Board> boardList(){ //jackson-databind(객체를 ->json형식으로 변환시켜줌)
		List<Board> list = boardMapper.getLists();		
		return list; //JSON형식으로 리턴한다는 의미임
	}

	@RequestMapping("/boardInsert.do")
	public @ResponseBody int boardInsert(Board vo){ 	
		try {
			System.out.println("-----------:"+vo);
		
			boardMapper.boardInsert(vo);
			return 1;
		} catch(Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}
	@RequestMapping("/boardDelete.do")
	public @ResponseBody int boardDelete(@RequestParam("idx") int idx){ 	
		try {
			boardMapper.boardDelete(idx);
			return 1;
		} catch(Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}
	@RequestMapping("/boardUpdate.do")
	public @ResponseBody int boardUpdate(Board vo){ 	
		try {
			boardMapper.boardUpdate(vo);
			return 1;
		} catch(Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}
	
	@RequestMapping("/boardContent.do")
	public @ResponseBody Board boardContent(@RequestParam("idx") int idx){ 	
		try {
			//System.out.println(idx);
			Board vo = boardMapper.boardContent(idx);
			//System.out.println(vo);
			return vo;
		} catch(Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}
	
	@RequestMapping("/boardCount.do")
	public @ResponseBody Board boardCount(@RequestParam("idx") int idx){ 	
		try {
			//System.out.println(idx);
			boardMapper.boardCount(idx);
			Board vo = boardMapper.boardContent(idx);
			//System.out.println(vo);
			return vo;
		} catch(Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}
}
