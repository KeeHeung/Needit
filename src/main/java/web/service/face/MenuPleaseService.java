package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.FileTb;
import web.dto.Like;
import web.util.Paging;

public interface MenuPleaseService {

   
   /**
    * 게시글 목록 조회
    * 
    * @param paging - 페이징 정보 객체 
    * @return 게시글 목록
    */
   public List<Board> list(Paging paging);
   
   
   
   /**
    * 게시글 목록을 위한 페이징 객체를 생성한다
    * 
    * 전달파라미터 객체의 curPage - 현재 페이지
    * DB에서 조회한 totalCount - 총 게시글 수
    * 
    * 두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환한다
    * 
    * @param param - curPage정보를 담고 있는 객체
    * @return 페이징 계산이 완료된 객체
    */
   public Paging getPaging(Paging param);



   /**
    * 게시글 상세보기
    * 
    * @param viewBoard - 상세 조회할 게시글 번호 객체
    * @return 조회된 상세 게시글 정보
    */
   public Board view(Board viewBoard);

   

   /**
    * 게시글 작성 처리 
    * + 첨부 파일을 처리한다
    * (첨부 파일은 여러 개 가능)
    * 
    * @param writeParam - 게시글 정보 객체
    * @param file - 첨부 파일 리스트
    */
   public void write(Board writeParam, List<MultipartFile> file);
   

   
   /**
    * 게시글 번호를 이용하여 업로드된 파일의 정보를 조회한다
    * 
    * @param viewBoard - 조회할 게시글 번호를 가진 객체
    * @return 첨부파일 정보
    */
   public List<FileTb> getAttachFile(Board viewBoard);

   
   /**
    * 파일 번호를 이용하여 업로드된 파일의 정보를 조회한다
    * 
    * @param fileTb - 조회할 파일 번호를 가진 객체
    * @return 파일 정보
    */
   public FileTb getFile(FileTb fileTb);
   

	/**
	 * 업데이트할 파일번호 조회
	 * 
	 * @param updateBoard
	 * @return
	 */
	public Board updateSelect(Board updateBoard);



	/**
	 * 업데이트
	 * 
	 * @param updateBoard
	 */
	public void updateBoard(Board updateBoard);



	/**
	 * 파일업데이트
	 * 
	 * @param file
	 * @param updateBoard
	 */
	public void updateFilesave(MultipartFile file, Board updateBoard);

	/**
	 * 글삭제하기
	 * 
	 * @param deleteParam
	 */
	public void delete(Board deleteParam);

	/**
	 * 따봉했는지 안했는지
	 * 
	 * @param like
	 * @return
	 */
	public boolean isLike(Like like);


	/**
	 * 따봉 갯수
	 * 
	 * @param like
	 * @return
	 */
	public Object getTotalCntLike(Like like);



	/** 
	 * 메뉴목록
	 * 
	 * @param writeParam
	 * @return
	 */
	public List<Board> getMenu(Board writeParam);





}




