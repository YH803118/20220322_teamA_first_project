package spring.com.pro_A.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
			
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/test/login.jsp");
		}
		
		return mav;
	}
	
	private String getViewName(HttpServletRequest request) throws Exception{
		// /pro03/test/login.do?id=???
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
			
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		
		System.out.println("uri : " + uri);
		
		int begin = uri.lastIndexOf("/");
		
		int end;
		if(uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String fileName = uri.substring(begin, end);
		System.out.println(fileName);
		
		if(fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf("."));
		}
		System.out.println(fileName);

		return fileName;
	}

	@Override
	@RequestMapping(value="/test/memberForm.do")
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		mav.setViewName(getViewName(request));
		return mav;
	}
	
	
	
	
}
