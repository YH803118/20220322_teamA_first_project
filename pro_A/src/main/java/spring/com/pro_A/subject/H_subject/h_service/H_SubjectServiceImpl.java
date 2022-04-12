package spring.com.pro_A.subject.H_subject.h_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.subject.H_subject.h_dao.H_SubjectDAO;

@Service
public class H_SubjectServiceImpl implements H_SubjectService{

	@Autowired
	private H_SubjectDAO subjectDAO;

	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return subjectDAO.lectName(lectNo);
	}
	
}
