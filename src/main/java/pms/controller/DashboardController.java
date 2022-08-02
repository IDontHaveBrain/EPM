package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pms.dto.IssueDashDto;
import pms.service.DashboardService;
import pms.vo.Notice;

import java.util.List;

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
        List<IssueDashDto> issueList = service.getIssueList(1);
        Integer iprogCount[] = {0,0,0,0};
        for(IssueDashDto issue:issueList){
            if(issue.getIprogress().equals("해결"))
                iprogCount[0]++;
            else if (issue.getIprogress().equals("해결중"))
                iprogCount[1]++;
            else if (issue.getIprogress().equals("해결불가"))
                iprogCount[2]++;
            iprogCount[3]++;
        }

        d.addAttribute("nlist", service.getNoticeList(1));
        d.addAttribute("ilist", issueList);
        d.addAttribute("iprog", iprogCount);
        return "pms/dashboard.jsp";
    }
}
