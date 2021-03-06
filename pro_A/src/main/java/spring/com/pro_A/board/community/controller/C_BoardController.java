package spring.com.pro_A.board.community.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.board.community.dto.CommDTO;

public interface C_BoardController {

	public ModelAndView commuList(@RequestParam(value = "pageNum", required = false) String pageNum,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;

	public ModelAndView commuWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void commuNew(@ModelAttribute("commDTO") CommDTO commDTO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView commuDetailView(@RequestParam("commuNo") int commuNo, @RequestParam("pageNum") int PageNum,
			@RequestParam("mod") String mod) throws Exception;

	public void commuModify(@ModelAttribute("commDTO") CommDTO commDTO, @RequestParam("pageNum") int pageNum,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView commuSearch(@RequestParam Map<String, String> info,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void commuDelete(@RequestParam(value = "commuNo", required = true) int commuNo, HttpServletResponse response) throws Exception;
}
