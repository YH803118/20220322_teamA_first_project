package spring.com.pro_A.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.com.pro_A.member.dto.MemberDTO;

@Controller
public interface MemberController {
	public ModelAndView login(@ModelAttribute("member")MemberDTO dto,
			RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView loginTest(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
