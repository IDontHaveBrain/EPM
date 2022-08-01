package pms.dao;

import java.util.List;

// pms.dao.WorkPageDao
import org.springframework.stereotype.Repository;

import pms.vo.WorkPage;

@Repository
public interface WorkPageDao {
	public List<WorkPage> getWorkPageList(int jid);
}
