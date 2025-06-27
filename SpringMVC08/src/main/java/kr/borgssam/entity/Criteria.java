package kr.borgssam.entity;

import lombok.Data;

@Data
public class Criteria {
	private int page; //현재페이지번호
	private int perPageNum; //페이지당 라인수
	public  Criteria() {
		this.page = 1;
		this.perPageNum =10; //조정
	}
	//현재 페이지의 글의 시작번호
	public int getPageStart() {		
		return (page-1)*perPageNum;		
	}
}
