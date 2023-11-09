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
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.AdminDao;
import web.dto.Banner;
import web.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired AdminDao adminDao;
	@Autowired ServletContext context;
	
	@Override
	public void bannerUpdate(Banner bannerParam, List<MultipartFile> file) {

//		adminDao.insert(bannerParam);
		
		if( file.size() == 0 ) {
			return;
		}
		
		for(MultipartFile f : file) {
			this.fileinsert( f, bannerParam.getBannerNo() );
		}
	} //bannerUpdate end

	private void fileinsert(MultipartFile file, int bannerNo) {
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("resources/banner");
		logger.info(storedPath);
		//upload 폴더 생성
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		//저장될 파일 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		String fileType = originName.substring(originName.lastIndexOf(".") + 1);
		
		//확장자명 가져오는 코드
//		file.getContentType();
		
		//저장할 파일 객체
		File dest = new File(storedFolder, storedName);
	
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Banner banner = new Banner();
		banner.setBannerNo(bannerNo);
		banner.setOriginName(originName);
		banner.setStoredName(storedName);
		banner.setFileType(fileType);
		
		adminDao.insertBanner(banner);
				
	} //fileinsert end

	
	

}
