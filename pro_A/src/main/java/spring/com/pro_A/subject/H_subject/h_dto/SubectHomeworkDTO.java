package spring.com.pro_A.subject.H_subject.h_dto;

import java.sql.Date;

public class SubectHomeworkDTO {
	private int lectNo;
	private int homeworkNo;
	private String title;
	private String content;
	private Date endDate;
	
	
	public int getHomeworkNo() {
		return homeworkNo;
	}
	public void setHomeworkNo(int homeworkNo) {
		this.homeworkNo = homeworkNo;
	}
	public int getLectNo() {
		return lectNo;
	}
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}	
	
}
