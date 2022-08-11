package pms.dao;
// pms.dao.GlobalDao
import org.springframework.stereotype.Repository;
import pms.vo.Jobplan;
import pms.vo.Member;
import pms.vo.Participants;

import java.util.List;
import java.util.Map;

@Repository
public interface GlobalDao {
    public Member getMember(String email);
    public List<Jobplan> memJobListPrj(Participants sch);
    public List<Jobplan> jobplanListPrj(int pid);
    public boolean isProjectMember(Map check);
    public boolean checkProjectAuth(Map check);
    public boolean testMember(Map check);
    public Member getTestMember(int mid);
}