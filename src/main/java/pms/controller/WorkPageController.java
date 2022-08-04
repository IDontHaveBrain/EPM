package pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.service.GlobalService;
import pms.service.WorkPageService;
import pms.vo.WorkPageFile;

@Controller
public class WorkPageController {
    @Autowired(required = false)
    private WorkPageService service;
    // 강제로그인
    @Autowired(required = false)
    private GlobalService gservice;
    
	// http://localhost:7080/project06/WorkPageList.do
	@RequestMapping("WorkPageList.do")
	public String WorkPageList(Model d) {
		d.addAttribute("wlist",service.getWorkPageList(1));

        
		return "WEB-INF\\views\\WorkPageList.jsp";
	}
	
	@RequestMapping("WorkPageFileinsert.do")
	public String WorkPageInsertForm(){

		return "WEB-INF\\views\\WorkPageFileinsert.jsp";
	}
	@RequestMapping("WorkPageInsert.do")
	public String WorkPageInsert(WorkPageFile ins, Model d){
		service.insertWorkPageFile(ins);

		return "WEB-INF\\views\\WorkPageFileinsert.jsp";
	}	
	// int pid, @RequestParam("pid") 
	@RequestMapping("WorkPageDetail.do")
	public String WorkPageDetail(Model d){

		d.addAttribute("workpage",service.getWorkPageList(1));
		
		return "WEB-INF\\views\\WorkPageDetail.jsp";
	}	
	/*	g
	// http://localhost:7080/project06/workpage.do
	@RequestMapping("workpage.do")
	public String WorkPageList2(Model d) {
		return "WEB-INF\\views\\WorkPage\\ajaxlist.jsp";
	}

	@RequestMapping("list.do")
	public String WorkPageList3(Model d) {
		 d.addAttribute("WorkPageList",service.getWorkPageList(4));
		 return "pageJsonReport";
	}
	
	*/
	// http://localhost:7080/board/download.do?fname=config
	// 다운로드컨트롤
	/*
	@RequestMapping("download.do")
	public String download(@RequestParam("fname") String fname, Model d) {
		d.addAttribute("downloadFileName", fname);
		
		// viewer에서 지정한 모델명으로 파일명을 지정..
		// viewer
		// String fname = (String)model.get("downloadFileName");
		return "downloadViewer";
	}
	*/
}
