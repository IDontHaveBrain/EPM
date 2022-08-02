package pms.dao;
// pms.dao.GlobalDao
import org.springframework.stereotype.Repository;
import pms.vo.Member;

@Repository
public interface GlobalDao {
    public Member getMember(String email);
}
