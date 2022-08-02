package pms.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import pms.service.ProjectService;
import pms.vo.Project;

@Controller
public class ProjectController {
	@Autowired(required=false)
	private ProjectService service;
	
	// http://localhost:7080/project06/projectList.do
	@RequestMapping("projectList.do")
	public String projectList() {
		return "WEB-INF\\views\\projectlist.jsp";
	}
	
	// http://localhost:7080/project06/projectInsertForm.do
	@RequestMapping("projectInsertForm.do")
	public String projectInsertForm(){
		return "WEB-INF\\views\\project.jsp";
	}
	
	/*
	@RequestMapping("updateProject.do")
	public String updateProject(Project upt, Model d){		
		d.addAttribute("project",service.updateProject(upt));
		d.addAttribute("proc","upt");

		return "WEB-INF\\views\\projectedit.jsp";
	}
	
	@RequestMapping("delete.do")
	public String deleteProject(@RequestParam("number") int number, Model d){
		service.deleteProject(number);
		d.addAttribute("proc","del");
		
		return "WEB-INF\\views\\projectedit.jsp";
	}
	 */

}

