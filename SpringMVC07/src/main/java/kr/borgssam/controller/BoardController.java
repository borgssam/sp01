package kr.borgssam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.borgssam.entity.Board;
import kr.borgssam.service.BoardService;

@Controller //POJO
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String getList(Model model) {
		List<Board> list = boardService.getList();
		model.addAttribute("list",list);
		
		return "board/list";		
	}
	
	@GetMapping("/register")
	public String register(){
		return "board/register";
	}
	
	@PostMapping("/register")
	public String registerBoard(@ModelAttribute Board vo, RedirectAttributes rttr) {
		int result = boardService.register(vo);
		if(result != 1) {
			return "board/register";			
		}
		rttr.addFlashAttribute("result", vo.getIdx());
		return "redirect:/board/list";		
	}
	
	


}
