package pms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.GlobalService;
import pms.service.WorkPageService;
import pms.vo.Member;
import pms.vo.WorkPage;
import pms.vo.WorkPageFile;
import pms.vo.WorkPageSch;

@Controller
public class WorkPageController {
	@Autowired(required = false)
	private WorkPageService service;
	@Autowired(required = false)
	private GlobalService gservice;

	// http://localhost:7080/project06/WorkPageList.do
	@RequestMapping("WorkPageList.do")
	public String WorkPageList(WorkPageSch sch,@RequestParam(value = "mid", defaultValue = "0") int mid,
											   @RequestParam(value = "pid", defaultValue = "0") int pid,
											   Model d, HttpServletRequest request) {
		// 임시 프로젝트 선택

		pid = 1;
		HttpSession session = request.getSession();
		Member curMem3 = (Member) request.getSession().getAttribute("mem");

		if (curMem3 == null) {
			return "redirect:login.do";
		}

		if (!gservice.checkProjectAuth(curMem3.getMid(), pid)) {
			return "redirect:WorkPageList.do";
		}
		System.out.println(curMem3.getEmail());
		List<WorkPage> wpList = service.getWorkPageList(sch, curMem3.getMid(), pid);
		d.addAttribute("wlist", wpList);
		
		System.out.println("확인해보자:"+sch.getJmstatus());
		return "WEB-INF\\views\\WorkPageList.jsp";
	}
	
	// 승인요청
	@RequestMapping("updateWorkPage.do")
	public String updateWorkPage(WorkPage upt,Model d,
					@RequestParam(value = "jmid") int jmid) {
			service.updateWorkPage(jmid);
		
		d.addAttribute("proc","upt");
		return "redirect:WorkPageList.do?";
	}
	// 삭제

	@RequestMapping("deleteWorkPage.do")
	public String deleteWorkPage(@RequestParam(value = "fid") int fid,
			@RequestParam(value = "jmid") int jmid,
			@RequestParam(value = "jid") int jid,Model d) {
		service.deleteWorkPageFile(fid);
		return "redirect:WorkPageDetail.do?jid="+jid+"&jmid="+jmid;
	}

	
	
	@RequestMapping("WorkPageFileinsert.do")
	public String WorkPageInsertForm() {

		return "WEB-INF\\views\\WorkPageDetail.jsp";
	}

	@RequestMapping("WorkPageInsert.do")
	public String WorkPageInsert(WorkPageFile ins, Model d,
						@RequestParam(value = "jmid") int jmid,
						@RequestParam(value = "jid") int jid) {

		
		service.insertWorkPageFile(ins,jmid);
			return "redirect:WorkPageDetail.do?jid="+jid+"&jmid="+jmid;
		
		

	}

	// int pid, @RequestParam("pid")
	@RequestMapping("WorkPageDetail.do")
	public String WorkPageDetail(WorkPage sch,@RequestParam(value = "mid", defaultValue = "0") int mid, Model d,
							WorkPage filelist,@RequestParam(value = "jid", defaultValue = "0") int jid,
											  @RequestParam(value = "jmid", defaultValue = "0") int jmid,
											  HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		Member curMem = (Member) request.getSession().getAttribute("mem");
		if (curMem == null) {
			return "redirect:login.do";
		}

		if (!gservice.checkProjectAuth(curMem.getMid(), jid)) {
			return "redirect:WorkPageDetail.do";
		}
		
		d.addAttribute("workpage", service.getWokrPageDetail(sch,curMem.getMid(), jid));
		d.addAttribute("flist",service.getWorkPageFile(filelist, curMem.getMid(), jid,jmid));
		
		System.out.println("jmid 값:"+filelist.getJmid());
		System.out.println("jmid 값:"+sch.getJmid());
		System.out.println("mid 값:"+curMem.getMid());
		
		return "WEB-INF\\views\\WorkPageDetail.jsp";
	}

	/*
	 * g // http://localhost:7080/project06/workpage.do
	 * 
	 * @RequestMapping("workpage.do") public String WorkPageList2(Model d) { return
	 * "WEB-INF\\views\\WorkPage\\ajaxlist.jsp"; }
	 * 
	 * @RequestMapping("list.do") public String WorkPageList3(Model d) {
	 * d.addAttribute("WorkPageList",service.getWorkPageList(4)); return
	 * "pageJsonReport"; }
	 * 
	 */
	// http://localhost:7080/board/download.do?fname=config
	// 다운로드컨트롤
	@RequestMapping("download.do")
	public String download(@RequestParam("fname") String fname, Model d) {
		d.addAttribute("downloadFileName", fname);
		// viewer에서 지정한 모델명으로 파일명을 지정..
		// viewer
		// String fname = (String)model.get("downloadFileName");
		return "downloadViewer";
	}

}
