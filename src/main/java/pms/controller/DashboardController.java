package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pms.dto.IssuesDashDto;
import pms.dto.IssuesSch;
import pms.dto.NoticeSch;
import pms.dto.ProjectListDto;
import pms.service.DashboardService;
import pms.service.GlobalService;
import pms.vo.Jobplan;
import pms.vo.Member;
import pms.vo.Notice;
import pms.vo.Project;

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
    public String dashboard(IssuesSch isch, NoticeSch nsch,
                            @RequestParam(value = "pid", defaultValue = "0") int pid,
                            Model d, HttpServletRequest request){
        //pid = 1;
        HttpSession session = request.getSession();
        Member curMem = (Member)request.getSession().getAttribute("mem");
        if(curMem == null){
            return "redirect:login.do";
        }
        if(!gservice.checkProjectAuth(curMem.getMid(), pid))
        {
            return "redirect:test.do";
        }
        System.out.println(curMem.getEmail());

        Integer iprogCount[] = service.issueProgCount(1);
        Integer jprogCount[] = service.noticeProgCount(1);

        d.addAttribute("nlist", service.noticePaging(nsch,1));
        d.addAttribute("ilist", service.issuePaging(isch,1));
        d.addAttribute("iprog", iprogCount);
        d.addAttribute("jprog", jprogCount);
        return "WEB-INF/views/dashboard/dashboard.jsp";
    }

    @RequestMapping("adminDashboard.do")
    public String adminDashboard(
                                 Model d, HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("mem", gservice.getMember("test@test.com"));

        List<Project> prjList = service.getAllProjectList();

        d.addAttribute("prjList", prjList);
        return "WEB-INF/views/dashboard/adminDashboard.jsp";
    }

    @RequestMapping("issueListAjax.do")
    public String issueListAjax(IssuesSch sch,
                                @RequestParam(value = "pid", defaultValue = "0") int pid, Model d){

        d.addAttribute("ilist", service.issuePaging(sch,pid));
        return "pageJsonReport";
    }

    @RequestMapping("noticeListAjax.do")
    public String noticeListAjax(NoticeSch sch,
                                 @RequestParam(value = "pid", defaultValue = "0") int pid, Model d){

        d.addAttribute("nlist", service.noticePaging(sch ,pid));
        return "pageJsonReport";
    }
}
