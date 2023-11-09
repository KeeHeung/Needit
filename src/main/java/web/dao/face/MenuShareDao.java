package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.dto.FileTb;
import web.util.Paging;

public interface MenuShareDao {
	
	/**
	 * 페이지수 계산
	 * 
	 * @param param 페이지수 
	 * @return 계산된 페이지 수 
	 */
	public int selectCntAll(Paging param);
	
	/**
	 * 나눔 게시판 전체 조회
	 * @param cate 
	 * 
	 * @return 나눔 게시판 전체 조회 결과
	 */
	public List<Board> selectAll(Paging paging);
	
	/**
	 * 상세조회시 필요한 boardno 가져오기
	 * 
	 * @param board boardno
	 * @return 해당 게시글 boardno 
	 */
	public Board selectByBoardNo(Board board);
	
	/**
	 * 조회수 조회
	 * 
	 * @param boardNo 전달 파라미터
	 */
	public void updateHit(int boardNo);
	
	/**
	 * 사용자가 입력한 글작성 정보를 DB에 insert
	 * 
	 * @param writerContent 사용자가 작성한 데이터
	 */
	public void insertBoard(Board writerContent);
	
	/**
	 * 파일 업로드
	 * 
	 * @param fileTb 사용자가 업로드할 파일
	 */
	public void insertFile(FileTb fileTb);
	
	/**
	 * 메뉴 번호
	 * 
	 * @param writerContent 메뉴번호
	 * @return 메뉴번호
	 */
	public List<Board> selectByMenu(Board writerContent);
	
	/**
	 * 사용자가 업로드한 이미지
	 * 
	 * @param file 이미지
	 * @return file 이미지
	 */
	public List<FileTb> selectFileImg(FileTb file);
	

}
