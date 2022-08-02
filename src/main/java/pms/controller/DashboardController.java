package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pms.dto.IssueDashDto;
import pms.service.DashboardService;
import pms.vo.Notice;

@Controller
public class DashboardController {
    @Autowired(required = false)
    private DashboardService service;
	// http://localhost:7080/project06/dashboard.do
    @RequestMapping("dashboard.do")
    public String dashboard(Model d){
        for(Notice n:service.getNoticeList(1)){
            System.out.println(n.getNtitle());
        }
        for(IssueDashDto issue:service.getIssueList(1)){
            System.out.println(issue.getItitle());
        }

        d.addAttribute("nlist", service.getNoticeList(1));
        d.addAttribute("ilist", service.getIssueList(1));
        return "pms/dashboard.jsp";
    }
}
