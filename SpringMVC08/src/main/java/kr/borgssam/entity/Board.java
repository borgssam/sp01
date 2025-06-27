package kr.borgssam.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int idx;                //번호
	private String memId;						//회원아이디
	private String title;						//제목
	private String content;					//내용
	private String writer;					//작성자
	private Date indate;					//작성일
	private int count;							//조회수
	private int board_group;				//부모글 답글그룹
	private int board_sequence;			//답글 순서
	private int board_level;				//답글 들여쓰기
	private int board_available;		//삭제된글표시
}
