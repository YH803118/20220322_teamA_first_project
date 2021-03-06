package spring.com.pro_A.board.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.com.pro_A.board.notice.dto.FileDTO;
import spring.com.pro_A.board.notice.dto.NoticeDTO;
import spring.com.pro_A.board.notice.service.N_BoardService;
import spring.com.pro_A.common.dto.Criteria;
import spring.com.pro_A.common.dto.PageDTO;

@Controller
public class N_BoardControllerImpl implements N_BoardController {

	private static final String CURR_FILE_REPO_PATH = "d:\\workspace\\spring\\upLoadFile";

	@Autowired
	private N_BoardService boardService;

	@RequestMapping(value = "/board/noticeList.do", method = RequestMethod.GET)
	public ModelAndView noticeList(@RequestParam(value = "pageNum", required = false) String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Criteria cri = new Criteria();
		List<NoticeDTO> noticeListTop = boardService.noticeListTop();
		cri.setAmount(20 - noticeListTop.size());
		int total = boardService.getNoticeCountAll();
		if (pageNum == null) {
			cri.setPageNum(1);
		} else {
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		PageDTO pageDTO = new PageDTO(cri, total);
		pageDTO.setCurPage(cri.getPageNum());

		List<NoticeDTO> noticeList = boardService.noticeList(cri);
		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));
		mav.addObject("noticeList", noticeList);
		mav.addObject("noticeListTop", noticeListTop);
		mav.addObject("pageDTO", pageDTO);
		return mav;
	}

	@RequestMapping(value = "/board/noticeDetail.do", method = RequestMethod.GET)
	public ModelAndView noticeDetailView(@RequestParam(value = "noticeNo", required = false) int noticeNo,
			@RequestParam(value = "mod", required = false) String mod, @RequestParam(value = "pageNum") String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		if (mod == null) {
			boardService.noticeAddHit(noticeNo);
			mav.setViewName("/board/noticeDetailView");
		} else {
			mav.setViewName("/board/noticeModifyForm");
		}
		NoticeDTO notice = boardService.noticeDetailView(noticeNo);
		List<FileDTO> noticeFiles = boardService.noticeFiles(noticeNo);
		mav.addObject("detailDTO", notice);
		mav.addObject("noticeFiles", noticeFiles);
		mav.addObject("pageNum", pageNum);
		return mav;
	}

	@RequestMapping(value = "/board/noticeWriteForm.do", method = RequestMethod.GET)
	public ModelAndView noticeWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return new ModelAndView((String) request.getAttribute("viewName"));
	}

	@RequestMapping(value = "/board/noticeNew.do", method = RequestMethod.POST)
	public void noticeNew(MultipartHttpServletRequest multipartReq, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		multipartReq.setCharacterEncoding("utf-8");
		Map<String, String> noticeMap = new HashMap<String, String>();
		Enumeration enu = multipartReq.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = (String) multipartReq.getParameter(name);
			noticeMap.put(name, value);
		}

		int result = boardService.addNotice(noticeMap);
		int addNoticeNo = boardService.getLastNoticeNo();
		int success = noticeFileUploader(multipartReq, addNoticeNo);
//		if(result > 0) {
//			int addNoticeNo = boardService.getLastNoticeNo();
//			int success = noticeFileUploader(multipartReq, addNoticeNo);
//			if(success != 0 ) {
//				boardService.deleteNotice(addNoticeNo);
//			}
//		} else {
//			
//		}
		response.sendRedirect("/pro_A/board/noticeList.do");
	}

	@RequestMapping(value = "/board/noticeDelete.do", method = RequestMethod.GET)
	public void noticeDel(@RequestParam("noticeNo") int noticeNo, HttpServletResponse response) throws Exception {

		List<FileDTO> fileList = boardService.getNoticeFileList(noticeNo);
		if (!fileList.isEmpty()) {
			fileDel(fileList);
		}
		boardService.noticeDel(noticeNo);
		response.sendRedirect("/pro_A/board/noticeList.do");

	}

	@RequestMapping(value = "/board/noticeDownload.do")
	public void noticeFileDown(@RequestParam("noticeFileName") String noticeFileName, HttpServletResponse response)
			throws Exception {
		OutputStream out = response.getOutputStream();
		FileDTO file = boardService.getFileInfo(noticeFileName);
		File downFile = new File(CURR_FILE_REPO_PATH + "\\" + file.getRegDate() + "\\" + noticeFileName);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName=" + noticeFileName);

		FileInputStream in = new FileInputStream(downFile);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

	public void fileDel(List<FileDTO> fileList) {
		File file = null;
		for (FileDTO fileDTO : fileList) {
			System.out.println(fileDTO.getNoticeFileName());
			FileDTO delFileInfo = boardService.getFileInfo(fileDTO.getNoticeFileName());
			file = new File(
					CURR_FILE_REPO_PATH + "//" + delFileInfo.getRegDate() + "//" + delFileInfo.getNoticeFileName());
			if (file.exists()) {
				boolean result = file.delete();
				if(result) {
					boardService.noticeFileDel(fileDTO.getNoticeFileName());
				}
			}
		}
	}

	public int noticeFileUploader(MultipartRequest multipartReq, int noticeNo) {
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
				fileDTO.setNoticeNo(noticeNo);
				fileDTO.setOriginalFileName(noticeFileName);
				noticeFileName = uuid.toString() + "_" + noticeFileName;
				fileDTO.setNoticeFileName(noticeFileName);
				File saveFile = new File(upLoadPath, noticeFileName);
				try {
					mFile.transferTo(saveFile);
					boardService.addNoticeFile(fileDTO);
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

	@RequestMapping(value = "/board/noticeModify.do", method = RequestMethod.POST)
	public void noticeMod(MultipartHttpServletRequest multipartReq, HttpServletResponse response) throws Exception {

		multipartReq.setCharacterEncoding("utf-8");
		Enumeration enu = multipartReq.getParameterNames();
		Map<String, String> noticeMap = new HashMap<String, String>();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = (String) multipartReq.getParameter(name);
			System.out.println("name : " + name);
			System.out.println("value : " + value);
			noticeMap.put(name, value);
		}
		
		int resultN = boardService.modNotice(noticeMap);
		
		String[] delFiles = multipartReq.getParameterValues("delFile");
		int noticeNo = Integer.parseInt(multipartReq.getParameter("noticeNo"));
		if (delFiles != null) {
			Map info = new HashMap();
			info.put("noticeNo", noticeNo);
			List<FileDTO> fileLists = new ArrayList<FileDTO>();
			for (String string : delFiles) {
				info.put("originalFileName", string);
				FileDTO file = boardService.getFileInfo(info);
				fileLists.add(file);
			}
			fileDel(fileLists);
		}
		int result = noticeFileUploader(multipartReq, noticeNo);
		System.out.println("?????????? " + result);
		response.sendRedirect("/pro_A/board/noticeList.do");
	}

	@Override
	@RequestMapping(value = "/board/noticeSearch.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeSearch(@RequestParam Map<String, String> info, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Criteria cri = new Criteria();
		List<NoticeDTO> noticeListTop = boardService.noticeListTop();
		cri.setAmount(20 - noticeListTop.size());
		cri.setSearchType(info.get("searchType"));
		cri.setSearchContent(info.get("searchContent"));
		if (info.get("pageNum") == null) {
			cri.setPageNum(1);
		} else {
			cri.setPageNum(Integer.parseInt(info.get("pageNum")));
		}

		int total = boardService.getSearchCountAll(cri);
		PageDTO pageDTO = new PageDTO(cri, total);
		pageDTO.setCurPage(cri.getPageNum());

		List<NoticeDTO> searchList = boardService.searchNoticeList(cri);

		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));
		mav.addObject("searchList", searchList);
		mav.addObject("noticeListTop", noticeListTop);
		mav.addObject("pageDTO", pageDTO);
		mav.addObject("searchType", info.get("searchType"));
		mav.addObject("searchContent", info.get("searchContent"));
		return mav;

	}
	
	
}