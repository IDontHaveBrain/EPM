package pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkPageController {
	// http://localhost:7080/project06/WorkPageList.do
	@RequestMapping("WorkPageList.do")
	public String WorkPageList() {
		return "WEB-INF\\views\\WorkPage\\WorkPageList.jsp";
	}

}
