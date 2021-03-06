package spring.com.pro_A.board.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import net.sf.cglib.proxy.Dispatcher;
import spring.com.pro_A.board.community.dto.CommDTO;
import spring.com.pro_A.board.community.dto.ReplyDTO;
import spring.com.pro_A.board.community.service.C_BoardService;
import spring.com.pro_A.common.dto.Criteria;
import spring.com.pro_A.common.dto.PageDTO;

@RestController
public class C_BoardControllerImpl implements C_BoardController {

	@Autowired
	private C_BoardService cBoardService;

	@RequestMapping(value = "/board/commuList.do", method = RequestMethod.GET)
	public ModelAndView commuList(@RequestParam(value = "pageNum", required = false) String pageNum,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println(session.getId());
		System.out.println(session.getAttribute("dto"));
		System.out.println(session.getMaxInactiveInterval());
		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));
		int total = cBoardService.getCommuTotCnt();
		Criteria cri = new Criteria();
		cri.setAmount(20);

		if (pageNum == null) {
			cri.setPageNum(1);
		} else {
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		PageDTO pageDTO = new PageDTO(cri, total);
		pageDTO.setCurPage(cri.getPageNum());
		List<CommDTO> commuList = cBoardService.getCommuList(cri);
		mav.addObject("commuList", commuList);
		mav.addObject("pageDTO", pageDTO);
		return mav;
	}

	@RequestMapping(value = "/board/commuWriteForm.do", method = RequestMethod.GET)
	public ModelAndView commuWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView((String) request.getAttribute("viewName"));
	}

	@Override
	@RequestMapping(value = "/board/commuNew.do", method = RequestMethod.POST)
	public void commuNew(CommDTO commDTO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int result = cBoardService.addCommu(commDTO);
		response.sendRedirect("commuList.do");
	}

	@RequestMapping(value = "/board/commuDetail.do", method = RequestMethod.GET)
	public ModelAndView commuDetailView(@RequestParam("commuNo") int commuNo, @RequestParam("pageNum") int pageNum,
			@RequestParam(value = "mod", required = false) String mod) throws Exception {
		ModelAndView mav = new ModelAndView();
		CommDTO commDTO = cBoardService.getCommuDetail(commuNo);
		mav.addObject("detailDTO", commDTO);
		mav.addObject("pageNum", pageNum);
		if (mod == null) {
			int result = cBoardService.addCommuHit(commuNo);
			mav.setViewName("/board/commuDetailView");
			List<ReplyDTO> replys = cBoardService.getReplys(commuNo);
			mav.addObject("replys", replys);
		} else {
			mav.setViewName("/board/commuModifyForm");
		}
		return mav;
	}

	@RequestMapping(value = "/board/commuModify.do", method = RequestMethod.POST)
	public void commuModify(@ModelAttribute("commDTO") CommDTO commDTO, @RequestParam("pageNum") int pageNum,
			HttpServletResponse response) throws Exception {

		int result = cBoardService.updateCommu(commDTO);
		System.out.println("?????? ????????? ?????? ????????? ??????????" + result);

		response.sendRedirect("/pro_A/board/commuList.do?pageNum=" + pageNum);

	}

	@Override
	@RequestMapping(value = "/board/commuSearch", method = RequestMethod.POST)
	public ModelAndView commuSearch(@RequestParam Map<String, String> info, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Criteria cri = new Criteria();
		cri.setAmount(20);
		cri.setSearchType(info.get("searchType"));
		cri.setSearchContent(info.get("searchContent"));
		int total = cBoardService.getCommuSearchCnt(cri);
		if (info.get("pageNum") == null) {
			cri.setPageNum(1);
		} else {
			cri.setPageNum(Integer.parseInt(info.get("pageNum")));
		}

		PageDTO pageDTO = new PageDTO(cri, total);
		pageDTO.setCurPage(cri.getPageNum());

		List<CommDTO> searchList = cBoardService.searchCommuList(cri);

		ModelAndView mav = new ModelAndView((String) request.getAttribute("viewName"));
		mav.addObject("searchList", searchList);
		mav.addObject("pageDTO", pageDTO);
		mav.addObject("searchType", info.get("searchType"));
		mav.addObject("searchContent", info.get("searchContent"));
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/commuDelete.do", method = RequestMethod.GET)
	public void commuDelete(@RequestParam(value = "commuNo", required = true) int commuNo, HttpServletResponse response)
			throws Exception {
		int result = cBoardService.delCommu(commuNo);
		response.sendRedirect("/pro_A/board/commuList.do");
	}

	@RequestMapping(value = "/board/replyNew.do", method = RequestMethod.POST)
	public void replyNew(@ModelAttribute("replyDTO") ReplyDTO replyDTO,
			@RequestParam(value = "pageNum", required = false) int pageNum, HttpServletResponse response)
			throws Exception {
		int result = cBoardService.addReply(replyDTO);
		if(result > 0 ) {
			int resultcommu = cBoardService.addReplyCnt(replyDTO.getCommuNo());
		}
		String url = "/pro_A/board/commuDetail.do?commuNo=";
		url += replyDTO.getCommuNo() + "&pageNum=" + pageNum;
		response.sendRedirect(url);
	}

	@RequestMapping(value = "/board/replyMod.do", method = RequestMethod.POST)
	public void replyMod(@RequestBody ReplyDTO replyDTO) throws Exception {
		int result = cBoardService.modReply(replyDTO);
	}

	
	@RequestMapping(value = "/board/replyDel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void replyDel(@RequestParam Map<String, String> info, HttpServletResponse response)
			throws Exception {
		int replyNo = Integer.parseInt(info.get("replyNo"));
		int commNo = Integer.parseInt(info.get("commuNo"));
		int result = cBoardService.delReply(replyNo);
		if(result > 0 ) {
			int resultcommu= cBoardService.delReplyCnt(commNo);
		}
		String url = "/pro_A/board/commuDetail.do?commuNo=";
		url += commNo + "&pageNum=" + info.get("pageNum");
		response.sendRedirect(url);
	
	}
}
