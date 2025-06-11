package kr.board.entity;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Data
public class MemberUser extends User {
	
	private Member member;

	// 일반 생성자: 직접 username, password, 권한, Member를 받는 경우
	public MemberUser(String username, String password,
	                  Collection<? extends GrantedAuthority> authorities,
	                  Member member) {
		super(username, password, authorities);
		this.member = member;
	}

	// Member 객체로부터 직접 정보를 추출하여 부모 생성자 호출
	public MemberUser(Member mvo) {
		super(
			mvo.getMemID(),
			mvo.getMemPassword(),
			mvo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList())
		);
		System.out.println("Memberuser:"+mvo);
		this.member = mvo;
	}
}
