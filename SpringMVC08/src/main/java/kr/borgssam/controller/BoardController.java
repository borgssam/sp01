package kr.borgssam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.borgssam.entity.Board;
import kr.borgssam.entity.Criteria;
import kr.borgssam.entity.PageMaker;
import kr.borgssam.service.BoardService;

@Controller //POJO
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String getList(Criteria cri, Model model) {
		List<Board> list = boardService.getList(cri);
		model.addAttribute("list",list);
		
		//페이징처리에 필요한 부분
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int cnt = boardService.totalCount();
		pageMaker.setTotalCount(cnt);//전체페이지의 수
		
		model.addAttribute("pageMaker", pageMaker);		
		
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
		rttr.addFlashAttribute("result", vo.getIdx()); //${result}
		return "redirect:/board/list";		
	}

	@GetMapping("/get")
	public String get(@RequestParam("idx") int idx, Model model){
		Board vo = boardService.get(idx);
		model.addAttribute("vo",vo);
		return "board/get";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model model){
		Board vo = boardService.get(idx);
		model.addAttribute("vo",vo);
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String modifyPost(@ModelAttribute Board vo, Model model){
		int result = boardService.modify(vo);
		//model.addAttribute("vo",mvo);
		return "redirect:/board/list";
	}


	@GetMapping("/remove")
	public String remove(@RequestParam("idx") int idx, Model model){
		int result = boardService.remove(idx);
		//model.addAttribute("vo",vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/reply")
	public String reply(@RequestParam("idx") int idx, Model model){
		Board vo = boardService.get(idx);
		model.addAttribute("vo",vo);
		return "/board/reply";
	}
	
	@PostMapping("/reply")
	public String replyPost(@ModelAttribute Board vo, Model model){
		int result = boardService.replyProcess(vo);
		//model.addAttribute("vo",mvo);
		return "redirect:/board/list";
	}
}
