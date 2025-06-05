package kr.board.entity;

import lombok.Data;

//Lombok API
@Data
public class Board {
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private String memID;
	private int count;

}
