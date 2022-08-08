package pms.dao;

import java.util.List;

// pms.dao.WorkPageDao
import org.springframework.stereotype.Repository;

import pms.vo.WorkPage;
import pms.vo.WorkPageFile;

@Repository
public interface WorkPageDao {
	// 리스트
	public List<WorkPage> WorkPageList(int mid,int pid);
	public List<WorkPage> getWorkPageList(WorkPage sch);

	// 상세화면
	public WorkPage getWorkPageDetail(int mid,int jid);

	// 파일등록
	public void insertFile(WorkPageFile file);
}
