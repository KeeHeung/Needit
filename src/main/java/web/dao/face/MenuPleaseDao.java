package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.dto.FileTb;
import web.util.Paging;

public interface MenuPleaseDao {

	
	/**
	 * 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 게시글 목록
	 */
	public List<Board> selectAll(Paging paging);

	
	/**
	 * 전체 게시글 수를 조회한다
	 * @param param 
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging param);

	
	/**
	 * 조회하려는 게시글의 조회수를 1증가 시킨다
	 * 
	 * @param viewBoard - 게시글 번호 객체
	 */
	public void updateHit(Board viewBoard);

	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다 
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호 객체
	 * @return 조회된 게시글 정보
	 */
	public Board selectByBoardNo(Board viewBoard);


	/**
	 * 
	 * @param writeParam
	 */
	public void insert(Board writeParam);


	/**
	 * 
	 * @param fileTb
	 */
	public void insertFile(FileTb fileTb);

	
	/**
	 * 
	 * @param viewBoard
	 * @return
	 */
	public List<FileTb> selectFileByBoardNo(Board viewBoard);


	/**
	 * 
	 * @param fileTb
	 * @return
	 */
	public FileTb selectFileByFileNo(FileTb fileTb);


	/**
	 * 게시글 번호를 이용하여 첨부파일 삭제
	 * 
	 * @param deleteParam - 삭제하려는 게시글 번호
	 */
	public void deleteFileByBoardNo(Board deleteParam);


	/**
	 * 리스트에서 게시글의 게시글 삭제
	 * 
	 * @param deleteParam - 삭제하려는 게시글 번호
	 */
	public void deleteByBoardNo(Board deleteParam);


	/**
	 * 메뉴찾기
	 * 
	 * @param writeParam
	 * @return
	 */
	public List<Board> selectByMenu(Board writeParam);


	
	
	
	
	
	
	
	

}
