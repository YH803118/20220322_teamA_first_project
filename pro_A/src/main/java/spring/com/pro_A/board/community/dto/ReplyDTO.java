package spring.com.pro_A.board.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ReplyDTO {

	private int replyNo;
	private int commuNo;
	private String replyId;
	private String replyWriter;
	private String replyContent;
	private Date replyRegDate;

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getCommuNo() {
		return commuNo;
	}

	public void setCommuNo(int commuNo) {
		this.commuNo = commuNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyRegDate() {
		return replyRegDate;
	}

	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

}
