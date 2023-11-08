package web.service.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface MenuRentService {
	
	public Paging getPaging(Paging param);

	public List<Board> list(Board board);

	public Board view(Board board);

}
