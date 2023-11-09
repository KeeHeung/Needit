package web.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MenuRentDao;
import web.dto.Board;
import web.service.face.MenuRentService;
import web.util.Paging;

@Service
public class MenuRentServiceImpl implements MenuRentService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MenuRentDao menuRentDao;

	@Override
	public List<Board> list(Paging paging) {
		logger.info("MenuRentServiceImpl list() 호출");
		return menuRentDao.selectAll(paging);
	}

	@Override
	public Paging getPaging(Paging param) {
		
		//총 게시글 수 조회
		int totalCount = menuRentDao.selectCntAll(param);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging( param.getMenu(), totalCount, param.getCurPage() );
		
		return paging;
	}

	@Override
	public Board view(Board board) {
		
		//update 일 때에는 조회수가 증가되지 않는다
		if( board.getHit() != -1 ) {
			//조회수 증가
			menuRentDao.updateHit(board);
		}
		
		return menuRentDao.selectByBoardNo(board);
	}



}
