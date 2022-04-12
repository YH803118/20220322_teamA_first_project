package spring.com.pro_A.subject.H_subject.h_dto;

import java.sql.Date;

public class SubmitInfo {
	private String id;
	private String content;
	private int homeworkNo;
	private Date SubmitDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHomeworkNo() {
		return homeworkNo;
	}
	public void setHomeworkNo(int homeworkNo) {
		this.homeworkNo = homeworkNo;
	}
	public Date getSubmitDate() {
		return SubmitDate;
	}
	public void setSubmitDate(Date submitDate) {
		SubmitDate = submitDate;
	}
	
}
