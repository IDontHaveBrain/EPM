package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pms.dao.GlobalDao;
import pms.dto.IssueDashDto;
import pms.service.DashboardService;
import pms.service.GlobalService;
import pms.vo.Member;
import pms.vo.Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DashboardController {
    @Autowired(required = false)
    private DashboardService service;
    @Autowired(required = false)
    private GlobalService gservice;

	// http://localhost:7080/project06/dashboard.do
    @RequestMapping("dashboard.do")
    public String dashboard(IssueDashDto issueForm ,Model d, HttpServletRequest request){
        for(Notice n:service.getNoticeList(1)){
            System.out.println(n.getNtitle());
        }
        for(IssueDashDto issue:service.getIssueList(1)){
            System.out.println(issue.getItitle());
        }
        HttpSession session = request.getSession();
        session.setAttribute("mem", gservice.getMember("skawns848@naver.com"));
        Member curMem = (Member)request.getSession().getAttribute("mem");
        if(curMem == null){
            return "redirect:login.do";
        }
        System.out.println(curMem.getEmail());

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

    @RequestMapping("issueListAjax.do")
    public String issueListAjax(IssueDashDto issueForm,
                                @RequestParam(value = "pid", defaultValue = "0") int pid, Model d){

        d.addAttribute("ilist", service.getIssueList(1));
        return "pageJsonReport";
    }

    @RequestMapping("noticeListAjax.do")
    public String noticeListAjax(IssueDashDto issueForm,
                                @RequestParam(value = "pid", defaultValue = "0") int pid, Model d){

        d.addAttribute("nlist", service.getNoticeList(1));
        return "pageJsonReport";
    }
}
