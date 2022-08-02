package pms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class prjController {
	// http://localhost:7080/project06/newprj.do

	@RequestMapping("newprj.do")
	public String newprj(){
		// 처리할 controller 내용.
		return "WEB-INF\\views\\project.jsp";
	}
	
	

}

