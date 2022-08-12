package pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pms.service.MemberService;
import pms.vo.Member;

@Controller
public class MemberController {
	@Autowired(required = false)
	private MemberService service;
	
	// http://localhost:7080/project06/register.do
	@RequestMapping("register.do")
	public String register(Member ins, Model d) {
		if (ins != null && ins.getEmail() != null && ins.getName() != null) {
			service.register(ins);
			return "redirect:login.do";
		}
		d.addAttribute(new Member());
		return "WEB-INF\\views\\login\\register.jsp";
	}

	@RequestMapping("dupCheck.do")
	public String hasMember(@RequestParam("email") String email, Model d) {
		System.out.println(email);
		d.addAttribute("dupCheck", service.checkEmail(email) == 0 ? false : true);
		return "pageJsonReport";
	}

	// http://localhost:7080/project06/login.do
	@RequestMapping("login.do")
	public String login(Member m, Model d, HttpServletRequest request) {
		if (m.getEmpno() != 0 && m.getPassword() != null) {
			Member mem = service.memberLogin(m);
			HttpSession session = request.getSession();
			if (mem != null && mem.getAuth().equals("ADMIN")) {
				session.setAttribute("mem", mem);
				return "redirect:adminDashboard.do";
			} else if (mem != null && mem.getAuth() != "ADMIN") {
				session.setAttribute("mem", mem);
				return "redirect:dashboard.do";
			} else {
				return "redirect:login.do";
			}
		}
		return "WEB-INF\\views\\login\\login.jsp";
	}
	
	@RequestMapping("memberlist.do")
	public String mailForm(Model d, Member sch) {
		d.addAttribute("memlist", service.getMemberList(sch));
		return "WEB-INF\\views\\member\\memberlist.jsp";
	}
	
	// http://localhost:7080/project06/memberDetail.do
	@RequestMapping("memberDetail.do")
	public String boardDetail(@RequestParam("mid") int mid, Model d){
		d.addAttribute("member",service.getMemberDetail(mid));
		
		return "WEB-INF\\views\\member\\memberdetail.jsp";
	}
	
	@RequestMapping("mypage.do")
	public String myPage(@RequestParam("mid") int mid, HttpServletRequest request, Model d){
		Member curMem = (Member)request.getSession().getAttribute("mem");
		d.addAttribute("member",service.getMemberDetail(curMem.getMid()));
		
		return "WEB-INF\\views\\member\\mypage.jsp";
	}
	
	@RequestMapping("authorize.do")
	public String authorize(Model d, Member upt) {
		service.authorize(upt);
		d.addAttribute("member", service.getMemberDetail(upt.getMid()));
		d.addAttribute("proc", "upt");
		return "WEB-INF\\views\\member\\memberdetail.jsp";
	}
	
	@RequestMapping("deleteMember.do")
	public String deleteMember(@RequestParam("mid") int mid, Model d) {
		service.deleteMember(mid);
		d.addAttribute("proc", "del");
		return "WEB-INF\\views\\member\\memberdetail.jsp";
	}
	
	@RequestMapping("logout.do")
	public String logout(Member m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("mem");
		return "redirect:login.do";
	}
	
	@ResponseBody
	@PostMapping("loginCheck.do")
	public String loginCheck(@ModelAttribute Member member) throws Exception {
		Member login = service.memberLogin(member);
		String result = "";
		if(login != null) {
			result = "pass";
		}else {
			result = "fail";
		}
		return result;
	}

}
