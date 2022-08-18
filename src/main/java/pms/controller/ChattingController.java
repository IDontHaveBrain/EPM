package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.MemberService;

@Controller
public class ChattingController {
	@Autowired(required=false)
	private MemberService service;
	
	
	// http://localhost:7080/project06/chattingFrm.do
	@RequestMapping("chattingFrm.do")
	public String chattingFrm(@RequestParam("pid") int pid, Model d) {
		d.addAttribute("member",service.getMemberDetail(pid));
		d.addAttribute("profile",service.getProfile(pid));
		
		return "WEB-INF\\views\\chatting.jsp";
		
	}
	

}
