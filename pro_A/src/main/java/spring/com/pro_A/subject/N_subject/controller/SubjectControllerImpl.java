package spring.com.pro_A.subject.N_subject.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.board.notice.dto.SubjectNoticeDTO;
import spring.com.pro_A.common.dto.Criteria;
import spring.com.pro_A.common.dto.PageDTO;
import spring.com.pro_A.subject.N_subject.service.SubjectService;

@Controller
public class SubjectControllerImpl implements SubjectController{

	@Autowired
	private SubjectService subjectService;
	
	@Override
	@RequestMapping(value="/test/subjectForm.do")
	public ModelAndView subjectForm(@RequestParam(value="subjectNo", required=false) String lectNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		String lectName = subjectService.lectName(Integer.parseInt(lectNo));
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("lectName",lectName);
		mav.addObject("lectNo",lectNo);
		return mav;
	}

	@Override
	@RequestMapping(value="/test/subjectNotice.do")
	public ModelAndView subjectNotice(@RequestParam(value="pageNum", required =false) String pageNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Criteria cri = new Criteria();
		List<SubjectNoticeDTO> noticeListTop = subjectService.noticeListTop();
		cri.setAmount(20-noticeListTop.size());
		int total = subjectService.getNoticeCountAll();
		int lectNo=Integer.parseInt(request.getParameter("lectNo"));
		String name=request.getParameter("name");
		if(pageNum == null) {
			cri.setPageNum(1);
		} else {
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		PageDTO pageDTO = new PageDTO(cri, total);
		pageDTO.setCurPage(cri.getPageNum());
		
		List<SubjectNoticeDTO> subNotice = subjectService.noticeList(cri);
		List<SubjectNoticeDTO> noticeList= new ArrayList<SubjectNoticeDTO>();

		for(SubjectNoticeDTO sub:subNotice)
		{
			if(lectNo==sub.getLectNo())
				{
				noticeList.add(sub);
				}
		}
		
		
		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));
		mav.addObject("noticeList", noticeList);
		mav.addObject("noticeListTop", noticeListTop);
		mav.addObject("pageDTO", pageDTO);
		mav.addObject("lectNo",lectNo);
		mav.addObject("name", name);
		return mav;
	}
	
	@RequestMapping(value = "/test/noticeDetail.do", method = RequestMethod.GET)
	public ModelAndView noticeDetailView(@RequestParam(value = "noticeNo", required = false) int noticeNo,
			@RequestParam(value="mod", required = false) String mod,@RequestParam(value="pageNum") String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(mod == null) {
			subjectService.noticeAddHit(noticeNo);
			 mav.setViewName("/test/noticeDetailView");
		} else {
			 mav.setViewName("/test/noticeModifyForm");
		}
		SubjectNoticeDTO notice = subjectService.noticeDetailView(noticeNo);
		mav.addObject("detailDTO", notice);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
	
	@RequestMapping(value = "/test/noticeWriteForm.do", method = RequestMethod.GET)
	public ModelAndView noticeWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav=new ModelAndView((String) request.getAttribute("viewName"));
		String lectNo = request.getParameter("lectNo");
		mav.addObject("lectNo",lectNo);
		return mav;
		
	}

	@RequestMapping(value = "/test/noticeNew.do", method = RequestMethod.POST)
	public void noticeNew(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		String lectNo=request.getParameter("lectNo");
		Map<String, String> noticeMap = new HashMap<String, String>();
		Enumeration enu = request.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = (String) request.getParameter(name);
			noticeMap.put(name, value);
		}
		

		int result =  subjectService.addNotice(noticeMap);
		int addNoticeNo =  subjectService.getLastNoticeNo();
		
		

		response.sendRedirect("/pro_A/test/subjectNotice.do?lectNo="+lectNo);
	}
	
	@RequestMapping(value="/test/noticeDelete.do", method=RequestMethod.GET)
	public void noticeDel(@RequestParam("noticeNo") int noticeNo, HttpServletResponse response) throws Exception{
						
		 subjectService.noticeDel(noticeNo);
		response.sendRedirect("/pro_A/test/subjectNotice.do");
		
	}
	
	

}
