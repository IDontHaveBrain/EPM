package pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		if(ins!=null && ins.getEmail() !=null && ins.getPassword()!=null && ins.getName()!=null) {
			service.register(ins);
		}
		d.addAttribute(new Member());
		return "WEB-INF\\views\\register.jsp";
	}
	
	@RequestMapping("dupCheck.do")
	public String hasMember(@RequestParam("email")String email, Model d) {
		// 해당 회원이 있을 때, true, 없을 때, false
		d.addAttribute("dupCheck", service.checkEmail(email)==0?false:true);
		return "pageJsonReport";
	}
	
	// http://localhost:7080/project06/login.do
	@RequestMapping("login.do")
	public String login(@ModelAttribute("member") Member m,
				HttpServletRequest request) {
		if(m.getEmail()!=null) {
			Member mem = service.loginMember(m);
			HttpSession session = request.getSession();
			if(mem!=null) {
				session.setAttribute("mem", mem);
			}else {
				return "redirect:login.do";
			}
			
		}
		return "WEB-INF\\views\\login.jsp";
	}
}
 