package pms.dao;

import org.springframework.stereotype.Repository;
import pms.dto.IssueDashDto;
import pms.vo.Issue;
import pms.vo.Notice;

import java.util.List;

@Repository
public interface DashboardDao {
    public List<Notice> noticeList(int pid);
    public List<IssueDashDto> issueList(int pid);
}
