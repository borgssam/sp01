package kr.board.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.board.entity.AuthVO;
import kr.board.entity.Member;
import kr.board.entity.MemberUser;
import kr.board.mapper.MemberMapper;
import kr.board.security.MemberUserDetailsService;

@Controller
public class MemberController {
	@Autowired
	MemberMapper memberMapper;

	@Autowired
	MemberUserDetailsService memberUserDetailsService;
	
	@Autowired
	PasswordEncoder pwEncoder;

	@RequestMapping("/memJoin.do")
	public String memJoin() {
		return "member/join";
	}

	@GetMapping("/memRegisterCheck.do")   
	public @ResponseBody int memRegisterCheck(@RequestParam("memID") String memID)
	{		
		Member m = memberMapper.registerCheck(memID);
		System.out.println("-----"+m);
		if(m != null || memID.equals("")) {
			return 0;
		} else {
			return 1;
		}		
	}

	@PostMapping("/memUpdate.do")   
	public String memUpdate(Member m, RedirectAttributes rttr, HttpSession session)
	{		
		if(
			m.getMemID() == null || m.getMemID().equals("") ||	
			m.getMemPassword() == null || m.getMemPassword().equals("") ||	
			m.getMemName() == null || m.getMemName().equals("") ||	
			m.getMemAge() == 0 || m.getMemAge().equals("") ||
			m.getAuthList() == null ||	m.getAuthList().size()==0||
			m.getMemGender() == null || m.getMemGender().equals("") ||	
			m.getMemEmail() == null || m.getMemEmail().equals("") 				
		) {
			//메시지 포함해서 리다이렉트
			rttr.addFlashAttribute("msgType","실패메시지");
			rttr.addFlashAttribute("msg","모든 내용을 입력하세요");
			
			return "redirect:/memUpdateForm.do";			
		} else {
			
		}
		
		//회원수정하기
		String encyptPwd = this.pwEncoder.encode(m.getMemPassword());
		m.setMemPassword(encyptPwd);	
		int result = memberMapper.memUpdate(m);
		System.out.println("-----"+m);
		
		memberMapper.authDelete(m.getMemID());	
		List<AuthVO> list = m.getAuthList();			
		for(AuthVO vo :list) {
			System.out.println("AuthVO:"+vo);
			if(vo.getAuth() != null) {
				AuthVO saveVO = new AuthVO();
				saveVO.setMemID(m.getMemID());
				saveVO.setAuth(vo.getAuth());
				memberMapper.authInsert(saveVO);					
			}				
		}
		
		if(result == 1) {
			//성공
			rttr.addFlashAttribute("msgType","수전성공");
			rttr.addFlashAttribute("msg","회원수정 성공");
			Member mvo = memberMapper.getMember(m.getMemID());
			//Member mvo = memberMapper.memLogin(m);//
			session.setAttribute("mvo", mvo);
			return "redirect:/";
		} else {
			//실패
			rttr.addFlashAttribute("msgType","실패메시지");
			rttr.addFlashAttribute("msg","회원수정 실패");
			return "redirect:/memUpdateForm.do";
		}		
	}
	
	
	@PostMapping("/memRegister.do")   
	public String memRegister(Member m, RedirectAttributes rttr, HttpSession session)
	{		
		if(  
			m.getMemID() == null || m.getMemID().equals("") ||	
			m.getMemPassword() == null || m.getMemPassword().equals("") ||	
			m.getMemName() == null || m.getMemName().equals("") ||	
			m.getMemAge() == 0 || m.getMemAge().equals("") ||
			m.getAuthList().size() == 0 ||
			m.getMemGender() == null || m.getMemGender().equals("") ||	
			m.getMemEmail() == null || m.getMemEmail().equals("") 				
		) {
			//메시지 포함해서 리다이렉트
			rttr.addFlashAttribute("msgType","실패메시지");
			rttr.addFlashAttribute("msg","모든 내용을 입력하세요");
			
			return "redirect:/memJoin.do";			
		} else {
			
		}
		
		m.setMemProfile("");
		//회원을 테이블에 저장하기
		//추가: 비밀번호를 암호화 하기
		String encyptPwd = pwEncoder.encode(m.getMemPassword());
		m.setMemPassword(encyptPwd);
		
		int result = memberMapper.register(m);
		System.out.println("-----"+m);
		if(result == 1) {
			//권한 테이블에 회원의 권한을 저장하기
			List<AuthVO> list = m.getAuthList();			
			for(AuthVO vo :list) {
				System.out.println("AuthVO:"+vo);
				if(vo.getAuth() != null) {
					AuthVO saveVO = new AuthVO();
					saveVO.setMemID(m.getMemID());
					saveVO.setAuth(vo.getAuth());
					memberMapper.authInsert(saveVO);					
				}				
			}
			//성공
			rttr.addFlashAttribute("msgType","저장성공");
			rttr.addFlashAttribute("msg","회원가입 성공");
			Member mvo = memberMapper.getMember(m.getMemID());
			session.setAttribute("mvo", mvo);
			System.out.println("새사람:"+mvo);
			return "redirect:/";
		} else {
			//실패
			rttr.addFlashAttribute("msgType","실패메시지");
			rttr.addFlashAttribute("msg","회원가입 실패");
			return "redirect:/memJoin.do";
		}		
	}
/*
	@RequestMapping("/memLogin.do")   
	public String memLogin(Member m, RedirectAttributes rttr, HttpSession session)
	{
		System.out.println("memLogin -------------");
		
		if(m.getMemID() == null || m.getMemID().equals("")) {
			rttr.addFlashAttribute("msgType","실패메시지");
			rttr.addFlashAttribute("msg","모든내용일 입력해주세요.");
			return "redirect:/memLoginForm.do";			
		}
				
		Member mvo = memberMapper.getMember(m.getMemID());	
		if(mvo != null && pwEncoder.matches(m.getMemPassword(),  mvo.getMemPassword())) {
			rttr.addFlashAttribute("msgType","성공메시지");
			rttr.addFlashAttribute("msg","로그인성공.");
			session.setAttribute("mvo", mvo);
			System.out.println("비번일치");
		} else {
			System.out.println("비번불일치");
			rttr.addFlashAttribute("msgType","실패메시지");
			rttr.addFlashAttribute("msg","로그인실패.");
			return "redirect:/memLoginForm.do";	
		}
		
		return "redirect:/";
	}
*/
	@RequestMapping("/memLogout.do")   
	public String memLogout(HttpSession session)
	{	
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/memLoginForm.do")   
	public String memLoginForm()
	{	
		return "/member/memLoginForm";
	}

	@RequestMapping("/memUpdateForm.do")   
	public String memUpdateForm()
	{	
		return "/member/memUpdateForm";
	}
	
	@RequestMapping("/memImageForm.do")   
	public String memImageForm()
	{	
		return "/member/memImageForm";
	}

	@RequestMapping("/memImageUpdate.do")   
	public String memImageUpdate(HttpServletRequest request,HttpSession session,  RedirectAttributes rttr)
	{	
		//파일업로드 API
		MultipartRequest multi = null;
		//
		int fileMaxSize = 1000* 1024 * 1024;
		String savePath = request.getRealPath("/resources/upload");
		System.out.println("SAVE_PATH:"+savePath);
		try {
			//업로드 시작
			multi = new MultipartRequest(request,savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy() );

			//업로드 후
			String memID = multi.getParameter("memID"); // ✅ 이렇게 수정해야 함!
			String fileName="";
			File file = multi.getFile("memProfile");
			if(file != null) { 
				//업로드 되어 있으면
				//이미지파일이 아니면 삭제
				String ext=file.getName().substring(file.getName().lastIndexOf(".")+1);
				ext = ext.toUpperCase();
				if(ext.equals("PNG") || ext.equals("GIF") || ext.equals("JPG")) {
					//old이미지, new이미지
					System.out.println("여기요 1"+memID+"ss");
					String oldProfile = memberMapper.registerCheck(memID).getMemProfile();
					if(oldProfile != null) {
						File oldFile = new File(savePath+"/"+oldProfile);
						if(oldFile.exists()) {oldFile.delete();}	
					}
					String newProfile = file.getName();
					Member mvo = new Member();
					mvo.setMemID(memID);
					mvo.setMemProfile(newProfile);
					memberMapper.memProfileUpdate(mvo);
					
					
					//memberMapper.
//					rttr.addFlashAttribute("msgType","성공메시지");
//					rttr.addFlashAttribute("msg","프로파일을 성공적으로 업로드했습니다.");
//					
//					Member m = memberMapper.getMember(memID);
//					session.setAttribute("mvo", m);
					

					// 스프링보안(새로운 인증 세션을 생성->객체바인딩)
					Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
					MemberUser userAccount = (MemberUser) authentication.getPrincipal();
					SecurityContextHolder.getContext().setAuthentication(createNewAuthentication(authentication,userAccount.getMember().getMemID()));
							
					rttr.addFlashAttribute("msgType", "성공 메세지");
					rttr.addFlashAttribute("msg", "이미지 변경이 성공했습니다.");	
					return "redirect:/";
					
				} else {
					if(file.exists()) {
						file.delete();
					}
					rttr.addFlashAttribute("msgType","실패메시지");
					rttr.addFlashAttribute("msg","이미지(png,gif,jpg) 파일이 아닙니다.");
					return "redirect:/memImageForm.do";	
				}
			}
			
			
			
		} catch(Exception e) {
			System.out.println("파일업로드 실패");
			e.printStackTrace();
			rttr.addFlashAttribute("msgType","실패메시지");
			rttr.addFlashAttribute("msg","파일의 크기는 10MB를 넘을 수 없습니다."+e.getMessage());
			return "redirect:/memImageForm.do";	
		}
		
		return "redirect:/";
		
	}

	 // 스프링 보안(새로운 세션 생성 메서드)
	 // UsernamePasswordAuthenticationToken -> 회원정보+권한정보
	 protected Authentication createNewAuthentication(Authentication currentAuth, String username) {
		    UserDetails newPrincipal = memberUserDetailsService.loadUserByUsername(username);
		    UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
		    newAuth.setDetails(currentAuth.getDetails());	    
		    return newAuth;
	 }
	 
	@RequestMapping("/access-denied")   
	public String showAccessDenied()
	{	
		return "/access-denied";
	}
	
}
