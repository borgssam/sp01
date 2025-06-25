package kr.borgssam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.borgssam.entity.Board;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMappterTest {

	@Autowired
	private BoardMapper mapper;
	
	@Test
//	@Rollback(false) // 트랜잭션 커밋 허용
//	@Transactional
	public void testInsert() throws Exception{
		Board vo = new Board();
		vo.setMemId("bit06");
		vo.setTitle("A");
		vo.setContent("AAAA");
		vo.setWriter("관리자1");
		
		
		int result = mapper.insertSelectKey(vo);
		
		System.out.println("------------");
			log.info(vo);
			System.out.println("결과:"+result);
		
		System.out.println("------------");
    Thread.sleep(1000);  // 테스트 종료 전 출력 확인용
	}/*
	public void testGetList1() {
		List<Board> list = mapper.getList();
		
		System.out.println("------------");
		for(Board vo : list) {
			System.out.println(vo);
		}
		System.out.println("------------");
	}*/

}
