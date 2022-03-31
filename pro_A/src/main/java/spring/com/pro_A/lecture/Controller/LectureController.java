package spring.com.pro_A.lecture.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.apply.dto.ApplyDTO;
import spring.com.pro_A.lecture.dto.LectureDTO;

public interface LectureController{
public ModelAndView open(@ModelAttribute("lecture") LectureDTO dto,HttpServletRequest request,HttpServletResponse response);
public ModelAndView applyForm(HttpServletRequest request,HttpServletResponse response);
public ModelAndView apply(HttpServletRequest request,HttpServletResponse response);
}
