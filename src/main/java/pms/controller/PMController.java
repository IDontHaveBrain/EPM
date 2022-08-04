package pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.vo.Member;

@Controller
public class PMController {
	// http://localhost:7080/project06/manage.do
	@RequestMapping("manage.do")
	public String manage(HttpServletRequest request) {
		HttpSession session = request.getSession();
        Member mem = (Member)session.getAttribute("mem");
        if(mem == null){
            return "redirect:login.do";
        }
		return "WEB-INF\\views\\pm\\default.jsp";
	}
}
