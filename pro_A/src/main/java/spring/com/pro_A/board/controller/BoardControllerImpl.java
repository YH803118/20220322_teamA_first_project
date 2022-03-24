package spring.com.pro_A.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.board.dto.NoticeDTO;
import spring.com.pro_A.board.service.BoardService;

@Controller
public class BoardControllerImpl implements BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/board/noticeList.do", method = RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<NoticeDTO> noticeList =  boardService.noticeList();
		for (NoticeDTO noticeDTO : noticeList) {
			noticeDTO.getNoticeNo();
		}
		ModelAndView mav = new ModelAndView((String)request.getAttribute("viewName"));
		mav.addObject("noticeList", noticeList);
		int num = 3;
		mav.addObject("num", num);
		return mav;
	}
	
	@RequestMapping(value="/board/noticeDetail.do", method = RequestMethod.GET)
	public ModelAndView noticeDetailView(
			@RequestParam(value="noticeNo", required = false) int noticeNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		NoticeDTO notice = boardService.noticeDetailView(noticeNo);
		return null;
		
	}
}
