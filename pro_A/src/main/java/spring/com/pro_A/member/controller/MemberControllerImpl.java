package spring.com.pro_A.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



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
	public ModelAndView login(@ModelAttribute("member")MemberDTO dto,
			RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		memberDTO = memberService.login(dto);
		if(memberDTO != null) {
			System.out.println("로그인성공");
		} else {
			System.out.println("로그인실패");
		}
		
		return mav;
	}
	@Override
	@RequestMapping(value="/test/*Form.do")
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value="/test/addMember.do" ,method = RequestMethod.POST)
	   public ModelAndView addMember(@ModelAttribute("member") MemberDTO member,
	                           HttpServletRequest request, HttpServletResponse response) throws Exception {
	      request.setCharacterEncoding("utf-8");
	      ModelAndView mav =new ModelAndView();
	      int result = memberService.addMember(member);
	      if(result>=1) {
	      mav.setViewName("redirect:/test/loginTest.do");
	      }
	      
	      return mav;
	   }






}
