package pms.dao;

import org.springframework.stereotype.Repository;
import pms.dto.IssuesDashDto;
import pms.dto.IssuesSch;
import pms.vo.Notice;

import java.util.List;

@Repository
public interface DashboardDao {
    public List<Notice> noticeList(int pid);
    public List<IssuesDashDto> issueList(int pid);
    public int issueTotCnt(int pid);
    public List<IssuesDashDto> issueListPage(IssuesSch sch);
}
