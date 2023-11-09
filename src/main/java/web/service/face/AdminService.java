package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Banner;

public interface AdminService {

	/**
	 * 배너사진 파일을 업로드한다
	 * 
	 * @param bannerParam - 파일 테이블 정보 객체
	 * @param file - 첨부 파일 리스트
	 */
	public void bannerUpdate(Banner bannerParam, List<MultipartFile> file);

}
