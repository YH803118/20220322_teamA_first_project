package spring.com.pro_A.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {

	public ModelAndView noticeList(@RequestParam("pageNum") String pageNum, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void noticeNew(MultipartHttpServletRequest multipartReq, HttpServletResponse response) throws Exception;

	public void noticeDel(@RequestParam("noticeNo") int noticeNo, HttpServletResponse response) throws Exception;

	public ModelAndView noticeDetailView(@RequestParam(value = "noticeNo", required = false) int noticeNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void noticeFileDown(@RequestParam("noticeFileName") String noticeFileName, HttpServletResponse response)
			throws Exception;
	
	public void noticeFileDel(@RequestParam("noticeNo") int noticeNo,
			@RequestParam("noticeFileName") String noticeFileName,HttpServletResponse response) throws Exception;
	
}
