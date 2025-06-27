package kr.borgssam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.borgssam.entity.Member;
import kr.borgssam.service.BoardService;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/loginProcess")	
	public String login(Member vo, HttpSession session) {
    System.out.println("ID: " + vo.getMemId());
    System.out.println("PWD: " + vo.getMemPwd());
		Member mvo = boardService.login(vo);
		if(mvo != null) {
			//로그인성공
			session.setAttribute("mvo", mvo);
			System.out.println("로그인성공");
		} else {
			System.out.println("로그인실패");
		}
		return "redirect:/board/list";
	}
	
	@RequestMapping("/logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/list";
	}

}
