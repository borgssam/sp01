package kr.board.entity;

import lombok.Data;

@Data
public class AuthVO {
	private int no;
	private String memID;
	private String auth; //회원권한 (ROLE_USER, ROLE_MANAGER, ROLE_ADMIN)
}
