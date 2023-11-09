package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MenuShareDao;
import web.dto.Board;
import web.dto.FileTb;
import web.service.face.MenuShareFace;
import web.util.Paging;

@Service
public class MenuShareServiceImpl implements MenuShareFace{
	
	//로그 객체 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MenuShareDao menuShareDao;
	@Autowired ServletContext context;
	
	@Override
	public Paging getPaging(Paging param) {
		
		int totalCount = menuShareDao.selectCntAll(param);
		
		Paging paging = new Paging(param.getMenu(),totalCount, param.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Board> selectBoardStatus(Paging paging, Board board) {
		
		return menuShareDao.selectAll(paging);
	}

	@Override
	public Board view(Board board) {
		
		Board res = menuShareDao.selectByBoardNo(board);
		
		if(board.getHit() != -1 ) {
			menuShareDao.updateHit(res.getBoardNo());
			
		}
		return menuShareDao.selectByBoardNo(board);
	}

	@Override
	public void write(Board writerContent, List<MultipartFile> upFile) {
		
		if( writerContent.getTitle() == null || "".equals(writerContent.getTitle())) {
			writerContent.setTitle("(제목없음)");
		}
		
		//글작성 
		menuShareDao.insertBoard(writerContent);
		
		//첨부파일이 없을 경우 처리
		if( upFile.size() == 0 ) {
			return;
		}

		for(MultipartFile f : upFile) {
			this.fileinsert( f, writerContent.getBoardNo() );
		}

	}
	
	private void fileinsert( MultipartFile file, int boardNo ) {
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			return;
		}
		logger.info("boardNo{}",boardNo);
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		//upload 폴더 생성
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		
		//저장될 파일 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		String fileType = originName.substring(originName.lastIndexOf(".")+ 1);
		
		//저장할 파일 객체
		File dest = new File(storedFolder, storedName);
	
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------------------------------

		FileTb fileTb = new FileTb();
		fileTb.setBoardNo( boardNo );
		fileTb.setOriginName( originName );
		fileTb.setStoredName( storedName );
		fileTb.setFileType(fileType);
		
		menuShareDao.insertFile( fileTb );

	}
	
	@Override
	public List<Board> menu(Board writerContent) {
		
		return menuShareDao.selectByMenu(writerContent);
		
	}
	
	@Override
	public List<FileTb> getImg(FileTb file) {
		
		return menuShareDao.selectFileImg(file);
	}
	

	@Override
	public List<FileTb> getAttachFile(Board updateParam) {
		
		return null;
	}

	

	

	
}
