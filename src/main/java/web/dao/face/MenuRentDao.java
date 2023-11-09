package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface MenuRentDao {

	/**
	 * 
	 * 
	 * @param param
	 * @return
	 */
	public int selectCntAll(Paging param);

	
	/**
	 * 
	 * 
	 * @param paging
	 * @return
	 */
	public List<Board> selectAll(Paging paging);

	/**
	 * 
	 * 
	 * @param board
	 */
	public void updateHit(Board board);

	/**
	 * 
	 * 
	 * @param board
	 * @return
	 */
	public Board selectByBoardNo(Board board);

}
