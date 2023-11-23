package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Banner;
import web.dto.Board;
import web.dto.Comment;
import web.dto.User;

public interface AdminService {

	/**
	 * 배너사진 파일을 업로드한다
	 * 
	 * @param bannerParam - 파일 테이블 정보 객체
	 * @param file - 첨부 파일 리스트
	 */
	public void bannerUpdate(Banner bannerParam, List<MultipartFile> file);

	/**
	 * 관리자에서 썸네일 미리보기를 위한 메소드
	 * @return 사진 저장 배열
	 */
	public List<Banner> getBannerNo();

	/**
	 * 게시글 작성 처리
	 *  + 첨부 파일을 처리한다
	 *  (첨부 파일은 여러 개 가능)
	 * 
	 * @param writeParam - 게시글 정보 객체
	 * @param file - 첨부 파일 리스트
	 */
	public void writeNotice(Board writeParamNotice);

	/**
	 * 게시글 목록 조회
	 * 
	 * @return 게시글 목록
	 */
	public List<Board> noticeList();

	/**
	 * 메일 전송을 위해 DB에서 이메일을 불러온다
	 * 
	 * @return 이메일 목록
	 */
	public List<Map<String, Object>> emailList();

	/**
	 * 게시글 신고 목록 조회
	 * 
	 * @return 게시글 신고 목록
	 */
	public List<Map<String, Object>> getBoardReportInfo();

	/**
	 * 댓글 신고 목록 조회
	 * 
	 * @return 댓글 신고 목록
	 */
	public List<Map<String, Object>> getCmtReportInfo();

	/**
	 * 게시글, 댓글을 삭제한다
	 * 
	 * @param board - 게시글 정보 객체
	 */
	public void deleteBoardCmt(Board board, Comment cmt);



	



}
