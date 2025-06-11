package kr.board.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.board.entity.Member;
import kr.board.entity.MemberUser;
import kr.board.mapper.MemberMapper;

public class MemberUserDetailsService implements UserDetailsService {
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("로그인 요청이 들어오면 실행--------"+username);
		// TODO Auto-generated method stub
		Member mvo = mapper.memLogin(username);

		System.out.println("mvo--------"+mvo);
		if(mvo != null) {
			return new MemberUser(mvo);
			
		} else {
			throw new UsernameNotFoundException("user with username"+username+"does not exist.");
			
		}
	}

}
