package pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.PMService;
import pms.vo.Member;

@Controller
public class PMController {
	@Autowired(required = false)
	private PMService service;
	// http://localhost:7080/project06/manage.do
	@RequestMapping("manage.do")
	public String manage(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
        Member mem = (Member)session.getAttribute("mem");
        if(mem == null){
            return "redirect:login.do";
        }
        d.addAttribute("pplist", service.getParticipants(1));
		return "WEB-INF\\views\\pm\\pm-gantt.jsp";
	}
	@RequestMapping("joblist.do")
	public String joblist(@RequestParam("pid") int pid, Model d) {
		d.addAttribute("joblist", service.getJobList(pid));
		return "pageJsonReport";
	}
}
