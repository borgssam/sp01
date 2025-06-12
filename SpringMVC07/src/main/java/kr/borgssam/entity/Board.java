package kr.borgssam.entity;

import lombok.Data;

@Data
public class Board {
	private int idx;
	private String title;
	private String content;
	private String writer;
	private int indate;
	private int count;
	private String memID;
}
