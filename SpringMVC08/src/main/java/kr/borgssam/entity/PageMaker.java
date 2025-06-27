package kr.borgssam.entity;

import lombok.Data;

//페이징처리를 만드는 클래스(vo)
@Data
public class PageMaker {
	private Criteria cri;
	private int totalCount;  //총게시글의 수
	private int startPage;   //페이지바에서 시작 페이지번호
	private int endPage;     //페이지바에서 마지막 페이지번호
	private boolean prev;    //페이지바에서 이전페이지 버튼 존재여부
	private boolean next;    //페이지바에서 다음페이지 버튼 존재여부
	private int displayPageNum = 10; //페이지바의 크기
	
	public PageMaker() {}
	
	//총게시글의 수를 구하는 메서드
	public void setTotalCount(int totalCnt) {
		this.totalCount = totalCnt;
		makePaging();
	}

	private void makePaging() {
		//1.화면에 보여질 마지막페이지번호
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		//2.화면에 보여질 시작 페이지번호
		startPage = endPage - displayPageNum + 1;
		if(startPage <= 0) startPage = 1;
		
		//3.전체마지막페이지
		int totalPage = (int) ( Math.ceil( totalCount / (double)cri.getPerPageNum()) );

		//4.마지박페이지 유효성 검증
		if(endPage > totalPage) { endPage = totalPage;}
		
		//이전버튼
		prev = (startPage == 1)? false:true;
		
		//다음버튼
		next = (endPage >= totalPage)? false:true;


		
	}
}
