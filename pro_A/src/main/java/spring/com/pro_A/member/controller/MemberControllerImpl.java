package spring.com.pro_A.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.com.pro_A.member.dto.CalendarDTO;
import spring.com.pro_A.member.dao.MemberDAO;
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
			if(memberDTO.getMemberType() == 2) {
				System.out.println("관리자로그인");
				mav.setViewName("redirect:/test/managerForm.do");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("isLogon", true);
				session.setAttribute("dto", memberDTO);
				System.out.println("로그인성공");
				mav.setViewName("redirect:/test/loginForm.do");
			}
		} else{
			System.out.println("로그인실패");
			mav.setViewName("redirect:/test/loginForm.do");
		}
		
		return mav;
	}
	@Override
	@RequestMapping(value="/test/*Form.do")
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<CalendarDTO> calendarList = memberService.showSchedule();
		mav.addObject("calendarList",calendarList);
		return mav;
	}
	
	@RequestMapping(value="/test/addMember.do" ,method = RequestMethod.POST)
	   public ModelAndView addMember(@ModelAttribute("member") MemberDTO member,
	                           HttpServletRequest request, HttpServletResponse response) throws Exception {
	      request.setCharacterEncoding("utf-8");
	      ModelAndView mav =new ModelAndView();
	      int result = memberService.addMember(member);
	      if(result>=1) {
	      mav.setViewName("redirect:/test/loginForm.do");
	      }
	      
	      return mav;
	   }
	
	@Override
	@RequestMapping(value="/test/modForm.do")
	public ModelAndView modForm(@ModelAttribute("member") MemberDTO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String command=request.getParameter("command");
		if(command==null) {
		String id=request.getParameter("id");
		MemberDTO dto=memberService.selectId(id);
		String viewName = (String) request.getAttribute("viewName");
		mav.addObject("dto",dto);
		mav.setViewName(viewName);
		}
		else if(command.equals("mod")) {
			memberService.modMember(member);
			 mav.setViewName("redirect:/test/loginForm.do");
		}
		return mav;
	}
	
	@RequestMapping(value="/test/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		session.invalidate();
		ModelAndView mav= new ModelAndView("redirect:/test/loginForm.do");
		return mav;
	}

	
}
