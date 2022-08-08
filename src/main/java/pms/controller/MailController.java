package pms.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pms.service.MailSenderService;
import pms.vo.Member;

@Controller
public class MailController {

	@Autowired(required = false)
	private MailSenderService service;

	// http://localhost:7080/springweb/mailForm.do
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public void findPwGET() throws Exception{
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute Member member, HttpServletResponse response) throws Exception{
		service.findPw(response, member);
	}
}
