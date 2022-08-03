package pms.dao;
// pms.dao.GlobalDao
import org.springframework.stereotype.Repository;
import pms.vo.Jobplan;
import pms.vo.Member;

import java.util.List;
import java.util.Map;

@Repository
public interface GlobalDao {
    public Member getMember(String email);
    public List<Jobplan> jobplanListPrj(int pid);
    public boolean isProjectMember(Map check);
    public boolean checkProjectAuth(Map check);
}