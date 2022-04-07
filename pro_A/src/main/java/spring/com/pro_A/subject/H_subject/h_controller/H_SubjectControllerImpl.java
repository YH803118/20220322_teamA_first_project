package spring.com.pro_A.subject.H_subject.h_controller;

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
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.subject.H_subject.h_dto.SubjectHomeworkDTO;
import spring.com.pro_A.subject.H_subject.h_service.H_SubjectService;

@Controller
public class H_SubjectControllerImpl implements H_SubjectController{

	@Autowired
	private H_SubjectService subjectService;
	private static final String CURR_FILE_REPO_PATH = "d:\\workspace\\spring\\upLoadFile\\homework";
	@Override
	@RequestMapping(value="/test/subjectHomework.do")
	public ModelAndView subjectForm(@RequestParam(value="subjectNo", required=false) String lectNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		int lectNum = Integer.parseInt(lectNo);
		
		String lectName = subjectService.lectName(lectNum);
		List<SubjectHomeworkDTO> homeworkList = subjectService.homeworkList(lectNo);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		mav.addObject("lectName",lectName);
		mav.addObject("lectNo",lectNum);
		mav.addObject("homeworkList", homeworkList);
		return mav;
	}

	@Override
	@RequestMapping(value="/test/subjectHomeworkAdd.do")
	public ModelAndView homeworkAddForm(String lectNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/test/homeworkAdd.do", method=RequestMethod.POST)
	public void homeworkAdd(MultipartHttpServletRequest multipartReq, 
			@RequestParam(value="lectNo", required=false) String lectNo, 
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();
		multipartReq.setCharacterEncoding("utf-8");
		Map<String, String> homeworkMap = new HashMap<String, String>();
		Enumeration enu = multipartReq.getParameterNames();
			System.out.println(lectNo+"+++++++++++++++++++++++++++");
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = (String) multipartReq.getParameter(name);
			if(name.equals("endDate")) {
				value = value.substring(2);
			}
			homeworkMap.put(name, value);
		}homeworkMap.put("lectNo", lectNo);
		int result = subjectService.addHomework(homeworkMap);
		int addHomeworkNo = subjectService.getLastHomeworkNo();
 		int success = noticeFileUploader(multipartReq, addHomeworkNo);
 		
 		response.sendRedirect("/pro_A/test/subjectHomework.do?subjectNo="+lectNo);
	}

	private int noticeFileUploader(MultipartHttpServletRequest multipartReq, int addHomeworkNo) {
		// TODO Auto-generated method stub
		Date todays = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String DailyDir = sdf.format(todays);
		Iterator it = multipartReq.getFileNames();
		int result = 0;
		while (it.hasNext()) {
			FileDTO fileDTO = new FileDTO();
			String fileName = (String) it.next();
			MultipartFile mFile = multipartReq.getFile(fileName);
			File upLoadPath = new File(CURR_FILE_REPO_PATH, DailyDir);
			if (!upLoadPath.exists()) {
				upLoadPath.mkdirs();
			}
			if (mFile.getSize() != 0) {
				String noticeFileName = mFile.getOriginalFilename();
				noticeFileName = noticeFileName.substring(noticeFileName.lastIndexOf("\\") + 1);
				UUID uuid = UUID.randomUUID();
				fileDTO.setUuid(uuid.toString());
				System.out.println("fileDTO , uuid = : " + fileDTO.getUuid());
				fileDTO.setNoticeNo(addHomeworkNo);
				System.out.println("fileDTO , noticeNo = : " + fileDTO.getNoticeNo());
				fileDTO.setOriginalFileName(noticeFileName);
				System.out.println("original fileName : " + fileDTO.getOriginalFileName());
				noticeFileName = uuid.toString() + "_" + noticeFileName;
				fileDTO.setNoticeFileName(noticeFileName);
				System.out.println("변경된 파일이름 : " + fileDTO.getNoticeFileName());
				File saveFile = new File(upLoadPath, noticeFileName);
				try {
					mFile.transferTo(saveFile);
					subjectService.addHomeworkFile(fileDTO);
					result = 0;
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					result = -1;
				} catch (IOException e) {
					// TODO Auto-generated catch block
					result = -1;
					e.printStackTrace();
				}
			}
		}
		return result;
	}

}
