package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pms.service.DashboardService;
import pms.vo.Notice;

@Controller
public class DashboardController {
    @Autowired(required = false)
    private DashboardService service;

    @RequestMapping("dashboard.do")
    public String dashboard(Model d){
        for(Notice n:service.getNoticeList(1)){
            System.out.println(n.getNtitle());
        }
        return "pms/dashboard.jsp";
    }
}
