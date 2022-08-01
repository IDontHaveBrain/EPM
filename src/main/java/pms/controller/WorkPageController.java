package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.service.WorkPageService;
import pms.vo.WorkPage;

@Controller
public class WorkPageController {
    @Autowired(required = false)
    private WorkPageService service;
	// http://localhost:7080/project06/WorkPageList.do
	@RequestMapping("WorkPageList.do")
	public String WorkPageList(Model d) {
		d.addAttribute("wlist",service.getWorkPageList(4));
		return "WEB-INF\\views\\WorkPage\\WorkPageList.jsp";
	}
	/*
	public String WorkPageList2(WorkPage sch, Model d) {
		d.addAttribute("WorkPageList",service.getWorkPageList(sch));
		return "pageJsonReport";
	}
	*/

}
