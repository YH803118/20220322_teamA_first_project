package spring.com.pro_A.lecture.dto;

import org.springframework.stereotype.Component;

@Component
public class LectureDTO {

	private int lectNo;
	private String lectName;
	private String name;
	private String lectDay;
	private int begin;
	private int end;
	public int getLectNo() {
		return lectNo;
	}
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	public String getLectName() {
		return lectName;
	}
	public void setLectName(String lectName) {
		this.lectName = lectName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLectDay() {
		return lectDay;
	}
	public void setLectDay(String lectDay) {
		this.lectDay = lectDay;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
}
