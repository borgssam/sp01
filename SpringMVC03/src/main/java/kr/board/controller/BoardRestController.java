package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@RequestMapping("/board")
@RestController //ajax용 @ResponseBody생략가능
public class BoardRestController {

	@Autowired
	BoardMapper boardMapper;
	
	@GetMapping("/all")
	public List<Board> boardList(){ //jackson-databind(객체를 ->json형식으로 변환시켜줌)
		List<Board> list = boardMapper.getLists();		
		return list; //JSON형식으로 리턴한다는 의미임
	}

//	@RequestMapping("/boardInsert.do")
	@PostMapping("/new")
	public int boardInsert(Board vo){ 	
		try {
			System.out.println("-----------:"+vo);
		
			boardMapper.boardInsert(vo);
			return 1;
		} catch(Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}
	@DeleteMapping("/{idx}")
	public int boardDelete(@PathVariable("idx") int idx){ 	
		try {
			boardMapper.boardDelete(idx);
			return 1;
		} catch(Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}
	@PutMapping("/update")
	public int boardUpdate(@RequestBody Board vo){ 	
		System.out.println("--update--:"+vo);
		try {
			boardMapper.boardUpdate(vo);
			return 1;
		} catch(Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}
	
	@GetMapping("/{idx}")
	public Board boardContent(@PathVariable("idx") int idx){ 	
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
	
	@PutMapping("/count/{idx}")
	public Board boardCount(@PathVariable("idx") int idx){ 	
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
