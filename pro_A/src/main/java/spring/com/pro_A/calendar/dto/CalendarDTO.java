package spring.com.pro_A.calendar.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class CalendarDTO {
	private Date scheduleDate;
	private Date scheduleEnd;
	private String schedule;
	private String scheduleDetail;
	public Date getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public Date getScheduleEnd() {
		return scheduleEnd;
	}
	public void setScheduleEnd(Date scheduleEnd) {
		this.scheduleEnd = scheduleEnd;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public String getScheduleDetail() {
		return scheduleDetail;
	}
	public void setScheduleDetail(String scheduleDetail) {
		this.scheduleDetail = scheduleDetail;
	}
	
	
}
