package web.dao.face;

import web.dto.Banner;

public interface AdminDao {

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param bannerParam - 삽입하 게시글 정보
	 */
	public void insert(Banner bannerParam);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param banner - 삽입할 첨부파일 정보
	 */
	public void insertBanner(Banner banner);

	
	
}
