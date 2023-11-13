package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
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
	 * 파일 업로드
	 * 
	 * @param boardfile
	 */
	public void insertFile(FileTb boardfile);

	
	/**
	 * 
	 * @param viewBoard
	 * @return
	 */
	public List<FileTb> selectFileByBoardNo(Board viewBoard);


	/**
	 * 
	 * @param boardfile
	 * @return
	 */
	public FileTb selectFileByFileNo(FileTb boardfile);

	/**
	 * 게시글 내용을 수정한다
	 * 제목, 본문을 주어진 게시글 번호를 이용하여 수정한다
	 * 
	 * @param updateParam - 수정할 내용이 담긴 객체
	 */
	public void update(Board updateParam);
	

	/**
	 * 기존의 첨부파일을 삭제한다
	 * 
	 * @param delFileno - 삭제하려는 파일 번호들
	 */
	public void deleteFiles(int[] delFileno);
	
	
	
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
	 * 사용자가 해당 게시글을 추천한 적이 있는지 조회
	 * 
	 * @param like - 사용자와 게시글 정보를 가지고 있는 객체
	 * @return 1 - 추천한 적 있음, 0 - 추천한 적 없음
	 */
	public int selectCntLike(Like like);
	
	/**
	 * 추천상태 넣기
	 * 
	 * @param like - 추천 정보 객체
	 */
	public void insertLike(Like like);
	
	/**
	 * 추천상태 지우기
	 * 
	 * @param like - 추천 정보 객체
	 */
	public void deleteLike(Like like);
	
	
	/**
	 * 게시글의 전체 추천 수 조회
	 * 
	 * @param like - 추천 수를 조회할 게시글 정보
	 * @return 전체 추천 수
	 */
	public int selectTotalCntLike(Like like);
	
	
	
	
	/**
	 * 메뉴찾기
	 * 
	 * @param writeParam
	 * @return
	 */
	public List<Board> selectByMenu(Board writeParam);


	/**
	 * 댓글 삽입
	 * 
	 * @param comment
	 */
	public void insertComment(Comment comment);










	
	
	
	
	
	
	
	

}
