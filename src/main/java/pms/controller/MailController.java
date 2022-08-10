package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import pms.service.MailSenderService;
import pms.service.MemberService;
import pms.vo.Mail;
import pms.vo.Member;

@Controller
public class MailController {
	
	@Autowired(required = false)
	private MailSenderService service;

	// http://localhost:7080/springweb/mailForm.do
	@GetMapping("createEmpnoAndPassword.do")
	public String mailForm() {
		return "WEB-INF\\views\\memberdetail.jsp";
	}

	@PostMapping("sendEmpnoAndPassword.do")
	public String mailSender(Mail mail, Member member, Model d) {
		if(member != null) {
			service.uptEmpnoAndPassword(member);
			d.addAttribute("msg", service.sendMail(mail, member));
			return "redirect:memberlist.do";
		}
		
		return "WEB-INF\\views\\memberdetail.jsp";
	}
	// http://localhost:7080/project06/recoverpassword.do
	@GetMapping("recoverpassword.do")
	public String recoverPasswordForm() {
		return "WEB-INF\\views\\forgot-password.jsp";
	}

	@PostMapping("sendTempPassword.do")
	public String recoverPassword(Mail mail, Member member, Model d) {
		if(member != null) {
			service.recoverPassword(member);
			d.addAttribute("msg", service.sendTempPassword(mail, member));
		}
		
		return "WEB-INF\\views\\forgot-password.jsp";
	}
}
