package spring.com.pro_A.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public interface MemberController {
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
