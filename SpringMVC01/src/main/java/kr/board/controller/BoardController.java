package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

//알바생
@Controller
public class BoardController {
	@Autowired 
	private BoardMapper mapper;
	
	// boardList.do 
	// HandlerMapping
	@RequestMapping("/boardList.do")	
	public String boardList(Model model) {
		List<Board> list = mapper.getLists();
//		Board vo = new Board();
//		vo.setIdx(0);
//		vo.setTitle("게시판실습");
//		vo.setContent("게시판실습");
//		vo.setWriter("홍길동");
//		vo.setIndate("2025-01-01");
//		vo.setCount(0);
//		List<Board> list = new ArrayList<Board>();
//		list.add(vo);
//		list.add(vo);
//		list.add(vo);
		
		model.addAttribute("list",list);		
		
		return "boardList"; //포워드, 리다이렉트 경로 // WEB-INF/views/
	}
	
	@GetMapping("/boardForm.do")
	public String boardForm(Model model) {
		return "boardForm";
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board vo) { //title, content, writer
		//파라미터수집
		mapper.boardInsert(vo);
		return "redirect:/boardList.do";
	}

	@GetMapping("/boardContent.do")
	public String boardContent(@RequestParam("idx") int idx , Model model) {
		mapper.boardCount(idx);
		Board vo = mapper.boardContent(idx);
		model.addAttribute("vo",vo);
		return "boardContent";
	}
	
	@GetMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable("idx") int idx ) {
		mapper.boardDelete(idx);
		return "redirect:/boardList.do";
	}

	@GetMapping("/boardUpdateForm.do/{idx}")
	public String boardUpdateForm(@PathVariable("idx") int idx , Model model) {
		Board vo = mapper.boardContent(idx);
		model.addAttribute("vo",vo);
		return "boardUpdate";
	}
	
	@PostMapping("/boardUpdate.do")
	public String boardUpdae(Board vo) { //title, content, writer
		//파라미터수집
		mapper.boardUpdate(vo);
		return "redirect:/boardList.do";
	}
}
