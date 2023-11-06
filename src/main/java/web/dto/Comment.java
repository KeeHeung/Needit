package web.dto;

import java.util.Date;

public class Comment {
	
	private int cmtNo;
	private Date writeDate;
	private String content;
	private int boardNo;
	private String writerId;

	public Comment() {}

	public Comment(int cmtNo, Date writeDate, String content, int boardNo, String writerId) {
		super();
		this.cmtNo = cmtNo;
		this.writeDate = writeDate;
		this.content = content;
		this.boardNo = boardNo;
		this.writerId = writerId;
	}

	@Override
	public String toString() {
		return "Comment [cmtNo=" + cmtNo + ", content=" + content + ", boardNo=" + boardNo + ", writerId=" + writerId
				+ "]";
	}

	public int getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	
}
