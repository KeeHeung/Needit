package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.FileTb;
import web.util.Paging;

public interface MenuShareFace {

	/**
	 * 페이징 계산
	 * 
	 * @param param 페이지 수
	 * @return 페이지
	 */
	public Paging getPaging(Paging param);
	
	/**
	 * 나눔 게시판 조회
	 * 
	 * @param paging 페이지수로 리스트 조회
	 * @return 나눔게시판 조회
	 */
	public List<Board> selectBoardStatus(Paging paging,Board board);
	
	/**
	 * 나눔 게시판 상세조회
	 * 
	 * @param board 게시글 번호
	 * @return boardno 에 해당 하는 게시글 상세조회
	 */
	public Board view(Board board);
	
	/**
	 * 게시글 작성
	 * 
	 * @param writerContent DB에 insert할 데이터
	 * @param upFile 
	 */
	public void write(Board writerContent, List<MultipartFile> upFile);
	
	/**
	 * 있던 파일 정보 조회
	 * 
	 * @param updateParam 파일 정보
	 * @return 파일 정보
	 */
	public List<FileTb> getAttachFile(Board updateParam);
	
	/**
	 * 메뉴 번호 가져오기 
	 * 
	 * @param writerContent 메뉴 번호
	 * @return 메뉴 번호
	 */
	public List<Board> menu(Board writerContent);
	
	/**
	 * 사용자가 업로드한 파일 가져오기
	 * 
	 * @param file 파일 정보
	 * @return 
	 */
	public List<FileTb> getImg(FileTb file);
	
	


}
