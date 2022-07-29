package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.DashboardDao;
import pms.vo.Member;
import pms.vo.Notice;

import java.util.List;

@Service
public class DashboardService {
    @Autowired(required = false)
    private DashboardDao dao;

    public List<Notice> getNoticeList(int pid) {
        return dao.noticeList(pid);
    }
}
