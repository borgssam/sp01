package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;

@Mapper  //- MyBatis API
public interface BoardMapper {

    
	public List<Board> getLists(); //전체리스트	
	public void boardInsert(Board vo);
	public Board boardContent(int idx);
	public int boardDelete(int idx);
	public void boardUpdate(Board vo); 
	
	@Update("update myboard set count = count+1 where idx=#{idx}")
    public void boardCount(@Param("idx") int idx);  // 조회수 증가
}
