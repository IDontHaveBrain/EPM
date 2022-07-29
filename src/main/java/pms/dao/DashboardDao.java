package pms.dao;

import org.springframework.stereotype.Repository;
import pms.vo.Notice;

import java.util.List;

@Repository
public interface DashboardDao {
    public List<Notice> noticeList(int pid);
}
