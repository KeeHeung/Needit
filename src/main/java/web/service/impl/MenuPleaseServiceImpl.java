package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MenuPleaseDao;
import web.dto.Board;
import web.dto.FileTb;
import web.dto.Like;
import web.service.face.MenuPleaseService;
import web.util.Paging;

@Service
public class MenuPleaseServiceImpl implements MenuPleaseService{
   private final Logger logger = LoggerFactory.getLogger( this.getClass() );

   @Autowired private MenuPleaseDao menuPleaseDao;
   
   @Autowired ServletContext context;
   

   @Override
   public List<Board> list(Paging paging) {
      return menuPleaseDao.selectAll(paging);
   }



   
   
   @Override
   public Paging getPaging(Paging param) {
	   
	   //총 게시글 수 조회
	   int totalCount = menuPleaseDao.selectCntAll(param);
	   
	   //페이징 객체 생성(페이징 계산)
	   Paging paging = new Paging(param.getMenu(), totalCount, param.getCurPage());
	   
	   return paging;
   }





   @Override
   public Board view(Board viewBoard) {
	   
	   //조회수 증가
	   menuPleaseDao.updateHit(viewBoard);
	   
	   return menuPleaseDao.selectByBoardNo(viewBoard);
   }


   
   

   @Override
   public void write(Board writeParam, List<MultipartFile> file) {
	   
	   
	   if( writeParam.getTitle() == null || "".equals(writeParam.getTitle()) ) {
			writeParam.setTitle("(제목없음)");
		}
	   
	   	menuPleaseDao.insert(writeParam);
	   
		//---------------------------------------------------------------------------
	   	
	   	//첨부파일이 없을 경우 처리
	   	if (file.size() == 0) {
			return;
		}
	   
	   	for(MultipartFile f : file) {
			this.fileinsert( f, writeParam.getBoardNo() );
		}
	   
   	}
   
   


   
   

   private void fileinsert(MultipartFile file, int boardNo) {
	
	   //빈 파일 처리
	   if (file.getSize() <= 0) {
		   return;
	   }
	   
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
		fileTb.setBoardNo(boardNo);
		fileTb.setOriginName(originName);
		fileTb.setStoredName(storedName);
		fileTb.setFileType(fileType);
		
		menuPleaseDao.insertFile(fileTb);
		
}


	@Override
	   public List<FileTb> getAttachFile(Board viewBoard) {
	      return menuPleaseDao.selectFileByBoardNo(viewBoard);
	   }
	
	
	
	
	@Override
	public FileTb getFile(FileTb fileTb) {
		return menuPleaseDao.selectFileByFileNo(fileTb);
	}

	
	
	
	
   @Override
   public Board updateSelect(Board updateBoard) {
	   return null;
   }
	
	
	
	
   
	
   @Override
   public void updateBoard(Board updateBoard) {
	   
   }
	
	
	
   
	
	
   @Override
   public void updateFilesave(MultipartFile file, Board updateBoard) {
	   
   }



   @Override
   @Transactional
   public void delete(Board deleteParam) {
	   menuPleaseDao.deleteFileByBoardNo(deleteParam); //첨부파일 삭제 먼저
	   menuPleaseDao.deleteByBoardNo(deleteParam); // 게시글 삭제
   }


	@Override
	public boolean isLike(Like like) {
		return false;
	}
	
	
	
	
	
	@Override
	public Object getTotalCntLike(Like like) {
		return null;
	}





	@Override
	public List<Board> getMenu(Board writeParam) {
		return menuPleaseDao.selectByMenu(writeParam);
	}





		
	
   
   






}