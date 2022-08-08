package pms.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.dao.WorkPageDao;
import pms.vo.WorkPage;
import pms.vo.WorkPageFile;

@Service
public class WorkPageService {
	@Autowired(required=false)
	private WorkPageDao dao;
	
    public List<WorkPage> WorkPageList(int mid,int pid) {
        return dao.WorkPageList(mid,pid);
    }
	public List<WorkPage> getWorkPageList(WorkPage sch,int mid,int pid){
		sch.setMid(mid);
		sch.setPid(pid);
		return dao.getWorkPageList(sch);
	}
	
	// 상세화면
	public WorkPage getWokrPageDetail(int mid,int jid){
		return dao.getWorkPageDetail(mid,jid);
	}	
	
	// 파일서버 정보(공통정보)
	@Value("${upload}")
	private String path;
	public void insertWorkPageFile(WorkPageFile ins) {
		MultipartFile mpf = ins.getReport();
		String fname = mpf.getOriginalFilename();
		
		File f = new File(path+fname);
		try {
			mpf.transferTo(f);
			System.out.println("파일업로드 완성");
			// IO(input/output)일어나는 경우에는 일반적으로 필수예외처리(compile예외처리)
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// dao.insertWorkPageFile(ins); // 기본정보가 등록  key(no)
		dao.insertFile(new WorkPageFile(path,fname)); // 위 게시물의 key를 가져와서 파일정보에 등록
		
	// 		insert into  boardfile values(board_seq.currval,
	// 	     #{path}, #{fname}, sysdate, sysdate, '')	
		
		
	}
}
