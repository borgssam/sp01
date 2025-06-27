package kr.borgssam.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.borgssam.entity.Board;
import kr.borgssam.service.BoardService;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {

	@Autowired
	private BoardService bsrv;
	
	@Test
	public void testGetList() {
		List<Board> list = bsrv.getList();
		
		System.out.println("------------");
	/*	for(Board vo : list) {
			System.out.println(vo);
		}*/
		bsrv.getList().forEach(vo->System.out.println(vo));
		System.out.println("------------");

	}
}
