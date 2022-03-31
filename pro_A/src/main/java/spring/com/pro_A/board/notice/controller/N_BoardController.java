package spring.com.pro_A.board.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface N_BoardController {

	public ModelAndView noticeList(@RequestParam("pageNum") String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public void noticeNew(MultipartHttpServletRequest multipartReq, HttpServletResponse response) throws Exception;

	public void noticeDel(@RequestParam("noticeNo") int noticeNo, HttpServletResponse response) throws Exception;

	public ModelAndView noticeDetailView(@RequestParam(value = "noticeNo", required = false) int noticeNo,
			@RequestParam(value = "mod", required = false) String mod, @RequestParam(value = "pageNum") String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void noticeFileDown(@RequestParam("noticeFileName") String noticeFileName, HttpServletResponse response)
			throws Exception;

	public void noticeMod(MultipartHttpServletRequest multipartReq, HttpServletResponse response) throws Exception;

	public ModelAndView noticeSearch(@RequestParam Map<String, String> info, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
