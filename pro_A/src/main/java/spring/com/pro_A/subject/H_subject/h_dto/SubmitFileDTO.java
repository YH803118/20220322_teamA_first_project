package spring.com.pro_A.subject.H_subject.h_dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class SubmitFileDTO {

	private String id;
	private String submitFileName;
	private int homeworkNo;
	private String uuid;
	private String originalFileName;
	private Date regDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubmitFileName() {
		return submitFileName;
	}

	public void setSubmitFileName(String submitFileName) {
		this.submitFileName = submitFileName;
	}

	public int getHomeworkNo() {
		return homeworkNo;
	}

	public void setHomeworkNo(int homeworkNo) {
		this.homeworkNo = homeworkNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

}
