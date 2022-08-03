package pms.dao;
// pms.dao.GlobalDao
import org.springframework.stereotype.Repository;
import pms.vo.Jobplan;
import pms.vo.Member;

import java.util.List;

@Repository
public interface GlobalDao {
    public Member getMember(String email);
    public List<Jobplan> jobplanListPrj(int pid);
}
