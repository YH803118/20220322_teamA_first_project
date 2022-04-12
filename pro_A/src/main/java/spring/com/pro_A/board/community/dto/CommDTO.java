package spring.com.pro_A.board.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class CommDTO {

	private int commuNo;
	private String commuId;
	private String commuWriter;
	private String commuTitle;
	private String commuContent;
	private Date commuRegDate;
	private int commuHit;
	private int replyCnt;

	public int getCommuNo() {
		return commuNo;
	}

	public void setCommuNo(int commuNo) {
		this.commuNo = commuNo;
	}

	public String getCommuWriter() {
		return commuWriter;
	}

	public void setCommuWriter(String commuWriter) {
		this.commuWriter = commuWriter;
	}

	public String getCommuTitle() {
		return commuTitle;
	}

	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}

	public String getCommuContent() {
		return commuContent;
	}

	public void setCommuContent(String commuContent) {
		this.commuContent = commuContent;
	}

	public Date getCommuRegDate() {
		return commuRegDate;
	}

	public void setCommuRegDate(Date commuRegDate) {
		this.commuRegDate = commuRegDate;
	}

	public int getCommuHit() {
		return commuHit;
	}

	public void setCommuHit(int commuHit) {
		this.commuHit = commuHit;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String getCommuId() {
		return commuId;
	}

	public void setCommuId(String commuId) {
		this.commuId = commuId;
	}

}
