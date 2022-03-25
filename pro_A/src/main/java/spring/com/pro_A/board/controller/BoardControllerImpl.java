package spring.com.pro_A.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.board.dto.FileDTO;
import spring.com.pro_A.board.dto.NoticeDTO;
import spring.com.pro_A.board.service.BoardService;

@Controller
public class BoardControllerImpl implements BoardController {
	
	private static final String CURR_IMAGE_REPO_PATH = "d:\\workspace\\spring\\upLoadFile";
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/board/noticeList.do", method = RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<NoticeDTO> noticeList =  boardService.noticeList();
		ModelAndView mav = new ModelAndView((String)request.getAttribute("viewName"));
		mav.addObject("noticeList", noticeList);
		return mav;
	}
	
	@RequestMapping(value="/board/noticeDetail.do", method = RequestMethod.GET)
	public ModelAndView noticeDetailView(
			@RequestParam(value="noticeNo", required = false) int noticeNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		boardService.noticeAddHit(noticeNo);
		NoticeDTO notice = boardService.noticeDetailView(noticeNo);
		ModelAndView mav = new ModelAndView("/board/noticeDetailView");
		mav.addObject("detailDTO", notice);
		
		return mav;
		
	}
	
	@RequestMapping(value="/board/*Form.do", method=RequestMethod.GET)
	public ModelAndView noticeWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		return new ModelAndView((String)request.getAttribute("viewName"));
	}
	
	@RequestMapping(value="/board/noticeNew.do", method=RequestMethod.POST)
	public ModelAndView noticeNew(MultipartHttpServletRequest multipartReq, HttpServletResponse response) throws Exception {
		
		multipartReq.setCharacterEncoding("utf-8");
		Map<String, String> noticeMap = new HashMap<String, String>();
		Enumeration enu = multipartReq.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			System.out.println("name : " + name);
			String value = (String) multipartReq.getParameter(name);
			System.out.println("value : " + value);
			noticeMap.put(name, value);
		}
		
		 int result = boardService.addNotice(noticeMap);
		 int addNoticeNo = boardService.getLastNoticeNo();
		 noticeFileUploader(multipartReq, addNoticeNo);
		
		return null;
	}
	
	
	public void noticeFileUploader(MultipartRequest multipartReq, int noticeNo) throws Exception {
			
		Date todays = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String DailyDir = sdf.format(todays);
		Iterator it = multipartReq.getFileNames();
		
		while(it.hasNext()){
			FileDTO fileDTO = new FileDTO();
			String fileName = (String)it.next();
			MultipartFile mFile= multipartReq.getFile(fileName);
			File upLoadPath = new File(CURR_IMAGE_REPO_PATH,DailyDir);
			if(!upLoadPath.exists()) {
				upLoadPath.mkdirs();
			}
			String noticeFileName = mFile.getOriginalFilename();
			noticeFileName = noticeFileName.substring(noticeFileName.lastIndexOf("\\")+1);
			UUID uuid = UUID.randomUUID();
			noticeFileName = uuid.toString() + "_" + noticeFileName;
			fileDTO.setNoticeNo(noticeNo);
			fileDTO.setNoticeFileName(noticeFileName);
			boardService.addNoticeFile(fileDTO);
			File saveFile = new File(upLoadPath, noticeFileName);
			mFile.transferTo(saveFile);
		}
		
	}
	
}