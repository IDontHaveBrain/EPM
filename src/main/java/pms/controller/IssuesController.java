package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.service.IssuesService;

@Controller
public class IssuesController {

	@Autowired(required = false)
	private IssuesService service;
	
	// http://localhost:7080/project06/insertIssue.do
	@RequestMapping("insertIssue.do")
	public String insertIssue() { // 이슈사항 등록
		
		return "WEB-INF\\views\\issue.jsp";
	}
	
	// http://localhost:7080/project06/issueDetail.do
	@RequestMapping("issueDetail.do")
	public String issueDetail() { // 이슈사항 내용 및 업데이트 내역 확인 (리스트에서 클릭 시 해당 이슈사항으로 이동)
		
		return "WEB-INF\\views\\issuedetail.jsp";
	}
	
	// http://localhost:7080/project06/editIssue.do
	@RequestMapping("editIssue.do")
	public String editIssue() { // 이슈사항 업데이트
		
		return "WEB-INF\\views\\issueedit.jsp";
	}
	
	// http://localhost:7080/project06/issueList.do
	@RequestMapping("issueList.do")
	public String issueList() { // 이슈사항 리스트 (이슈사항명, 작성자, status 확인 가능, 수정 및 삭제)
		
		return "WEB-INF\\views\\issuelist.jsp";
	}
}
