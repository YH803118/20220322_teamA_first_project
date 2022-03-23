package spring.com.pro_A.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.member.dto.MemberDTO;
import spring.com.pro_A.member.service.MemberService;

@Controller
public class MemberControllerImpl implements MemberController{

	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberDTO memberDTO;
	
	@Override
	@RequestMapping(value="/test/login.do")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}
}
