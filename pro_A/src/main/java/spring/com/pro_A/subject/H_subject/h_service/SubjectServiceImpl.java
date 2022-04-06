package spring.com.pro_A.subject.H_subject.h_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.com.pro_A.subject.N_subject.dao.SubjectDAO;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDAO subjectDAO;

	@Override
	public String lectName(int lectNo) {
		// TODO Auto-generated method stub
		return subjectDAO.lectName(lectNo);
	}
	
}
