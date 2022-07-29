package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.MemberService;
import pms.vo.Member;

@Controller
public class MemberController {
	@Autowired(required = false)
	private MemberService service;
	// http://localhost:7080/project06/register.do
	@RequestMapping("register.do")
	public String register(Member ins, Model d){
		return "WEB-INF\\views\\default.jsp";
	}
	
	@RequestMapping("dupCheck.do")
	public String hasMember(@RequestParam("email")String email, Model d) {
		// 해당 회원이 있을 때, true, 없을 때, false
		d.addAttribute("dupCheck", service.checkEmail(email)==0?false:true);
		return "pageJsonReport";
	}
}
 