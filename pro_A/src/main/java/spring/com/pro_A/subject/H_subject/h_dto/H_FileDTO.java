package spring.com.pro_A.subject.H_subject.h_dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class H_FileDTO {

	private String homeworkFileName;
	private int homeworkNo;
	private String uuid;
	private String originalFileName;
	private Date regDate;

	public int gethomeworkNo() {
		return homeworkNo;
	}

	public void sethomeworkNo(int homeworkNo) {
		this.homeworkNo = homeworkNo;
	}

	public String gethomeworkFileName() {
		return homeworkFileName;
	}

	public void sethomeworkFileName(String homeworkFileName) {
		this.homeworkFileName = homeworkFileName;
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
