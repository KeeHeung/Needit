package web.service.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface MenuRentService {
	
	/**
	 * 
	 * 
	 * @param param
	 * @return
	 */
	public Paging getPaging(Paging param);

	/**
	 * 
	 * 
	 * @param paging
	 * @return
	 */
	public List<Board> list(Paging paging);

	/**
	 * 
	 * 
	 * @param board
	 * @return
	 */
	public Board view(Board board);

}
